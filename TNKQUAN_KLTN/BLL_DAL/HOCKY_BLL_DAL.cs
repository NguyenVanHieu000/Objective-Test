using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class HOCKY_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<HOCKY> listHocKy()
        {
            return qlTNKQ.HOCKies.ToList();
        }
        public HOCKY timTheoTen(string ten)
        {
            return qlTNKQ.HOCKies.Where(t => t.TENHK == ten).First();
        }
        public HOCKY timTheoID(string id)
        {
            return qlTNKQ.HOCKies.Where(t => t.ID_HOCKY == id).First();
        }
        public List<HOCKY> timTheoID1(string id)
        {
            return qlTNKQ.HOCKies.Where(t => t.ID_HOCKY == id).Select(t=>t).ToList();
        }
    }
}
