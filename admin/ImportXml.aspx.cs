using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Xml;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class admin_ImportXml : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void nextstep1_Click(object sender, EventArgs e)
    {
        importMultiView.ActiveViewIndex = 1;
        string url_to_load = locationTextBox.Text;
        loadXmlProductImportList(url_to_load);
    }

    protected void loadXmlProductImportList(string url)
    {
        //Load Document
        XmlTextReader r = new XmlTextReader(url);

        while (r.Read())
        {
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "title")
            {
                xmlReportLabel.Text += r.ReadString() + "<br />";
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "description")
            {
                xmlReportLabel.Text += r.ReadString() + "<br />";
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "category")
            {
                xmlReportLabel.Text += r.ReadString() + "<br />";
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "stock")
            {
                xmlReportLabel.Text += r.ReadString() + "<br />";
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "price")
            {
                xmlReportLabel.Text += r.ReadString() + "<br />----------------------------------------<br />";
            }
        }
    }
    protected void nextstep2_Click(object sender, EventArgs e)
    {
        importMultiView.ActiveViewIndex = 2;
        string url_to_load = locationTextBox.Text;
        insertProduct(url_to_load);
    }
    protected void insertProduct(string url)
    {
        string[] product = new string[5];
        XmlTextReader r = new XmlTextReader(url);
        while (r.Read())
        {
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "title")
            {
                product[0] = r.ReadString();
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "description")
            {
                product[1] = r.ReadString();
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "category")
            {
                product[2] = r.ReadString();
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "stock")
            {
                product[3] = r.ReadString();
            }
            if (r.MoveToContent() == XmlNodeType.Element && r.Name == "price")
            {
                product[4] = r.ReadString();
                try
                {
                    ProductImport productA = new ProductImport(product[0], product[1], Convert.ToInt32(product[2]), Convert.ToInt32(product[3]), Convert.ToDouble(product[4]));
                    sqlInsert(productA);
                    xmlCompleteLabel.Text = "Import successfully.";
                }
                catch (Exception)
                {
                    xmlCompleteLabel.Text = "An error ocurred. Please check your database to make sure nothing funny happened.";
                }
            }
            
        }
    }
    protected void sqlInsert(ProductImport product)
    {
        using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["connectionloja"].ConnectionString))
        {
            string sql = "INSERT INTO products([title], [description], [posted], [published], [id_category], [stock_status], [price]) VALUES (@title, @description, @posted, @published, @id_category, @stock_status, @price)";
            using (SqlCommand cmd = new SqlCommand(sql, con))
            {
                con.Open();
                try
                {
                    bool status = false;
                    if (product.Stock > 0)
                    {
                        status = true;
                    }
                    else if (product.Stock == 0)
                    {
                        status = false;
                    }
                    DateTime date = DateTime.Now;
                    SqlCommand cmdIns = new SqlCommand(sql, con);
                    cmdIns.Parameters.Add("@title", product.Title);
                    cmdIns.Parameters.Add("@description", product.Description);
                    cmdIns.Parameters.Add("@posted", date);
                    cmdIns.Parameters.Add("@published", false);
                    cmdIns.Parameters.Add("@id_category", product.Category);
                    cmdIns.Parameters.Add("@stock_status", status);
                    cmdIns.Parameters.Add("@price", product.Price);
                    cmdIns.ExecuteNonQuery();
                    cmdIns.Dispose();
                    cmdIns = null;
                }
                catch (Exception ex)
                {
                    //throw new Exception(ex.ToString(), ex);
                }
                finally
                {
                    con.Close();
                }
            }
        }
    }
}