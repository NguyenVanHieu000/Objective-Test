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
    public partial class frmChucVu : Form
    {
        PHANQUYEN_BLL_DAL pq = new PHANQUYEN_BLL_DAL();
        public frmChucVu()
        {
            InitializeComponent();
        }
        public void loadCHUCVU()
        {
            cboChucVu.DataSource = pq.LoadCHUCVU();
            cboChucVu.DisplayMember = "TENCVU";
            cboChucVu.ValueMember = "ID_CVU";
        }
        public void loadGVIEN()
        {
            foreach(GIANGVIEN item in pq.get_DataGVIEN())
            {
                dgvUser.Rows.Add(item.ID_GVIEN, item.PASSGV, item.TENGV);
            }

        }
        public void loadGVIENCHUCVU()
        {
            dgvGrUser.Rows.Clear();
            dgvGrUser.Refresh();
            foreach(GVIENCHUCVU iten in pq.get_DataGVCVu())
            {
                string tencv ="";
                foreach(CHUCVU cv in pq.LoadCHUCVU())
                {
                    if (iten.ID_CVU == cv.ID_CVU)
                        tencv = cv.TENCVU;
                }
                dgvGrUser.Rows.Add(iten.ID_GVIEN,tencv);
            }
            
        }
        public void loadALL()
        {
            loadCHUCVU();
            loadGVIEN();
            loadGVIENCHUCVU();
        }

        private void frmPhanQuyen_Load(object sender, EventArgs e)
        {
            loadALL();
        }

        private void cboChucVu_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                    dgvGrUser.Rows.Clear();
                    dgvGrUser.Refresh();
                    foreach(GVIENCHUCVU gv in pq.get_DataGVCVu())
                    {
                        if (gv.ID_CVU == cboChucVu.SelectedValue.ToString())
                        {
                            loadGVIENCHUCVU();
                        }
                    }
            }
            catch
            {
                MessageBox.Show("Không xác định!");
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string _TenDN = dgvUser.CurrentRow.Cells[0].Value.ToString();
            string _MaCVU = cboChucVu.SelectedValue.ToString();
            bool check = pq.Insert_GVIENCVU(_TenDN, _MaCVU);
            if(check)
            {
                MessageBox.Show("Thêm Thành Công");
                loadGVIENCHUCVU();
            }
            else
            {
                MessageBox.Show("Thêm Thất Bại");
                loadGVIENCHUCVU();
            }
        }

      
        private void btnXoa_Click(object sender, EventArgs e)
        {
            string _TenDN = dgvGrUser.CurrentRow.Cells[0].Value.ToString();
            string _MaCVU = "";
            foreach(CHUCVU cv in pq.LoadCHUCVU())
            {
                if (dgvGrUser.CurrentRow.Cells[1].Value.ToString() == cv.TENCVU)
                    _MaCVU = cv.ID_CVU;
            }
            bool check = pq.Delete_GVIENCVU(_TenDN,_MaCVU);
            if (check)
            {
                MessageBox.Show("Xóa Thành Công");
                loadGVIENCHUCVU();
            }
            else
            {
                MessageBox.Show("Xóa Thất Bại");
                loadGVIENCHUCVU();
            }
        }

        private void btnOut_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmPhanQuyen_FormClosing(object sender, FormClosingEventArgs e)
        {
            if(MessageBox.Show("Bạn có chắc thoát không","Cảnh báo!",MessageBoxButtons.YesNo,MessageBoxIcon.Error,MessageBoxDefaultButton.Button1)==DialogResult.No)
            {
                e.Cancel = true;
            }
        }

    }
}
