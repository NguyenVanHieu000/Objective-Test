using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class GacThi
    {
        public string tenPhong { get; set; }
        public int? TietBD { get; set; }
        public int? TietKT { get; set; }
        public string tenMonHoc { get; set; }
        public DateTime? ngayThi { get; set; }
        public int quyen { get; set; }
    }
}