using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class MUCDO_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<MUCDO> listMucDo()
        {
            return qlTNKQ.MUCDOs.ToList();
        }
        public MUCDO timTheoID(string id)
        {
            return qlTNKQ.MUCDOs.Where(t => t.ID_MUCDO == id).First();
        }
        public MUCDO timTheoTen(string ten)
        {
            ten = ten.TrimEnd('\r',' ','\n');
            return qlTNKQ.MUCDOs.Where(t => t.TENMUCDO == ten).FirstOrDefault();
        }
    }
}
