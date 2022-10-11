using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class LICHTHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public IQueryable get_Data()
        {
            return qlTNKQ.LICHTHIs.Select(t => t);
        }
        public void them(LICHTHI a)
        {
            qlTNKQ.LICHTHIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public bool ktTrung(LICHTHI a)
        {
            int?[] A = new int?[10];
            int? n = a.TietBĐ;
            int k = 0;
            while (n <= a.TietKT)
            {
                A[k] = n;
                n = n + 1;
                k++;
            }

            List<LICHTHI> lst = qlTNKQ.LICHTHIs.Where(t => t.NGAYTHI == a.NGAYTHI).ToList();

            foreach (LICHTHI b in lst)
            {
                int?[] B = new int?[10];
                int? m = b.TietBĐ;
                int o = 0;
                while (m <= b.TietKT)
                {
                    B[o] = m;
                    m = m + 1;
                    o++;
                }
                if (ktSo(A, B) == false)
                    return false;
            }
            return true;

            //List<LICHTHI> lst = qlTNKQ.LICHTHIs.Where(t => t.NGAYTHI == a.NGAYTHI).ToList();
            //if (lst == null)
            //    return true;
            //return false;
        }
        public void xoa(string id)
        {
            LICHTHI a = qlTNKQ.LICHTHIs.Where(t => t.ID_LICHTHI == id).First();
            qlTNKQ.LICHTHIs.DeleteOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public LICHTHI get_Data_TheoID(string id)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.ID_LICHTHI == id).FirstOrDefault();
        }
        public LICHTHI get_Data_TheoTen(string ten)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.TENLICHTHI == ten).FirstOrDefault();
        }
        public IQueryable get_Data_TheoMon(string idMon)
        {
            return qlTNKQ.LICHTHIs.Where(t=>t.ID_MONHOC==idMon);
        }
        public IQueryable get_Data_TheoHocKy(string idHocKy)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.ID_HOCKY == idHocKy);
        }
        public IQueryable get_Data_TheoNamhoc(string idNamhoc)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.ID_NAMHOC == idNamhoc);
        }
        public bool ktSo(int? []A,int?[]B)
        {
            for(int i=0;i<A.Count();i++)
            {
                for(int j=0;j<B.Count();j++)
                {
                    if (A[i] == B[j]&&A[i]!=null&&B[j]!=null)
                        return false;
                }
            }
            return true;
        }
        public string autoID()
        {
            Random a = new Random();
            int dem = a.Next(100, 999);
            string ngay = DateTime.Now.ToString("yyMMddmm");
            return ngay.Substring(0, 8) + dem.ToString();
        }
        public List<LICHTHI> lst()
        {
            return qlTNKQ.LICHTHIs.ToList();
        }
        public List<LICHTHI> lst_TheoMon_HK_Nam(string idMon, string idHKy, string idNam)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.ID_NAMHOC == idNam && t.ID_MONHOC == idMon && t.ID_HOCKY == idHKy).ToList();
        }
        public List<LICHTHI> lst_TheoMon(string idMon)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.ID_MONHOC == idMon).ToList();
        }
        public List<LICHTHI> lst_TheoHK(string idHKy)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.ID_HOCKY == idHKy).ToList();
        }
        public List<LICHTHI> lst_TheoNam(string idNam)
        {
            return qlTNKQ.LICHTHIs.Where(t => t.ID_NAMHOC == idNam).ToList();
        }
    }
}
