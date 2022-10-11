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
using Aspose.Words;
using System.Diagnostics;

namespace KLTN
{
    public partial class frmTaoDeThi : DevExpress.XtraEditors.XtraForm
    {
        MON_BLL_DAL m = new MON_BLL_DAL();
        QLNHCHoi_BLL_DAL nhch = new QLNHCHoi_BLL_DAL();
        DETHI_BLL_DAL dt = new DETHI_BLL_DAL();
        CAUHOI_BLL_DAL ch = new CAUHOI_BLL_DAL();
        MUCDO_BLL_DAL md = new MUCDO_BLL_DAL();
        NAMHOC_BLL_DAL nh = new NAMHOC_BLL_DAL();
        CTDTHI_BLL_DAL ctdt = new CTDTHI_BLL_DAL();
        DETHI dethi = new DETHI();
        KHOA_BLL_DAL khoa = new KHOA_BLL_DAL();
        public string id_gv = "";
        public frmTaoDeThi()
        {
            InitializeComponent();
            load();
        }
        public void load()
        {
            loadCB_Mon();
            loadCB_Khoa();
            loadDGV_DSDeThi();
        }
        private void guna2ComboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void panel5_Paint(object sender, PaintEventArgs e)
        {

        }

        private void dgvDeThi_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

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
        public void loadCB_Khoa()
        {
            List<KHOA> list = khoa.listKhoa();
            cbKhoa.Items.Add("All");
            foreach (KHOA a in list)
            {
                cbKhoa.Items.Add(a.TENKHOA);
            }
        }
        public void loadDGV_DSDeThi()
        {
            dgvDSDe.Rows.Clear();
            dgvDSDe.Refresh();
            foreach (DETHI item in dt.list())
            {
                string name = "";
                foreach (NAMHOC item1 in nh.listNamHoc())
                {
                    if (item.ID_NAMHOC == item1.ID_NAMHOC)
                    {
                        name = item1.TENNAM;
                    }
                }
                dgvDSDe.Rows.Add(item.ID_DETHI, item.TENDETHI, item.SLCAU, item.TGLamBai, item.GhiChu, item.TinhTrang, name);
            }
        }
        public void loadDGV_DSDeThi_TheoMon(string idMon)
        {
            dgvDSDe.Rows.Clear();
            dgvDSDe.Refresh();
            foreach (DETHI item in dt.list_TheoMon(idMon))
            {
                string name = "";
                foreach (NAMHOC item1 in nh.listNamHoc())
                {
                    if (item.ID_NAMHOC == item1.ID_NAMHOC)
                    {
                        name = item1.TENNAM;
                    }
                }
                dgvDSDe.Rows.Add(item.ID_DETHI, item.TENDETHI, item.SLCAU, item.TGLamBai, item.GhiChu, item.TinhTrang, name);
            }
        }
        public void themCTDTHI(string txtMucDo, string idNHCH, string idDeThi, int sl)
        {
            try
            {
                if (sl > 0)
                {
                    MUCDO mucdo = new MUCDO();
                    mucdo = md.timTheoTen(txtMucDo);

                    List<CAUHOI> lst = layCauHoi(mucdo.ID_MUCDO, idNHCH, sl);

                    for (int i = 0; i < lst.Count; i++)
                    {
                        CTDTHI chitietDT = new CTDTHI();
                        chitietDT.ID_DTHI = idDeThi;
                        chitietDT.ID_CTDTHI = ctdt.autoID(idDeThi);
                        chitietDT.HINH = lst[i].HINH;
                        chitietDT.CAUHOI = lst[i].NOIDUNGCH;
                        chitietDT.A = lst[i].A;
                        chitietDT.B = lst[i].B;
                        chitietDT.C = lst[i].C;
                        chitietDT.D = lst[i].D;
                        chitietDT.DapAn = lst[i].DAPAN;

                        ctdt.themCTDTHI(chitietDT);
                    }
                }
            }
            catch
            {
            }
        }
        public List<CAUHOI> layCauHoi(string idMucDo, string idNHCH, int sl)
        {
            List<CAUHOI> a = ch.lstCauHoi_TheoNHCH_MucDo(idNHCH, idMucDo);
            List<CAUHOI> b = new List<CAUHOI>();
            int[] A = new int[a.Count()];
            int k = 0;
            Random rd = new Random(); do
            {
                int stt = rd.Next(1, a.Count + 1);
                if (ktMang(A, stt) == true)
                {
                    A[k] = stt;
                    k++;
                    b.Add(a[stt - 1]);
                    sl--;
                }
            }
            while (sl > 0);
            return b;
        }

