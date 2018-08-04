using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Entidades
{
    public class Administrador:Usuario
    {
        private string cargo;

        public string Cargo
        {
            get { return cargo; }
            set 
            {
                if (value.Length > 0)
                    cargo = value;
            }
        }

        public Administrador(string _nombusu, string _nombcomp, string _cont, long _doc, string _carg)
            : base(_nombusu, _nombcomp, _cont, _doc)
        {
            Cargo = _carg;
        }

        public override string ToString()
        {
            return base.ToString() +"  "+ Cargo;
        }
    }
}
