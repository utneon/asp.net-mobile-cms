using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for ProductImport
/// </summary>
public class ProductImport
{
    //Propriedades e Atributos
    public double Price { get; set; }
    public string Title { get; set; }
    public string Description { get; set; }
    public int Category { get; set; }
    public int Stock { get; set; }

    public ProductImport(string title, string description, int category, int stock, double price)
    {
        this.Title = title;
        this.Description = description;
        this.Category = category;
        this.Stock = stock;
        this.Price = price;
    }
}