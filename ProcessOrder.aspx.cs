using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ProcessOrder : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == true)
        {
            if (Session["cart"] == null)
            {
                confirmLabel.Text = "No products to purchase.";
                confirmPurchaseLink.Text = "";
                confirmPurchaseLink.NavigateUrl = "";
            }
            else
            {
                string view = Request.QueryString["view"];
                if (view == "processOrderConfirmation")
                {

                    ShoppingCart temp = (ShoppingCart)Session["cart"];
                    try
                    {
                        temp.savePurchase();
                        purchaseCompleteLabel.Text = "Purchase Completed Successfully";
                        Session.Remove("cart");
                    }
                    catch
                    {
                        purchaseCompleteLabel.Text = "It wasn't possible to complete the purchase at the moment. Please try again later.";
                    }
                    confirmOrderMultiView.ActiveViewIndex = 1;
                }
                else
                {
                    confirmOrderMultiView.ActiveViewIndex = 0;
                    confirmLabel.Text = "<p>Please confirm your order before making the purchase.</p><br /><table>";
                    ShoppingCart temp = (ShoppingCart)Session["cart"];
                    int contador = 0;
                    foreach (Product product in temp.items)
                    {
                        confirmLabel.Text += "<tr><td><p>" + product.Title + "</p></td><td><p>" + product.Price.ToString() + "</p></td></tr>";
                        contador++;
                    }


                    confirmLabel.Text += "<tr><td><p>Total: </p></td><td><p style=\"color:#ff6666;\">" + contador + " items with a total of " + temp.total.ToString() + "</p></td></tr>";
                    confirmLabel.Text += "</table>";
                }
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");
        }

    }
    protected void ConfirmBtn_Click(object sender, EventArgs e)
    {
        confirmOrderMultiView.ActiveViewIndex = 1;
    }
}