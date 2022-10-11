using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class LOPHP_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<LOPHOCPHAN> getDataLHP(string ID)
        {
            return qlTNKQ.LOPHOCPHANs.Where(t => t.ID_MONHOC.Equals(ID)).ToList();
        }
    }
}
