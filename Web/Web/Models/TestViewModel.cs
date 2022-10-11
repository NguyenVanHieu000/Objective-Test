using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class TestViewModel
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public TGTHI tgthi { get; set; }
        public BAITHI baithi { get; set; }
        public MONHOC monhoc { get; set; }
        public DETHI dethi { get; set; }
        public PHONGTHI phongthi { get; set; }
        public List<DETHI> getdata_DETHI()
        {
            return db.DETHIs.Select(t=>t).ToList();
        }
        public List<LICHTHI> getData_LICHTHI()
        {
            return db.LICHTHIs.Select(t => t).ToList();
        }
    }
}