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

public partial class mobile_PurchaseComplete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string username = Request.QueryString["username"];
        //usernameLabel.Text = "Username: " + username;
        string password = Request.QueryString["password"];
        //passwordLabel.Text = "Password: " + password;
        string id_product = Request.QueryString["id"];
        string total = Request.QueryString["total"];


        if (Membership.ValidateUser(username, password))
        {

            FormsAuthentication.SetAuthCookie(username, false);
            if (User.Identity.IsAuthenticated == true)
            {

                //get userid do userlogged
                MembershipUser userlogged = Membership.GetUser();
                string UserID = userlogged.ProviderUserKey.ToString();
                //ProfileCommon p = Profile.GetProfile(User.Identity.Name);
                mensagemLabel.Text = Profile.Nome + ", a sua encomenda foi recebida. Receberá um email assim que tiver sido confirmada. Obrigado por fazer negócio conosco. <br><br> A sua morada actual é:<br><br> " + Profile.Morada + " <br><br><br>Estes dados foram consultados através do Profile.";
                // Guardar a compra na base de dados a encomenda.

                DateTime date = DateTime.Now;
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
                {
                    string sql = "INSERT INTO orders([userid], [id_product], [date], [order_total], [order_status]) VALUES (@userid, @id_product, @date, @order_total, @order_status)";
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        con.Open();
                        try
                        {
                            SqlCommand cmdIns = new SqlCommand(sql, con);
                            cmdIns.Parameters.Add("@userid", userlogged.ProviderUserKey);
                            cmdIns.Parameters.Add("@id_product", Convert.ToInt32(id_product));
                            cmdIns.Parameters.Add("@date", date);
                            cmdIns.Parameters.Add("@order_total", Convert.ToDouble(total));
                            cmdIns.Parameters.Add("@order_status", "0");
                            cmdIns.ExecuteNonQuery();
                            cmdIns.Dispose();
                            cmdIns = null;
                        }
                        catch (Exception ex)
                        {
                            throw new Exception(ex.ToString(), ex);
                            mensagemLabel.Text = "Ocorreu um erro a processar a sua encomenda. Por Favor tente novamente.";
                        }
                        finally
                        {
                            cancelBtn.Text = "Cancel";
                            con.Close();
                        }
                    }
                }
            }


        }
        else
        {
            mensagemLabel.ForeColor = System.Drawing.Color.FromArgb(255, 98, 48);
            mensagemLabel.Text = "Wrong Username/Password. Please Try Again";
            cancelBtn.Text = "Try Again";
        }



    }
    protected void Page_PreInit(object sender, EventArgs e)
    {
        //Desactivar o theming para esta página
        Page.Theme = null;
    }

}