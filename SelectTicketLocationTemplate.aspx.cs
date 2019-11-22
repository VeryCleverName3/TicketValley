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
        //my code is bad
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void submitTicketsButton_Click(object sender, EventArgs e)
        {
            //Code for submitting tickets goes here
            var path = "";
            userDirectory ahhidontremembercsharp = new userDirectory();
            path = "C:/Users/" + ahhidontremembercsharp.user.TrimEnd(ahhidontremembercsharp.user[ahhidontremembercsharp.user.Length-1]) + "/source/repos/TicketValley/testing.txt";
            //Thank you Carter for making this static to your directory. I fixed it.
            //Also thank you Microsoft for making the name of your users the username minus the last char

            using (System.IO.StreamWriter file = new System.IO.StreamWriter(path))
            {
                file.WriteLine(selectedTicketsBox.Text);
            }
        }
    }
}