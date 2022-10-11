using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class CTDTHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public void them(CTDTHI a)
        {
            qlTNKQ.CTDTHIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public List<CTDTHI> list()
        {
            return qlTNKQ.CTDTHIs.Select(t => t).ToList();
        }
        public int autoID(string idDeThi)
        {
            List<CTDTHI> lst = qlTNKQ.CTDTHIs.Where(t => t.ID_DTHI == idDeThi).ToList();
            int dem = 0;
            if (lst.Count > 0)
            {
                foreach (CTDTHI a in lst)
                {
                    dem = a.ID_CTDTHI;
                }
            }
            return dem + 1;

        }
        public void themCTDTHI(CTDTHI a)
        {
            qlTNKQ.CTDTHIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public IQueryable get_DataCTDTHi_TheoIDDTHI(string id)
        {
            return qlTNKQ.CTDTHIs.Where(x => x.ID_DTHI == id);
        }
        public void xoa(CTDTHI a)
        {
            qlTNKQ.CTDTHIs.DeleteOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public List<CTDTHI> list_TheoDeThi(string id)
        {
            return qlTNKQ.CTDTHIs.Where(t => t.ID_DTHI==id).ToList();
        }
    }
}
