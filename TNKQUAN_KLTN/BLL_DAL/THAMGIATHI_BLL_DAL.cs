using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class THAMGIATHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public TGTHI Timtheo_IDBaiThi(string id)
        {
            return qlTNKQ.TGTHIs.Where(t => t.ID_BAITHI == id).First();
        }
        public TGTHI Timtheo_IDSV(string id)
        {
            return qlTNKQ.TGTHIs.Where(t => t.ID_SVIEN == id).FirstOrDefault();
        }
        public List<TGTHI> lst_TheoLich(string idLich)
        {
            return qlTNKQ.TGTHIs.Where(t => t.ID_LICHTHI == idLich).ToList();
        }
        public List<TGTHI> list()
        {
            return qlTNKQ.TGTHIs.ToList();
        }
        public int autoID()
        {
            int dem = 0;
            if (qlTNKQ.TGTHIs.Count() > 0)
            {
                foreach (TGTHI a in list())
                {
                    dem = a.ID_TGTHI;
                }
            }
            return dem + 1;
        }
        public bool themList(List<TGTHI> lst)
        {
            try
            {
                foreach (TGTHI i in lst)
                {
                    qlTNKQ.TGTHIs.InsertOnSubmit(i);
                    qlTNKQ.SubmitChanges();
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        public IQueryable get_Data()
        {
            return qlTNKQ.TGTHIs.Select(t => t);
        }
        public IQueryable get_Data_TheoLich(string idLich)
        {
            return qlTNKQ.TGTHIs.Where(t => t.ID_LICHTHI == idLich);
        }
        public bool xoa(int id)
        {
            TGTHI a = qlTNKQ.TGTHIs.Where(t => t.ID_TGTHI == id).FirstOrDefault();
            if (a == null)
                return false;
            else
            {
                qlTNKQ.TGTHIs.DeleteOnSubmit(a);
                qlTNKQ.SubmitChanges();
                return true;
            }
            return false;
        }
    }
}
