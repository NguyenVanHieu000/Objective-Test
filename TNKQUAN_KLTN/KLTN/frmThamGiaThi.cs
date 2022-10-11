using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using BLL_DAL;
using xls = Microsoft.Office.Interop.Excel; //inport thư viện interop.excel

namespace KLTN
{
    public partial class frmThamGiaThi : DevExpress.XtraEditors.XtraForm
    {
        MON_BLL_DAL m = new MON_BLL_DAL();
        THAMGIATHI_BLL_DAL tgt = new THAMGIATHI_BLL_DAL();
        LICHTHI_BLL_DAL lt = new LICHTHI_BLL_DAL();
        SINHVIEN_BLL_DAL sv = new SINHVIEN_BLL_DAL();
        DETHI_BLL_DAL dt = new DETHI_BLL_DAL();
        BAITHI_BLL_DAL bt = new BAITHI_BLL_DAL();
        PHONGTHI_BLL_DAL pt = new PHONGTHI_BLL_DAL();
        CTBAITHI_BLL_DAL ctbt = new CTBAITHI_BLL_DAL();
        CTDTHI_BLL_DAL ctdt = new CTDTHI_BLL_DAL();
        NGUOIDUNG_BLL_DAL nd = new NGUOIDUNG_BLL_DAL();
        GVCOITHI_BLL_DAL gvcoithi = new GVCOITHI_BLL_DAL();
        //tao bang chua du lieu tu file excel vao
        public DataTable bang;
        //tao file chua thong tin file import
        public string filename;
        public frmThamGiaThi()
        {
            InitializeComponent();
            loadCB_Mon();
            loadDGV_TGThi();
        }
        public void loadCB_Mon()
        {
            List<MONHOC> list = m.listMon();
            cbMon.Items.Add("All");
            foreach (MONHOC a in list)
            {
                cbMon.Items.Add(a.TENMONHOC);
            }
        }
        public void loadDGV_TGThi()
        {
            dgvTGThi.DataSource = tgt.get_Data();
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {

        }

        private void cbLichThi_TextChanged(object sender, EventArgs e)
        {
            try
            {
                dgvTGThi.DataSource = tgt.get_Data_TheoLich(cbLichThi.Text);
            }
            catch { }
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            //khi click vao nut thi se mo hop thoai chon file
            OpenFileDialog fDialog = new OpenFileDialog(); //tao 1 hop thoai de chon file
            fDialog.Filter = "excel file |*.xls;*.xlsx"; //chi lay nhung file co dang xls hoac xlsx
            fDialog.FilterIndex = 1; //tro vao vi tri dau tien cua bo loc
            fDialog.RestoreDirectory = true; //nho duong dan cua lan truy cap truoc
            fDialog.Multiselect = false; //khong cho phep chon nhieu file cung luc
            fDialog.Title = "Chọn file excel"; //tieu de cua hop thoai
            //new chon file thanh cong
            if (fDialog.ShowDialog() == DialogResult.OK)
            {
                //set gia tri vao textbox filename
                filename = fDialog.FileName;
                //thuc thi methob readExcel
                readExcel();
                //do du lieu vao dgv
                if (bang != null)
                {
                    dgvSV.DataSource = bang;
                }
                else
                {
                    MessageBox.Show("Không có dữ liệu");
                }
            }
        }

        public void readExcel()
        {
            //kiem tra du lieu da co chua
            if (filename == null)
            {
                MessageBox.Show("Chưa chọn file");
            }
            else
            {
                //mo file va doc du lieu
                xls.Application excelApp = new xls.Application();
                //kiem tra xem mo duoc khong?
                try
                {
                    excelApp.Workbooks.Open(filename);
                }
                catch
                {
                    MessageBox.Show("Không thể mở file");
                }
                //tao cau truc table
                bang = new DataTable();
                bang.Columns.Add("ID_SinhVien", typeof(string));
                bang.Columns.Add("Password", typeof(string));
                bang.Columns.Add("TenSV", typeof(string));
                bang.Columns.Add("Hinh", typeof(string));
                bang.Columns.Add("NamSinh", typeof(string));
                bang.Columns.Add("GioiTinh", typeof(string));
                bang.Columns.Add("SDT", typeof(string));
                bang.Columns.Add("DiaChi", typeof(string));
                bang.Columns.Add("CMND", typeof(string));
                bang.Columns.Add("QueQuan", typeof(string));
                bang.Columns.Add("ID_Khoa", typeof(string));

                //doc du lieu tung sheet cua excel
                foreach (xls.Worksheet WSheet in excelApp.Worksheets)
                {
                    //tao mot datarow de lay du lieu cho tung dong
                    DataRow dr;
                    //bien i de doc tung dong cua sheet excel
                    long i = 1;
                    try
                    {
                        do
                        {
                            if (WSheet.Range["A" + i].Value == null &&
                                WSheet.Range["B" + i].Value == null &&
                                WSheet.Range["C" + i].Value == null &&
                                WSheet.Range["D" + i].Value == null &&
                                WSheet.Range["E" + i].Value == null &&
                                WSheet.Range["F" + i].Value == null &&
                                WSheet.Range["G" + i].Value == null &&
                                WSheet.Range["H" + i].Value == null &&
                                WSheet.Range["I" + i].Value == null &&
                                WSheet.Range["J" + i].Value == null &&
                                WSheet.Range["K" + i].Value == null)
                            {
                                break; //neu den dong cuoi cung cua sheet data thi dung lai
                            }
                            dr = bang.NewRow(); //datarow co kieu du lieu cung voi bang
                            dr["ID_SinhVien"] = WSheet.Range["A" + i].Value;
                            dr["Password"] = WSheet.Range["B" + i].Value;
                            dr["TenSV"] = WSheet.Range["C" + i].Value;
                            dr["Hinh"] = WSheet.Range["D" + i].Value;
                            dr["NamSinh"] = WSheet.Range["E" + i].Value;
                            dr["GioiTinh"] = WSheet.Range["F" + i].Value;
                            dr["SDT"] = WSheet.Range["G" + i].Value;
                            dr["DiaChi"] = WSheet.Range["H" + i].Value;
                            dr["CMND"] = WSheet.Range["I" + i].Value;
                            dr["QueQuan"] = WSheet.Range["J" + i].Value;
                            dr["ID_Khoa"] = WSheet.Range["K" + i].Value;
                            bang.Rows.Add(dr);

                            i++;
                        } while (true);
                        //loadDGV_SV();
                    }
                    catch
                    {
                        MessageBox.Show("Có lỗi khi thực hiện");
                    }
                }
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                if (cbLichThi.Text == "")
                    MessageBox.Show("Hãy chọn lịch thi");
                else
                {
                    int n = dgvSV.RowCount;
                    List<string> lst = new List<string>();
                    for (int i = 0; i < n; i++)
                    {
                        lst.Add(dgvSV.Rows[i].Cells[0].Value.ToString());
                    }
                    List<SINHVIEN> lstSinhVien = sv.lstThiSinh(lst);
                    if (lstSinhVien == null)
                        MessageBox.Show("Có mã sinh viên không hợp lệ");
                    else
                    {
                        string idLichthi = "";
                        List<TGTHI> lstTGT = new List<TGTHI>();
                        for (int i = 0; i < n; i++)
                        {
                            TGTHI thamgia = new TGTHI();
                            LICHTHI lichThi = lt.get_Data_TheoTen(cbLichThi.Text);
                            thamgia.ID_TGTHI = tgt.autoID() + i;
                            thamgia.ID_SVIEN = lstSinhVien[i].ID_SVIEN;
                            thamgia.ID_LICHTHI = lichThi.ID_LICHTHI;
                            idLichthi = lichThi.ID_LICHTHI;

                            MONHOC monhoc = m.timTheoTen(cbMon.Text);

                            List<DETHI> lstDeThi = dt.list_TheoMon_NamHoc(monhoc.ID_MONHOC, lichThi.ID_NAMHOC);
                            Random rd = new Random();
                            int stt = rd.Next(1, lstDeThi.Count);
                            DETHI dethi = lstDeThi[stt];

                            BAITHI baithi = new BAITHI();
                            baithi.ID_BAITHI = bt.autoID();
                            baithi.TINHTRANG = 0;
                            baithi.ID_DETHI = dethi.ID_DETHI;
                            baithi.CAUTL = dethi.SLCAU.ToString();
                            bt.them(baithi);
                            thamgia.ID_BAITHI = baithi.ID_BAITHI;

                            List<CTDTHI> lstCTDETHI = ctdt.list_TheoDeThi(dethi.ID_DETHI);
                            for (int k = 0; k < lstCTDETHI.Count; k++)
                            {
                                CTBAITHI ctBaiThi = new CTBAITHI();
                                ctBaiThi.ID_BAITHI = baithi.ID_BAITHI;
                                ctBaiThi.DapAn = null;
                                ctBaiThi.ID_CTDETHI = lstCTDETHI[k].ID_CTDTHI;
                                ctBaiThi.ID_CTBAITHI = lstCTDETHI[k].ID_CTDTHI;
                                ctbt.them(ctBaiThi);
                            }
                            lstTGT.Add(thamgia);
                        }
                        int sl = lstTGT.Count;
                        int a = 0;
                        List<PHONGTHI> lstPhong = pt.lst();
                        foreach (PHONGTHI i in lstPhong)
                        {
                            string soLuongTS = i.SL.ToString();
                            int k = int.Parse(soLuongTS);
                            while (k > 0)
                            {
                                if (a < sl)
                                {
                                    lstTGT[a].ID_PHONGTHI = i.ID_PHONGTHI;
                                    a++;
                                    k--;
                                }
                                else
                                    k = 0;
                            };
                        }
                        if (tgt.themList(lstTGT) == true)
                        {
                           
                            them_gvGacThi(idLichthi);
                            MessageBox.Show("Thêm thành công");
                            cbMon.Text = "";
                            cbLichThi.Text = "";
                            loadDGV_TGThi();
                        }
                        else
                            MessageBox.Show("Không thể thêm");
                    }
                }
            }
            catch
            {
                MessageBox.Show("Lỗi");
            }
        }

        public void them_gvGacThi(string idLichThi)
        {
            try
            {
                List<TGTHI> lstTGT = tgt.lst_TheoLich(idLichThi);

                List<string> lstIDPhong = new List<string>();
                int i = 0;
                foreach (TGTHI item in lstTGT)
                {
                    if(lstIDPhong.Count == 0)
                    {
                        lstIDPhong.Add(item.ID_PHONGTHI);
                    }
                    if (item.ID_PHONGTHI != lstIDPhong[i].ToString())
                    {
                        lstIDPhong.Add(item.ID_PHONGTHI);
                        i++;
                    }
                }
                LICHTHI lichthi = lt.get_Data_TheoID(idLichThi);
                MONHOC monhoc = m.timTheoID(lichthi.ID_MONHOC);
                List<GIANGVIEN> gv_bomon = nd.lstgv_theoKhoa(monhoc.ID_KHOA);

                CHUCVU chucvu = nd.chucvu_TheoTen("Nhân viên khảo thí");
                List<GVIENCHUCVU> lst_GVCV = nd.lstgv_TheoCV(chucvu.ID_CVU);

                foreach (var item in lstIDPhong)
                {
                    List<string> lstIDGV_CoiThi = new List<string>() ;
                    Random rd = new Random();
                    int stt1 = rd.Next(1, gv_bomon.Count);
                    int stt2 = rd.Next(0, lst_GVCV.Count);
                    lstIDGV_CoiThi.Add(gv_bomon[stt1].ID_GVIEN);
                    lstIDGV_CoiThi.Add(lst_GVCV[stt2].ID_GVIEN);
                    for (int k = 0; k < lstIDGV_CoiThi.Count();k++ )
                    {
                        GVCOITHI gvct = new GVCOITHI();
                        gvct.QUYEN = 0;
                        gvct.ID_LICHTHI = idLichThi;
                        gvct.ID_PHONGTHI = item;
                        gvct.ID_GVIEN = lstIDGV_CoiThi[k];
                        gvcoithi.them(gvct);
                    }
                    lstIDGV_CoiThi.Clear();
                }
            }
            catch { }

        }


        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                string temp = dgvTGThi.SelectedRows[0].Cells[0].Value.ToString();
                int id = int.Parse(temp);
                if (tgt.xoa(id) == true)
                {
                    MessageBox.Show("Xóa thành công");
                    loadDGV_TGThi();
                }
                else
                    MessageBox.Show("Không thể xóa");
            }
            catch
            {
                MessageBox.Show("Lỗi");
            }
        }

        private void cbMon_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                cbLichThi.Items.Clear();
                if (cbMon.Text == "All")
                    loadDGV_TGThi();
                else
                {
                    MONHOC monhoc = m.timTheoTen(cbMon.Text);
                    List<LICHTHI> lstLichThi = lt.lst_TheoMon(monhoc.ID_MONHOC);
                    foreach (LICHTHI i in lstLichThi)
                    {
                        cbLichThi.Items.Add(i.TENLICHTHI);
                    }
                }
            }
            catch
            { }
        }

    }
}