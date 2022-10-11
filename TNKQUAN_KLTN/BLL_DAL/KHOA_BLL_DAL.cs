using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class KHOA_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<KHOA> listKhoa()
        {
            return qlTNKQ.KHOAs.ToList();
        }
        public KHOA timKhoaTheoTen(string ten)
        {
            return qlTNKQ.KHOAs.Where(x => x.TENKHOA == ten).First();
        }
        public KHOA timKhoaTheoID(string id)
        {
            return qlTNKQ.KHOAs.Where(x => x.ID_KHOA == id).First();
        }
        public List<KHOA> get_IDKHOA(string ID)
        {
            return qlTNKQ.KHOAs.Where(x => x.ID_KHOA == ID).ToList();
        }
    }
}
