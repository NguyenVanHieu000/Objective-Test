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
    public partial class frmDangNhap : DevExpress.XtraEditors.XtraForm
    {
        DANGNHAP_BLL_DAL dn = new DANGNHAP_BLL_DAL();
        public frmDangNhap()
        {
            InitializeComponent();
        }

        private void frmDangNhap_Load(object sender, EventArgs e)
        {
            guna2Panel1.BackColor = Color.FromArgb(100, 0, 0, 0);
            this.guna2Panel1.Parent = this.guna2PictureBox1;
            txtMatKhau.UseSystemPasswordChar = true;
           

            label1.BackColor = System.Drawing.Color.Transparent;
            label2.BackColor = System.Drawing.Color.Transparent;
            label3.BackColor = System.Drawing.Color.Transparent;
            txtTaiKhoan.BackColor = System.Drawing.Color.Transparent;
            txtMatKhau.BackColor = System.Drawing.Color.Transparent;
            btnDangNhap.BackColor = System.Drawing.Color.Transparent;
            btnThoat.BackColor = System.Drawing.Color.Transparent;

            //guna2TextBox1.Focus();
        }

        private void frmDangNhap_FormClosing(object sender, FormClosingEventArgs e)
        {
            DialogResult r = MessageBox.Show("Bạn chắc chắn muốn thoát?", "", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button1);
            if (r == DialogResult.No)
                e.Cancel = true;
        }

        private void guna2Button2_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void guna2TextBox1_Enter(object sender, EventArgs e)
        {
            if (txtTaiKhoan.Text == "Vui lòng nhập tài khoản")
            {
                txtTaiKhoan.Text = "";
                txtTaiKhoan.ForeColor = Color.DimGray;
            }
        }

        private void guna2TextBox1_Leave(object sender, EventArgs e)
        {
            if (txtTaiKhoan.Text == "")
            {
                txtTaiKhoan.Text = "Vui lòng nhập tài khoản";
                txtTaiKhoan.ForeColor = Color.Gray;
            }
        }

        private void guna2TextBox2_Enter(object sender, EventArgs e)
        {
            if (txtMatKhau.Text == "Vui lòng nhập mật khẩu")
            {
                txtMatKhau.Text = "";
                txtMatKhau.ForeColor = Color.DimGray;
                txtMatKhau.UseSystemPasswordChar = true;
            }
        }

        private void guna2TextBox2_Leave(object sender, EventArgs e)
        {
            if (txtMatKhau.Text == "")
            {
                txtMatKhau.Text = "Vui lòng nhập mật khẩu";
                txtMatKhau.ForeColor = Color.Gray;
                txtMatKhau.UseSystemPasswordChar = false;
            }
        }

        private void guna2Panel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(txtTaiKhoan.Text.Trim()))
            {
                MessageBox.Show("Bạn chưa nhập " + label2.Text.ToLower());
                this.txtTaiKhoan.Focus();
                return;
            }
            else if (string.IsNullOrEmpty(txtMatKhau.Text.Trim()))
            {
                MessageBox.Show("Bạn chưa nhập " + label3.Text.ToLower());
                this.txtMatKhau.Focus();
                return;
            }
            else
            {
                ProcessLogin();
            }
        }

        public int checkLogin()
        {
            if (dn.get_DataLogin(txtTaiKhoan.Text, txtMatKhau.Text).Count() == 0)
                return 0;
            return 1;
        }
        public void ProcessLogin()
        {
            
            int result = checkLogin();
            if (result == 0)
            {
                MessageBox.Show("Sai " + label2.Text.ToLower() + " hoặc " + label3.Text.ToLower());
                return;
            }
            frmMains frm = new frmMains();
            frm.user = txtTaiKhoan.Text;
            frm.mk = txtMatKhau.Text;
            frm.Show();
            this.Hide();

        }

        private void guna2PictureBox1_Click(object sender, EventArgs e)
        {

        }
    }
}