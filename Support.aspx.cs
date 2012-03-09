using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class Support : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //Estava a ocorrer um erro no momento do logout no support.aspx
        try
        {
            //Get userid and Store it in session
            MembershipUser userlogged = Membership.GetUser();
            string UserID = userlogged.ProviderUserKey.ToString();
            Session["userid"] = UserID;

            string view = Request.QueryString["view"];
            switch (view)
            {
                case "viewtickets":
                    ((MultiView)LoginViewSupport.FindControl("SupportMultiview")).ActiveViewIndex = 1;
                    ((HyperLink)LoginViewSupport.FindControl("supportViewUserSupportTickers")).NavigateUrl = "~/Support.aspx";
                    ((HyperLink)LoginViewSupport.FindControl("supportViewUserSupportTickers")).Text = "Request Another Support Ticket";
                    break;
            }
        }
        catch (Exception)
        {
            Response.Redirect("~/Default.aspx");
        }
    }
    protected void SubmitSupportTicketBtn_Click(object sender, EventArgs e)
    {
        string assunto = ((DropDownList)LoginViewSupport.FindControl("assunto")).SelectedValue;
        string mensagem = ((TextBox)LoginViewSupport.FindControl("message")).Text;

        if (User.Identity.IsAuthenticated == true)
        {

            //Get userid and User
            MembershipUser userlogged = Membership.GetUser();
            string UserID = userlogged.ProviderUserKey.ToString();
            Session["userid"] = UserID;


            DateTime date = DateTime.Now;
            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
            {
                string sql = "INSERT INTO support([assunto], [mensagem], [userid], [direction], [date], [status]) VALUES (@assunto, @mensagem, @userid, @direction, @date, @status)";
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    try
                    {
                        SqlCommand cmdIns = new SqlCommand(sql, con);
                        cmdIns.Parameters.Add("@assunto", assunto);
                        cmdIns.Parameters.Add("@mensagem", mensagem);
                        cmdIns.Parameters.Add("@userid", userlogged.ProviderUserKey);
                        cmdIns.Parameters.Add("@direction", 1);
                        cmdIns.Parameters.Add("@date", date);
                        cmdIns.Parameters.Add("@status", "open");
                        cmdIns.ExecuteNonQuery();
                        cmdIns.Dispose();
                        cmdIns = null;
                        ((Label)LoginViewSupport.FindControl("confirmationLabel")).Text = "Request made successfully";
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.ToString(), ex);
                        ((Label)LoginViewSupport.FindControl("confirmationLabel")).Text = "Sorry, please try again, it wasn't possible to proccess your request.";
                        
                    }
                    finally
                    {
                        //Mudar a vista para a view de confirmação
                        ((MultiView)LoginViewSupport.FindControl("SupportMultiview")).ActiveViewIndex = 2;
                        con.Close();
                    }
                }
            }
        }

        
        
    }
}