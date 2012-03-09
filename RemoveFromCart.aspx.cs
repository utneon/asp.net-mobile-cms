using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class RemoveFromCart : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (User.Identity.IsAuthenticated == true)
        {
            if (Session["cart"] == null)
            {
                Response.Redirect("~/Default.aspx");
            }
            else
            {
                try
                {
                    int position = Convert.ToInt32(Request.QueryString["position"]);
                    ShoppingCart temp = (ShoppingCart)Session["cart"];
                    temp.removeProductFromItemList(position);
                    Session["cart"] = temp;

                    removeLabelStatus.Text = "The item has been removed successfully from the Shopping Cart.";
                    Response.Redirect("~/store.aspx");
                }
                catch
                {
                    removeLabelStatus.Text = "Please try again later, it wasn't possible to remove the item from the cart. Sorry about the inconvenience.";
                }
            }
        }
        else
        {
            Response.Redirect("~/Default.aspx");

        }
    }
}