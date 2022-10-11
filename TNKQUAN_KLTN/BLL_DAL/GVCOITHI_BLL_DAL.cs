using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class GVCOITHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public void them(GVCOITHI a)
        {
            qlTNKQ.GVCOITHIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
    }
}
