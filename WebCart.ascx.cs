using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WebCart : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["cart"] == null)
        {
        }
        else
        {
            ShoppingCart temp = (ShoppingCart)Session["cart"];
            int contador = 0;
            foreach (Product product in temp.items)
            {
                shoopingCartItems.Text += product.Title + " - " + product.Price.ToString() + "<a href=\"RemoveFromCart.aspx?position=" + contador + "\" style=\"color:#ff6666;\"> x <a/><br />";
                contador++;
            }
            if (contador == 0)
            {
                purchaseLink.NavigateUrl = "";
                purchaseLink.Text = "";
            }
            else if (contador > 0)
            {
                purchaseLink.NavigateUrl = "~/ProcessOrder.aspx";
                purchaseLink.Text = "Check Out";
            }
            //Session["total"] = temp.total;
            shoppingCartTotal.Text = "Total: " + contador + " items =" + temp.total.ToString();
        }
    }
}