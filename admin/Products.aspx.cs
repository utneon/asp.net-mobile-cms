using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Products : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        LinkProductsManage.CssClass = "selectedview";
        string view = Request.QueryString["view"];
        switch (view)
        {
            case "manage":
                ProductsMultiView.SetActiveView(productsManage);
                LinkProductsManage.CssClass = "selectedview";
                break;
            case "create":
                ProductsMultiView.SetActiveView(productsCreate);
                LinkProductsCreate.CssClass = "selectedview";
                LinkProductsManage.CssClass = "";
                break;
            case "update":
                ProductsMultiView.SetActiveView(productsUpdate);
                break;
            case "UploadImage":
                LinkProductsCreate.CssClass = "";
                LinkProductsManage.CssClass = "";
                ProductsMultiView.SetActiveView(ChangeImage);
                break;
        }

    }
    /*
    protected void insertedProduct(object sender, DetailsViewInsertedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "Product added successfully";
            ProductsMultiView.ActiveViewIndex = 0;
            LinkProductsManage.CssClass = "selectedview";
            LinkProductsCreate.CssClass = "";
        }
    }
     */
    protected void commandNews(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("~/admin/Products.aspx?view=manage");
        }
    }
    protected void updatedProduct(object sender, DetailsViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "Product Info updated.";
            ProductsMultiView.ActiveViewIndex = 0;
        }
    }
    protected void pInsert(object sender, SqlDataSourceStatusEventArgs e)
    {
        if (e.Exception == null)
        {
            mensagemErro.Text = String.Format("<br> Product '{0}' successfully added. <br><br>", e.Command.Parameters["@id_product"].Value);
            ProductsMultiView.ActiveViewIndex = 0;
            LinkProductsManage.CssClass = "selectedview";
            LinkProductsCreate.CssClass = "";

            string id_product_for_image = String.Format("{0}", e.Command.Parameters["@id_product"].Value);

            // verifica o tipo de ficheiro
            // neste exemplo, apenas vamos permitir upload ficheiros do tipo JPG
            if (imageUpload.PostedFile.ContentType == "image/jpg" || imageUpload.PostedFile.ContentType == "image/jpeg" || imageUpload.PostedFile.ContentType == "image/pjpeg")
            {
                // verifica o tamanho do ficheiro
                // neste exemplo, o tamanho do ficheiro tem que ser superior a ZERO e inferior a 512 Kb
                if (imageUpload.PostedFile.ContentLength > 0 && imageUpload.PostedFile.ContentLength < (512 * 1024))
                {
                    try
                    {
                        //imageUpload.PostedFile.SaveAs(Server.MapPath("~/files/products/" + imageUpload.PostedFile.FileName));
                        imageUpload.PostedFile.SaveAs(Server.MapPath("~/files/products/" + id_product_for_image + ".JPG"));
                        mensagemErro.Text += "Ficheiro guardado com sucesso no servidor!<br />";
                        mensagemErro.Text += "File name: " + imageUpload.PostedFile.FileName + "<br>" + imageUpload.PostedFile.ContentLength + " kb<br>" + "Content type: " + imageUpload.PostedFile.ContentType;
                        mensagemErro.CssClass = "ok";
                    }
                    catch (Exception ex)
                    {
                        mensagemErro.Text += "Ocorreu um erro ao tentar guardar no servidor";
                        mensagemErro.Text += "<br />" + ex.Message.ToString();
                        mensagemErro.CssClass = "error";
                    }

                }
                else
                {
                    mensagemErro.Text += "Ficheiro inválido: o tamanho não pode exceder os 512 kB";
                    mensagemErro.CssClass = "error";
                }
            }
            else
            {
                mensagemErro.Text += "Ficheiro inválido/Sem Ficheiro: escolha uma imagem JPG";
                mensagemErro.CssClass = "error";
            }
        }
        else
        {
            mensagemErro.Text = "Unable to add Product. Please try again.";
            e.ExceptionHandled = true;
        }
        mensagemErro.Text += "<br>";
    }

    protected void submitUploadBtn_Click(object sender, EventArgs e)
    {
        string id_product_for_image = Request.QueryString["id"];

        // verifica o tipo de ficheiro
        // neste exemplo, apenas vamos permitir upload ficheiros do tipo JPG
        if (FileUploadChangeImage.PostedFile.ContentType == "image/jpg" || FileUploadChangeImage.PostedFile.ContentType == "image/jpeg" || FileUploadChangeImage.PostedFile.ContentType == "image/pjpeg")
        {
            // verifica o tamanho do ficheiro
            // neste exemplo, o tamanho do ficheiro tem que ser superior a ZERO e inferior a 512 Kb
            if (FileUploadChangeImage.PostedFile.ContentLength > 0 && FileUploadChangeImage.PostedFile.ContentLength < (512 * 1024))
            {
                try
                {
                    //imageUpload.PostedFile.SaveAs(Server.MapPath("~/files/products/" + imageUpload.PostedFile.FileName));
                    FileUploadChangeImage.PostedFile.SaveAs(Server.MapPath("~/files/products/" + id_product_for_image + ".JPG"));
                    mensagemErro.Text += "Ficheiro guardado com sucesso no servidor!<br />";
                    mensagemErro.Text += "File name: " + FileUploadChangeImage.PostedFile.FileName + "<br>" + FileUploadChangeImage.PostedFile.ContentLength + " kb<br>" + "Content type: " + FileUploadChangeImage.PostedFile.ContentType;
                    mensagemErro.CssClass = "ok";
                    ProductsMultiView.SetActiveView(productsManage);
                    LinkProductsManage.CssClass = "selectedview";
                }
                catch (Exception ex)
                {
                    mensagemErro.Text += "Ocorreu um erro ao tentar guardar no servidor";
                    mensagemErro.Text += "<br />" + ex.Message.ToString();
                    mensagemErro.CssClass = "error";
                }

            }
            else
            {
                mensagemErro.Text += "Ficheiro inválido: o tamanho não pode exceder os 512 kB";
                mensagemErro.CssClass = "error";
            }
        }
        else
        {
            mensagemErro.Text += "Ficheiro inválido/Sem Ficheiro: escolha uma imagem JPG";
            mensagemErro.CssClass = "error";
        }
    }
}