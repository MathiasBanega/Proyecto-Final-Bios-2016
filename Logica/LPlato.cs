using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Persistencia;

namespace Logica
{
   public class LPlato
    {
       public static Plato BuscarPlato(int _id,long _rut)
       {
           Plato p = Pplato.BuscarPlato(_id,_rut);
           return p;
       }

       public static int Agregar(Plato p)
       {
          int id = Pplato.Agregar(p);
          return id;
       }

       public static void Modificar(Plato p)
       {
           Pplato.Modificar(p);
       }

       public static void Eliminar(Plato p)
       {
           Pplato.Eliminar(p);
       }
    }
}
