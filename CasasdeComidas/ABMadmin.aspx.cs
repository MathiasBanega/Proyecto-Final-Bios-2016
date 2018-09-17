using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;

public partial class ABMadmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
     
    }

   
    
    protected void ActBotBajaMod()
    {
        btnEliminar.Visible = true;
        btnModificar.Visible = true;
        GridView1.Visible = true;
    }

    protected void DesBotBajaMod()
    {
        btnEliminar.Visible = false;
        btnModificar.Visible = false;
        GridView1.Visible = false;
    }

    protected void ActBotAltAdm()
    {
        btnAgregar.Visible = true;
    }

    protected void ActAlta()
    {
        ddlCargo.Visible = true;
        txtContraseña.Visible = true;
        txtDocumento.Visible = true;
        txtNombreComp.Visible = true;
        txtNombreUsu.Visible = true;
        btnGuardar.Visible = true;
        lblDoc.Text = "Documento";
        lblPas.Text = "Contraseña";
        lblNom.Text = "Nombre";
        lblUsu.Text = "Usuario";
        lblCar.Text = "Cargo";
    }

    protected void DesAlta()
    {
        ddlCargo.Visible = false;
        txtContraseña.Visible = false;
        txtNombreComp.Visible = false;
        txtNombreUsu.Visible = false;
        btnGuardar.Visible = false;
        btnAgregar.Visible = false;
        lblDoc.Text = "";
        lblPas.Text = "";
        lblNom.Text = "";
        lblUsu.Text = "";
        lblCar.Text = "";
    }




    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            DesAlta();
            long doc = Convert.ToInt64(txtDocumento.Text);
            Administrador a = LAdmin.Buscar(doc);
            List<Administrador> l = new List<Administrador>();

            if (a == null)
            {
                Session["Admin"] = a;
                GridView1.DataBind();
                //muestro los botones necesarios para agregar nuevo
                DesBotBajaMod();
                ActBotAltAdm();
                lblError.Text = "No existe un administrador con ese documento";
            }

            else
            {
                DesAlta();
                lblError.Text = "";
                Session["Admin"] = a;
                l.Add(a);
                GridView1.DataSource = l;
                GridView1.DataBind();
                //hago visibles los botones para modificar y eliminar
                ActBotBajaMod();
            }


        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
   
    protected void btnModificar_Click(object sender, EventArgs e)
    {
       
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
        lblError.Text = "";
        ActAlta();
    }





    protected void txtNombreComp_TextChanged(object sender, EventArgs e)
    {

    }

    protected void txtNombreUsu_TextChanged(object sender, EventArgs e)
    {

    }
    
    protected void txtDocumento_TextChanged(object sender, EventArgs e)
    {

    }
}