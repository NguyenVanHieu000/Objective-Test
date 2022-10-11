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
    public partial class frmTaoDotThi : DevExpress.XtraEditors.XtraForm
    {
        MON_BLL_DAL m = new MON_BLL_DAL();
        NAMHOC_BLL_DAL nh = new NAMHOC_BLL_DAL();
        LICHTHI_BLL_DAL lt = new LICHTHI_BLL_DAL();
        HOCKY_BLL_DAL hk = new HOCKY_BLL_DAL();
        public string id_gv="";
        public frmTaoDotThi()
        {
            InitializeComponent();
            cbHocKy.Size = cbMon.Size = cbNamHoc.Size   = new Size(200, 36);
        }

        private void frmTaoDotThi_Load(object sender, EventArgs e)
        {
            loadCB_HocKy();
            loadCB_Mon();
            loadCB_NamHoc();
            loadDGV_LICHTHI();
        }
        public void loadCB_Mon()
        {
            List<MONHOC> list = m.listMon();
            cbMon.Items.Add("All");
            foreach (MONHOC a in list)
            {
                cbMon.Items.Add(a.TENMONHOC);
            }
        }
        public void loadCB_NamHoc()
        {
            List<NAMHOC> list = nh.listNamHoc();
            cbNamHoc.Items.Add("All");
            foreach (NAMHOC a in list)
            {
                cbNamHoc.Items.Add(a.TENNAM);
            }
        }
        public void loadCB_HocKy()
        {
            List<HOCKY> list = hk.listHocKy();
            cbHocKy.Items.Add("All");
            foreach (HOCKY a in list)
            {
                cbHocKy.Items.Add(a.TENHK);
            }
        }
        public void loadDGV_LICHTHI()
        {
            dgvDotThi.Rows.Clear();
            dgvDotThi.Refresh();
            foreach(LICHTHI item in lt.get_Data())
            {
                dgvDotThi.Rows.Add(item.TENLICHTHI,item.NGAYTAO,item.NGAYTHI,item.TietBĐ,item.TietKT,item.ID_NAMHOC,item.ID_HOCKY);
            }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            try
            {
                if (cbMon.Text != "All")
                {
                    MONHOC monhoc = m.timTheoTen(cbMon.Text);
                    dgvDotThi.DataSource = lt.get_Data_TheoMon(monhoc.ID_MONHOC);
                }
                else
                {
                    if (cbNamHoc.Text != "All")
                    {
                        NAMHOC namhoc = nh.timTheoTen(cbNamHoc.Text);
                        dgvDotThi.DataSource = lt.get_Data_TheoNamhoc(namhoc.ID_NAMHOC);
                    }
                    else
                    {
                        if (cbHocKy.Text != "All")
                        {
                            HOCKY hocki = hk.timTheoTen(cbHocKy.Text);
                            dgvDotThi.DataSource = lt.get_Data_TheoHocKy(hocki.ID_HOCKY);
                        }
                        else loadDGV_LICHTHI();
                    }
                }
            }
            catch
            {

            }
        }

        private void btnTao_Click(object sender, EventArgs e)
        {
            try
            {
                if (ktThemLichThi() != "true")
                    MessageBox.Show(ktGiaTriNhap());
                else
                {
                    DialogResult diaLog = MessageBox.Show("Bạn chắc chắn muốn tạo lịch thi này?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                    if (diaLog == DialogResult.Yes)
                    {
                        themLichThi();
                    }
                }
            }
            catch
            {
                loadDGV_LICHTHI();
            }
        }
        public void clear()
        {
            cbHocKy.Text = "All";
            cbMon.Text = "All";
            cbNamHoc.Text = "All";
            dtNgayThi.Text = DateTime.Now.ToString();
            txtTietBD.Text = "";
            txtTietKT.Text = "";

            flowLayoutPanel1.Controls.Clear();
        }
        public bool IsNumber(string pValue)
        {
            foreach (Char c in pValue)
            {
                if (!Char.IsDigit(c))
                    return false;
            }
            return true;
        }
        public void themLichThi()
        {
            try
            {
                foreach (Button i in flowLayoutPanel1.Controls.OfType<Button>())
                {
                    LICHTHI lichthi = new LICHTHI();
                    //lấy id của nhân viên khảo thí đang đăng nhập vào hệ thống
                    lichthi.ID_GVIEN = id_gv;
                    //
                    lichthi.ID_LICHTHI = lt.autoID();

                    string s = i.Text;

                    lichthi.NGAYTHI = DateTime.Parse(s.Substring(0, 10));

                    int vt1 = s.IndexOf("(");
                    int vt2 = s.IndexOf("-");
                    lichthi.TietBĐ = int.Parse(s.Substring(vt1 + 1, vt2 - vt1 - 1));

                    int vt3 = s.IndexOf(")");
                    lichthi.TietKT = int.Parse(s.Substring(vt2 + 1, vt3 - vt2 - 1));

                    lichthi.TENLICHTHI = cbMon.Text + " " + cbNamHoc.Text + " (" + dtNgayThi.Text + ": " + s.Substring(vt1 + 1, vt2 - vt1 - 1)+"-" + s.Substring(vt2 + 1, vt3 - vt2 - 1) + ")";
                    lichthi.NGAYTAO = DateTime.Now;

                    MONHOC monhoc = m.timTheoTen(cbMon.Text);
                    lichthi.ID_MONHOC = monhoc.ID_MONHOC;

                    HOCKY hocky = hk.timTheoTen(cbHocKy.Text);
                    lichthi.ID_HOCKY = hocky.ID_HOCKY;

                    NAMHOC namhoc = nh.timTheoTen(cbNamHoc.Text);
                    lichthi.ID_NAMHOC = namhoc.ID_NAMHOC;

                    lt.them(lichthi);
                }
                clear();
                loadDGV_LICHTHI();
                MessageBox.Show("Tạo thành công");
            }
            catch
            {
                MessageBox.Show("Lỗi");
            }
        }
        public string ktThemLichThi()
        {
            if (cbMon.Text == "" || cbMon.Text == "All")
                return "Phải chọn 1 môn";
            if (cbHocKy.Text == "" || cbHocKy.Text == "All")
                return "Phải chọn 1 học kỳ";
            if (cbNamHoc.Text == "" || cbNamHoc.Text == "All")
                return "Phải chọn 1 niên khóa";
            if (ktThemNgayThi() == false)
                MessageBox.Show("Phải tạo ngày thi");
            return "true";
        }
        public string ktGiaTriNhap()
        {
            if (cbMon.Text == "" || cbMon.Text == "All")
                return "Phải chọn 1 môn";
            if (cbHocKy.Text == "" || cbHocKy.Text == "All")
                return "Phải chọn 1 học kỳ";
            if (cbNamHoc.Text == "" || cbNamHoc.Text == "All")
                return "Phải chọn 1 niên khóa";
            if (IsNumber(txtTietBD.Text) == false || IsNumber(txtTietKT.Text) == false || txtTietBD.Text == "" || txtTietKT.Text == "")
                return "Số tiết phải nhập kí tự số";
            if (int.Parse(txtTietBD.Text) > int.Parse(txtTietKT.Text))
                return "Tiết kết thúc phải phải lớn hơn tiết bát đầu";
            return "true";
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            clear();
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                LICHTHI lichthi = lt.get_Data_TheoID(dgvDotThi.SelectedRows[0].Cells[0].Value.ToString());
                if (lichthi != null)
                {
                    DialogResult m = MessageBox.Show("Bạn chắc chắn muốn xóa lịch thi này?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                    if (m == DialogResult.Yes)
                    {
                        lt.xoa(dgvDotThi.SelectedRows[0].Cells[0].Value.ToString());
                        clear();
                        loadDGV_LICHTHI();
                        MessageBox.Show("Xóa thành công");
                    }
                }
                else
                    MessageBox.Show("Lịch thi không tồn tại");
            }
            catch
            {
                clear();
                loadDGV_LICHTHI();
                MessageBox.Show("Lỗi");
            }
        }

        private void dgvDotThi_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                dtNgayThi.Text = dgvDotThi.SelectedRows[0].Cells[3].Value.ToString();
                txtTietBD.Text = dgvDotThi.SelectedRows[0].Cells[4].Value.ToString();
                txtTietKT.Text = dgvDotThi.SelectedRows[0].Cells[5].Value.ToString();

                MONHOC monhoc = m.timTheoID(dgvDotThi.SelectedRows[0].Cells[7].Value.ToString());
                cbMon.Text = monhoc.TENMONHOC;


                NAMHOC namhoc = nh.timTheoID(dgvDotThi.SelectedRows[0].Cells[8].Value.ToString());
                cbNamHoc.Text = namhoc.TENNAM;

                HOCKY hocki = hk.timTheoID(dgvDotThi.SelectedRows[0].Cells[9].Value.ToString());
                cbHocKy.Text = hocki.TENHK;
            }
            catch
            { }
        }

        private void btnThemNgayThi_Click(object sender, EventArgs e)
        {
            try
            {
                if (ktGiaTriNhap() != "true")
                    MessageBox.Show(ktGiaTriNhap());
                else
                {
                    Button temp = new Button();
                    temp.Name = dtNgayThi.Text + "(" + txtTietBD.Text + "-" + txtTietKT.Text + ")";
                    temp.Text = dtNgayThi.Text + " (" + txtTietBD.Text + "-" + txtTietKT.Text + ")";
                    temp.Size = new Size(100, 36);
                    temp.Click += new System.EventHandler(LichThiClick);

                    if (ktNgayThiTrung(temp) == true)
                    {
                        flowLayoutPanel1.Controls.Add(temp);

                        dtNgayThi.Text = dtNgayThi.Text;
                        txtTietBD.Clear();
                        txtTietKT.Clear();

                        MessageBox.Show("Thêm thành công");
                    }
                    else
                    {
                        dtNgayThi.Text = DateTime.Now.ToString();
                        txtTietBD.Clear();
                        txtTietKT.Clear();
                        MessageBox.Show("Trùng lịch thi!");
                    }
                 }
            }
            catch
            {

            }
        }
        private void LichThiClick(object sender, EventArgs e)
        {
            Button temp = sender as Button;
            string s = temp.Text;
            dtNgayThi.Text = s.Substring(0, 10);

            int vt1 = s.IndexOf("(");
            int vt2 = s.IndexOf("-");
            txtTietBD.Text = s.Substring(vt1+1,vt2-vt1-1);

            int vt3 = s.IndexOf(")");
            txtTietKT.Text = s.Substring(vt2+1, vt3 - vt2-1);
        }

        private void btnXoaNgayThi_Click(object sender, EventArgs e)
        {
            try
            {
                if (txtTietBD.Text == "" || txtTietKT.Text == "")
                {
                    MessageBox.Show("Phải chọn ngày thi muốn xóa!");
                }
                else
                {
                    foreach (Button i in flowLayoutPanel1.Controls.OfType<Button>())
                    {
                        if (i.Text == dtNgayThi.Text + " (" + txtTietBD.Text + "-" + txtTietKT.Text + ")")
                        {
                            flowLayoutPanel1.Controls.Remove(i);

                            dtNgayThi.Text = DateTime.Now.ToString();
                            txtTietBD.Clear();
                            txtTietKT.Clear();
                            MessageBox.Show("Xóa thành công");
                        }
                    }
                }
            }
            catch
            {

            }
        }

        public bool ktNgayThiTrung(Button temp)
        {
            foreach (Button i in flowLayoutPanel1.Controls.OfType<Button>())
            {
                if (i.Text == temp.Text)
                {
                    return false;
                }
            }
            LICHTHI a = new LICHTHI();
            a.NGAYTHI = DateTime.Parse(dtNgayThi.Text);
            a.TietBĐ = int.Parse(txtTietBD.Text);
            a.TietKT = int.Parse(txtTietKT.Text);
            if (lt.ktTrung(a) != true)
            {
                return false;
            }
            return true;
        }
        public bool ktThemNgayThi()
        {
            foreach (Button i in flowLayoutPanel1.Controls.OfType<Button>())
            {
                return true;
            }
            return false;
        }
    }
}