using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

/// <summary>
/// Summary description for ShoppingCart
/// </summary>
public class ShoppingCart
{
    public ArrayList items { get; set; }
    public double total { get; set; }
    public ShoppingCart()
    {
        this.total = 0;
        this.items = new ArrayList();
    }

    public void addProductToItemList(Product produtoadd)
    {
        items.Add(produtoadd);
        double new_total = 0;
        foreach (Product item in items)
        {
            new_total += item.Price;
        }
        this.total = new_total;
    }
    public void removeProductFromItemList(int position)
    {
        double new_total = 0;
        this.items.RemoveAt(position);
        foreach (Product item in items)
        {
            new_total += item.Price;
        }
        this.total = new_total;
    }
    public void savePurchase()
    {
        foreach (Product product in this.items)
        {
            //get userid do userlogged
            MembershipUser userlogged = Membership.GetUser();
            string UserID = userlogged.ProviderUserKey.ToString();
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
                        cmdIns.Parameters.Add("@id_product", Convert.ToInt32(product.Id));
                        cmdIns.Parameters.Add("@date", date);
                        cmdIns.Parameters.Add("@order_total", Convert.ToDouble(product.Price));
                        cmdIns.Parameters.Add("@order_status", "0");
                        cmdIns.ExecuteNonQuery();
                        cmdIns.Dispose();
                        cmdIns = null;
                    }
                    catch (Exception ex)
                    {
                        throw new Exception(ex.ToString(), ex);
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
        }
    }
}