using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Web.Models;
using Web.Common;
using System.Text.RegularExpressions;
namespace Web.Controllers
{
    public class StudentController : Controller
    {
        User user = new User();
        StudentDA Model = new StudentDA();
        DataClasses1DataContext db = new DataClasses1DataContext();
        //
        // GET: /Student/
        [HttpGet]
        public ActionResult Index()
        {
            return View(Model.GetDashboard());
        }
        public ActionResult DoingTest(string idDethi, string idbaithi)
        {
            string iddt = idDethi;
            Model.id_BaiThi = idbaithi;
            Model.id_DeThi = iddt;
            ViewBag.ID = idDethi;
            ViewBag.ID_BT = idbaithi;
            Model.Time(iddt);
            if (!user.IsTesting())
                return View("Error");
            if (Model.time != null)
            {
                string timem = Model.time.ToString();
                string[] time = Regex.Split(timem, ":");
                ViewBag.min = time[0];
                ViewBag.sec = time[1];
            }
            Model.UpdateTimeBD(iddt);
            return View(Model.GetListQuest(iddt));
            
        }
        public ActionResult SubmitTest()
        {
            string id = Request["idDethi"];
            Model.id_BaiThi  = Request["idBaithi"];
            Model.id_DeThi = id;
            if (!user.IsTesting())
                return View("Error");
            var list = Model.GetListQuest(id);
            int? total_quest = 0;
            foreach (var item in list)
            {
                if (item.dethi.ID_DETHI.Equals(id))
                {
                    total_quest = item.dethi.SLCAU;
                    break;
                }
            }
            double coefficient = 10.0 / (double)total_quest;
            int count_correct = 0;
            foreach (var item in list)
            {
                if (item.dethi.ID_DETHI.Equals(id))
                {
                    if (item.ctbaithi.DapAn != null && item.ctbaithi.DapAn.Trim().Equals(item.ctdethi.DapAn.Trim()))
                        count_correct++;
                }
            }
            double score = coefficient * count_correct;
            Model.UpdateTimeKT(Model.id_DeThi, score, count_correct);
            return RedirectToAction("Index");
        }
        [HttpPost]
        public void UpdateTiming(FormCollection form)
        {
            
            string min = form["min"];
            string sec = form["sec"];
            string idbt = form["idbt"];
            string time = min + ":" + sec;
            Model.UpdateTiming(time,idbt);
        }

        [HttpPost]
        public void UpdateStudentTest(FormCollection form)
        {
            int id_quest = int.Parse(form["id"]);
            string answer = form["answer"];
            string idbt = form["idbthi"];
            answer = answer.Trim();
            string time = form["min"] + ":" + form["sec"];
            Model.UpdateStudentTest(id_quest, answer,idbt);
            Model.UpdateTiming(time, idbt);
        }
        public ActionResult Logout()
        {
            if (user.id == null)
                return View("Error");
            user.Reset();
            return RedirectToAction("Login", "Login");
        }
    }
}