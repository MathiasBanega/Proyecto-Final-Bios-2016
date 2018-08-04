using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Casa
    {
        private long rut;
        private string nombre,especializacion;

        public long Rut
        {
            get { return rut; }
            set 
            {
                string cadena = value.ToString();

                if (cadena.Length == 12)
                {
                    for (int i = 0; i < cadena.Length; i++)
                    {
                        if (!char.IsNumber(Convert.ToChar(cadena.Substring(i, 1))))
                            throw new Exception("Error en RUT: solo puede contener numeros."); 
                    }

                    rut = value;
                }

                else
                    throw new Exception("Error en RUT: Debe tener un largo de 12 digitos.");
            }
        }

        public string Nombre
        {
            get { return nombre; }
            set 
            {
                if (value.Length > 0)
                    nombre = value;
                else
                    throw new Exception("Se requiere de un nombre para el local.");
            }
        }

        public string Especializacion//no hay controles porque las opciones se van a poner en un drop down list ya que son limitadas.
        {
            get { return especializacion; }
            set { especializacion = value; }           
        }

        //constructor
        public Casa(long _rut, string _nombre, string _esp)
        {
            Rut = _rut;
            Nombre = _nombre;
            Especializacion = _esp;
        }

        public override string ToString()
        {
            return Rut + "  " + Nombre + "  " + Especializacion;
        }
 
    }
}
