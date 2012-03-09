using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

public partial class ProductAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (User.Identity.IsAuthenticated == true)
        {

            if (Session["cart"] == null)
            {
                ShoppingCart cart = new ShoppingCart();
                Session["cart"] = cart;
                //double cart_total = 0;
                //Session["total"] = cart_total;
            }
            else
            {
            }

            MembershipUser userlogged = Membership.GetUser();
            string UserID = userlogged.ProviderUserKey.ToString();


            string productTitle = "";
            string price = "0";
            int id_product = Convert.ToInt32(Request.QueryString["id"]);

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
            {
                string sql = "SELECT title,price FROM PRODUCTS WHERE id_product=" + id_product;
                using (SqlCommand cmd = new SqlCommand(sql, con))
                {
                    con.Open();
                    SqlDataReader reader = cmd.ExecuteReader();
                    if (reader.HasRows)
                    {
                        while (reader.Read())
                        {
                            productTitle = reader["title"].ToString();
                            price = reader["price"].ToString();
                        }
                        //então adiciona ao objecto shoppingcart o producto
                        try
                        {
                            double cartprice = Convert.ToDouble(price);
                            Product producta = new Product(id_product, productTitle, cartprice);
                            ShoppingCart temp = (ShoppingCart)Session["cart"];
                            temp.addProductToItemList(producta);
                            cartLabel.Text = "Adicionado ao carrinho com sucesso. Total: "+temp.total.ToString();
                            Session["cart"] = temp;

                        }
                        catch (Exception)
                        {
                        }
                    }
                    else
                    {
                        cartLabel.Text = "Esse produto não existe.";
                    }
                }

            }

        }
        else
        {
            Response.Redirect("~/Login.aspx");
        }
    }
}