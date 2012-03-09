using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserInfo : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void guardarDadosBtn_Click(object sender, EventArgs e)
    {
        // UTILIZADORES AUTENTICADOS
        if (User.Identity.IsAuthenticated == true)
        {
            ProfileCommon p = Profile.GetProfile(User.Identity.Name);
            Profile.Nome = ((TextBox)UserInfoLoginView.FindControl("registerNome")).Text;
            Profile.Morada = ((TextBox)UserInfoLoginView.FindControl("registerMorada")).Text;
            Profile.Email = ((TextBox)UserInfoLoginView.FindControl("registerEmail")).Text;
            Profile.Contacto = ((TextBox)UserInfoLoginView.FindControl("registerContacto")).Text;
            Profile.Save();
            p.Save();
            Response.Redirect("~/Default.aspx");
        }
        else
        {
            // UTILIZADORES ANONIMOS
            Response.Redirect("~/Default.aspx");
        }
    }
}