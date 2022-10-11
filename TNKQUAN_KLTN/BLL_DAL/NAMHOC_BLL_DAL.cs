using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class NAMHOC_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<NAMHOC> listNamHoc()
        {
            return qlTNKQ.NAMHOCs.ToList();
        }
        public NAMHOC timTheoTen(string ten)
        {
            return qlTNKQ.NAMHOCs.Where(t => t.TENNAM == ten).First();
        }
        public NAMHOC timTheoID(string id)
        {
            return qlTNKQ.NAMHOCs.Where(t => t.ID_NAMHOC == id).First();
        }
    }
}
