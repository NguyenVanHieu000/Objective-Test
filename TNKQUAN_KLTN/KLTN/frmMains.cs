using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using BLL_DAL;
namespace KLTN
{
    public partial class frmMains : Form
    {
        KHOA_BLL_DAL khoa = new KHOA_BLL_DAL();
        NGUOIDUNG_BLL_DAL nguoidung = new NGUOIDUNG_BLL_DAL();
        PHANQUYEN_BLL_DAL phanquyen = new PHANQUYEN_BLL_DAL();
        public string user="";
        public string id_khoa = "";
        public string chucvu = "";
        public string mk = "";
        public frmMains()
        {
            InitializeComponent();
            this.WindowState = FormWindowState.Maximized;
        }

        private void frmMains_Load(object sender, EventArgs e)
        {
            pnScreen.Padding = new Padding(70, 0, 50, 0);
            customizeDesing();
            load_Button();
            load_NguoiDung();
        }
        private void load_Button()
        {
            btnSoanNHCH.Visible = false;
            btnNHCH.Visible = false;
            btnTaoDotThi.Visible = false;
            btnChucVu.Visible = false;
            btnPQuyen.Visible = false;
            btnThongKe.Visible = false;
            btnTGTHI.Visible = false;
        }

        public void load_NguoiDung()
        {
            try
            {
                string tencv = "";
                string tenKhoa = "";
                try
                {
                    foreach (GIANGVIEN gv1 in nguoidung.get_Infos(user))// lấy dữ liệu từ bảng GVIEN
                    {


                        foreach (GVIENCHUCVU gvcu in nguoidung.get_DataGVCVU(gv1.ID_GVIEN))// truyền ID_GVIEN để lấy dữ liệu từ bảng GVCVU
                        {
                            foreach (CHUCVU cv in nguoidung.get_DataCVU())//lấy dữ liệu từ bảng chức vụ
                            {
                                if (gvcu.ID_CVU == cv.ID_CVU)
                                {
                                    tencv = cv.TENCVU;
                                    chucvu = cv.ID_CVU;
                                    break;
                                }
                            }
                        }
                        foreach (KHOA item in khoa.get_IDKHOA(gv1.ID_KHOA))
                        {
                            if (item.ID_KHOA.Equals(gv1.ID_KHOA))
                            {
                                tenKhoa = item.TENKHOA;
                                id_khoa = item.ID_KHOA;
                                break;
                            }
                        }
                        lbChucVu.Text = tencv;
                        lbID.Text = gv1.ID_GVIEN.ToString();
                        lbTen.Text = gv1.TENGV.ToString();
                        lbKhoa.Text = tenKhoa;
                        imgUser.Image = Image.FromFile(Application.StartupPath + "\\img\\" + gv1.HINHGV);
                        break;
                    }
                }
                catch
                {
                    foreach (GIANGVIEN gv1 in nguoidung.get_Infos(user))// lấy dữ liệu từ bảng GVIEN
                    {


                        foreach (GVIENCHUCVU gvcu in nguoidung.get_DataGVCVU(gv1.ID_GVIEN))// truyền ID_GVIEN để lấy dữ liệu từ bảng GVCVU
                        {
                            foreach (CHUCVU cv in nguoidung.get_DataCVU())//lấy dữ liệu từ bảng chức vụ
                            {
                                if (gvcu.ID_CVU == cv.ID_CVU)
                                {
                                    tencv = cv.TENCVU;
                                    chucvu = cv.ID_CVU;
                                    break;
                                }
                            }
                        }
                        foreach (KHOA item in khoa.get_IDKHOA(gv1.ID_KHOA))
                        {
                            if (item.ID_KHOA.Equals(gv1.ID_KHOA))
                            {
                                tenKhoa = item.TENKHOA;
                                id_khoa = item.ID_KHOA;
                                break;
                            }
                        }
                        lbChucVu.Text = tencv;
                        lbID.Text = gv1.ID_GVIEN.ToString();
                        lbTen.Text = gv1.TENGV.ToString();
                        lbKhoa.Text = tenKhoa;
                        imgUser.Image = Image.FromFile(Application.StartupPath + "\\Hinh\\svNam1.PNG");
                        break;
                    }
                }
                load_phanquyen();
            }
            catch
            {

            }
        }

        private void customizeDesing()
        {
            panelTaiKhoanSubmenu.Visible = false;
        }

        private void hideSubmenu()
        {
            if (panelTaiKhoanSubmenu.Visible == true)
                panelTaiKhoanSubmenu.Visible = false;
        }
        private Form activeForm = null;
        private void openChildForm(Form childForm)
        {
            if (activeForm != null)
            {
                activeForm.Close();
            }
            activeForm = childForm;
            childForm.TopLevel = false;
            childForm.FormBorderStyle = FormBorderStyle.None;
            childForm.Dock = DockStyle.Fill;
            pnScreen.Controls.Add(childForm);
            pnScreen.Tag = childForm;
            pnScreen.Dock = DockStyle.Fill;
            childForm.BringToFront();
            childForm.Show();
        }
        private void showSubmenu(Panel submenu)
        {
            if (submenu.Visible == false)
            {
                hideSubmenu();
                submenu.Visible = true;
            }
            else
                submenu.Visible = false;
        }

        public void load_phanquyen()
        {
            foreach (GVIENCHUCVU item in phanquyen.getDataNhom(user))
            {
                foreach (PHANQUYEN item1 in phanquyen.getDataManHinh(item.ID_CVU))
                {
                    CheckAllButtonChildVisiable(item1.ID_MANHINH);
                }
            }
        }

