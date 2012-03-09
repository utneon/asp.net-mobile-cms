using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_Content : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        LinkContentManage.CssClass = "selectedview";
        LinkContentCreate.Text = "Criar Conteúdo";
        string view = Request.QueryString["view"];
        switch (view)
        {
            case "manage":
                ContentMultiview.ActiveViewIndex = 0;
                LinkContentManage.CssClass = "selectedview";
                break;
            case "create":
                ContentMultiview.ActiveViewIndex = 1;
                LinkContentManage.CssClass = "";
                LinkContentCreate.CssClass = "selectedview";
                break;
            case "preview":
                ContentMultiview.ActiveViewIndex = 2;
                LinkContentManage.CssClass = "";
                LinkContentCreate.CssClass = "selectedview";
                LinkContentCreate.Text = "Pré Visualização de Conteúdo";
                break;
            case "UploadImages":
                LinkContentManage.CssClass = "";
                LinkContentCreate.CssClass = "";
                LinkContentUploadImages.CssClass = "selectedview";
                ContentMultiview.ActiveViewIndex = 3;
                break;
        }
        //Verificação para o formview create/edit mode
        string mode = Request.QueryString["mode"];
        switch (mode)
        {
            case "edit":
                LinkContentCreate.Text = "Editar Conteúdo";
                FormView1.ChangeMode(FormViewMode.Edit);
                break;
        }

    }

    /// <summary>
    /// Método para command events
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void commandContent(object sender, FormViewCommandEventArgs e)
    {
        if (e.CommandName == "Cancel")
        {
            Response.Redirect("~/admin/Content.aspx?view=manage");
        }
    }


    /// <summary>
    /// Método executad após ter sido executado a submissão e processamento de insert.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void insertedContent(object sender, FormViewInsertedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "Conteúdo criado com sucesso";
            ContentMultiview.ActiveViewIndex = 0;
            LinkContentManage.CssClass = "selectedview";
            LinkContentCreate.CssClass = "";
        }
        else
        {
            mensagemErro.Text = "Não foi possível inserir o conteúdo na base de dados. Por favor tente novamente.";
            ContentMultiview.ActiveViewIndex = 0;
            LinkContentCreate.CssClass = "";
        }
    }

    /// <summary>
    /// Método executad após ter sido executado a submissão e processamento de update.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void updatedContent(object sender, FormViewUpdatedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "As alterações foram guardadas.";
            ContentMultiview.ActiveViewIndex = 0;
            LinkContentManage.CssClass = "selectedview";
            LinkContentCreate.CssClass = "";
            //Response.Redirect("~/admin/Content.aspx");
        }
        else
        {
            mensagemErro.Text = "Não foi possível efectuar as alterações pretendidas. Por favor tente novamente.";
            ContentMultiview.ActiveViewIndex = 0;
            LinkContentCreate.CssClass = "";
        }
    }

    /// <summary>
    /// Método para formview do upload de imagens.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void insertedImageUpload(object sender, FormViewInsertedEventArgs e)
    {
        if (e.AffectedRows == 1)
        {
            mensagemErro.Text = "Imagem adicionada ao conteúdo com sucesso. Pode adicionar mais imagens.";
        }
        else
        {
            mensagemErro.Text = "Não foi possível inserir o conteúdo na base de dados. Por favor tente novamente.";
        }
    }

    /// <summary>
    /// Método que é executado com a formview é submetida. Antes de ser inserida na base de dados são efectuadas várias verificações e alterados valores e parametros conforme necessário.
    /// Usar o e.Cancel = true se for necessário cancelar o insert.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void FormView1_OnInserting(object sender, FormViewInsertEventArgs e)
    {
        //Primeira verificação: Verificar existência de ficheiro e fazer upload do thumbnail
        FileUpload fileUpload1 = (FileUpload)FormView1.FindControl("FileUploadThumbnail");
        if (fileUpload1.HasFile)
        {
            if (fileUpload1.PostedFile.ContentType == "image/jpg" || fileUpload1.PostedFile.ContentType == "image/jpeg" || fileUpload1.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//thumbnails//" + fileUpload1.FileName));
                string ficheiro = fileUpload1.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//thumbnails//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                //A seguinte linha actualiza o parametro que é passado no comando SQL do Datasource escolhido. É este valor que é guardado na base de dados.
                e.Values["thumbnail_image"] = ficheiro;
                fileUpload1.SaveAs(Server.MapPath("~//files//content//thumbnails//" + ficheiro));
            }
            else
            {
            }
            /*
             * Código para cancelar o insert no caso de falta de ficheiro :)
            else
            {
                e.Cancel = true;

            }
            */
        }
        //Fim de primeira verificação

        //Segunda verificação: Verificar existência de ficheiro e fazer upload da imagem principal do conteúdo
        FileUpload fileUpload2 = (FileUpload)FormView1.FindControl("FileUploadContentImage");
        if (fileUpload2.HasFile)
        {
            if (fileUpload2.PostedFile.ContentType == "image/jpg" || fileUpload2.PostedFile.ContentType == "image/jpeg" || fileUpload2.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//images//" + fileUpload2.FileName));
                string ficheiro = fileUpload2.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//images//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                //A seguinte linha actualiza o parametro que é passado no comando SQL do Datasource escolhido. É este valor que é guardado na base de dados.
                e.Values["content_image"] = ficheiro;
                fileUpload2.SaveAs(Server.MapPath("~//files//content//images//" + ficheiro));
            }
            else
            {
            }
            /*
             * Código para cancelar o insert no caso de falta de ficheiro :)
            else
            {
                e.Cancel = true;

            }
            */
        }
        //Fim de segunda verificação

        //Terceira verificação: Verificar existência de ficheiro e fazer upload da imagem de thumbnail/preview no interface mobile
        FileUpload fileUpload3 = (FileUpload)FormView1.FindControl("FileUploadMobileThumbnail");
        if (fileUpload3.HasFile)
        {
            if (fileUpload3.PostedFile.ContentType == "image/jpg" || fileUpload3.PostedFile.ContentType == "image/jpeg" || fileUpload3.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//mobile_thumbnails//" + fileUpload3.FileName));
                string ficheiro = fileUpload3.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//mobile_thumbnails//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                e.Values["mobile_thumbnail"] = ficheiro;
                fileUpload3.SaveAs(Server.MapPath("~//files//content//mobile_thumbnails//" + ficheiro));
            }
            else
            {
            }
        }
        //Fim de terceira verificação

        //Quarta verificação: Verificar existência de ficheiro e fazer upload da imagem principal de conteúdo no interface mobile
        FileUpload fileUpload4 = (FileUpload)FormView1.FindControl("FileUploadMobileImage");
        if (fileUpload4.HasFile)
        {
            if (fileUpload4.PostedFile.ContentType == "image/jpg" || fileUpload4.PostedFile.ContentType == "image/jpeg" || fileUpload4.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//mobile_images//" + fileUpload4.FileName));
                string ficheiro = fileUpload4.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//mobile_images//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                e.Values["mobile_image"] = ficheiro;
                fileUpload4.SaveAs(Server.MapPath("~//files//content//mobile_images//" + ficheiro));
            }
            else
            {
            }
        }
        //Fim de quarta verificação
    }

    /// <summary>
    /// Método que é executado com a formview é submetida para update.
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void FormView1_OnUpdating(object sender, FormViewUpdateEventArgs e)
    {
        //Primeira verificação: Verificar existência de ficheiro e fazer upload do thumbnail
        FileUpload fileUpload1 = (FileUpload)FormView1.FindControl("FileUploadThumbnail");
        if (fileUpload1.HasFile)
        {
            if (fileUpload1.PostedFile.ContentType == "image/jpg" || fileUpload1.PostedFile.ContentType == "image/jpeg" || fileUpload1.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//thumbnails//" + fileUpload1.FileName));
                string ficheiro = fileUpload1.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//thumbnails//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                //A seguinte linha actualiza o parametro que é passado no comando SQL do Datasource escolhido. É este valor que é guardado na base de dados.
                e.NewValues["thumbnail_image"] = ficheiro;
                fileUpload1.SaveAs(Server.MapPath("~//files//content//thumbnails//" + ficheiro));
            }
            else
            {
            }
            /*
             * Código para cancelar o insert no caso de falta de ficheiro :)
            else
            {
                e.Cancel = true;

            }
            */
        }
        //Fim de primeira verificação

        //Segunda verificação: Verificar existência de ficheiro e fazer upload da imagem principal do conteúdo
        FileUpload fileUpload2 = (FileUpload)FormView1.FindControl("FileUploadContentImage");
        if (fileUpload2.HasFile)
        {
            if (fileUpload2.PostedFile.ContentType == "image/jpg" || fileUpload2.PostedFile.ContentType == "image/jpeg" || fileUpload2.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//images//" + fileUpload2.FileName));
                string ficheiro = fileUpload2.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//images//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                //A seguinte linha actualiza o parametro que é passado no comando SQL do Datasource escolhido. É este valor que é guardado na base de dados.
                e.NewValues["content_image"] = ficheiro;
                fileUpload2.SaveAs(Server.MapPath("~//files//content//images//" + ficheiro));
            }
            else
            {
            }
            /*
             * Código para cancelar o insert no caso de falta de ficheiro :)
            else
            {
                e.Cancel = true;

            }
            */
        }
        //Fim de segunda verificação

        //Terceira verificação: Verificar existência de ficheiro e fazer upload da imagem de thumbnail/preview no interface mobile
        FileUpload fileUpload3 = (FileUpload)FormView1.FindControl("FileUploadMobileThumbnail");
        if (fileUpload3.HasFile)
        {
            if (fileUpload3.PostedFile.ContentType == "image/jpg" || fileUpload3.PostedFile.ContentType == "image/jpeg" || fileUpload3.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//mobile_thumbnails//" + fileUpload3.FileName));
                string ficheiro = fileUpload3.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//mobile_thumbnails//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                e.NewValues["mobile_thumbnail"] = ficheiro;
                fileUpload3.SaveAs(Server.MapPath("~//files//content//mobile_thumbnails//" + ficheiro));
            }
            else
            {
            }
        }
        //Fim de terceira verificação

        //Quarta verificação: Verificar existência de ficheiro e fazer upload da imagem principal de conteúdo no interface mobile
        FileUpload fileUpload4 = (FileUpload)FormView1.FindControl("FileUploadMobileImage");
        if (fileUpload4.HasFile)
        {
            if (fileUpload4.PostedFile.ContentType == "image/jpg" || fileUpload4.PostedFile.ContentType == "image/jpeg" || fileUpload4.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//mobile_images//" + fileUpload4.FileName));
                string ficheiro = fileUpload4.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//mobile_images//" + ficheiro));
                    } while (File.Exists(path) == true);
                }
                e.NewValues["mobile_image"] = ficheiro;
                fileUpload4.SaveAs(Server.MapPath("~//files//content//mobile_images//" + ficheiro));
            }
            else
            {
            }
        }
        //Fim de quarta verificação
    }
    protected void FormViewImageUpload_OnInserting(object sender, FormViewInsertEventArgs e)
    {
        //Primeira verificação: Verificar existência de ficheiro e fazer upload do thumbnail
        FileUpload fileUpload1 = (FileUpload)FormViewImageUpload.FindControl("FileUpload1");
        if (fileUpload1.HasFile)
        {
            if (fileUpload1.PostedFile.ContentType == "image/jpg" || fileUpload1.PostedFile.ContentType == "image/jpeg" || fileUpload1.PostedFile.ContentType == "image/pjpeg")
            {
                string path = (Server.MapPath("~//files//content//images//" + fileUpload1.FileName));
                string ficheiro = fileUpload1.FileName;
                if (File.Exists(path))
                {
                    int contador = 0;
                    do
                    {
                        contador++;
                        ficheiro = Convert.ToString(contador) + ficheiro;
                        path = (Server.MapPath("~//files//content//images//" + ficheiro));
                    } while (File.Exists(path) == true);
                }

                e.Values["filename"] = ficheiro;
                e.Values["type"] = fileUpload1.PostedFile.ContentType;
                fileUpload1.SaveAs(Server.MapPath("~//files//content//images//" + ficheiro));
                //Get image data.
                System.Drawing.Image image = System.Drawing.Image.FromFile(path);
                string height = image.Height.ToString();
                string width = image.Width.ToString();
                //string size = image.Size.ToString();
                image.Dispose();

                e.Values["width"] = width;
                e.Values["height"] = height;
                e.Values["size"] = fileUpload1.PostedFile.ContentLength.ToString();
            }
            else
            {
            }
            /*
             * Código para cancelar o insert no caso de falta de ficheiro :)
            else
            {
                e.Cancel = true;

            }
            */
        }
        //Fim de primeira verificação
    }

}