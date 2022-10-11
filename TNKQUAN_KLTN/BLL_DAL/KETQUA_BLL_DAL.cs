using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class KETQUA_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public IQueryable get_Data()
        {
            return qlTNKQ.KETQUAs.Select(t => t);
        }
        public IQueryable get_Data_TheoBaiThi(string id)
        {
            return qlTNKQ.KETQUAs.Where(t => t.ID_BAITHI==id);
        }
        public KETQUA timTheoIDBaiThi(string id)
        {
            return qlTNKQ.KETQUAs.Where(t => t.ID_BAITHI == id).First();
        }
        public double? AVGBaiThi(string id)
        {
            return qlTNKQ.KETQUAs.Where(t=>t.ID_BAITHI.Equals(id)).Sum(t => t.DIEMTHI);
        }
    }
}
