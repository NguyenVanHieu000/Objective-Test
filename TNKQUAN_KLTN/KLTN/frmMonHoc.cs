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
    public partial class frmMonHoc : Form
    {
        MON_BLL_DAL monhoc = new MON_BLL_DAL();
        QLNHCHoi_BLL_DAL nhch = new QLNHCHoi_BLL_DAL();
        public string ID = "";
        public string idGV = "";
        public frmMonHoc()
        {
            InitializeComponent();
            this.StartPosition = FormStartPosition.CenterScreen;
        }


        private void frmMonHoc_FormClosed(object sender, FormClosedEventArgs e)
        {
            this.Close();
        }

        private void btnThemMH_Click_1(object sender, EventArgs e)
        {

        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            this.Close();
        }

    }
}
