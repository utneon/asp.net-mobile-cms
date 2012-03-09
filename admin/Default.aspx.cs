using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Data;
using System.Data.SqlClient;
using System.Configuration;


public partial class admin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        getSupportTickets();
        getNewOrders();
    }

    protected void getSupportTickets()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
        {
            string sql = "SELECT status FROM SUPPORT WHERE status='open'";
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                int contador = 0;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        contador++;
                    }
                    ticketsopenLabel.ForeColor = System.Drawing.Color.FromArgb(255, 98, 48);
                    ticketsopenLabel.Text = Convert.ToString(contador);
                }
                else
                {
                    ticketsopenLabel.Text = "There is no requested support.";
                }
            }
        }
    }
    protected void getNewOrders()
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
        {
            string sql = "SELECT order_status FROM orders WHERE order_status='0'";
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                int contador = 0;
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.HasRows)
                {
                    while (reader.Read())
                    {
                        contador++;
                    }
                    newOrdersLabel.ForeColor = System.Drawing.Color.FromArgb(255, 98, 48);
                    newOrdersLabel.Text = Convert.ToString(contador);
                }
                else
                {
                    newOrdersLabel.Text = "There are no orders.";
                }
            }
        }
    }
}