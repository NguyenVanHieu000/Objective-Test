using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class CTBAITHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public void them(CTBAITHI a)
        {
            qlTNKQ.CTBAITHIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();

        }
    }
}
