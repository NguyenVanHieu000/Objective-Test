using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Common;
namespace Web.Models
{
    public class DeThi
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        
        public List<TGTHI> GetData_TGTHI(string ID)
        {
            return db.TGTHIs.Where(t => t.ID_SVIEN.Equals(ID)).ToList();
        }
        public List<BAITHI> GetData_BAITHI(string ID)
        {
            return db.BAITHIs.Where(t => t.ID_BAITHI.Equals(ID)).ToList();
        }
        public List<DETHI> GetData_DETHI(string ID)
        {
            return db.DETHIs.Where(t=>t.ID_DETHI.Equals(ID)).ToList();
        }
    }
}