using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace BLL_DAL
{
    public class PHANQUYEN_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public List<CHUCVU> LoadCHUCVU()
        {
            return qlTNKQ.CHUCVUs.Select(t => t).ToList();
        }
        public IQueryable loadCHUCVU(string id)
        {
            return qlTNKQ.CHUCVUs.Where(t=> t.ID_CVU.Equals(id));
        }
        public List<PHANQUYEN> loadPHANQUYEN()
        {
            return qlTNKQ.PHANQUYENs.Select(t => t).ToList();
        }
        public  IQueryable get_DataGVIEN()
        {
            return qlTNKQ.GIANGVIENs.Select(t => t);
        }
        public List<GVIENCHUCVU> get_DataGVCVu()
        {
            return qlTNKQ.GVIENCHUCVUs.Select(t=>t).ToList();
        }
        public GVIENCHUCVU get_DataGVCVU(string ID)
        {
            return qlTNKQ.GVIENCHUCVUs.SingleOrDefault(t => t.ID_CVU.Equals(ID));
        }
        public IQueryable getDataNhom(string IDGVIEN)
        {
            return qlTNKQ.GVIENCHUCVUs.Where(t => t.ID_GVIEN.Equals(IDGVIEN)).Select(t=>t);
        }
        public IQueryable getDataManHinh(string IDCVU)
        {
            return qlTNKQ.PHANQUYENs.Where(t => t.ID_CVU.Equals(IDCVU)).Select(t=>t);
        }
        public bool Insert_GVIENCVU(string ID_GV,string ID_CV)
        {
            try
            {
                GVIENCHUCVU gcvu = qlTNKQ.GVIENCHUCVUs.SingleOrDefault(t => t.ID_GVIEN.Equals(ID_GV));
                if (gcvu == null)
                {
                    GVIENCHUCVU insert = new GVIENCHUCVU();
                    insert.ID_GVIEN = ID_GV;
                    insert.ID_CVU = ID_CV;
                    qlTNKQ.GVIENCHUCVUs.InsertOnSubmit(insert);
                    qlTNKQ.SubmitChanges();
                    return true;
                }
                return false;
            }
            catch(Exception)
            {
                return false;
                throw;
            }
        }
        public bool Delete_GVIENCVU(string ID_GV,string ID_CV)
        {
            try
            {
                GVIENCHUCVU gcvu = qlTNKQ.GVIENCHUCVUs.SingleOrDefault(t => t.ID_GVIEN.Equals(ID_GV)&& t.ID_CVU.Equals(ID_CV));
                qlTNKQ.GVIENCHUCVUs.DeleteOnSubmit(gcvu);
                qlTNKQ.SubmitChanges();
                return true;
            }
            catch(Exception)
            {
                return false;
                throw;
            }
        }
        public bool Insert_Quyen(PHANQUYEN ph)
        {
            try
            {
                PHANQUYEN pn = qlTNKQ.PHANQUYENs.SingleOrDefault(t=>t.ID_CVU.Equals(ph.ID_CVU) && t.ID_MANHINH.Equals(ph.ID_MANHINH));
                if(pn == null)
                {
                    PHANQUYEN pn1 = new PHANQUYEN();
                    pn1.ID_CVU = ph.ID_CVU;
                    pn1.ID_MANHINH = ph.ID_MANHINH;
                    pn1.COQUYEN = ph.COQUYEN;
                    qlTNKQ.PHANQUYENs.InsertOnSubmit(pn1);
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
        public bool Delete_Quyen(PHANQUYEN ph)
        {
            try
            {
                PHANQUYEN pn = qlTNKQ.PHANQUYENs.SingleOrDefault(t => t.ID_CVU.Equals(ph.ID_CVU) && t.ID_MANHINH.Equals(ph.ID_MANHINH));
                qlTNKQ.PHANQUYENs.DeleteOnSubmit(pn);
                qlTNKQ.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public bool Update_Quyen(PHANQUYEN ph)
        {
            try
            {
                PHANQUYEN pn = qlTNKQ.PHANQUYENs.SingleOrDefault(t => t.ID_CVU.Equals(ph.ID_CVU) && t.ID_MANHINH.Equals(ph.ID_MANHINH));
                pn.COQUYEN = ph.COQUYEN;
                qlTNKQ.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

       

    }
}
