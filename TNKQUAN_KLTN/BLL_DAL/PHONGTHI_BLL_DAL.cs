using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class PHONGTHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<PHONGTHI> lst()
        {
            return qlTNKQ.PHONGTHIs.ToList();
        }
    }
}
