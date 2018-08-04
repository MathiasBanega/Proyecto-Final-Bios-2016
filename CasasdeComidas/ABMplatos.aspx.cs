using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Entidades;
using Logica;

public partial class ABMplatos : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //carga nombre de las casas
       if(!IsPostBack)
        BuscarCasas();
    }

    protected void BuscarCasas()
    {   
        List<Casa> lista = LCasa.BuscarCasas();
        
        ddlNombreCasas.DataTextField = "Nombre";
        ddlNombreCasas.DataValueField = "Rut";
        ddlNombreCasas.DataSource = lista;
        ddlNombreCasas.DataBind();
        Session["ListaCasas"] = lista;              
    }

    protected void ActivarAlta()
    {
        txtCodigo.Visible = true;
        txtNombre.Visible = true;
        txtPrecio.Visible = true;
        fupImagen.Visible = true;
        //btnGuardar.Visible = true;
        lblImg.Visible = true;
        lblNom.Visible = true;
        lblPre.Visible = true;
        txtCodigo.Enabled = false;
        btnBuscar.Enabled = false;
        ddlNombreCasas.Enabled=false;
        btnCancelar.Visible = true;
        lblError.Text="";
        lnkNuevo.Visible = false;
        btnAceptar.Visible = true;
        imgFoto.Visible = true;
        btnVerImg.Visible = true;

    }

    protected void LimpiarFormulario()
    {
        txtCodigo.Visible = true;
        txtNombre.Visible = false;
        txtPrecio.Visible = false;
        fupImagen.Visible = false;
        btnGuardar.Visible = false;
        lblImg.Visible = false;
        lblNom.Visible = false;
        lblPre.Visible = false;
        txtCodigo.Enabled = true;
        btnBuscar.Enabled = true;
        ddlNombreCasas.Enabled = true;
        btnCancelar.Visible = false;
        lblError.Text = "";
        lnkNuevo.Visible = false;
        btnAceptar.Visible = false;
        imgFoto.Visible = false;
        btnVerImg.Visible = false;
    }

    protected void txtPrecio_TextChanged(object sender, EventArgs e)
    {

    }

   

    protected void lnkNuevo_Click(object sender, EventArgs e)
    {
        ActivarAlta();
        //aca ya se crea la casa segun el nombre seleccionado para usar luego al crear el plato
        
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        try
        {
            Plato p = LPlato.BuscarPlato(Convert.ToInt32(txtCodigo.Text),ddlNombreCasas.SelectedItem.Text);
            List<Plato> lista = new List<Plato>();
            
            
            if (p == null)
            {
                GridView1.DataBind();
                lblError.Visible = true;
                lnkNuevo.Visible = true;
                btnEliminar.Visible = false;
                btnModificar.Visible = false;//ver si tengo que hacer un metodo para esto, queda feo asi.
                lblError.Text = "No se encontro ningun plato con ese identificador.";
            }

            else
            {
                lista.Add(p);
                lblError.Text = "";
                lnkNuevo.Visible = false;
                GridView1.DataSource = lista;
                GridView1.DataBind();
                btnModificar.Visible = true;
                btnEliminar.Visible = true;
            }
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }

    protected void btnCancelar_Click(object sender, EventArgs e)
    {
        LimpiarFormulario();
    }

    protected void btnVerImg_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";

            fupImagen.PostedFile.SaveAs(Server.MapPath("~/imagenes/") + fupImagen.FileName);
            Session["Imagen"] = "~/imagenes/" + fupImagen.FileName;
            imgFoto.ImageUrl = Session["Imagen"].ToString();

            //imgfoto.imageurl = "~/imagenes/" + fupimagen.filename;

            imgFoto.Width = fupImagen.Width;
            imgFoto.Height = fupImagen.Height;
        }
        catch
        {
            lblError.Text = "No se pudo cargar la imagen.";
            return;
        }

    }

    protected void btnGuardar_Click(object sender, EventArgs e)
    {

    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        try
        {
            //en este try se comprueba que todos los datos esten bien
            double precio = Convert.ToDouble(txtPrecio.Text);
            string nombre = txtNombre.Text;
            string img = Session["Imagen"].ToString();
            string casa = ddlNombreCasas.SelectedItem.Text;
            long rut = Convert.ToInt64(ddlNombreCasas.SelectedItem.Value);
            string esp = "";
            //busco la especializacion de la casa en la lista de casas que subi a la session mediante el RUT
            List<Casa> lista = (List<Casa>)Session["ListaCasas"];
            for (int i = 0; i < lista.Count; i++)
            {
                if (lista[i].Rut == rut)
                    esp = lista[i].Especializacion;
            }

            Plato p;
            Casa c;
            //el id de la casa es 0 porque se le pone el id en la BD
            c = new Casa(rut, casa, esp);
            p = new Plato(0, nombre, img, precio, c);
            Session["Plato"] = p;
           
            try
            {
                //Plato p = (Plato)Session["Plato"];
                int id = LPlato.Agregar(p);
                LimpiarFormulario();
                lblError.Text = "Se agregó el plato con exito, su identificador es: " + id;
                //al agregar el plato hay que hacer que loa imagen se limpie porque queda la del plato anterior.
            }

            catch (Exception ex)
            { lblError.Text = ex.Message; }

        
        }

        catch
        { lblError.Text = "Error al ingresar los datos."; }//porbar ex.message a ver si me saltan errores mas especificos.
               
    }

    
}