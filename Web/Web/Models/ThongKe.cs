using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class ThongKe
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public string IDThongKe { get; set; }
        public string ID_SV { get; set; }
        public string TenSV { get; set; }
        public string TenMonhoc { get; set; }
        public string TenHocKy { get; set; }
        public string TenNamHoc { get; set; }
        public double? DiemThi { get; set; }
        public bool isCheck { get; set; }

        public List<ThongKe> lstThongKe()
        {
            List<ThongKe> a = new List<ThongKe>();
            foreach (TGTHI tgt in db.TGTHIs.ToList())
            {
                ThongKe item = new ThongKe();
                item.IDThongKe = tgt.ID_SVIEN + tgt.LICHTHI.MONHOC.ID_MONHOC + tgt.LICHTHI.HOCKY.ID_HOCKY + tgt.LICHTHI.NAMHOC.TENNAM;
                item.ID_SV = tgt.ID_SVIEN;
                item.TenSV = tgt.SINHVIEN.TENSV;
                item.TenMonhoc = tgt.LICHTHI.MONHOC.TENMONHOC;
                item.TenHocKy = tgt.LICHTHI.HOCKY.TENHK;
                item.TenNamHoc = tgt.LICHTHI.NAMHOC.TENNAM;
                item.isCheck = false;

                foreach (KETQUA kq in db.KETQUAs.ToList())
                {
                    if (tgt.ID_BAITHI == kq.ID_BAITHI)
                    {
                        item.DiemThi = kq.DIEMTHI;
                    }
                }
                a.Add(item);
            }
            return a;
        }
        public List<ThongKe> lstThongKeTheo_Mon_HK_Nam(string idMon, string idHK, string idNam)
        {
            string tenMon = "", tenHocKy = "", tenNamHoc = "";
            foreach (MONHOC item in db.MONHOCs.ToList())
            {
                if (item.ID_MONHOC == idMon)
                    tenMon = item.TENMONHOC;
            }
            foreach (HOCKY item in db.HOCKies.ToList())
            {
                if (item.ID_HOCKY == idHK)
                    tenHocKy = item.TENHK;
            }
            foreach (NAMHOC item in db.NAMHOCs.ToList())
            {
                if (item.ID_NAMHOC == idNam)
                    tenNamHoc = item.TENNAM;
            }
            List<ThongKe> a = lstThongKe();
            return a.Where(t => t.TenMonhoc == tenMon && t.TenHocKy == tenHocKy && t.TenNamHoc == tenNamHoc).ToList();
        }
        
    }
}