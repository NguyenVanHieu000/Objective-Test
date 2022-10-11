using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class DANGNHAP_BLL_DAL
    {
        DBDataContext qlDN = new DBDataContext();
        public int DANGNHAP(string ID_GVIENs, string PASS)
        {
            var tendn = qlDN.GIANGVIENs.SingleOrDefault(t=> t.ID_GVIEN.Equals(ID_GVIENs)&& t.PASSGV.Equals(PASS));
            if (tendn == null )
            {
                return 1;
            }
            else
                return 0;

        }
        public List<GIANGVIEN> get_DataLogin(string pUserName, string pPassword)
        {
            return qlDN.GIANGVIENs.Where(t => t.ID_GVIEN.Equals(pUserName) && t.PASSGV.Equals(pPassword)).Select(t => t).ToList();
        }
    }
}
