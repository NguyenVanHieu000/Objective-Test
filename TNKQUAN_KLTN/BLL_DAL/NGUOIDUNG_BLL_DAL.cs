using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class NGUOIDUNG_BLL_DAL
    {
        DBDataContext qlGV = new DBDataContext();
        public GIANGVIEN get_Info(string ID)
        {
            return qlGV.GIANGVIENs.SingleOrDefault(t => t.ID_GVIEN.Equals(ID));
        }
        public List<GIANGVIEN> get_Infos(string ID)
        {
            return qlGV.GIANGVIENs.Where(t => t.ID_GVIEN.Equals(ID)).Select(t=>t).ToList();

        }
        public List<GVIENCHUCVU> get_DataGVCVU(string ID)
        {
            return qlGV.GVIENCHUCVUs.Where(t => t.ID_GVIEN.Equals(ID)).ToList();
        }
        public List<CHUCVU> get_DataCVU()
        {
            return qlGV.CHUCVUs.Select(t => t).ToList();
        }
        public List<CHUCVU> get_DataCVU(string ID)
        {
            return qlGV.CHUCVUs.Where(t => t.ID_CVU.Equals(ID)).Select(t=>t).ToList();
        }
        public void DoiMK(string ID,string MKMoi)
        {
            GIANGVIEN gv = qlGV.GIANGVIENs.SingleOrDefault(t => t.ID_GVIEN.Equals(ID));
            gv.PASSGV = MKMoi;
            qlGV.SubmitChanges();
        }
        public List<GIANGVIEN> lstgv_theoKhoa(string idKhoa)
        {
            return qlGV.GIANGVIENs.Where(t => t.ID_KHOA == idKhoa).ToList();
        }
        public CHUCVU chucvu_TheoTen(string tenCV)
        {
            return qlGV.CHUCVUs.Where(t => t.TENCVU == tenCV).First();
        }
        public List<GVIENCHUCVU> lstgv_TheoCV(string idCV)
        {
            return qlGV.GVIENCHUCVUs.Where(t => t.ID_CVU == idCV).ToList();
        }
    }
}
