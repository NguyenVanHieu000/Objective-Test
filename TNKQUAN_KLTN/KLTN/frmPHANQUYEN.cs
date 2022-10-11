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
    public partial class frmPHANQUYEN : Form
    {
        PHANQUYEN_BLL_DAL pq = new PHANQUYEN_BLL_DAL();
        MANHINH_BLL_DAL mh = new MANHINH_BLL_DAL();
        public frmPHANQUYEN()
        {
            InitializeComponent();
        }
        public void loadCBO()
        {
            cboChucVu.DataSource = pq.LoadCHUCVU();
            cboChucVu.DisplayMember = "TENCVU";
            cboChucVu.ValueMember = "ID_CVU";

            cboMANHINH.DataSource = mh.getDataMANHINH();
            cboMANHINH.DisplayMember = "TENMANHINH";
            cboMANHINH.ValueMember = "ID_MANHINH";
        }
        public void LoadPHANQUYEN()
        {
            dgvPQUYEN.Rows.Clear();
            dgvPQUYEN.Refresh();
            foreach(PHANQUYEN item in pq.loadPHANQUYEN())
            {
                string chucvu = "";
                string manhinh = "";
                foreach(CHUCVU item1 in pq.LoadCHUCVU())
                {
                    if (item1.ID_CVU.Equals(item.ID_CVU))
                    {
                        chucvu = item1.TENCVU;
                    }
                }
                foreach (MANHINH item2 in mh.getDataMANHINH())
                {
                    if (item2.ID_MANHINH.Equals(item.ID_MANHINH))
                    {
                        manhinh = item2.TENMANHINH;
                    }
                }
                dgvPQUYEN.Rows.Add(chucvu,manhinh, item.COQUYEN);
            }
            
        }

        private void frmPHANQUYEN_Load(object sender, EventArgs e)
        {
            loadCBO();
            LoadPHANQUYEN();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                PHANQUYEN ph = new PHANQUYEN();
                ph.ID_CVU = cboChucVu.SelectedValue.ToString();
                ph.ID_MANHINH = cboMANHINH.SelectedValue.ToString();
                if (chkQuyen.Checked)
                {
                    ph.COQUYEN = true;
                }
                else
                    ph.COQUYEN = false;
                pq.Insert_Quyen(ph);
                LoadPHANQUYEN();

            }
            catch
            {
                MessageBox.Show("Thêm Thất Bại!");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                PHANQUYEN ph = new PHANQUYEN();
                foreach (CHUCVU item1 in pq.LoadCHUCVU())
                {
                    if (item1.TENCVU.Equals(dgvPQUYEN.CurrentRow.Cells[0].Value.ToString()))
                    {
                        ph.ID_CVU = item1.ID_CVU;
                        break;
                    }
                }
                foreach (MANHINH item2 in mh.getDataMANHINH())
                {
                    if (item2.TENMANHINH.Equals(dgvPQUYEN.CurrentRow.Cells[1].Value.ToString()))
                    {
                        ph.ID_MANHINH = item2.ID_MANHINH;
                        break;
                    }
                }
                pq.Delete_Quyen(ph);
                LoadPHANQUYEN();
            }
            catch
            {
                MessageBox.Show("Fail!");
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                PHANQUYEN ph = new PHANQUYEN();
                foreach (CHUCVU item1 in pq.LoadCHUCVU())
                {
                    if (item1.TENCVU.Equals(cboChucVu.Text))
                    {
                        ph.ID_CVU = item1.ID_CVU;
                        break;
                    }
                }
                foreach (MANHINH item2 in mh.getDataMANHINH())
                {
                    if (item2.TENMANHINH.Equals(cboMANHINH.Text))
                    {
                        ph.ID_MANHINH = item2.ID_MANHINH;
                        break;
                    }
                }
                if (chkQuyen.Checked)
                    ph.COQUYEN = true;
                else
                    ph.COQUYEN = false;
                pq.Update_Quyen(ph);
                LoadPHANQUYEN();
            }
            catch
            {
                MessageBox.Show("Fail!");
            }
        }

        private void dgvPQUYEN_SelectionChanged(object sender, EventArgs e)
        {
            cboChucVu.Text = dgvPQUYEN.CurrentRow.Cells[0].Value.ToString();
            cboMANHINH.Text = dgvPQUYEN.CurrentRow.Cells[1].Value.ToString();
            chkQuyen.Checked = bool.Parse(dgvPQUYEN.CurrentRow.Cells[2].Value.ToString());
        }
    }
}
