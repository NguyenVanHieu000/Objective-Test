using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class DETHI_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public IQueryable get_Data()
        {
            return qlTNKQ.DETHIs.Select(t => t);
        }
        public IQueryable get_DataTheoMon(string id)
        {
            return qlTNKQ.DETHIs.Where(t => t.ID_NHCH==id);
        }
        public void them(DETHI a)
        {
            qlTNKQ.DETHIs.InsertOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }
        public List<DETHI> list()
        {
            return qlTNKQ.DETHIs.Select(t => t).ToList();
        }
        public string autoID()
        {
            string id = "";
            int dem = 0;
            if(qlTNKQ.DETHIs.Count()>0)
            {
                foreach (DETHI a in list())
                {
                    id = a.ID_DETHI;
                }
                dem = int.Parse(id.Substring(2, 3));
            }
            if (dem < 9)
                return "DT00" + (dem + 1).ToString();
            else if (dem >= 9 && dem < 99)
                return "DT0" + (dem + 1).ToString();
            else
                return "DT" + (dem + 1).ToString();
        }
        public void xoa(string id)
        {
            DETHI a = qlTNKQ.DETHIs.Where(x => x.ID_DETHI == id).First();
            qlTNKQ.DETHIs.DeleteOnSubmit(a);
            qlTNKQ.SubmitChanges();
        }

        public DETHI timTheoID(string id)
        {
            return qlTNKQ.DETHIs.Where(t => t.ID_DETHI == id).FirstOrDefault();
        }
        public List<DETHI> list_TheoMon_NamHoc(string idMon, string idNamHoc)
        {
            NHCH nhch = qlTNKQ.NHCHes.Where(t => t.ID_MONHOC == idMon).First();
            return qlTNKQ.DETHIs.Where(t => t.ID_NHCH == nhch.ID_NHCH && t.ID_NAMHOC == idNamHoc).ToList();
        }
        public List<DETHI> list_TheoMon(string idMon)
        {
            NHCH nhch = qlTNKQ.NHCHes.Where(t => t.ID_MONHOC == idMon).First();
            return qlTNKQ.DETHIs.Where(t => t.ID_NHCH == nhch.ID_NHCH).ToList();
        }
        
    }
}
