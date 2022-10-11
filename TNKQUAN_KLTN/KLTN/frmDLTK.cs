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
using Microsoft.Office.Interop.Excel;
using System.IO;
using app = Microsoft.Office.Interop.Excel.Application;

namespace KLTN
{
    public partial class frmDLTK : DevExpress.XtraEditors.XtraForm
    {
        MON_BLL_DAL m = new MON_BLL_DAL();
        NAMHOC_BLL_DAL nh = new NAMHOC_BLL_DAL();
        HOCKY_BLL_DAL hk = new HOCKY_BLL_DAL();
        KETQUA_BLL_DAL kq = new KETQUA_BLL_DAL();
        SINHVIEN_BLL_DAL sv = new SINHVIEN_BLL_DAL();
        BAITHI_BLL_DAL bt = new BAITHI_BLL_DAL();
        THAMGIATHI_BLL_DAL tgt = new THAMGIATHI_BLL_DAL();
        LICHTHI_BLL_DAL lt = new LICHTHI_BLL_DAL();
        
        public frmDLTK()
        {
            InitializeComponent();
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
            cbNienKhoa.Items.Add("All");
            foreach (NAMHOC a in list)
            {
                cbNienKhoa.Items.Add(a.TENNAM);
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
        void loadDGV_KetQua()
        {
            dgvKetQua.DataSource = kq.get_Data();
        }

        private void frmDLTK_Load(object sender, EventArgs e)
        {
            loadDGV_KetQua();
            loadCB_HocKy();
            loadCB_Mon();
            loadCB_NamHoc();
        }

        private void dgvKetQua_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                string idBaiThi = dgvKetQua.SelectedRows[0].Cells[3].Value.ToString();
                BAITHI baithi = bt.TimtheoID(idBaiThi);

                TGTHI thamgia = tgt.Timtheo_IDBaiThi(baithi.ID_BAITHI);

                SINHVIEN sinhvien = sv.timSVTheoIDSV(thamgia.ID_SVIEN);

                txtMaSV.Text = sinhvien.ID_SVIEN;
                txtHoTen.Text = sinhvien.TENSV;

                txtDiem.Text = dgvKetQua.SelectedRows[0].Cells[1].Value.ToString();

                LICHTHI lichthi = lt.get_Data_TheoID(thamgia.ID_LICHTHI);

                MONHOC monhoc = m.timTheoID(lichthi.ID_MONHOC);
                cbMon.Text = monhoc.TENMONHOC;

                HOCKY hocky = hk.timTheoID(lichthi.ID_HOCKY);
                cbHocKy.Text = hocky.TENHK;

                NAMHOC namhoc = nh.timTheoID(lichthi.ID_NAMHOC);
                cbNienKhoa.Text = namhoc.TENNAM;
            }
            catch { }
        }

        private void btnTimKiem_Click(object sender, EventArgs e)
        {
            try
            {
                if(txtMaSV.Text!="")
                {
                    TGTHI thamgia = tgt.Timtheo_IDSV(txtMaSV.Text);
                    if (thamgia == null)
                        MessageBox.Show("Không có sinh viên này");
                    else
                    {
                        BAITHI baithi = bt.TimtheoID(thamgia.ID_BAITHI);
                        dgvKetQua.DataSource = kq.get_Data_TheoBaiThi(baithi.ID_BAITHI);
                    }
                }
                else
                {
                    if (cbHocKy.Text != "All" && cbMon.Text != "All" && cbNienKhoa.Text != "All")
                    {
                        loadTheo_Mon_HK_Nam();
                    }
                    else if (cbHocKy.Text == "All" && cbMon.Text == "All" && cbNienKhoa.Text == "All" && txtMaSV.Text == "")
                    {
                        loadDGV_KetQua();
                    }
                    else if (cbMon.Text != "All" && cbHocKy.Text == "All" && cbNienKhoa.Text == "All" && txtMaSV.Text == "")
                    {
                        loadTheo_Mon();
                    }
                    else if (cbMon.Text == "All" && cbHocKy.Text == "All" && cbNienKhoa.Text != "All" && txtMaSV.Text == "")
                    {
                        loadTheo_Nam();
                    }
                    else if (cbMon.Text == "All" && cbHocKy.Text != "All" && cbNienKhoa.Text == "All" && txtMaSV.Text == "")
                    {
                        loadTheo_HK();
                    }
                    else
                        MessageBox.Show("Chọn giá trị cần tìm kiếm");
                }
            }
            catch
            { }
        }
        public void loadTheo_Nam()
        {
            NAMHOC namhoc = nh.timTheoTen(cbNienKhoa.Text);

            List<TGTHI> a = new List<TGTHI>();
            List<LICHTHI> lstLichThi = lt.lst_TheoNam(namhoc.ID_NAMHOC);

            foreach (LICHTHI i in lstLichThi)
            {
                List<TGTHI> b = tgt.lst_TheoLich(i.ID_LICHTHI);
                foreach (TGTHI j in b)
                {
                    a.Add(j);
                }
            }
            List<BAITHI> lstBaiThi = new List<BAITHI>();
            foreach (TGTHI i in a)
            {
                BAITHI baithi = bt.TimtheoID(i.ID_BAITHI);
                lstBaiThi.Add(baithi);
            }
            List<KETQUA> lstKetQua = new List<KETQUA>();
            foreach (BAITHI i in lstBaiThi)
            {
                KETQUA ketqua = kq.timTheoIDBaiThi(i.ID_BAITHI);
                lstKetQua.Add(ketqua);
            }
            dgvKetQua.DataSource = lstKetQua;

        }
        public void loadTheo_HK()
        {
            HOCKY hocky = hk.timTheoTen(cbHocKy.Text);
            List<TGTHI> a = new List<TGTHI>();
            List<LICHTHI> lstLichThi = lt.lst_TheoHK(hocky.ID_HOCKY);

            foreach (LICHTHI i in lstLichThi)
            {
                List<TGTHI> b = tgt.lst_TheoLich(i.ID_LICHTHI);
                foreach (TGTHI j in b)
                {
                    a.Add(j);
                }
            }
            List<BAITHI> lstBaiThi = new List<BAITHI>();
            foreach (TGTHI i in a)
            {
                BAITHI baithi = bt.TimtheoID(i.ID_BAITHI);
                lstBaiThi.Add(baithi);
            }
            List<KETQUA> lstKetQua = new List<KETQUA>();
            foreach (BAITHI i in lstBaiThi)
            {
                KETQUA ketqua = kq.timTheoIDBaiThi(i.ID_BAITHI);
                lstKetQua.Add(ketqua);
            }
            dgvKetQua.DataSource = lstKetQua;
        }

