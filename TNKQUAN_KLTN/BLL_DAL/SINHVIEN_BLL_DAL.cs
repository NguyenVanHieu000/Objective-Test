using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
namespace BLL_DAL
{
    public class SINHVIEN_BLL_DAL
    {
        DBDataContext qlTNKQ = new DBDataContext();
        public IQueryable get_DataSV()
        {
            return qlTNKQ.SINHVIENs.Select(t => t);
        }
        public List<KHOA> getDataKHOA()
        {
            return qlTNKQ.KHOAs.Select(t => t).ToList();
        }
        public List<SINHVIEN> listSV()
        {
            return qlTNKQ.SINHVIENs.Select(t => t).ToList();
        }
        public bool themSV(string pw,string tensv,string hinh,string namSinh,string sdt,string gt,string queQuan,string diaChi,string cmnd,string txtKhoa)
        {
            
            try
                {
                        SINHVIEN a = new SINHVIEN();
                            a.PASSSVIEN = pw;
                            a.TENSV = tensv;
                            a.HINHSV = hinh;
                            a.NAMSINH = DateTime.Parse(namSinh);
                            a.GIOITINH = gt;
                            a.SDT = sdt;
                            a.DIACHI = diaChi;
                            a.CMND = cmnd;
                            a.QUEQUAN = queQuan;
                            a.ID_KHOA = txtKhoa;
                            a.ID_SVIEN = autoID();
                            qlTNKQ.SINHVIENs.InsertOnSubmit(a);
                            qlTNKQ.SubmitChanges();
                            return true;
                }
            catch
            {
                return false;
                throw;
                }
        }
        
        public bool xoaSV(string ID)
        {
            SINHVIEN a = timSVTheoIDSV(ID);
            if (a == null)
                return false;
            else
            {
                qlTNKQ.SINHVIENs.DeleteOnSubmit(a);
                qlTNKQ.SubmitChanges();
                return true;
            }
        }
        public string autoID()
        {
            string id = "";
            int dem = 0;
            if (qlTNKQ.SINHVIENs.Count() >0)
            {
                foreach (SINHVIEN a in listSV())
                {
                    id = a.ID_SVIEN;
                }
                dem = int.Parse(id.Substring(8, 3));
            }
            if (dem < 99)
                return id.Substring(0, 7) + "00" + (dem + 1).ToString();
            else if (dem >= 99 && dem < 999)
                return id.Substring(0, 7) + "0" + (dem + 1).ToString();
            else
                return id.Substring(0, 7) + (dem + 1).ToString();

        }
        public bool themSinhVien(SINHVIEN a)
        {
            try
            {
                qlTNKQ.SINHVIENs.InsertOnSubmit(a);
                qlTNKQ.SubmitChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
     
        public IQueryable timSVTheoIDKhoa(string idKhoa)
        {
            return qlTNKQ.SINHVIENs.Where(t => t.ID_KHOA == idKhoa);
        }
        public IQueryable timSVTheoID(string idSV)
        {
            return qlTNKQ.SINHVIENs.Where(t => t.ID_SVIEN == idSV);
        }
        public SINHVIEN timSVTheoIDSV(string idSV)
        {
            return qlTNKQ.SINHVIENs.Where(t => t.ID_SVIEN == idSV).FirstOrDefault();
        }
        public void update(SINHVIEN a)
        {
            SINHVIEN sv = timSVTheoIDSV(a.ID_SVIEN);
            sv.TENSV = a.TENSV;
            sv.PASSSVIEN = a.PASSSVIEN;
            sv.NAMSINH = a.NAMSINH;
            sv.DIACHI = a.DIACHI;
            sv.CMND = a.CMND;
            sv.HINHSV = a.HINHSV;
            sv.GIOITINH = a.GIOITINH;
            sv.ID_KHOA = a.ID_KHOA;
            sv.QUEQUAN = a.QUEQUAN;
            sv.SDT = a.SDT;

            qlTNKQ.SubmitChanges();
        }

        public List<SINHVIEN> lstThiSinh(List<string> lstID)
        {
            List<SINHVIEN> lst = new List<SINHVIEN>();
            foreach (string i in lstID)
            {
                SINHVIEN sinhvien = timSVTheoIDSV(i);
                if (sinhvien != null)
                {
                    lst.Add(sinhvien);
                }
                else
                    return null;
            }
            return lst.OrderBy(t => t.TENSV).ToList();
        }
    }
}
