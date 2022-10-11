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
using Microsoft.Office.Interop.Word;
using iTextSharp.text.pdf.parser;

namespace KLTN
{
    public partial class frmSoanCauHoi : Form
    {
        string data = "";
        public string filename;
        private string tenfile = "";
        public string user = "";
        public string id_Khoa = "";
        MON_BLL_DAL m = new MON_BLL_DAL();
        CAUHOI_BLL_DAL ch = new CAUHOI_BLL_DAL();
        QLNHCHoi_BLL_DAL nhch = new QLNHCHoi_BLL_DAL();
        MUCDO_BLL_DAL md = new MUCDO_BLL_DAL();
        NGUOIDUNG_BLL_DAL nguoidung = new NGUOIDUNG_BLL_DAL();
        KHOA_BLL_DAL khoa = new KHOA_BLL_DAL();
        MON_BLL_DAL mh = new MON_BLL_DAL();
        
        public frmSoanCauHoi()
        {
            InitializeComponent();
        }
        public void load_KHOA()
        {
            foreach(GIANGVIEN item in nguoidung.get_Infos(user))
            {
                foreach(KHOA item1 in khoa.listKhoa())
                {
                    if(item.ID_KHOA.Equals(item1.ID_KHOA))
                    {
                        id_Khoa = item1.ID_KHOA;
                        loadCB_Mon(item.ID_KHOA);
                        break;
                    }
                }
            }
        }
        //lấy id của giảng viên đang đăng nhập vào hệ thống
        public void loadCB_Mon(string id)
        {
            List<MONHOC> list = m.listMon(id);
            cbMon.Properties.Items.Add("All");
            foreach (MONHOC a in list)
            {
                cbMon.Properties.Items.Add(a.TENMONHOC);
            }
        }
        public void loadCB_MucDo()
        {
            List<MUCDO> list = md.listMucDo();

            foreach (MUCDO a in list)
            {
                cbMucDo.Properties.Items.Add(a.TENMUCDO);
            }
        }
        public void loadDGV_CauHoi()
        {
            dgvCauHoi.Rows.Clear();
            dgvCauHoi.Refresh();

            List<MONHOC> lstmonhoc = mh.listMon(id_Khoa);
            List<NHCH> lstNHCH = new List<NHCH>();
            foreach(MONHOC i in lstmonhoc)
            {
                lstNHCH.Add(nhch.timTheoMon(i.ID_MONHOC));
            }


            foreach(NHCH i in lstNHCH)
            {
                foreach (CAUHOI item in ch.get_DataCauHoi_TheoNHCH(i.ID_NHCH))
                {
                    string name = "";
                    foreach (MUCDO item1 in md.listMucDo())
                    {
                        if (item.ID_MUCDO == item1.ID_MUCDO)
                        {
                            name = item1.TENMUCDO;
                        }
                    }
                    dgvCauHoi.Rows.Add(item.ID_CAUHOI, item.NOIDUNGCH, item.HINH, item.DAPAN, item.A, item.B, item.C, item.D, item.TTrang, item.CHUONG, name);

                }
            }
           
        }
        public void loadDGV_CauHoi(string ID)
        {
            dgvCauHoi.Rows.Clear();
            dgvCauHoi.Refresh();
            foreach (CAUHOI item in ch.get_DataCauHoi_TheoNHCH(ID))
            {
                string name = "";
                foreach (MUCDO item1 in md.listMucDo())
                {
                    if (item.ID_MUCDO == item1.ID_MUCDO)
                    {
                        name = item1.TENMUCDO;
                    }
                }
                dgvCauHoi.Rows.Add(item.ID_CAUHOI, item.NOIDUNGCH, item.HINH, item.DAPAN, item.A, item.B, item.C, item.D, item.TTrang, item.CHUONG, name);

            }

        }

        private void cbMon_TextChanged(object sender, EventArgs e)
        {
            if(cbMon.Text=="All")
            {
                loadDGV_CauHoi();
            }
            else
            {
                MONHOC mh = m.timTheoTen(cbMon.Text);
                NHCH n = nhch.timTheoMon(mh.ID_MONHOC);
                loadDGV_CauHoi(n.ID_NHCH);

                cbChuong.Properties.Items.Clear();

                int? tongChuong = mh.TONGCHUONG;
                for (int i = 1; i <= tongChuong; i++)
                {
                    cbChuong.Properties.Items.Add(i);
                }
            }
        }

