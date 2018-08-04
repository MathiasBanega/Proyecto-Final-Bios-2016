using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
   public class Usuario
    {
       
       private string nombreusu, nombrecomp, contraseña;
       private long documento;

       public string NombreUsu
       {
           get { return nombreusu; }
           set 
           {
               if (value.Length > 0)
               {
                   for (int i = 0; i < value.Length; i++)
                   {
                       if (!char.IsLetter(Convert.ToChar(value.Substring(i, 1))))
                           if (!char.IsNumber(Convert.ToChar(value.Substring(i, 1))))
                           throw new Exception("El nombre de usuario solo puede contener caracteres alfanumericos.");
                   }

                   nombreusu = value;
               }
               else
                   throw new Exception("Se necesita nombre de usuario.");

           }
       }

       public string NombreComp
       {
           get { return nombrecomp; }
           set
           {
               if (value.Length > 0)
               {
                   for (int i = 0; i < value.Length; i++)
                   {
                       if (!char.IsLetter(Convert.ToChar(value.Substring(i, 1))))
                               throw new Exception("Su nombre no puede contener números, por favor verifique que los datos sean correctos.");
                   }

                   nombrecomp = value;
               }
               else
                   throw new Exception("Debe agregar su nombre.");
           }
       }

       public string Contraseña
       {
           get { return contraseña; }
           set
           {
               if (value.Length > 0)
                   contraseña = value;
               else
                   throw new Exception("Debe introducir una conraseña.");
           }
       }

       public long Documento
       {
           get { return documento; }
           set
           {
               if (value > 9999999 && value <= 99999999)
                   documento = value;
               else
                   throw new Exception("Error en cedula de identidad, por favor compruebe que los datos sean correctos.");
           }
       }

       
       public Usuario(string _nombusu, string _nombcomp, string _cont, long _doc)
       {
           NombreUsu = _nombusu;
           NombreComp = _nombcomp;
           Contraseña = _cont;
           Documento = _doc;
       }

       public override string ToString()
       {
           return NombreUsu +"  "+ NombreComp+"  "+ Documento;
       }
    }
}
