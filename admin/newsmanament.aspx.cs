using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_newsmanament : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkNewsManage.CssClass = "selectedview";
        string view = Request.QueryString["view"];
        switch (view)
        {
            case "manage":
                NewsMultiView.SetActiveView(newsManage);
                LinkNewsManage.CssClass = "selectedview";
                break;
            case "create":
                NewsMultiView.SetActiveView(newsCreate);
                //meter o novo separador activo
                LinkNewsCreate.CssClass = "selectedview";
                //remover o estado activo do separador antigo
                LinkNewsManage.CssClass = "";
                break;
            case "update":
                NewsMultiView.SetActiveView(NewsUpdate);
                break;
        }
    }
    protected void insertedNews(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "News Article created successfully";
            NewsMultiView.ActiveViewIndex = 0;
        }
    }
    protected void updatedNews(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "News Article updated.";
            NewsMultiView.ActiveViewIndex = 0;
        }
    }
    protected void deletedNews(object sender, GridViewDeletedEventArgs e)
    {
        if (e.Exception == null)
        {
            mensagemErro.Text = "News Article deleted.";
            NewsMultiView.ActiveViewIndex = 0;
        }
    }
    protected void commandNews(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName=="Cancel")
        {
            Response.Redirect("newsmanament.aspx?view=manage");
        }
    }
}