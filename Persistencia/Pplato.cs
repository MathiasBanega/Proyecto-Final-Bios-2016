using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Entidades;
using System.Data.SqlClient;
using System.Data;

namespace Persistencia
{
   public class Pplato
    {
       public static Plato BuscarPlato(int _id,string nombC)//como solo muestro uno ahora no es lista, es solamente plato.
       {
          // List<Plato> lista= new List<Plato>();
           int id;
           string nombPlato, imagen;
           double precio;
           Plato p=null;

           Casa c=null;//tengo que pedir los datos de la casa para poder crearla
           long rut;
           string nombCasa, espec;

           SqlDataReader lector;
           SqlConnection con = new SqlConnection(Conexion.Con);
           SqlCommand com = new SqlCommand("buscarplato ",con);
           com.Parameters.AddWithValue("@idplato", _id);
           com.Parameters.AddWithValue("@nombcasa", nombC);
           com.CommandType = CommandType.StoredProcedure;

           try
           {
               con.Open();
               lector = com.ExecuteReader();

               if (lector.Read())//era while porque mostraba todos los que tengan ese id pero ahora solo muestro 1 
               {
                   id = (int)lector["IDplato"];
                   nombPlato = (string)lector["Nomb_Plato"];
                   imagen = (string)lector["Imagen"];
                   precio = (double)lector["Precio"];
                   rut = (long)lector["RUT"];
                   nombCasa = (string)lector["Nomb_Casa"];
                   espec = (string)lector["Especializacion"];
                   c = new Casa(rut, nombCasa, espec);
                   p = new Plato(id, nombPlato, imagen, precio,c);
                 //  lista.Add(p);
               }
           }

           catch (Exception ex)
           { throw ex; }

           finally
           { con.Close(); }
           
           return p;
       }

       public static int Agregar(Plato p)
       {
           int id;
          
           SqlConnection con = new SqlConnection(Conexion.Con);
           SqlCommand cmd = new SqlCommand("AgregarPlato ", con);
           cmd.CommandType = CommandType.StoredProcedure;
           cmd.Parameters.AddWithValue("@nomb",p.Nombre);
           cmd.Parameters.AddWithValue("@precio", p.Precio);
           cmd.Parameters.AddWithValue("@img", p.Imagen);
           cmd.Parameters.AddWithValue("@rut", p.Casa.Rut);
           SqlParameter salida = new SqlParameter("@id", SqlDbType.Int);
           salida.Direction = ParameterDirection.Output;//no se crea la variable, solo se devuelve
           cmd.Parameters.Add(salida);
           SqlParameter ret = new SqlParameter("@retorno",SqlDbType.Int);
           ret.Direction = ParameterDirection.ReturnValue;
           cmd.Parameters.Add(ret);

           try
           {
               con.Open();
               cmd.ExecuteNonQuery();

               if ((int)ret.Value == -1)
                   throw new Exception("Error al agregar el plato");
           }

           catch(Exception ex)
           { throw ex; }

           finally
           { con.Close(); }

           id = Convert.ToInt32(salida.Value);
           return id;
       }
    }
    
   
}
