using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TicketValley
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitTicketsButton_Click(object sender, EventArgs e)
        {
            //Code for submitting tickets goes here
            var path = "C:/Users/carte/source/repos/TicketValley/testing.txt";

            using (System.IO.StreamWriter file = new System.IO.StreamWriter(path))
            {
                file.WriteLine(selectedTicketsBox.Text);
            }
        }
    }
}