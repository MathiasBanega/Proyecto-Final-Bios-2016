using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
   public class Cliente:Usuario
    {
        private long tarjeta;
        private string direccion;

        public long Tarjeta
        {
            get { return tarjeta; }
            set
            {
                string cadena = Convert.ToString(value);
                if (cadena.Length == 16)
                {

                    tarjeta = value;
                }

                else
                    throw new Exception("La Tarjeta debe tener 16 digitos.");
            }
        }

        public string Direccion
        {
            get { return direccion; }
            set
            {
                if (value.Length > 0)//seguir agregarndo controles
                    direccion = value;
            }
        }

        public Cliente(string _nombusu, string _nombcomp, string _cont, long _doc, long _tar, string _dir)
            : base(_nombusu, _nombcomp, _cont, _doc)
        {
            Tarjeta = _tar;
            Direccion = _dir;
        }

        public override string ToString()
        {
            return base.ToString() +"  "+ Tarjeta +"  "+ direccion;
        }
    }
}
