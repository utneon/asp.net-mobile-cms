using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Categories : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkCategoriesManage.CssClass = "selectedview";
        string view = Request.QueryString["view"];
        switch (view)
        {
            case "manage":
                CategoriesMultiView.SetActiveView(categoriesManage);
                LinkCategoriesManage.CssClass = "selectedview";
                break;
            case "create":
                CategoriesMultiView.SetActiveView(categoriesCreate);
                LinkCategoriesCreate.CssClass = "selectedview";
                LinkCategoriesManage.CssClass = "";
                break;
            case "update":
                CategoriesMultiView.SetActiveView(categoriesUpdate);
                break;
        }
    }
    protected void insertedCategory(object sender, DetailsViewInsertedEventArgs e)
    {
            if (e.AffectedRows == 1)
            {
                mensagemErro.Text = "Category inserted successfully";
                CategoriesMultiView.ActiveViewIndex = 0;
                LinkCategoriesCreate.CssClass = "";
                LinkCategoriesManage.CssClass = "selectedview";
            }
            else if (e.Exception != null)
            {
                mensagemErro.Text = "Category already exists.";
                e.ExceptionHandled = true;
                e.KeepInInsertMode = true;
            }
    }
    protected void updatedCategory(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "Category Updated.";
            CategoriesMultiView.ActiveViewIndex = 0;
        }
    }
    protected void commandCategory(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            CategoriesMultiView.ActiveViewIndex = 0;
            LinkCategoriesManage.CssClass = "selectedview";
            LinkCategoriesCreate.CssClass = "";
        }
    }
}