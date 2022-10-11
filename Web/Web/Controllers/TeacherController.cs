using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;
using Web.Common;
using System.Data;
using System.IO;
using ClosedXML.Excel;

namespace Web.Controllers
{
    public class TeacherController : Controller
    {
        User user = new User();
        DataClasses1DataContext db = new DataClasses1DataContext();
        LstThongKe lstTK = new LstThongKe();
        ThongKe thongke = new ThongKe();
        // GET: Teacher
        public ActionResult Index()
        {
            List<GVIENCHUCVU> model = new List<GVIENCHUCVU>();
            model = db.GVIENCHUCVUs.Where(t => t.ID_GVIEN == user.id).ToList();
            return View(model);
        }
        public ActionResult Logout()
        {
            if (user.id == null)
                return View("Error");
            user.Reset();
            return RedirectToAction("Login", "Login");
        }
        public ActionResult ThongKeDiem(string searchString, int? page, string idMon, string idHK, string idNam, string chucvu)
        {
            List<ThongKe> models = new List<ThongKe>();
            if(chucvu=="Nhân viên khảo thí")
            {
                //load dropdownlist
                List<MONHOC> listMonHoc = db.MONHOCs.ToList();
                SelectList lstMH = new SelectList(listMonHoc, "ID_MONHOC", "TENMONHOC");
                ViewBag.dsMonHoc = lstMH;

                List<HOCKY> listHocKy = db.HOCKies.ToList();
                SelectList lstHK = new SelectList(listHocKy, "ID_HOCKY", "TENHK");
                ViewBag.dsHocKy = lstHK;

                List<NAMHOC> listNamHoc = db.NAMHOCs.ToList();
                SelectList lstNH = new SelectList(listNamHoc, "ID_NAMHOC", "TENNAM");
                ViewBag.dsNamHoc = lstNH;

                //load bảng thống kê
                models = thongke.lstThongKe();

                //lọc dữ liệu
                if (!String.IsNullOrWhiteSpace(idMon)
                    && !String.IsNullOrWhiteSpace(idHK)
                    && !String.IsNullOrWhiteSpace(idNam))
                {
                    models = thongke.lstThongKeTheo_Mon_HK_Nam(idMon, idHK, idNam);
                }

                //tìm kiếm theo id sinh viên, tên sinh viên, học kì, năm học
                if (!String.IsNullOrEmpty(searchString))
                {
                    models = models.Where(s => s.ID_SV.Contains(searchString)
                                           || s.TenSV.Contains(searchString)
                                           || s.TenMonhoc.Contains(searchString)
                                           || s.TenHocKy.Contains(searchString)
                                           || s.TenNamHoc.Contains(searchString)).ToList();
                }

                lstTK.list = models;
            }
            return View(lstTK);
        }
        [HttpPost]
        public ActionResult ExportExcel(LstThongKe b)
        {
            DataTable dt = new DataTable("Grid");
            dt.Columns.AddRange(new DataColumn[6] { new DataColumn("ID sinh viên"),
                                        new DataColumn("Tên sinh viên"),
                                        new DataColumn("Tên môn học"),
                                        new DataColumn("Tên học kỳ"),
                                        new DataColumn("Tên năm học") ,
                                        new DataColumn("Điểm") });
            //lấy danh sách id Thống kê dựa vào từng checkbox đã chọn
            List<string> lstID = new List<string>();
            foreach (var item in b.list)
            {
                if (item.isCheck == true)
                {
                    string id = item.IDThongKe;
                    lstID.Add(id);
                }
            }
            //lấy danh sách đã chọn
            List<ThongKe> models = new List<ThongKe>();
            models = thongke.lstThongKe();
            List<ThongKe> a = new List<ThongKe>();
            foreach (var item in models)
            {
                for (int i = 0; i < lstID.Count; i++)
                {
                    if (item.IDThongKe == lstID[i])
                    {
                        a.Add(item);
                    }
                }
            }
            foreach (var item in a)
            {
                dt.Rows.Add(item.ID_SV, item.TenSV, item.TenMonhoc, item.TenHocKy, item.TenNamHoc, item.DiemThi);
            }

            var wb = new XLWorkbook();
            wb.Worksheets.Add(dt);
            MemoryStream stream = new MemoryStream();
            wb.SaveAs(stream);
            return File(stream.ToArray(), "application/vnd.openxmlformarts-officedocument.spreadsheetml.sheet", "BangDiemThi.xlsx");
        }

