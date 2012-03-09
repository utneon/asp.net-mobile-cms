using System;
using System.IO;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class admin_ImageUpload : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

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