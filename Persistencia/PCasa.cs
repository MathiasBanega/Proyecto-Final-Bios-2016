using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Entidades;

namespace Persistencia
{
   public class PCasa
    {
       public static Casa BuscarPorRut(long _Rut)
       {
           //defino variables
           Casa c = null;
           string nombre,especializacion;
           long rut;

           SqlConnection con = new SqlConnection(Conexion.Con);//se crea la conexion a la base de datos
           SqlCommand com = new SqlCommand("BuscarRut ",con);//se le pasa el nombre del pa y la conexion
           com.CommandType = CommandType.StoredProcedure;
           com.Parameters.AddWithValue("@Rut",_Rut);
           SqlDataReader lector;

           try
           {
               con.Open();
               lector = com.ExecuteReader();

               if (lector.Read())
               {
                   nombre = (string)lector["Nombre"];
                   especializacion = (string)lector["Especializacion"];
                   rut = (long)lector["RUT"];

                   c = new Casa(rut, nombre, especializacion);
               }

           }
           
           catch (Exception ex)
           { throw ex; }
           
           finally
           { con.Close(); }

           return c;
       }

       public static void Modificar(Casa c)//no devuelve nada
       {
           SqlConnection con = new SqlConnection(Conexion.Con);
           SqlCommand com = new SqlCommand("ModificarCasa ", con);
           com.CommandType = CommandType.StoredProcedure;
           com.Parameters.AddWithValue("@Rut", c.Rut);
           com.Parameters.AddWithValue("@Nombre", c.Nombre);
           com.Parameters.AddWithValue("@Esp", c.Especializacion);

           SqlParameter ret = new SqlParameter("@retorno", SqlDbType.Int);
           ret.Direction = ParameterDirection.ReturnValue;
           com.Parameters.Add(ret);

           try
           {
               con.Open();
               com.ExecuteNonQuery();

               if ((int)ret.Value == -1)
                   throw new Exception("No se encuentra ninguna casa de comida con ese numero de RUT.");

               else if ((int)ret.Value == -2)
                   throw new Exception("Error al modificar la casa de comidas.");
           }

           catch (Exception ex)
           { throw ex; }

           finally
           { con.Close(); }
       }

       public static void Agregar(Casa c)
       {
           SqlConnection con = new SqlConnection(Conexion.Con);
           SqlCommand com = new SqlCommand("AgregarCasa ", con);
           com.CommandType = CommandType.StoredProcedure;
           com.Parameters.AddWithValue("@Rut", c.Rut);
           com.Parameters.AddWithValue("@Nombre", c.Nombre);
           com.Parameters.AddWithValue("@Esp", c.Especializacion);
           SqlParameter ret = new SqlParameter("@Retorno", SqlDbType.Int);
           ret.Direction = ParameterDirection.ReturnValue;
           com.Parameters.Add(ret);

           try
           {
               con.Open();
               com.ExecuteNonQuery();

               if ((int)ret.Value == -1)
                   throw new Exception("Ya existe una casa con ese Rut.");

               else if ((int)ret.Value == -2)
                   throw new Exception("Ya existe una casa con ese nombre.");

               else if ((int)ret.Value == -3)
                   throw new Exception("Error al crear casa.");
           }

           catch (Exception ex)
           {
               throw ex;
           }

           finally
           { con.Close(); }
           
       }

       public static void Eliminar(long _Rut)
       {
           SqlConnection con = new SqlConnection(Conexion.Con);
           SqlCommand com = new SqlCommand("EliminarCasa", con);
           com.CommandType = CommandType.StoredProcedure;
           com.Parameters.AddWithValue("@rut", _Rut);
           SqlParameter retorno = new SqlParameter("@retorno", SqlDbType.Int);
           retorno.Direction = ParameterDirection.ReturnValue;
           com.Parameters.Add(retorno);

           try
           {
               con.Open();
               com.ExecuteNonQuery();

               if ((int)retorno.Value == -1)
                   throw new Exception("No existe una casa de comidas con ese numero de rut"); // es al pedo porque se supone que ya la encontro cuando se busco hoy
               else if ((int)retorno.Value == -2)
                   throw new Exception("Error al eliminar la casa de comidas");
           }

           catch (Exception ex)
           { throw ex; }

           finally
           { con.Close(); }
       }

       public static List<Casa> BuscarCasas()
       {
           List<Casa> lista = new List<Casa>();
           string nombre;
           string esp;
           long rut;
           Casa c;

           SqlConnection con = new SqlConnection(Conexion.Con);
           SqlCommand com = new SqlCommand("BuscarCasas ",con);
           com.CommandType = CommandType.StoredProcedure;
           SqlDataReader lector;

           try
           {
               con.Open();
               lector = com.ExecuteReader();
               while (lector.Read())
               {
                   nombre = (string)lector["Nomb_Casa"];
                   esp = (string)lector["Especializacion"];
                   rut = (long)lector["RUT"];
                   c = new Casa(rut, nombre, esp);
                   

                   lista.Add(c);
               }
           }

           catch (Exception ex)
           { throw ex; }

           finally
           { con.Close(); }
       
           return lista;
       }
    }
}
