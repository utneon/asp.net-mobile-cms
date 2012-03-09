using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Product
/// </summary>
public class Product
{
    //Propriedades e Atributos
    public int Id { get; set; }
    public double Price { get; set; }
    public string Title { get; set; }

    public Product(int id, string title, double price)
    {
        this.Id = id;
        this.Title = title;
        this.Price = price;
    }

}