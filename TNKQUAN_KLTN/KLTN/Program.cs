using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;
using DevExpress.UserSkins;
using DevExpress.Skins;

namespace KLTN
{
    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        /// 
        //[STAThread]
        //[System.Runtime.InteropServices.DllImport("user32.dll")]
        //private static extern bool SetProcessDPIAware();
        public static frmDangNhap frmDN = null;
        public static frmQLNHCHois frmQLNHCH = null;
        public static frmSoanCauHoi frmSoanNHCH = null;
        public static frmMains frmMain = null;
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            BonusSkins.Register();
            SkinManager.EnableFormSkins();
           // Application.Run(new frmDangNhap());
            frmQLNHCH = new frmQLNHCHois();
            frmDN = new frmDangNhap();
            frmSoanNHCH = new frmSoanCauHoi();
            //Application.Run(new frmSDTK());
            Application.Run(frmDN);
        }
    }
}
