using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;

public partial class ABMCasaComidas : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
            DesactivarBotones();
    }

    //metodos que activan y desactivan cosas de la pagina segun los resultados obtenidos
    private void ActivarBM()
    {       
        btnEliminar.Visible = true;
        btnModificar.Visible = true;
    }

    private void DesactivarBotones()
    {
        ddlEspecializacion.Visible = false;
        txtNombre.Visible = false;
        lblNom.Visible = false;
        lblEsp.Visible = false;
        btnEliminar.Visible = false;
        btnModificar.Visible = false;
        //btnAgregar.Visible = false;
        lnkNuevo.Visible = false;
        GridView1.DataSource = null;
        GridView1.DataBind();
        lblError.Text = "";
        btnGuardar.Visible = false;
        btnAgregar.Visible = false;
        txtNombre.Text = "";
    }

    private void ActivarFormulario()
    {
        ddlEspecializacion.Visible = true;
        txtNombre.Visible = true;
        lblNom.Visible = true;
        lblEsp.Visible = true;
    }

    private void DesMod()
    {
        btnGuardar.Visible = false;
        txtRut.Enabled = true;
        btnBuscar.Enabled = true;
        btnEliminar.Enabled = true;
        btnModificar.Enabled = true;
    }

    private void ActMod()
    {
        btnGuardar.Visible = true;
        txtRut.Enabled = false;
        btnBuscar.Enabled = false;
        btnEliminar.Enabled = false;
        btnModificar.Enabled = false;
    }


    
    protected void btnBuscar_Click(object sender, EventArgs e)
    {
        try
        {
            DesactivarBotones();
            Casa c = null;
            c = LCasa.BuscarPorRut(Convert.ToInt64(txtRut.Text));

            if (c == null)
            {
                Session["Casa"] = c;
                lblError.Text = "No se encontro ninguna casa.";
                lnkNuevo.Visible = true;
            }

            else
            {
                Session["Casa"]= c;
                //habilitar los botones
                ActivarBM();
                List<Casa> l = new List<Casa>();
                l.Add(c);
                GridView1.DataSource = l;
                GridView1.DataBind();
            }
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            Casa c = (Casa)Session["Casa"];
            ActivarFormulario();
            ActMod();
            txtNombre.Text = c.Nombre;
            
            if (c.Especializacion == "Pizzeria")
                ddlEspecializacion.SelectedIndex = 0;
            else if (c.Especializacion == "Minutas")
                ddlEspecializacion.SelectedIndex = 1;
            else if (c.Especializacion == "Vegetariano")
                ddlEspecializacion.SelectedIndex = 2;
            else if (c.Especializacion == "Internacional")
                ddlEspecializacion.SelectedIndex = 3;
            if (c.Especializacion == "Parrillada")
                ddlEspecializacion.SelectedIndex = 4;

        }
        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {
        try
        {
            Casa c = new Casa(Convert.ToInt64(txtRut.Text),txtNombre.Text,ddlEspecializacion.SelectedItem.Text);
            LCasa.Modificar(c);
            lblError.Text = "Modificado Correctamente.";
            Session["Casa"] = c;
            ActivarBM();
            DesactivarBotones();
            List<Casa> l = new List<Casa>();
            l.Add(c);
            GridView1.DataSource = l;
            GridView1.DataBind();
            DesMod();
            ActivarBM();
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }

    protected void lnkNuevo_Click(object sender, EventArgs e)
    {
        DesactivarBotones();
        ActivarFormulario();
        btnAgregar.Visible = true;
    }

    protected void btnAgregar_Click(object sender, EventArgs e)
    {
       
        try 
        {
            Casa c = new Casa(Convert.ToInt64(txtRut.Text), txtNombre.Text, ddlEspecializacion.SelectedItem.Text);
            LCasa.Agregar(c);
            DesactivarBotones();
            lblError.Text = "Se agregó una nueva casa con exito.";
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; } 
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            LCasa.Eliminar(Convert.ToInt64(txtRut.Text));
            DesactivarBotones();
            lblError.Text = "Se elimino la casa correctamente";
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }
}