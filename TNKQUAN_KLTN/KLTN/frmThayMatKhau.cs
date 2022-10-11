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
    public partial class frmThayMatKhau : Form
    {
        public string user = "";
        public string mk = "";
        NGUOIDUNG_BLL_DAL nd = new NGUOIDUNG_BLL_DAL();
        public frmThayMatKhau()
        {
            InitializeComponent();
        }

        private void frmThayMatKhau_Load(object sender, EventArgs e)
        {
            txtTaiKhoan.Text = user;
            txtMKCu.Text = mk;
        }

        private void frmThayMatKhau_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void btnLuu_Click_1(object sender, EventArgs e)
        {
            if (txtMKMoi.Text == "")
            {
                MessageBox.Show("Mật khẩu mới không được bỏ trống!");
            }
            else
            {
                DialogResult m = MessageBox.Show("Bạn chắc chắn muốn thay đổi mật khẩu?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                if (m == DialogResult.Yes)
                {
                    nd.DoiMK(user, txtMKMoi.Text);
                    txtMKCu.Text = txtMKMoi.Text;
                    txtMKMoi.Text = "";
                    MessageBox.Show("Đổi mật khẩu thành công");
                }
            }
        }
    }
}
