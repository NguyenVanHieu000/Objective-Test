using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class CAUHOI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public IQueryable get_DataCauHoi()
        {
            return qlTNKQ.CAUHOIs.Select(t => t);
        }
        public List<CAUHOI> get_DataCauHoi_TheoNHCH(string idNHCH)
        {
            return qlTNKQ.CAUHOIs.Where(t => t.ID_NHCH==idNHCH).ToList();
        }
        public List<CAUHOI> lstCauHoi_TheoNHCH_MucDo(string idNHCH,string idMucDo)
        {
            return qlTNKQ.CAUHOIs.Where(t => t.ID_NHCH == idNHCH&&t.ID_MUCDO==idMucDo&&t.TTrang=="Đã duyệt").ToList();
        }
        public void themCH(string cauHoi,string hinh,string dapan,string cauA,string cauB,string cauC,string cauD,string idMucDo,string chuong,string tinhtrang,string idNHCH)
        {
            CAUHOI a = new CAUHOI();
            a.ID_CAUHOI = autoID();
            a.ID_MUCDO = idMucDo;
            a.CHUONG=int.Parse(chuong);
            a.NOIDUNGCH = cauHoi;
            a.A=cauA;
            a.B=cauB;
            a.C = cauC;
            a.D = cauD;
            a.DAPAN = dapan;
            a.TTrang = tinhtrang;
            a.ID_NHCH = idNHCH;
            a.HINH = hinh;
     
            qlTNKQ.CAUHOIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public void themCauHoi(CAUHOI a)
        {
            //a.ID_CAUHOI = autoID();
            qlTNKQ.CAUHOIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public List<CAUHOI> lstCauHoi()
        {
            return qlTNKQ.CAUHOIs.ToList() ;
        }
        public string autoID()
        {

            string id = "";
            int dem = 0;
            if (qlTNKQ.CAUHOIs.Count() >0)
            {
                foreach (CAUHOI ch in lstCauHoi())
                {
                    id = ch.ID_CAUHOI;
                }
                dem = int.Parse(id.Substring(2, 5));
            }
            if (dem < 9)
                return id.Substring(0, 2) + "0000" + (dem + 1).ToString();
            else if (dem >= 9 && dem < 99)
                return id.Substring(0, 2) + "000" + (dem + 1).ToString();
            else if (dem >= 99 && dem < 999)
                return id.Substring(0, 2) + "00" + (dem + 1).ToString();
            else if (dem >= 999 && dem < 9909)
                return id.Substring(0, 2) + "0" + (dem + 1).ToString();
            else
                return id.Substring(0, 2) + (dem + 1).ToString();
        }
        public CAUHOI timCHtheoID(string id)
        {
            return qlTNKQ.CAUHOIs.Where(x => x.ID_CAUHOI == id).First();
        }
        public void xoaCH(CAUHOI a)
        {
            qlTNKQ.CAUHOIs.DeleteOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public bool suaCH(string id,string cauHoi,string hinh,string dapan,string cauA,string cauB,string cauC,string cauD,string idMucDo,string chuong)
        {
            CAUHOI a = qlTNKQ.CAUHOIs.Where(x => x.ID_CAUHOI == id).FirstOrDefault();
            if(a!=null)
            {
                a.ID_MUCDO = idMucDo;
                a.CHUONG = int.Parse(chuong);
                a.NOIDUNGCH = cauHoi;
                a.A = cauA;
                a.B = cauB;
                a.C = cauC;
                a.D = cauD;
                a.DAPAN = dapan;
                a.HINH = hinh;

                qlTNKQ.SubmitChanges();
                return true;
            }
            return false;
        }
        // sửa tình trạng câu hỏi
        public bool UpdateTTrang(string id, string ttrang)
        {
            try
            {
                CAUHOI ch = qlTNKQ.CAUHOIs.Where(t => t.ID_CAUHOI.Equals(id)).Select(t => t).Single();
                ch.TTrang = ttrang;
                qlTNKQ.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
                throw;
            }
        }
    }
}
