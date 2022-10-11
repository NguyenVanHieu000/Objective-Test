using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web;
using Web.Common;
namespace Web.Models
{
    public class LoginModel
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        [Display(Name = "Tài Khoản")]
        public string username { get; set; }
        [Display(Name = "Mật Khẩu")]
        public string password { get; set; }
        public bool IsValidSinhVien(LoginModel model)
        {
            //model.password = Common.Encryptor.MD5Hash(model.password);
            try
            {
                SINHVIEN sv = db.SINHVIENs.First(x => x.ID_SVIEN == model.username && x.PASSSVIEN == model.password);
                if (sv != null)
                {
                    SetStudentSession(sv.ID_SVIEN);
                    return true;
                }
            }
            catch (Exception) { }
            return false;
        }
        public bool IsValidGiangVien(LoginModel model)
        {
            //model.password = Common.Encryptor.MD5Hash(model.password);
            try
            {
                GIANGVIEN gv = db.GIANGVIENs.First(x => x.ID_GVIEN == model.username && x.PASSGV == model.password);
                if (gv != null)
                {
                    SetTeacherSession(gv.ID_GVIEN);
                    return true;
                }
            }
            catch (Exception) { }
            return false;
        }
        public void SetStudentSession(string userID)
        {
            SINHVIEN user = db.SINHVIENs.SingleOrDefault(x => x.ID_SVIEN == userID);
            HttpContext.Current.Session.Add(Common.UserSession.id, user.ID_SVIEN);
            HttpContext.Current.Session.Add(Common.UserSession.ten, user.TENSV);
            HttpContext.Current.Session.Add(Common.UserSession.hinh, user.HINHSV);
            HttpContext.Current.Session.Add(Common.UserSession.namsinh, user.NAMSINH);
            HttpContext.Current.Session.Add(Common.UserSession.gioitinh, user.GIOITINH);
        }
        public void SetTeacherSession(string userID)
        {
            GIANGVIEN user = db.GIANGVIENs.SingleOrDefault(x => x.ID_GVIEN == userID);
            HttpContext.Current.Session.Add(Common.UserSession.id, user.ID_GVIEN);
            HttpContext.Current.Session.Add(Common.UserSession.ten, user.TENGV);
            HttpContext.Current.Session.Add(Common.UserSession.hinh, user.HINHGV);
            HttpContext.Current.Session.Add(Common.UserSession.namsinh, user.NAMSINH);
            HttpContext.Current.Session.Add(Common.UserSession.gioitinh, user.GIOITINH);
        }
    }
}