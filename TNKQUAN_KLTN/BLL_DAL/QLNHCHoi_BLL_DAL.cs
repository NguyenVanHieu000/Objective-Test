using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class QLNHCHoi_BLL_DAL
    {
        DBDataContext qlNHCHOI = new DBDataContext();
        public IQueryable getDATAGVien()
        {
            return qlNHCHOI.GIANGVIENs.Select(t => t);
        }
        public List<CAUHOI> getDataCH()
        {
            return qlNHCHOI.CAUHOIs.Select(t => t).ToList();
        }
        public List<CAUHOI> getDataCH(string ID_NHCHOI )
        {
            return qlNHCHOI.CAUHOIs.Where(t => t.ID_NHCH.Equals(ID_NHCHOI)).Select(t=>t).ToList();
        }
        public List<MUCDO> getDateMDo()
        {
            return qlNHCHOI.MUCDOs.Select(t=> t).ToList();
        }
        public IQueryable getDataChuong(string ID_NHCHOI)
        {
            return qlNHCHOI.CAUHOIs.Where(t=> t.ID_NHCH.Equals(ID_NHCHOI)).Select(t => t.CHUONG).Distinct();
        }

        public IQueryable getDataTTrang()
        {
            return qlNHCHOI.CAUHOIs.Select(t => t.TTrang).Distinct();
        }
        public List<NHCH> getDataNHCH()
        {
            return qlNHCHOI.NHCHes.Select(t => t).ToList();
        }
        public NHCH timTheoMon(string idMon)
        {
            return qlNHCHOI.NHCHes.Where(t => t.ID_MONHOC == idMon).First();
        }
        public NHCH timTheoID(string id)
        {
            return qlNHCHOI.NHCHes.Where(t => t.ID_NHCH == id).First();
        }
        public bool them(string idMon,string idGV)
        {
            try
            {
                NHCH a = new NHCH();
                a.ID_NHCH = autoID();
                a.ID_MONHOC = idMon;
                a.SLCAUHOI = 0;
                a.ID_GVIEN = idGV;
                a.TGCAPNHAT = DateTime.Now;
                qlNHCHOI.NHCHes.InsertOnSubmit(a);
                qlNHCHOI.SubmitChanges();
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
            if (qlNHCHOI.NHCHes.Count() > 0)
            {
                foreach (NHCH a in getDataNHCH())
                {
                    id = a.ID_NHCH;
                }
                dem = int.Parse(id.Substring(4, 3));
            }
            if (dem < 9)
                return "NHCH00" + (dem + 1).ToString();
            else if (dem >= 9 && dem < 99)
                return "NHCH0" + (dem + 1).ToString();
            else
                return "NHCH" + (dem + 1).ToString();
        }
    }
}
