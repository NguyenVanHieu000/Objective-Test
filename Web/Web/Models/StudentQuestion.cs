using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class StudentQuestion
    {
        public TGTHI tgthi { get; set; }
        public BAITHI baithi { get; set; }
        public DETHI dethi { get; set; }
        public CTDTHI ctdethi { get; set; }
        public CTBAITHI ctbaithi { get; set; }
        public LICHTHI lichthi { get; set; }
    }
}