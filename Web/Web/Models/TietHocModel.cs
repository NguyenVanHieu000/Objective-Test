using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace Web.Models
{
    public class TietHocModel
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public List<TIETHOC> getTietHoc()
        {
            return db.TIETHOCs.Select(t => t).ToList();
        }
    }
}