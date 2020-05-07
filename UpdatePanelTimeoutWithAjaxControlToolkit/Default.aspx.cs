using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace UpdatePanelTimeoutWithAjaxControlToolkit
{
    public partial class Default : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void StandardButton_Click(object sender, EventArgs e)
        {
            StandardLabel.Text = DateTime.Now.ToString();
        }

        protected void AsyncButton_Click(object sender, EventArgs e)
        {
            System.Threading.Thread.Sleep(10 * 1000);
            AsyncLabel.Text = DateTime.Now.ToString();
        }

        protected void ScriptManager1_AsyncPostBackError(object sender, AsyncPostBackErrorEventArgs e)
        {
            ScriptManager1.AsyncPostBackErrorMessage = e.Exception.Message;
            Debug.WriteLine($"{e.Exception.Message}");
        }

        protected void GenericErrorButton_Click(object sender, EventArgs e)
        {
            throw new ArgumentException("Genric Exception message text!");
        }
    }
}