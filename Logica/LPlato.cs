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
       public static Plato BuscarPlato(int _id,string nombC)
       {
           Plato p = Pplato.BuscarPlato(_id,nombC);
           return p;
       }

       public static int Agregar(Plato p)
       {
          int id = Pplato.Agregar(p);
          return id;
       }

    }
}
