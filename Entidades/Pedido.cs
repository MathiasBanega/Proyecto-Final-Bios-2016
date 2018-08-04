using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
   public class Pedido
    {
       private DateTime fecha;
       private int numero;//0
       private int cantidad;
       private bool entregado;

       private Usuario usuario;
       private Plato plato;

       
       
       public DateTime Fecha
       {
           get { return fecha; }
           set 
           {
               if (value.Date <= DateTime.Now)//este control es al pedo porque la fecha se agrega automaticamente.
               {
                   fecha = value;
               }

               else
                   throw new Exception("Error de fecha*.");
           }
       }

       public int Numero
       {
           get { return numero; }
           set { numero = value; }
       }

       public int Cantidad
       {
           get { return cantidad; }
           set
           {
               if (value > 0)
                   cantidad = value;

               else
                   throw new Exception("Error en cantidad.");
           }
       }

       public bool Entregado
       {
           get { return entregado; }
           set { entregado = value; }
       }

       public Usuario Usuario
       {
           get { return usuario; }
           set 
           {
               if (value != null)
                   usuario = value;
               else
                   throw new Exception("Se necesita un usuario.");
           }
       }

       public Plato Plato
       {
           get { return plato; }
           set
           {
               if (value != null)
                   plato = value;
               else
                   throw new Exception("Se necesita un plato.");
           }
       }
    }
}
