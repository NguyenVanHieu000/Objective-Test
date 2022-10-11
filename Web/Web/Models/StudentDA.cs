using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Web.Common;
namespace Web.Models
{
    public class StudentDA
    {
        User user = new User();
        DataClasses1DataContext db = new DataClasses1DataContext();
        DeThi dt = new DeThi();
        TestViewModel ts = new TestViewModel();
        public List<TestViewModel> GetDashboard()
        {
            List<TestViewModel> tests = (from x in db.TGTHIs
                                         where x.ID_SVIEN == user.id
                                         join s in db.LICHTHIs on x.ID_LICHTHI equals s.ID_LICHTHI
                                         join mh in db.MONHOCs on s.ID_MONHOC equals mh.ID_MONHOC
                                         join bt in db.BAITHIs on x.ID_BAITHI equals bt.ID_BAITHI
                                         join dt in db.DETHIs on bt.ID_DETHI equals dt.ID_DETHI
                                         join p in db.PHONGTHIs on x.ID_PHONGTHI equals p.ID_PHONGTHI
                                         select new TestViewModel { tgthi = x, monhoc = mh, baithi = bt, phongthi = p, dethi = dt }).ToList();
            return tests;
        }
        public string id_DeThi { get; set; }
        public string id_BaiThi { get; set; }
        public string time;
        public void Time(string id)
        {
            foreach (TGTHI item in dt.GetData_TGTHI(user.id))
            {
                foreach(BAITHI item1 in dt.GetData_BAITHI(item.ID_BAITHI))
                {
                    foreach(DETHI item2 in dt.GetData_DETHI(id))
                    {
                        if (item1.TIMING != null)
                        {
                            time = item1.TIMING.ToString();
                            break;
                        }
                        else
                        {
                            time = item2.TGLamBai.ToString() + ":00";
                            break;
                        }
                    }
                }
            }
        }
        public List<StudentQuestion> GetListQuest(string ids)
        {
            List<StudentQuestion> list = new List<StudentQuestion>();
            try
            {
                list = (from x in db.TGTHIs
                        join s in db.BAITHIs on x.ID_BAITHI equals s.ID_BAITHI
                        join t in db.DETHIs on s.ID_DETHI equals t.ID_DETHI
                        join u in db.CTDTHIs on s.ID_DETHI equals u.ID_DTHI
                        join l in db.LICHTHIs on x.ID_LICHTHI equals l.ID_LICHTHI
                        where x.ID_SVIEN.Equals(user.id) && t.ID_DETHI.Equals(ids) && x.ID_BAITHI.Equals(id_BaiThi)
                        select new StudentQuestion { tgthi = x, baithi = s, dethi = t, lichthi = l, ctdethi = u }).OrderBy(t => t.tgthi.ID_SVIEN).ToList();
                foreach (var item in list)
                {
                    if (item.tgthi.ID_BAITHI.Equals(item.baithi.ID_BAITHI))
                    {
                        string id = item.baithi.ID_BAITHI;
                        list = (from x in db.BAITHIs
                                join s in db.CTBAITHIs on x.ID_BAITHI equals s.ID_BAITHI
                                join t in db.CTDTHIs on s.ID_CTDETHI equals t.ID_CTDTHI
                                where x.ID_BAITHI.Equals(id)
                                select new StudentQuestion { baithi = item.baithi, tgthi = item.tgthi, dethi = item.dethi, ctdethi = t, lichthi = item.lichthi, ctbaithi = s }
                        ).OrderBy(t => t.ctbaithi.ID_CTBAITHI).ToList();
                        break;
                    }
                }
            }
            catch (Exception)
            {

            }
            return list;
        }
        public void UpdateTiming(string timing ,string idbt)
        {
            BAITHI bt = db.BAITHIs.Where(t => t.ID_BAITHI.Equals(idbt)).Single();
            bt.TIMING = timing;
            time = timing;
            db.SubmitChanges();
        }
        public void UpdateStudentTest(int id_question, string answer, string id_bt )
        {
            var update = (from t in db.TGTHIs where t.ID_SVIEN == user.id
                          join x in db.BAITHIs on t.ID_BAITHI equals x.ID_BAITHI
                          join s in db.CTBAITHIs on x.ID_BAITHI equals s.ID_BAITHI
                          join p in db.CTDTHIs on s.ID_CTDETHI equals p.ID_CTDTHI
                          where x.ID_BAITHI == id_bt  &&  s.ID_CTDETHI == id_question select s).First();
            update.DapAn = answer;
            db.SubmitChanges();
        }
        public void UpdateTimeBD(string id)
        {
            List<TGTHI> tgh = db.TGTHIs.Where(t=>t.ID_SVIEN.Equals(user.id)).Select(t => t).ToList();
            List<BAITHI> bt = db.BAITHIs.Where(t => t.ID_DETHI.Equals(id)).Select(t => t).ToList();
            foreach (var item in tgh)
            {
                foreach (var item1 in bt)
                {
                    if(item.ID_BAITHI.Equals(item1.ID_BAITHI) && item1.ID_DETHI.Equals(id))
                    {
                            var timebd = db.BAITHIs.Where(t => t.ID_BAITHI.Equals(item1.ID_BAITHI)).Single();
                            timebd.TGBDau = DateTime.Now;
                            db.SubmitChanges();
                    } 
                }
            }    
        }
        public void UpdateTimeKT(string id, double score, int correct)
        {
            List<TGTHI> tgh = db.TGTHIs.Where(t => t.ID_SVIEN.Equals(user.id)).Select(t => t).ToList();
            List<BAITHI> bt = db.BAITHIs.Where(t => t.ID_DETHI.Equals(id)).Select(t => t).ToList();
            foreach (var item in tgh)
            {
                foreach (var item1 in bt)
                {
                    if (item.ID_BAITHI.Equals(item1.ID_BAITHI) && item1.ID_DETHI.Equals(id))
                    {
                        var timebd = db.BAITHIs.Where(t => t.ID_BAITHI.Equals(item1.ID_BAITHI)).Single();
                        timebd.TGKT = DateTime.Now;
                        db.SubmitChanges();
                        InsertScore(item1.ID_BAITHI,score, correct);
                        FinishTest(item1.ID_BAITHI);
                    }
                }
            }
        }
        public void InsertScore(string id,double score, int correct)
        {
            KETQUA s  = new KETQUA();
            s.ID_KQUA = "";
            s.ID_BAITHI = id;
            s.DIEMTHI = score;
            s.SLCAUDUNG = correct;
            db.KETQUAs.InsertOnSubmit(s);
            db.SubmitChanges();
        }
        public void FinishTest(string id)
        {
            var bt = db.BAITHIs.Where(t => t.ID_BAITHI.Equals(id)).Single();
            bt.TINHTRANG = 1;
            db.SubmitChanges();
        }
    }
}