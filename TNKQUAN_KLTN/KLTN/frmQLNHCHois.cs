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
    public partial class frmQLNHCHois : DevExpress.XtraEditors.XtraForm
    {
        MON_BLL_DAL mon = new MON_BLL_DAL();
        CAUHOI_BLL_DAL cauhoi = new CAUHOI_BLL_DAL();
        QLNHCHoi_BLL_DAL ql = new QLNHCHoi_BLL_DAL();
        NGUOIDUNG_BLL_DAL nguoidung = new NGUOIDUNG_BLL_DAL();
        PHANQUYEN_BLL_DAL pq = new PHANQUYEN_BLL_DAL();
        //DBDataContext db = new DBDataContext();
        public string user = "";
        public string id_KHOA = "";
        public string chucvu = "";
        public frmQLNHCHois()
        {
            InitializeComponent();
        }
        public void loadCHUCVU()
        {
            foreach (CHUCVU cv in pq.loadCHUCVU(chucvu))
            {
                if (cv.ID_CVU == "CVU004")
                {
                    btnDuyet.Enabled = false;
                    loadCBO(cv.ID_CVU);
                }
                else
                {
                    btnDuyet.Enabled = true;
                    btnTaoDe.Enabled = false;
                    loadCBO(cv.ID_CVU);
                }
            }

        }
        public void loadCBO(string id)
        {
            dgvCAUHOI.Rows.Clear();
            dgvCAUHOI.Refresh();
            cboMONHOC.Items.Add("All");
            if (id == "CVU004")
            {
                foreach (MONHOC item in mon.listMon())
                {
                    cboMONHOC.Items.Add(item.TENMONHOC);
                }
                cboTTRANG.DataSource = ql.getDataTTrang();
                cboTTRANG.DisplayMember = "TTrang";
            }
            else {
                foreach (MONHOC item in mon.listMon(id_KHOA))
                {
                    cboMONHOC.Items.Add(item.TENMONHOC);
                }
                cboTTRANG.DataSource = ql.getDataTTrang();
                cboTTRANG.DisplayMember = "TTrang";
            }
            
        }
        public void loadCauHoi_Khoa()
        {
            dgvCAUHOI.Rows.Clear();
            dgvCAUHOI.Refresh();
            foreach (MONHOC item in mon.listMon(id_KHOA))
            {
                foreach (NHCH item2 in ql.getDataNHCH())
                    if (item2.ID_MONHOC.Equals(item.ID_MONHOC))
                    {
                        loadCAUHOI(item2.ID_NHCH);
                    }
            }
        }
        public void loadCAUHOI(string id)
        {
            foreach (CAUHOI ch in cauhoi.get_DataCauHoi_TheoNHCH(id))
            {
                string name = "";
                foreach (MUCDO md in ql.getDateMDo())
                {
                    if (ch.ID_MUCDO == md.ID_MUCDO)
                    {
                        name = md.TENMUCDO;
                    }
                }
                dgvCAUHOI.Rows.Add(ch.ID_CAUHOI, ch.NOIDUNGCH, ch.HINH, ch.DAPAN, ch.A, ch.B, ch.C, ch.D, ch.TTrang, ch.CHUONG, name);
            }
        }
        // Hàm load câu hỏi theo id_NHCH();
        private void loadCAUHOI3(string id)
        {
            dgvCAUHOI.Rows.Clear();
            dgvCAUHOI.Refresh();
            foreach (CAUHOI ch in cauhoi.get_DataCauHoi_TheoNHCH(id))
            {
                string name = "";
                foreach (MUCDO md in ql.getDateMDo())
                {
                    if (ch.ID_MUCDO == md.ID_MUCDO)
                    {
                        name = md.TENMUCDO;
                    }
                }
                dgvCAUHOI.Rows.Add(ch.ID_CAUHOI, ch.NOIDUNGCH, ch.HINH, ch.DAPAN, ch.A, ch.B, ch.C, ch.D, ch.TTrang, ch.CHUONG, name);
            }
            cboTTRANG.DataSource = ql.getDataTTrang();
            cboTTRANG.DisplayMember = "TTrang";
        }
        //Hàm load câu hỏi có điều kiện
        public void loadCAUHOI1(CAUHOI ch)
        {
            string name = "";
            foreach (MUCDO md in ql.getDateMDo())
            {
                if (ch.ID_MUCDO == md.ID_MUCDO)
                {
                    name = md.TENMUCDO;
                }
            }
            dgvCAUHOI.Rows.Add(ch.ID_CAUHOI, ch.NOIDUNGCH,ch.HINH, ch.DAPAN, ch.A, ch.B, ch.C, ch.D, ch.TTrang, ch.CHUONG, name);
        }
        public void loadCAUHOI2(CAUHOI ch)
        {
            string name = "";
            foreach (MUCDO md in ql.getDateMDo())
            {
                if (ch.ID_MUCDO == md.ID_MUCDO)
                {
                    name = md.TENMUCDO;
                }
            }
            dgvCAUHOI.Rows.Add(ch.ID_CAUHOI, ch.NOIDUNGCH, ch.HINH, ch.DAPAN, ch.A, ch.B, ch.C, ch.D, ch.TTrang, ch.CHUONG, name);
        }

        private void btnDuyet_Click(object sender, EventArgs e)
        {
            try
            {
                foreach (CAUHOI ch in ql.getDataCH(id))
                {
                    if (ch.TTrang.Equals("Chưa duyệt"))
                    {
                        cauhoi.UpdateTTrang(ch.ID_CAUHOI, "Đã duyệt");
                    }
                }
                loadCAUHOI3(txtNHCH.Text);
                MessageBox.Show("Đã Duyệt");
            }
            catch
            {
                MessageBox.Show("Lỗi Duyệt");
            }
        }

        private void frmQLNHCHois_Load(object sender, EventArgs e)
        {
            loadCHUCVU();
        }

        private void cboMONHOC_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                txtNHCH.Text = "";
                string idmon = "";
                if (cboMONHOC.SelectedItem.ToString().Equals("All"))
                {
                    loadCauHoi_Khoa();
                }
                foreach (MONHOC item in mon.listMon())
                {
                    if (item.TENMONHOC == cboMONHOC.SelectedItem.ToString())
                    {
                        idmon = item.ID_MONHOC;
                        foreach (NHCH nh in ql.getDataNHCH())
                        {
                            if (nh.ID_MONHOC.Equals(idmon))
                            {
                                txtNHCH.Text = nh.ID_NHCH;
                                loadNHCH(txtNHCH.Text);
                            }
                        }
                    }
                }
            }
            catch
            {
                MessageBox.Show("Fails!");
            }
        }
        private void loadNHCH(string id2)
        {
            try
            {
                dgvCAUHOI.Rows.Clear();
                dgvCAUHOI.Refresh();
                foreach (CAUHOI ch in ql.getDataCH())
                {
                    if (ch.ID_NHCH == id2)
                    {
                        loadCAUHOI1(ch);
                        cboCHUONG.DataSource = ql.getDataChuong(ch.ID_NHCH);
                        cboMUCDO.DataSource = ql.getDateMDo();
                        cboMUCDO.DisplayMember = "TENMUCDO";
                        cboMUCDO.ValueMember = "ID_MUCDO";

                        id = txtNHCH.Text;
                    }
                }
            }
            catch
            {
                MessageBox.Show("Không xác định!");
            }
        }
        string id = "";//Lấy id_NHCH từ môn học
        //combobox NHCH (Chọn để hiện data và load combobox chương + mức độ của bộ ngân hàng đó)

        private void txtNHCH_TextChanged(object sender, EventArgs e)
        {

        }
        //combobox chương (hiện những câu hỏi của chương đó trong nhch)
       
        //combobox mức độ(Hiện mức độ của câu hỏi trong nhch đó)
      
        private void cboTTRANG_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                dgvCAUHOI.Rows.Clear();
                dgvCAUHOI.Refresh();
                foreach (CAUHOI ch in ql.getDataCH(id))
                {
                    if (ch.TTrang == cboTTRANG.SelectedValue.ToString())
                    {
                        loadCAUHOI1(ch);
                    }
                }
            }
            catch
            {
                MessageBox.Show("KHÔNG xác định!");
            }
        }

        private void btnTaoDe_Click(object sender, EventArgs e)
        {
            frmTaoDeThi frm = new frmTaoDeThi();
            frm.id_gv = user;
            frm.ShowDialog();
        }

        private void cboCHUONG_SelectionChangeCommitted(object sender, EventArgs e)
        {
            try
            {
                dgvCAUHOI.Rows.Clear();
                dgvCAUHOI.Refresh();
                foreach (CAUHOI ch in ql.getDataCH(id))
                {
                    if (ch.ID_MUCDO == cboMUCDO.SelectedValue.ToString())
                    {
                        loadCAUHOI1(ch);
                    }
                }
            }
            catch
            {
                MessageBox.Show("KHÔNG xác định!");
            }
        }

        private void cboMUCDO_SelectionChangeCommitted(object sender, EventArgs e)
        {
            try
            {
                dgvCAUHOI.Rows.Clear();
                dgvCAUHOI.Refresh();
                foreach (CAUHOI ch in ql.getDataCH(id))
                {
                    if (ch.ID_MUCDO == cboMUCDO.SelectedValue.ToString())
                    {
                        loadCAUHOI1(ch);
                    }
                }
            }
            catch
            {
                MessageBox.Show("KHÔNG xác định!");
            }
        }

    }
}