using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class BAITHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public BAITHI TimtheoID(string id)
        {
            return qlTNKQ.BAITHIs.Where(t => t.ID_BAITHI == id).First();
        }
        public IQueryable getDataDeThi_ID(string ID)
        {
            return qlTNKQ.BAITHIs.Where(t => t.ID_DETHI.Equals(ID));
        }
        public List<BAITHI> list()
        {
            return qlTNKQ.BAITHIs.ToList();
        }
        public string autoID()
        {
            string id = "";
            int dem = 0;
            if (qlTNKQ.BAITHIs.Count() > 0)
            {
                foreach (BAITHI a in list())
                {
                    id = a.ID_BAITHI;
                }
                dem = int.Parse(id.Substring(2, 4));
            }
            if (dem < 9)
                return "BT000" + (dem + 1).ToString();
            else if (dem >= 9 && dem < 99)
                return "BT00" + (dem + 1).ToString();
            else if (dem >= 99 && dem < 999)
                return "BT0" + (dem + 1).ToString();
            else
                return "BT" + (dem + 1).ToString();

        }
        public void them(BAITHI a)
        {
            qlTNKQ.BAITHIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
    }
}
