using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirecionar para a área de administração se for administrador
        if (User.Identity.IsAuthenticated == true)
        {
            if (User.IsInRole("administrator") == true)
            {
                Response.Redirect("~/admin/Default.aspx");
            }
        }
    }
}