        public ActionResult GacThi()
        {
            LstGacThi lstGacThi = new LstGacThi();
            int i = 0;
            List<GVCOITHI> temp = db.GVCOITHIs.Where(t => t.ID_GVIEN == user.id && t.LICHTHI.NGAYTHI == DateTime.Now.Date).ToList();
            List<GacThi> temp2 = new List<GacThi>();
            foreach(var item in temp)
            {
                GacThi gthi=new GacThi();
                gthi.ngayThi = item.LICHTHI.NGAYTHI;
                gthi.tenMonHoc = item.LICHTHI.MONHOC.TENMONHOC;
                gthi.tenPhong = item.PHONGTHI.TENPHONG;
                gthi.TietBD = item.LICHTHI.TietBĐ;
                gthi.TietKT = item.LICHTHI.TietKT;
                gthi.quyen = 1;
                temp2.Add(gthi);
            }
            lstGacThi.lst = temp2;
            return View(lstGacThi);
        }
        public ActionResult PhongThi(int gioBD, string tenPhongThi, string searchString, string tinhtrang)
        {
            //load dropdownlist
            List<TinhTrang> listTinhTrang = new List<TinhTrang>();
            TinhTrang a = new TinhTrang { id = "0", ten = "Chưa đăng nhập" };
            listTinhTrang.Add(a);

            TinhTrang b = new TinhTrang { id = "1", ten = "Đang làm bài" };
            listTinhTrang.Add(b);

            TinhTrang c = new TinhTrang { id = "2", ten = "Đã nộp bài" };
            listTinhTrang.Add(c);

            SelectList lstTT = new SelectList(listTinhTrang, "id", "ten");
            ViewBag.dsTinhTrang = lstTT;

            //load
            TIETHOC tiethoc = db.TIETHOCs.Where(t => t.TIETHOC1 == gioBD).First();
            LstThamGiaThi lstTGT = new LstThamGiaThi();
            List<TGTHI> lstTGThi = db.TGTHIs.Where(t => t.PHONGTHI.TENPHONG == tenPhongThi&&t.LICHTHI.TietBĐ==tiethoc.TIETHOC1).ToList();
            List<ThamGiaThi> temp = new List<ThamGiaThi>();
            foreach(var item in lstTGThi)
            {
                ThamGiaThi tgt = new ThamGiaThi();
                tgt.idSV = item.ID_SVIEN;
                tgt.tenSV = item.SINHVIEN.TENSV;
                if (item.BAITHI.TGBDau != null && item.BAITHI.TGKT==null)
                {
                    tgt.tinhTrang = "1";
                }
                else if (item.BAITHI.TGBDau != null && item.BAITHI.TGKT != null)
                {
                    tgt.tinhTrang = "2";
                }
                else
                {
                    tgt.tinhTrang = "0";
                }
                tgt.gioBD = item.BAITHI.TGBDau;
                tgt.gioKT = item.BAITHI.TGKT;
                tgt.timing = item.BAITHI.TIMING;
                temp.Add(tgt);
            }
            lstTGT.lst = temp;
            //tìm kiếm theo id sinh viên, tên sinh viên, học kì, năm học
            if (!String.IsNullOrEmpty(searchString))
            {
                lstTGT.lst = lstTGT.lst.Where(s => s.idSV.Contains(searchString)
                                       || s.tenSV.Contains(searchString)).ToList();
            }
            //lọc bằng combobox
            if (!String.IsNullOrWhiteSpace(tinhtrang))
            {
                lstTGT.lst = lstTGT.lst.Where(t => t.tinhTrang == tinhtrang).ToList();
            }

            return View(lstTGT);
        }
    }
}