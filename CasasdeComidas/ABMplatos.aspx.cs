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
        btnCancelNuevo.Visible = true;
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
        imgFoto.ImageUrl = "";
        txtNombre.Text = "";
        txtPrecio.Text = "";
        txtCodigo.Text = "";
        btnModificar.Visible = false;
        btnEliminar.Visible = false;
        btnCancelNuevo.Visible = false;
        GridView1.DataSource = null;
        GridView1.DataBind();
    }

    protected void ActivarBM()
    {
        txtCodigo.Visible = true;
        txtNombre.Visible = true;
        txtPrecio.Visible = true;
        fupImagen.Visible = true;
        btnGuardar.Visible = true;
        lblImg.Visible = true;
        lblNom.Visible = true;
        lblPre.Visible = true;
        txtCodigo.Enabled = false;
        btnBuscar.Enabled = false;
        ddlNombreCasas.Enabled = false;
        btnCancelar.Visible = true;
        lblError.Text = "";
        lnkNuevo.Visible = false;
        //btnAceptar.Visible = true;
        imgFoto.Visible = true;
        btnVerImg.Visible = true;
    }

    protected void DesGrid()
    {
        GridView1.Visible = false;
        btnModificar.Visible = false;
        btnEliminar.Visible = false;
    }
    protected void ActGrid()
    {
        List<Plato> l = new List<Plato>();
        Plato p = (Plato)Session["Plato"];
        l.Add(p);
        txtCodigo.Text = p.Id.ToString();
        GridView1.Visible = true;
        GridView1.DataSource = l;
        GridView1.DataBind();
        btnEliminar.Visible = true;
        btnModificar.Visible = true;
    }

    protected void txtPrecio_TextChanged(object sender, EventArgs e)
    {

    }
    
   

    protected void lnkNuevo_Click(object sender, EventArgs e)
    {
        ActivarAlta();        
    }

    protected void btnBuscar_Click(object sender, EventArgs e)
    {

        try
        {
            GridView1.Visible = true;

            int id = Convert.ToInt32(txtCodigo.Text);
            long rut = Convert.ToInt64(ddlNombreCasas.SelectedItem.Value);
            Plato p = LPlato.BuscarPlato(id, rut);
            List<Plato> lista = new List<Plato>();
            
            
            if (p == null)
            {
                Session["Plato"] = p;
                GridView1.DataBind();
                lblError.Visible = true;
                lnkNuevo.Visible = true;
                btnEliminar.Visible = false;
                btnModificar.Visible = false;
                lblError.Text = "No se encontro ningun plato con ese identificador.";
            }

            else
            {
                Session["Plato"] = p;
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
        ActGrid();
    }

    protected void btnVerImg_Click(object sender, EventArgs e)
    {
        try
        {
            lblError.Text = "";

            fupImagen.PostedFile.SaveAs(Server.MapPath("~/imagenes/") + fupImagen.FileName);
            Session["Imagen"] = "~/imagenes/" + fupImagen.FileName;
            imgFoto.ImageUrl = Session["Imagen"].ToString();

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
        try
        {
            int cod = Convert.ToInt32(txtCodigo.Text);
            string nom = txtNombre.Text;
            string img = imgFoto.ImageUrl;
            double pre = Convert.ToDouble(txtPrecio.Text);
            Plato p = (Plato)Session["Plato"];
            Casa c = p.Casa;
            p = new Plato(cod, nom, img, pre, c);
            LPlato.Modificar(p);
            //sube p a session y muestra en grid view, tambien lblerror dice que se modifico con exito.
            Session["Plato"] = p;          
            LimpiarFormulario();
            ActGrid();
            lblError.Text = "Se Modifico el plato con exito.";
            
        }
        catch(Exception ex)
        { lblError.Text = ex.Message; }
    }

    protected void btnAceptar_Click(object sender, EventArgs e)
    {
        try
        {
            
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
                
                int id = LPlato.Agregar(p);
                LimpiarFormulario();
                lblError.Text = "Se agregó el plato con exito, su identificador es: " + id;             
            }

            catch (Exception ex)
            { lblError.Text = ex.Message; }

        
        }

        catch
        { lblError.Text = "Error al ingresar los datos."; }
               
    }

    protected void btnModificar_Click(object sender, EventArgs e)
    {
        try
        {
            DesGrid();
            ActivarBM();
            Plato p = (Plato)Session["Plato"];
            txtNombre.Text = p.Nombre;
            txtPrecio.Text = p.Precio.ToString();
            imgFoto.ImageUrl = p.Imagen; 
            imgFoto.Width = fupImagen.Width;
            imgFoto.Height = fupImagen.Height;
        }
        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }

    protected void btnEliminar_Click(object sender, EventArgs e)
    {
        try
        {
            Plato p = (Plato)Session["Plato"];
            LPlato.Eliminar(p);
            LimpiarFormulario();

            lblError.Text = "Se elimino el plato y todas sus dependencias.";
            
        }

        catch (Exception ex)
        { lblError.Text = ex.Message; }
    }

    protected void btnCancelNuevo_Click(object sender, EventArgs e)
    {
        LimpiarFormulario();
    }

    
}