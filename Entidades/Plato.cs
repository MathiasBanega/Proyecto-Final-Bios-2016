using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
   public class Plato
    {
      private int id;
      private string nombre, imagen;
      private double precio;
      private Casa casa;

      public int Id
      {
          get { return id; }
          set { id = value; }
      }

      public string Nombre
      {
          get { return nombre; }
          set
          {
              if (value.Length > 0)
              { nombre = value; }
              else
                  throw new Exception("El plato no tiene nombre.");
          }
      }

      public string Imagen
      {
          get { return imagen; }
          set 
          {
              if (value.Length > 0)
                  imagen = value;
              else
                  throw new Exception("Se necesita una imagen para el plato.");
          }
      }

      public double Precio
      {
          get { return precio; }
          set 
          {
              if (value > 0)
              { precio = value; }
              else
                  throw new Exception("Error en precio del plato.");
          }
      }

      public Casa Casa
      {
          get { return casa; }

          set{
              if (casa != null)
                  casa = value;
              else
                  throw new Exception("Se necesita una casa para crear el plato.");
          }
      }

       //constructor
      public Plato(int _id, string _nom, string _img, double _precio,Casa _c)
      {
          Id = _id;
          Nombre = _nom;
          Imagen = _img;
          Precio = _precio;
          casa = _c;
      }



      public override string ToString()
      {
          return Id + "  " + Nombre + "  " + Imagen + "  " + Precio;
      }
    }
}