        private void dgvDSDe_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                string id = dgvDSDe.SelectedRows[0].Cells[0].Value.ToString();
                loadDGV_CTDTHI(id);

                txtMaDe.Text = id;
                txtTenDe.Text = dgvDSDe.SelectedRows[0].Cells[1].Value.ToString();
                txtSLCau.Text = dgvDSDe.SelectedRows[0].Cells[2].Value.ToString();
                txtTG.Text = dgvDSDe.SelectedRows[0].Cells[3].Value.ToString();
                txtGhiChu.Text = dgvDSDe.SelectedRows[0].Cells[4].Value.ToString();
            }
            catch { }
        }
        public void loadDGV_CTDTHI(string id)
        {
            dgvDeThi.Rows.Clear();
            dgvDeThi.Refresh();
            foreach (CTDTHI item in ctdt.get_DataCTDTHi_TheoIDDTHI(id))
            {
                dgvDeThi.Rows.Add(item.ID_CTDTHI, item.HINH, item.CAUHOI, item.A, item.B, item.C, item.D, item.DapAn);
            }

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

        private void btnTao_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult diaLog = MessageBox.Show("Bạn chắc chắn muốn tạo đề này?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                if (diaLog == DialogResult.Yes)
                {
                    if (cbMon.Text != "" && cbMon.Text != "All")
                    {
                        if (IsNumber(txtSLCau.Text) == false || IsNumber(txtSLCauCB.Text) == false
                            || IsNumber(txtCauTB.Text) == false || IsNumber(txtCauNC.Text) == false
                            || IsNumber(txtTG.Text) == false)
                            MessageBox.Show("Hãy nhập số nguyên");

                        int tong, slDe, slTB, slKho;
                        tong = int.Parse(txtSLCau.Text);
                        slDe = int.Parse(txtSLCauCB.Text);
                        slTB = int.Parse(txtCauTB.Text);
                        slKho = int.Parse(txtCauNC.Text);

                        if (slDe + slTB + slKho == tong)
                        {
                            dethi.SLCAU = tong;

                            dethi.ID_DETHI = dt.autoID();
                            dethi.TENDETHI = txtTenDe.Text;
                            dethi.GhiChu = txtTenDe.Text;
                            dethi.TinhTrang = "";
                            dethi.TGLamBai = int.Parse(txtTG.Text);


                            MONHOC monhoc = m.timTheoTen(cbMon.Text);
                            NHCH n = nhch.timTheoMon(monhoc.ID_MONHOC);

                            dethi.ID_NHCH = n.ID_NHCH;// t nhớ db cũ nó nhiều NHCH lắm.
                            //lấy id của nhân viên khảo thí đang đăng nhập vào hệ thống
                            dethi.ID_GVIEN = id_gv;
                            //

                            foreach (NAMHOC namhoc in nh.listNamHoc())
                            {
                                dethi.ID_NAMHOC = namhoc.ID_NAMHOC;
                            }

                            dt.them(dethi);//Thêm đề thi mới

                            themCTDTHI("Dễ", n.ID_NHCH, dethi.ID_DETHI, slDe);
                            themCTDTHI("Trung bình", n.ID_NHCH, dethi.ID_DETHI, slTB);
                            themCTDTHI("Khó", n.ID_NHCH, dethi.ID_DETHI, slKho);

                            MONHOC monhoc1 = m.timTheoTen(cbMon.Text);

                            loadDGV_DSDeThi_TheoMon(monhoc1.ID_MONHOC);
                            clear();
                            MessageBox.Show("Tạo thành công");
                        }
                        else
                            MessageBox.Show("Tổng số lượng câu không đúng");
                    }
                    else if (cbMon.Text == "All")
                        MessageBox.Show("Chỉ được chọn 1 môn");

                    else
                        MessageBox.Show("Hãy chọn môn học");
                }

            }
            catch
            {
                clear();
                loadDGV_DSDeThi();
                MessageBox.Show("Lỗi");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult r = MessageBox.Show("Bạn chắc chắn muốn xóa đề này?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                if (r == DialogResult.Yes)
                {

                    string id = dgvDSDe.SelectedRows[0].Cells[0].Value.ToString();
                    List<CTDTHI> lst = ctdt.list_TheoDeThi(id);
                    foreach (CTDTHI c in lst)
                    {
                        ctdt.xoa(c);
                    }
                    dt.xoa(id);

                    MONHOC monhoc = m.timTheoTen(cbMon.Text);

                    loadDGV_DSDeThi_TheoMon(monhoc.ID_MONHOC);
                    dgvDeThi.Rows.Clear();
                    txtMaDe.Text = "";
                    clear();
                    MessageBox.Show("Xóa thành công");
                }
            }
            catch { }
        }

        private void btnTron_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult r = MessageBox.Show("Bạn chắc chắn muốn trộn đề này?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                if (r == DialogResult.Yes)
                {

                    int sl = int.Parse(txtSLTron.Text);

                    string id = dgvDSDe.SelectedRows[0].Cells[0].Value.ToString();
                    DETHI dethiGoc = dt.timTheoID(id);

                    for (int i = 0; i < sl; i++)
                    {
                        DETHI a = deThitron(id, dethiGoc);
                        tronDe(dethiGoc.ID_DETHI, a.ID_DETHI);
                    }

                    MONHOC monhoc = m.timTheoTen(cbMon.Text);

                    loadDGV_DSDeThi_TheoMon(monhoc.ID_MONHOC);
                    clear();
                    MessageBox.Show("Tạo thành công");
                }
            }
            catch
            {
                MessageBox.Show("Lỗi");
            }
        }
        public DETHI deThitron(string id, DETHI dethiGoc)
        {
            try
            {

                DETHI a = new DETHI();
                a.ID_DETHI = dt.autoID();
                a.TENDETHI = dethiGoc.TENDETHI;
                a.GhiChu = dethiGoc.TENDETHI;
                a.TGLamBai = dethiGoc.TGLamBai;
                a.SLCAU = dethiGoc.SLCAU;
                a.ID_NHCH = dethiGoc.ID_NHCH;
                a.ID_NAMHOC = dethiGoc.ID_NAMHOC;
                a.TinhTrang = id; //lấy id đề gốc
                //lấy id của nhân viên khảo thí đang đăng nhập vào hệ thống
                a.ID_GVIEN = id_gv;
                //
                dt.them(a);

                return a;
            }
            catch
            {
                return null;
                MessageBox.Show("Vui lòng chọn đề muốn trộn");
            }
        }
        public void tronDe(string idDeGoc, string idDeTron)
        {
            try
            {
                List<CTDTHI> lstDeThiGoc = ctdt.list_TheoDeThi(idDeGoc);
                Random rd = new Random();

                int[] A = new int[lstDeThiGoc.Count()];
                int k = 0, m = lstDeThiGoc.Count;
                do
                {
                    int stt = rd.Next(1, lstDeThiGoc.Count + 1);
                    if (ktMang(A, stt) == true)
                    {
                        A[k] = stt;
                        k++;
                        stt--;

                        CTDTHI a = new CTDTHI();

                        a.ID_CTDTHI = ctdt.autoID(idDeTron);
                        a.ID_DTHI = idDeTron;
                        a.HINH = lstDeThiGoc[stt].HINH;
                        a.CAUHOI = lstDeThiGoc[stt].CAUHOI;
                        a.DapAn = lstDeThiGoc[stt].DapAn;

                        List<string> lstCau = new List<string>();
                        lstCau.Add(lstDeThiGoc[stt].A);
                        lstCau.Add(lstDeThiGoc[stt].B);
                        lstCau.Add(lstDeThiGoc[stt].C);
                        lstCau.Add(lstDeThiGoc[stt].D);

                        List<string> lstCauTron = tronCau(lstCau);
                        a.A = lstCauTron[0];
                        a.B = lstCauTron[1];
                        a.C = lstCauTron[2];
                        a.D = lstCauTron[3];

                        ctdt.themCTDTHI(a);

                        m--;
                    }
                }
                while (m > 0);

                foreach (CTDTHI i in lstDeThiGoc)
                {
                    CTDTHI a = new CTDTHI();
                    int stt = rd.Next(0, lstDeThiGoc.Count - 1);
                }
            }
            catch { }
        }
        public List<string> tronCau(List<string> a)
        {
            List<string> b = new List<string>();
            Random rd = new Random();
            int[] A = new int[a.Count()];
            int k = 0, m = a.Count;
            do
            {
                int stt = rd.Next(1, a.Count + 1);
                if (ktMang(A, stt) == true)
                {
                    A[k] = stt;
                    k++;
                    b.Add(a[stt - 1]);
                    m--;
                }
            }
            while (m > 0);
            return b;
        }
        public bool ktMang(int[] a, int b)
        {
            for (int i = 0; i < a.Count(); i++)
            {
                if (a[i] == b)
                    return false;
            }
            return true;
        }
        public void clear()
        {
            txtTenDe.Text = "";
            txtCauNC.Text = "";
            txtCauTB.Text = "";
            txtGhiChu.Text = "";
            txtSLCau.Text = "";
            txtSLCauCB.Text = "";
            txtSLTron.Text = "";
            txtTG.Text = "";
        }

        private void frmTaoDeThi_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void btnExport_Click(object sender, EventArgs e)
        {
            try
            {
                //Nạp file mẫu
                //khi click vao nut thi se mo hop thoai chon file
                OpenFileDialog fDialog = new OpenFileDialog(); //tao 1 hop thoai de chon file
                fDialog.Filter = "file |*.doc;*.docx"; //chi lay nhung file co dang xls hoac xlsx
                fDialog.FilterIndex = 1; //tro vao vi tri dau tien cua bo loc
                fDialog.RestoreDirectory = true; //nho duong dan cua lan truy cap truoc
                fDialog.Multiselect = false; //khong cho phep chon nhieu file cung luc
                fDialog.Title = "Chọn file word mẫu"; //tieu de cua hop thoai
                //new chon file thanh cong
                if (fDialog.ShowDialog() == DialogResult.OK)
                {
                    string tenfile;
                    //set gia tri vao textbox filename
                    tenfile = fDialog.FileName;

                    //kiem tra du lieu da co chua
                    if (tenfile == null)
                    {
                        MessageBox.Show("Chưa chọn file");
                    }
                    else
                    {
                        try
                        {
                            //mo file va doc du lieu
                            Document doc = new Document(tenfile);

                            string id = dgvDSDe.SelectedRows[0].Cells[0].Value.ToString();
                            DETHI dethi = dt.timTheoID(id);
                            NAMHOC namhoc = nh.timTheoID(dethi.ID_NAMHOC);
                            NHCH nganhang = nhch.timTheoID(dethi.ID_NHCH);
                            MONHOC monhoc = m.timTheoID(nganhang.ID_MONHOC);
                            List<CTDTHI> lstCTDT = ctdt.list_TheoDeThi(dethi.ID_DETHI);
                            string noidung = "";
                            for (int i = 0; i < lstCTDT.Count; i++)
                            {
                                noidung = noidung + "Câu " + lstCTDT[i].ID_CTDTHI + ": " + lstCTDT[i].CAUHOI
                                    + "\rA. " + lstCTDT[i].A
                                + "\rB. " + lstCTDT[i].B
                                + "\rC. " + lstCTDT[i].C
                                + "\rD. " + lstCTDT[i].D + "\r";
                            }

                            //Điền các thông tin cố định
                            doc.MailMerge.Execute(new[] { "NamHoc" }, new[] { namhoc.TENNAM });
                            doc.MailMerge.Execute(new[] { "TenDe" }, new[] { dethi.TENDETHI });
                            doc.MailMerge.Execute(new[] { "TenMon" }, new[] { monhoc.TENMONHOC });
                            doc.MailMerge.Execute(new[] { "MaMonHoc" }, new[] { monhoc.ID_MONHOC });
                            doc.MailMerge.Execute(new[] { "TGLamBai" }, new[] { dethi.TGLamBai.ToString() });
                            doc.MailMerge.Execute(new[] { "MaDe" }, new[] { dethi.ID_DETHI });
                            doc.MailMerge.Execute(new[] { "GhiChu" }, new[] { dethi.GhiChu });
                            doc.MailMerge.Execute(new[] { "NoiDung" }, new[] { noidung });

                            //Lưu và mở file
                            SaveFileDialog fDialog1 = new SaveFileDialog(); //tao 1 hop thoai de chon file
                            fDialog1.Filter = "word file |*.doc";
                            fDialog1.RestoreDirectory = true; //nho duong dan cua lan truy cap truoc
                            if (fDialog1.ShowDialog() == DialogResult.OK)
                            {
                                doc.Save(fDialog1.FileName);
                                Process.Start(fDialog1.FileName);
                            }
                            MessageBox.Show("Xuất thành công");
                        }
                        catch
                        {
                            MessageBox.Show("File lỗi");
                        }
                    }
                }
            }
            catch
            {
                MessageBox.Show("Không thành công");
            }
        }

        private void panel3_Paint(object sender, PaintEventArgs e)
        {

        }

        private void cbKhoa_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                cbMon.Text = "";
                dgvDSDe.Rows.Clear();
                dgvDSDe.Refresh();
                dgvDeThi.Rows.Clear();
                dgvDeThi.Refresh();
                txtMaDe.Text = "";
                clear();
                if (cbKhoa.Text != "All")
                {
                    KHOA k = khoa.timKhoaTheoTen(cbKhoa.Text);
                    cbMon.Items.Clear();

                    List<MONHOC> list = m.listMon(k.ID_KHOA);

                    if (list.Count() > 0)
                    {
                        cbMon.Items.Add("All");
                        foreach (MONHOC a in list)
                        {
                            cbMon.Items.Add(a.TENMONHOC);
                        }
                    }
                }
                else
                {
                    loadCB_Mon();
                    loadDGV_DSDeThi();
                }
            }
            catch
            { }
        }

        private void cbMon_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                clear();
                dgvDeThi.Rows.Clear();
                dgvDeThi.Refresh();
                txtMaDe.Text = "";
                if (cbMon.Text != "All")
                {
                    MONHOC monhoc = m.timTheoTen(cbMon.Text);

                    loadDGV_DSDeThi_TheoMon(monhoc.ID_MONHOC);
                }
                else
                {
                    dgvDSDe.Rows.Clear();
                    KHOA k = khoa.timKhoaTheoTen(cbKhoa.Text);
                    List<MONHOC> list = m.listMon(k.ID_KHOA);

                    List<DETHI> lstDTHI = new List<DETHI>();

                    foreach (MONHOC i in list)
                    {
                        List<DETHI> lstDe = dt.list_TheoMon(i.ID_MONHOC);
                        foreach (DETHI j in lstDe)
                        {
                            lstDTHI.Add(j);
                        }
                    }

                    foreach (DETHI item in lstDTHI)
                    {
                        string name = "";
                        foreach (NAMHOC item1 in nh.listNamHoc())
                        {
                            if (item.ID_NAMHOC == item1.ID_NAMHOC)
                            {
                                name = item1.TENNAM;
                            }
                        }
                        dgvDSDe.Rows.Add(item.ID_DETHI, item.TENDETHI, item.SLCAU, item.TGLamBai, item.GhiChu, item.TinhTrang, name);
                    }
                }
            }
            catch
            { }
        }


    }
}