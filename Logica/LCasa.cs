using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using Persistencia;

namespace Logica
{
  public class LCasa
    {
      public static Casa BuscarPorRut(long _Rut)
      {
          Casa c = null;
          c = PCasa.BuscarPorRut(_Rut);
          return c;
      }

      public static void Modificar(Casa c)
      {
          PCasa.Modificar(c);
      }

      public static void Agregar(Casa c)
      {
          PCasa.Agregar(c);
      }

      public static void Eliminar(long _Rut)
      {
          PCasa.Eliminar(_Rut);
      }

      public static List<Casa> BuscarCasas()
      {
          List<Casa> lista = PCasa.BuscarCasas();
          return lista;
      }
    }
}