        private void CheckAllButtonChildVisiable(string tag)
        {
            foreach (System.Windows.Forms.Control bt in panelSlideMenu.Controls)
            {
                if (bt.GetType().ToString() == "System.Windows.Forms.Button")
                {
                    if (bt.Tag != null)
                    {
                        if (bt.Tag.Equals(tag))
                        {
                            bt.Visible = true;
                        }
                    }
                }
            }
        }

        private void btnTaiKhoan_Click(object sender, EventArgs e)
        {
            
            if (panelSlideMenu.Width != 55)
            {
                showSubmenu(panelTaiKhoanSubmenu);
            }
            else if (panelSlideMenu.Width == 55)
            {
                panelTaiKhoanSubmenu.Hide();
            }
            
        }

        private void frmMains_FormClosed(object sender, FormClosedEventArgs e)
        {

            Program.frmDN.Show();
            if (Program.frmMain != null)
            {
                Program.frmMain.Close();
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
            hideSubmenu();
        }

       

        private void btnSoanNHCH_Click(object sender, EventArgs e)
        {
            Program.frmSoanNHCH = new frmSoanCauHoi();
            Program.frmSoanNHCH.user = this.user;
            Program.frmSoanNHCH.id_Khoa = this.id_khoa;
            openChildForm(Program.frmSoanNHCH);
            hideSubmenu();
        }

        private void btnNHCH_Click(object sender, EventArgs e)
        {
            frmQLNHCHois frm = new frmQLNHCHois();
            frm.user = user;
            frm.id_KHOA = id_khoa;
            frm.chucvu = chucvu;
            openChildForm(frm);
            hideSubmenu();
        }

        private void btnTaoDotThi_Click(object sender, EventArgs e)
        {
            frmTaoDotThi frm = new frmTaoDotThi();
            frm.id_gv = user;
            openChildForm(frm);
            hideSubmenu();
        }

        private void btnChucVu_Click(object sender, EventArgs e)
        {
            openChildForm(new frmChucVu());
            hideSubmenu();
        }

        private void btnPQuyen_Click(object sender, EventArgs e)
        {
            openChildForm(new frmPHANQUYEN());
            hideSubmenu();
        }

        private void btnThongKe_Click(object sender, EventArgs e)
        {
            openChildForm(new frmSDTK());
            hideSubmenu();
        }

        private void btnTGTHI_Click(object sender, EventArgs e)
        {
            openChildForm(new frmThamGiaThi());
            hideSubmenu();
        }

        private void btnResetPass_Click(object sender, EventArgs e)
        {
            frmThayMatKhau frm = new frmThayMatKhau();
            frm.user = user;
            frm.mk = mk;
            frm.ShowDialog();
        }

        private void CollapseMenu()
        {
            if (this.panelSlideMenu.Width > 300) //Collapse menu
            {
                panelSlideMenu.Width = 55;
                panelLogo.Height = 55;
                pnScreen.Dock = DockStyle.Fill;
                panelSlideMenu.Dock = DockStyle.Left;

                imgUser.Size = new System.Drawing.Size(40, 40);

                pnScreen.Padding = new Padding(70, 0, 50, 0);

                btnTaiKhoan.Text = "";
                btnSoanNHCH.Text = "";
                btnNHCH.Text = "";
                btnTaoDotThi.Text = "";
                btnChucVu.Text = "";
                btnPQuyen.Text = "";
                btnTGTHI.Text = "";
                btnThongKe.Text = "";
                btnThoat.Text = "";

                foreach (Button menuButton in panelSlideMenu.Controls.OfType<Button>())
                {
                    menuButton.ImageAlign = ContentAlignment.MiddleCenter;
                    menuButton.Padding = new Padding(0);
                }
            }
            else
            { //Expand menu
                panelSlideMenu.Width = 310;
                panelLogo.Height = 203;
                panelSlideMenu.Dock = DockStyle.Left;
                pnScreen.Dock = DockStyle.Fill;

                imgUser.Size = new System.Drawing.Size(110, 120);

                //pnScreen.Padding = new Padding(360, 0, 0, 0);

                btnTaiKhoan.Text = "Tài khoản";
                btnSoanNHCH.Text = "Soạn Ngân Hàng Câu Hỏi";
                btnNHCH.Text = "Ngân Hàng Câu Hỏi";
                btnTaoDotThi.Text = "Tạo Đợt Thi";
                btnChucVu.Text = "Chức Vụ";
                btnPQuyen.Text = "Phân Quyền";
                btnTGTHI.Text = "Tham Gia Thi";
                btnThongKe.Text = "Thống kê";
                btnThoat.Text = "Thoát";
                btnResetPass.Text = "Thay đổi mật khẩu";


                foreach (Button menuButton in panelSlideMenu.Controls.OfType<Button>())
                {
                    menuButton.ImageAlign = ContentAlignment.MiddleRight;
                    menuButton.ForeColor = System.Drawing.Color.Black;
                    menuButton.Text = menuButton.Text;
                }
            }
        }

        private void panelLogo_Click(object sender, EventArgs e)
        {
            CollapseMenu();
        }

        private void imgUser_Click(object sender, EventArgs e)
        {
            CollapseMenu();
        }

        private void pnScreen_Paint(object sender, PaintEventArgs e)
        {

        }

        private void panelLogo_Paint(object sender, PaintEventArgs e)
        {

        }

    }
}