        public void loadTheo_Mon()
        {
            MONHOC monhoc = m.timTheoTen(cbMon.Text);

            List<TGTHI> a = new List<TGTHI>();
            List<LICHTHI> lstLichThi = lt.lst_TheoMon(monhoc.ID_MONHOC);

            foreach (LICHTHI i in lstLichThi)
            {
                List<TGTHI> b = tgt.lst_TheoLich(i.ID_LICHTHI);
                foreach (TGTHI j in b)
                {
                    a.Add(j);
                }
            }
            List<BAITHI> lstBaiThi = new List<BAITHI>();
            foreach (TGTHI i in a)
            {
                BAITHI baithi = bt.TimtheoID(i.ID_BAITHI);
                lstBaiThi.Add(baithi);
            }
            List<KETQUA> lstKetQua = new List<KETQUA>();
            foreach (BAITHI i in lstBaiThi)
            {
                KETQUA ketqua = kq.timTheoIDBaiThi(i.ID_BAITHI);
                lstKetQua.Add(ketqua);
            }
            dgvKetQua.DataSource = lstKetQua;
        }
        public void loadTheo_Mon_HK_Nam()
        {
            MONHOC monhoc = m.timTheoTen(cbMon.Text);
            HOCKY hocky = hk.timTheoTen(cbHocKy.Text);
            NAMHOC namhoc = nh.timTheoTen(cbNienKhoa.Text);

            List<TGTHI> a = new List<TGTHI>();
            List<LICHTHI> lstLichThi = lt.lst_TheoMon_HK_Nam(monhoc.ID_MONHOC, hocky.ID_HOCKY, namhoc.ID_NAMHOC);

            foreach (LICHTHI i in lstLichThi)
            {
                List<TGTHI> b = tgt.lst_TheoLich(i.ID_LICHTHI);
                foreach (TGTHI j in b)
                {
                    a.Add(j);
                }
            }
            List<BAITHI> lstBaiThi = new List<BAITHI>();
            foreach (TGTHI i in a)
            {
                BAITHI baithi = bt.TimtheoID(i.ID_BAITHI);
                lstBaiThi.Add(baithi);
            }
            List<KETQUA> lstKetQua = new List<KETQUA>();
            foreach (BAITHI i in lstBaiThi)
            {
                KETQUA ketqua = kq.timTheoIDBaiThi(i.ID_BAITHI);
                lstKetQua.Add(ketqua);
            }
            dgvKetQua.DataSource = lstKetQua;
        }
        private void btnFile_Click(object sender, EventArgs e)
        {
            try
            {
                openBrowse();
            }
            catch
            {

            }
        }
        public void export2Excel(DataGridView g,string filename)
        {
            try
            {
                app obj = new app();
                obj.Application.Workbooks.Add(Type.Missing);
                obj.Columns.ColumnWidth=25;

                for (int i = 1; i < g.Columns.Count+1; i++)
                {
                    obj.Cells[1, i] = g.Columns[i-1].HeaderText;
                }
                for (int i = 0; i < g.Rows.Count; i++)
                {
                    for (int j = 0; j < g.Columns.Count; j++)
                    {
                        obj.Cells[i + 2, j + 1] = g.Rows[i].Cells[j].Value.ToString();
                    }
                }

                obj.ActiveWorkbook.SaveAs(filename);
                obj.ActiveWorkbook.Saved = true;
                MessageBox.Show("Xuất thành công");
            }
            catch
            {
                MessageBox.Show("Không thành công");
            }
        }
        public void openBrowse()
        {
            SaveFileDialog fDialog = new SaveFileDialog(); //tao 1 hop thoai de chon file
            fDialog.Filter = "excel file |*.xls;*.xlsx";
            fDialog.RestoreDirectory = true; //nho duong dan cua lan truy cap truoc
            if (fDialog.ShowDialog() == DialogResult.OK)
            {
                export2Excel(dgvKetQua, fDialog.FileName);
            }
        }
    }
}