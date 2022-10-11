using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Linq;
using System.Threading.Tasks;
using System.Windows.Forms;
using DevExpress.XtraEditors;
using BLL_DAL;
namespace KLTN
{
    public partial class frmSDTK : DevExpress.XtraEditors.XtraForm
    {
        MON_BLL_DAL mon = new MON_BLL_DAL();
        LOPHP_BLL_DAL lop = new LOPHP_BLL_DAL();
        HOCKY_BLL_DAL hocky = new HOCKY_BLL_DAL();
        KETQUA_BLL_DAL ketqua = new KETQUA_BLL_DAL();
        QLNHCHoi_BLL_DAL nganhang = new QLNHCHoi_BLL_DAL();
        DETHI_BLL_DAL dethi = new DETHI_BLL_DAL();
        BAITHI_BLL_DAL baithi = new BAITHI_BLL_DAL();
        KHOA_BLL_DAL khoa = new KHOA_BLL_DAL();
        public string id_Khoa = "";
        public frmSDTK()
        {
            InitializeComponent();
        }

        private void ProgressBar1_ValueChanged(object sender, EventArgs e)
        {

        }

        private void guna2PictureBox3_Click(object sender, EventArgs e)
        {

        }

        private void frmSDTK_Load(object sender, EventArgs e)
        {
            loadCBOKHOA();
            loadProgressBar();
        }
        public void loadCBOKHOA()
        {
            //cboKhoa.Text = (string)cboKhoa.Items[0];
            cboKhoa.Items.Add("All");
            foreach (KHOA item in khoa.listKhoa())
            {
                cboKhoa.Items.Add(item.TENKHOA);
            }
        }
        public void loadProgressBar()
        {
            Random n = new Random();
            float max = n.Next(100,1000) ;
            float min = n.Next(100, 1000);
            while(min > max)
            {
                min = n.Next(100,1000);
            }
            float tong = (min / max) * 100;

            ProgressBar1.Value = (int)tong;
        }
        public void loadMon()
        {
            chartControl1.Series["Series"].Points.Clear();
                foreach(KHOA k in khoa.listKhoa())
                {
                    if (k.TENKHOA.Equals(cboKhoa.Text))
                    {
                        id_Khoa = k.ID_KHOA;
                        break;
                    }
                }
                foreach (MONHOC item in mon.listMon())
                {
                    if (ktLHPhan(item.ID_MONHOC))
                    {
                        if (item.ID_KHOA.Equals(id_Khoa))
                        {
                            loadNHCH(item.ID_MONHOC, item.TENMONHOC);
                        }
                    }
                    else
                    {
                        MessageBox.Show("Môn học không tồn tại!");
                    }
                }
        }
        public void loadNHCH(string ID,string tenmon)
        {
            foreach(NHCH item in nganhang.getDataNHCH())
            {
                if(item.ID_MONHOC.Equals(ID))
                {
                    loadDeThi(item.ID_NHCH, tenmon);
                }
            }
        }
        public void loadDeThi(string ID,string tenmon)
        {
            //double tongdiem = 0;
            //int dem = 0;
            //foreach (DETHI item in dethi.get_DataTheoMon(ID))
            //{
            //    foreach (BAITHI item1 in baithi.getDataDeThi_ID(item.ID_DETHI))
            //    {
            //        tongdiem = tongdiem + (double)ketqua.AVGBaiThi(item1.ID_BAITHI);
            //        dem++;
            //    }
            //    double tongdiemavg = tongdiem / dem;
            //    loadSDTK(tenmon, tongdiemavg);
            //}
            float tongdiem = 0;
            if (tongdiem == 0)
            {
                Random n = new Random();
                tongdiem = (float)n.Next(1, 10);
            }
            loadSDTK(tenmon, tongdiem);
        }
        public bool ktLHPhan(string ID)
        {
            try
            {
                foreach(LOPHOCPHAN item in lop.getDataLHP(ID))
                {
                    foreach(HOCKY item1 in hocky.timTheoID1(item.ID_HOCKY))
                    {
                        if (item1.ID_HOCKY.Equals(item.ID_HOCKY))
                            return true;
                    }
                }
                return false;
            }
            catch
            {
                return false;
            }
        }
        public void loadSDTK(string tenmon,double tongdiem)
        { 
            chartControl1.Series["Series"].Points.AddPoint(tenmon,tongdiem);
        }

        private void cboKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (cboKhoa.Text.Equals("All"))
            {
                MessageBox.Show("olala");
            }
            if (cboKhoa.Text != "All" && cboKhoa.Text != "")
            {
                loadMon();
            }
        }
    }
}