        private void dgvCauHoi_SelectionChanged(object sender, EventArgs e)
        {
            try
            {
                txtCauHoi.Text = dgvCauHoi.SelectedRows[0].Cells[1].Value.ToString();
                string a, b, c, d;
                a = dgvCauHoi.SelectedRows[0].Cells[4].Value.ToString();
                b = dgvCauHoi.SelectedRows[0].Cells[5].Value.ToString();
                c = dgvCauHoi.SelectedRows[0].Cells[6].Value.ToString();
                d = dgvCauHoi.SelectedRows[0].Cells[7].Value.ToString();
                cbChuong.Text = dgvCauHoi.SelectedRows[0].Cells[9].Value.ToString();
                cbMucDo.Text = dgvCauHoi.SelectedRows[0].Cells[10].Value.ToString();
                string dapan = dgvCauHoi.SelectedRows[0].Cells[3].Value.ToString();
                if(a==dapan)
                {
                    rdA.Checked = true;
                }
                else if(b==dapan)
                {
                    rdB.Checked = true;
                }
                else if (c == dapan)
                {
                    rdC.Checked = true;
                }
                else
                {
                    rdD.Checked = true;
                }
                txtCauA.Text = a;
                txtCauB.Text = b;
                txtCauC.Text = c;
                txtCauD.Text = d;

                string s = dgvCauHoi.SelectedRows[0].Cells[10].Value.ToString();
                MUCDO mucdo = md.timTheoID(s);
                cbMucDo.Text = mucdo.TENMUCDO ;

                
            }
            catch { }
        }

