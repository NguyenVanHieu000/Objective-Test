using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Models;
namespace Web.Common
{
    public class User
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        public string id { get; set; }
        public string ten { get; set; }
        public string hinh { get; set; }
        public string namsinh { get; set; }
        public string gioitinh { get; set; }
        public int? time {get; set;}

        public User()
        {
            try
            {
                id = (string)HttpContext.Current.Session[UserSession.id];
                ten = (string)HttpContext.Current.Session[UserSession.ten];
                hinh = (string)HttpContext.Current.Session[UserSession.hinh];
                gioitinh = (string)HttpContext.Current.Session[UserSession.gioitinh];
                namsinh = (string)HttpContext.Current.Session[UserSession.namsinh];
                time = (int?)HttpContext.Current.Session[UserSession.time];
            }
            catch(Exception)
            {

            }
        }
        public void Reset()
        {
            HttpContext.Current.Session.Clear();
        }
        public bool IsTesting()
        {
            try
            {
                SINHVIEN a = db.SINHVIENs.SingleOrDefault(t=> t.ID_SVIEN.Equals(id));
                if (a!= null)
                    return true;
                return false;
            }
            catch (Exception)
            {
                return false;
            }
        }
    }
}