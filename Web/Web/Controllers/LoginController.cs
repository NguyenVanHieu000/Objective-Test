using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;
using Web.Common;
namespace Web.Controllers
{
    public class LoginController : Controller
    {
        DataClasses1DataContext db = new DataClasses1DataContext();
        [HttpGet]
        public ActionResult Login()
        {
            return View();
        }

        [HttpPost]
        public ActionResult Login(string username, string password, LoginModel model)
        {
            model.username = username;
            model.password = password;
            if (String.IsNullOrEmpty(username))
            {
                ViewData["Loi1"] = "Phải nhập tên đăng nhập";

            }
            else
                if (String.IsNullOrEmpty(password))
                {
                   ViewData["Loi2"] = "Phải nhập mật khẩu";
                }
                else
                {
                    if (ModelState.IsValid)
                    {
                        if (model.IsValidSinhVien(model))
                        {
                            ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                            return RedirectToAction("Index", "Student");
                        }
                        else
                        {
                            if (model.IsValidGiangVien(model))
                            {
                                ViewBag.Thongbao = "Chúc mừng đăng nhập thành công";
                                return RedirectToAction("Index", "Teacher");
                            }
                            else
                                ViewBag.Thongbao = "Tên đăng nhập hoặc mật khẩu không đúng ";
                        }
                    }
                    else
                        ViewBag.error = "Có lỗi xảy ra trong quá trình xử lý, vui lòng thử lại sau.";
                }
            return View();
        }
	}
}