        private void btnClear_Click(object sender, EventArgs e)
        {
            txtCauA.Clear();
            txtCauB.Clear();
            txtCauC.Clear();
            txtCauD.Clear();
            txtCauHoi.Clear();
            rdA.Checked = false;
            rdB.Checked = false;
            rdC.Checked = false;
            rdD.Checked = false;
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult m = MessageBox.Show("Bạn chắc chắn muốn sửa?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                if (m == DialogResult.Yes)
                {
                    string hinh = "";
                    if (txtCauHoi.Text == "")
                    {
                        MessageBox.Show("Chưa nhập câu hỏi");
                    }
                    string dapan = "";
                    if (rdA.Checked == true)
                        dapan = txtCauA.Text;
                    else if (rdB.Checked == true)
                        dapan = txtCauB.Text;
                    else if (rdC.Checked == true)
                        dapan = txtCauC.Text;
                    else if (rdD.Checked == true)
                        dapan = txtCauD.Text;
                    else
                        MessageBox.Show("Chưa chọn đáp án đúng");

                    MUCDO mucdo = md.timTheoTen(cbMucDo.Text);
                    string idMucDo = mucdo.ID_MUCDO;

                    string id = dgvCauHoi.SelectedRows[0].Cells[0].Value.ToString();
                    ch.suaCH(id, txtCauHoi.Text, hinh, dapan, txtCauA.Text, txtCauB.Text, txtCauC.Text, txtCauD.Text, idMucDo, cbChuong.Text);

                    load_DGV();
                    
                    MessageBox.Show("Sửa thành công");
                }
            }
            catch
            {
                MessageBox.Show("Không thể Sửa");
            }
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult dia = MessageBox.Show("Bạn chắc chắn muốn thêm?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                if (dia == DialogResult.Yes)
                {

                    if (tenfile != "")
                    {
                        themFile(data);
                    }
                    else
                    {
                        string hinh = "";
                        string tinhtrang = "Chưa duyệt";
                        string dapan = "";
                        if (rdA.Checked == true)
                            dapan = txtCauA.Text;
                        else if (rdB.Checked == true)
                            dapan = txtCauB.Text;
                        else if (rdC.Checked == true)
                            dapan = txtCauC.Text;
                        else if (rdD.Checked == true)
                            dapan = txtCauD.Text;
                        MONHOC mh = m.timTheoTen(cbMon.Text);
                        NHCH n = nhch.timTheoMon(mh.ID_MONHOC);
                        string idNHCH = n.ID_NHCH;
                        MUCDO mucdo = md.timTheoTen(cbMucDo.Text);
                        string idMucDo = mucdo.ID_MUCDO;
                        ch.themCH(txtCauHoi.Text, hinh, dapan, txtCauA.Text, txtCauB.Text, txtCauC.Text, txtCauD.Text, idMucDo, cbChuong.Text, tinhtrang, idNHCH);

                        load_DGV();
                        MessageBox.Show("Thêm thành công");
                    }
                }
            }
            catch
            {
                load_DGV();
                //MessageBox.Show("Không thể thêm");
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            try
            {
                DialogResult m = MessageBox.Show("Bạn chắc chắn muốn xóa?", "Warning", MessageBoxButtons.YesNo, MessageBoxIcon.Warning, MessageBoxDefaultButton.Button1);
                if (m == DialogResult.Yes)
                {
                    string id = dgvCauHoi.SelectedRows[0].Cells[0].Value.ToString();
                    CAUHOI c = ch.timCHtheoID(id);
                    ch.xoaCH(c);

                    load_DGV();

                    MessageBox.Show("Xóa thành công");
                }
            }
            catch {
                MessageBox.Show("Không thể xóa");
            }
        }
        private void load_DGV()
        {
            try
            {
                MONHOC mh = m.timTheoTen(cbMon.Text);
                NHCH n = nhch.timTheoMon(mh.ID_MONHOC);
                loadDGV_CauHoi(n.ID_NHCH);
            }
            catch { }
        }
        public bool chuongMoi(string data)
        {
            string temp;
            temp = data.Substring(0, 7);
            if (temp == "Chương:")
                return true;
            return false;
        }

        public void themFile(string data)
        {
            try
            {
                int chuong = 0;
                MONHOC monhoc = m.timTheoTen(laytenMon(data));
                if (monhoc == null)
                    MessageBox.Show("Lỗi file");
                NHCH n = nhch.timTheoMon(monhoc.ID_MONHOC);
                data = xoaChuoi(data, "Chương:", 0);
                do
                {
                    CAUHOI a = new CAUHOI();
                    if (chuongMoi(data) == true)
                    {
                        chuong = layChuong(data);
                        data = xoaChuoi(data, "Câu", 0);
                    }
                    a.CHUONG = chuong;
                    a.HINH = "";
                    a.ID_CAUHOI = ch.autoID();
                    a.TTrang = "Chưa duyệt";
                    a.ID_NHCH = n.ID_NHCH;
                    MUCDO mucdo = md.timTheoTen(layMucDo(data));
                    if (mucdo == null)
                        MessageBox.Show("Lỗi file");
                    a.ID_MUCDO = mucdo.ID_MUCDO;
                    a.NOIDUNGCH = layCauHoi(data);
                    string Caua, Caub, Cauc, Caud, dapan;
                    Caua = layCauA(data);
                    Caub = layCauB(data);
                    Cauc = layCauC(data);
                    data = xoaChuoi(data, Cauc, Cauc.Length);
                    int vt1 = data.IndexOf("Câu:");
                    int vt2 = data.IndexOf("Chương:");
                    if (vt1 < vt2 && vt1 != -1 && vt2 != -1)
                        Caud = layCauD(data, "Câu:");
                    else if (vt1 > vt2 && vt1 != -1 && vt2 != -1)
                        Caud = layCauD(data, "Chương:");
                    else if (vt2 == -1 && vt1 != -1)
                        Caud = layCauD(data, "Câu:");
                    else
                        Caud = data.Substring(2);
                    if (layDapAn(Caua) == true)
                    {
                        Caua = xoaChuoi(Caua, "*", 1);
                        dapan = Caua;
                    }
                    else if (layDapAn(Caub) == true)
                    {
                        Caub = xoaChuoi(Caub, "*", 1);
                        dapan = Caub;
                    }
                    else if (layDapAn(Cauc) == true)
                    {
                        Cauc = xoaChuoi(Cauc, "*", 1);
                        dapan = Cauc;
                    }
                    else
                    {
                        Caud = xoaChuoi(Caud, "*", 1);
                        dapan = Caud;
                    }
                    a.A = Caua;
                    a.B = Caub;
                    a.C = Cauc;
                    a.D = Caud;
                    a.DAPAN = dapan;
                    data = xoaChuoi(data, "d.", Caud.Length + 2);
                    ch.themCauHoi(a);
                }
                while (data != null);
                tenfile = "";
                loadDGV_CauHoi();
                MessageBox.Show("Thêm thành công");
            }
            catch
            {
                loadDGV_CauHoi();
                tenfile = "";
            }
        }
        public string xoaChuoi(string data, string s, int soKiTu)
        {
            int vt = data.IndexOf(s);
            return data.Remove(0, vt + soKiTu);
        }
        public string laytenMon(string data)
        {
            string str = data.Substring(8);
            if (str.Substring(0, 1) == " ")
                str = str.Substring(1);
            int vt = str.IndexOf("Chương: ");
            str = str.Substring(0, vt - 1);
            str = str.TrimEnd('\r', ' ', '\n');
            return str;
        }
        public int layChuong(string data)
        {
            int vt = data.IndexOf("Chương: ");
            string str = data.Substring(vt + 8);
            return int.Parse(str.Substring(0, 1));
        }
        public string layCauHoi(string data)
        {
            int vt1 = data.IndexOf("Câu: ");
            int vt2 = data.IndexOf("Mức độ: ");
            return data.Substring(vt1 + 5, vt2 - vt1 - 5);
        }
        public string layMucDo(string data)
        {
            int vt1 = data.IndexOf("Mức độ: ");
            int vt2 = data.IndexOf("a.");
            return data.Substring(vt1 + 8, vt2 - vt1 - 8);
        }
        public string layCauA(string data)
        {
            int vt1 = data.IndexOf("a.");
            int vt2 = data.IndexOf("b.");
            return data.Substring(vt1 + 2, vt2 - vt1 - 2);
        }
        public string layCauB(string data)
        {
            int vt1 = data.IndexOf("b.");
            int vt2 = data.IndexOf("c.");
            return data.Substring(vt1 + 2, vt2 - vt1 - 2);
        }
        public string layCauC(string data)
        {
            int vt1 = data.IndexOf("c.");
            int vt2 = data.IndexOf("d.");
            return data.Substring(vt1 + 2, vt2 - vt1 - 2);
        }
        public string layCauD(string data, string s)
        {
            int vt1 = data.IndexOf("d.");
            int vt2 = data.IndexOf(s);
            return data.Substring(vt1 + 2, vt2 - vt1 - 2);
        }
        public bool layDapAn(string cau)
        {
            string temp;
            temp = cau.Substring(0, 1);
            if (temp == "*")
                return true;
            return false;
        }

        private void btnBrowse_Click(object sender, EventArgs e)
        {
            try
            {
                //khi click vao nut thi se mo hop thoai chon file
                OpenFileDialog fDialog = new OpenFileDialog(); //tao 1 hop thoai de chon file
                fDialog.Filter = "file |*.doc;*.docx;*.pdf"; //chi lay nhung file co dang xls hoac xlsx
                fDialog.FilterIndex = 1; //tro vao vi tri dau tien cua bo loc
                fDialog.RestoreDirectory = true; //nho duong dan cua lan truy cap truoc
                fDialog.Multiselect = false; //khong cho phep chon nhieu file cung luc
                fDialog.Title = "Chọn file"; //tieu de cua hop thoai
                //new chon file thanh cong
                if (fDialog.ShowDialog() == DialogResult.OK)
                {
                    //set gia tri vao textbox filename
                    tenfile = fDialog.FileName;
                    //doc file
                    filename = tenfile;
                    //kiem tra du lieu da co chua
                    if (filename == null)
                    {
                        MessageBox.Show("Chưa chọn file");
                    }
                    else
                    {
                        try
                        {
                            //mo file va doc du lieu
                            Microsoft.Office.Interop.Word.Application app = new Microsoft.Office.Interop.Word.Application();
                            Document doc = app.Documents.Open(tenfile);
                            data = doc.Content.Text;
                        }
                        catch
                        {
                            iTextSharp.text.pdf.PdfReader reader = new iTextSharp.text.pdf.PdfReader(fDialog.FileName);
                            StringBuilder sb = new StringBuilder();
                            for (int i = 1; i <= reader.NumberOfPages; i++)
                            {
                                sb.Append(PdfTextExtractor.GetTextFromPage(reader, i));
                            }
                            data = sb.ToString();
                            reader.Close();
                        }
                    }
                }
            }
            catch { }
        }

        private void btnThemMH_Click(object sender, EventArgs e)
        {
            frmMonHoc fm = new frmMonHoc();
            fm.ID = id_Khoa;
            fm.idGV = user;
            fm.ShowDialog();
        }

        private void frmSoanCauHoi_Load(object sender, EventArgs e)
        {
            load_KHOA();
            loadCB_MucDo();
        }
    }
}