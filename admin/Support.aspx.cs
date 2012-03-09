using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_Support : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string view = Request.QueryString["view"];
        switch (view)
        {
            case "viewticketdetails":
                string id_ticket = Request.QueryString["id"];
                MultiViewSupport.ActiveViewIndex = 1;
                replyTicketLink.NavigateUrl = "~/admin/Support.aspx?view=replyticket&id=" + id_ticket;
                break;
            case "manage":
                MultiViewSupport.ActiveViewIndex = 0;
                break;
            case "replyticket":
                MultiViewSupport.ActiveViewIndex = 2;
                string id_tick = Request.QueryString["id"];
                Session["resposta"] = resposta.Text;
                // consulta à base de dados
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
                {
                    string sql = "SELECT mensagem, userid FROM SUPPORT WHERE id_mensagem = " + id_tick;
                    using (SqlCommand cmd = new SqlCommand(sql, con))
                    {
                        con.Open();
                        SqlDataReader reader = cmd.ExecuteReader();
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                resposta.Text = reader["mensagem"].ToString() + "\n\n ---------------------------\n Support Request Reply: \n --------------------------- \n\n";
                                useridLabel.Text = reader["userid"].ToString();
                                mensagemidLabel.Text = id_tick;
                            }
                        }
                        else
                        {
                            //não encontrou registos
                        }
                    }
                }
                // fim
                break;
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
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
                    cmdIns.Parameters.Add("@assunto", "reply");
                    cmdIns.Parameters.Add("@mensagem", Session["resposta"]);
                    cmdIns.Parameters.Add("@userid", useridLabel.Text);
                    cmdIns.Parameters.Add("@direction", 2);
                    cmdIns.Parameters.Add("@date", date);
                    cmdIns.Parameters.Add("@status", "closed");
                    cmdIns.ExecuteNonQuery();
                    cmdIns.Dispose();
                    cmdIns = null;

                    MultiViewSupport.ActiveViewIndex = 0;
                    mensagemErro.Text = "Ticket respondido";

                    //fazer o update do ticket a que se está a respostar para closed.
                    string id_ticket_replied = Request.QueryString["id"];

                    using (SqlConnection con2 = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
                    {
                        string sql2 = "UPDATE support SET status=@status FROM SUPPORT WHERE id_mensagem=@id_mensagem";
                        using (SqlCommand cmd2 = new SqlCommand(sql2, con2))
                        {
                            con2.Open();
                            cmd2.Parameters.Add("@status", "closed");
                            cmd2.Parameters.Add("@id_mensagem", Convert.ToInt32(id_ticket_replied));
                            try
                            {
                                cmd2.ExecuteNonQuery();
                            }
                            catch (Exception ex)
                            {
                                //Lançar erro para log ou visual
                            }
                            finally
                            {
                                con2.Close();
                            }


                        }
                    }
                }
                catch (Exception ex)
                {
                    throw new Exception(ex.ToString(), ex);
                    //lançar aviso de erro caso falhar
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}