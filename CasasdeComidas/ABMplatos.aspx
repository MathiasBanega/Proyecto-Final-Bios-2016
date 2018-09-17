<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.master" AutoEventWireup="true" Inherits="ABMplatos" Codebehind="ABMplatos.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style7
    {
        width: 462px;
    }
    .style5
    {
            width: 531px;
        }
    .style8
    {
        height: 30px;
        width: 462px;
    }
    .style6
    {
        height: 30px;
        width: 531px;
    }
    .style4
    {
        height: 30px;
    }
    .style18
    {
        width: 462px;
        height: 21px;
    }
    .style19
    {
        width: 531px;
        height: 21px;
    }
    .style20
    {
        height: 21px;
    }
        .style24
        {
            width: 462px;
            height: 36px;
        }
        .style25
        {
            width: 531px;
            height: 36px;
        }
        .style26
        {
            height: 36px;
        }
        .style27
        {
            width: 462px;
            height: 23px;
        }
        .style28
        {
            width: 531px;
            height: 23px;
        }
        .style29
        {
            height: 23px;
        }
        .style30
        {
            width: 462px;
            height: 8px;
        }
        .style31
        {
            width: 531px;
            height: 8px;
        }
        .style32
        {
            height: 8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" 
                Font-Size="X-Large" Text="Ingrese el código del plato"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
        </td>
        <td class="style6">
            &nbsp;</td>
        <td class="style4">
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            <asp:Label ID="lblCod" runat="server">Codigo</asp:Label>
&nbsp;
            <asp:TextBox ID="txtCodigo" runat="server" Height="22px" Width="74px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="ddlNombreCasas" runat="server" style="margin-left: 0px" 
                Height="24px">
            </asp:DropDownList>
            &nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnBuscar" runat="server" Height="29px" Text="Buscar" 
                Width="116px" onclick="btnBuscar_Click" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td class="style5">
            &nbsp;&nbsp;
            <asp:Label ID="lblError" runat="server"></asp:Label>
        &nbsp;&nbsp;
            <asp:LinkButton ID="lnkNuevo" runat="server" onclick="lnkNuevo_Click" 
                Visible="False">Agregar Nuevo</asp:LinkButton>
            </td>
        <td>
            </td>
    </tr>
    <tr>
        <td class="style7">
        </td>
        <td class="style5">
        &nbsp;&nbsp;
            </td>
        <td>
        </td>
    </tr>
    <tr>
        <td class="style30">
        </td>
        <td class="style31">
&nbsp;<asp:GridView ID="GridView1" runat="server" Height="10px" Width="516px" 
                AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="Id" HeaderText="ID" />
                    <asp:BoundField DataField="Nombre" HeaderText="Nombre" />
                    <asp:BoundField DataField="Precio" HeaderText="Precio" />
                    <asp:ImageField DataImageUrlField="Imagen" HeaderText="Imagen">
                        <ControlStyle Height="100px" Width="100px" />
                        <ItemStyle HorizontalAlign="Center" />
                    </asp:ImageField>
                </Columns>
            </asp:GridView>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
        <td class="style32">
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" Visible="False" 
                Width="87px" onclick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Visible="False" 
                Width="87px" onclick="btnEliminar_Click" />
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td class="style24">
            </td>
        <td class="style25">
            <asp:Label ID="lblNom" runat="server" Visible="False">Nombre</asp:Label>
&nbsp;
            <asp:TextBox ID="txtNombre" runat="server" Height="22px" Visible="False" 
                Width="202px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;<asp:Button ID="btnAceptar" runat="server" Height="32px" 
                onclick="btnAceptar_Click" Text="Aceptar" Visible="False" Width="71px" />
            
            &nbsp;&nbsp;
            <asp:Button ID="btnCancelNuevo" runat="server" Height="32px" 
                onclick="btnCancelNuevo_Click" Text="Cancelar" Visible="False" Width="71px" />
            
            <br />
            &nbsp;&nbsp;
            <br />
            <asp:Label ID="lblPre" runat="server" Visible="False">Precio</asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp; <asp:TextBox ID="txtPrecio" runat="server" Height="22px" Visible="False" 
                Width="202px" ontextchanged="txtPrecio_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            &nbsp;<asp:Button ID="btnGuardar" runat="server" Height="32px" Text="Guardar" 
                Width="71px" onclick="btnGuardar_Click" Visible="False" />
            
            &nbsp;&nbsp;
            <asp:Button ID="btnCancelar" runat="server" Height="32px" 
                onclick="btnCancelar_Click" Text="Cancelar" Visible="False" Width="71px" />
            <br />
            <br />
            <asp:Label ID="lblImg" runat="server" Visible="False">Imagen</asp:Label>
&nbsp;
            <asp:FileUpload ID="fupImagen" runat="server" Visible="False" Width="361px" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td class="style26">
            <br />
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnVerImg" runat="server" onclick="btnVerImg_Click" 
                Text="Cargar Imagen" Visible="False" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Image ID="imgFoto" runat="server" Height="16px" Width="16px" 
                Visible="False" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style18">
        </td>
        <td class="style19">
        </td>
        <td class="style20">
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style27">
            </td>
        <td class="style28">
            </td>
        <td class="style29">
            </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

