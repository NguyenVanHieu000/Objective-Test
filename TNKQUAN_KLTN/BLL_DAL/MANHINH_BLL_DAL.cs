using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
   public class MANHINH_BLL_DAL
    {
       DBDataContext qlTNKQ = new DBDataContext();
       public List<MANHINH> getDataMANHINH()
       {
           return qlTNKQ.MANHINHs.Select(t => t).ToList();
       }
       public bool Insert_MH(string Ten)
       {
           try
           {
               MANHINH mh1 = qlTNKQ.MANHINHs.SingleOrDefault(t => t.TENMANHINH.Equals(Ten));
               if(mh1 == null)
               {
                   MANHINH mh = new MANHINH();
                   mh.ID_MANHINH = "";
                   mh.TENMANHINH = Ten;
                   qlTNKQ.MANHINHs.InsertOnSubmit(mh);
                   qlTNKQ.SubmitChanges();
                   return true;
               }
               return false;
           }
           catch
           {
               return false;
           }
       }
       public bool Delete_MH(string ID)
       {
           try
           {
               MANHINH mh = qlTNKQ.MANHINHs.SingleOrDefault(t => t.ID_MANHINH.Equals(ID));
               qlTNKQ.MANHINHs.DeleteOnSubmit(mh);
               qlTNKQ.SubmitChanges();
               return true;
           }
           catch
           {
               return false;
           }
       }
       public bool Update_MH(string ID,string Ten)
       {
           try
           {
               MANHINH mh = qlTNKQ.MANHINHs.SingleOrDefault(t => t.ID_MANHINH.Equals(ID));
               if(mh !=null)
               {
                   mh.TENMANHINH = Ten;
                   qlTNKQ.SubmitChanges();
                   return true;
               }
               return false;
           }
           catch
           {
               return false;
           }
       }
    }
}
