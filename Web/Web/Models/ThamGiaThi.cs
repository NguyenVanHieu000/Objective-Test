using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class ThamGiaThi
    {
        public string idSV { get; set; }
        public string tenSV { get; set; }
        public string tinhTrang { get; set; }
        public DateTime? gioBD { get; set; }
        public DateTime? gioKT { get; set; }
        public string timing { get; set; }
    }
}