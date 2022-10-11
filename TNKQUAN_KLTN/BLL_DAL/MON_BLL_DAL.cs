using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class MON_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<MONHOC> listMon()
        {
            return qlTNKQ.MONHOCs.Select(t=>t).ToList();
        }
        public MONHOC timTheoTen(string ten)
        {
            ten = ten.TrimEnd('\r',' ','\n');
            return qlTNKQ.MONHOCs.Where(x => x.TENMONHOC == ten).FirstOrDefault() ;
        }
        public MONHOC timTheoID(string id)
        {
            return qlTNKQ.MONHOCs.Where(x => x.ID_MONHOC == id).First();
        }
        public List<MONHOC> listMon(string ID)
        {
            return qlTNKQ.MONHOCs.Where(t => t.ID_KHOA.Equals(ID)).Select(t=>t).ToList();
        }
        public bool InsertMH(string ten,int tc,int chuong ,string khoa)
        {
            try
            {
                MONHOC mh = new MONHOC();
                mh.TENMONHOC = ten;
                mh.TChi = tc;
                mh.TONGCHUONG = chuong;
                mh.ID_KHOA = khoa;
                mh.ID_MONHOC = autoID();
                qlTNKQ.MONHOCs.InsertOnSubmit(mh);
                qlTNKQ.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public string autoID()
        {
            string id = "";
            int dem = 0;
            if (qlTNKQ.MONHOCs.Count() > 0)
            {
                foreach (MONHOC a in listMon())
                {
                    id = a.ID_MONHOC;
                }
                dem = int.Parse(id.Substring(2,3));
            }
            if (dem < 9)
                return "MH00" + (dem + 1).ToString();
            else if (dem >= 9 && dem < 99)
                return "MH0" + (dem + 1).ToString();
            else 
                return "MH" + (dem + 1).ToString();
        }
    }
}
