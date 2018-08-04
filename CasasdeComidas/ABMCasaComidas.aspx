<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.master" AutoEventWireup="True" Inherits="ABMCasaComidas" Codebehind="ABMCasaComidas.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">

    .style7
    {
        width: 462px;
    }
    .style8
    {
        height: 30px;
        width: 462px;
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
    .style20
    {
        height: 21px;
    }
        .style21
        {
            width: 462px;
            height: 23px;
        }
        .style23
        {
            height: 23px;
        }
        .style24
        {
            width: 525px;
        }
        .style25
        {
            height: 30px;
            width: 525px;
        }
        .style26
        {
            width: 525px;
            height: 23px;
        }
        .style29
        {
            width: 525px;
            height: 21px;
        }
        .style30
        {
            height: 25px;
            width: 462px;
        }
        .style31
        {
            height: 25px;
            width: 525px;
        }
        .style32
        {
            height: 25px;
        }
        .style33
        {
            width: 462px;
            height: 24px;
        }
        .style34
        {
            width: 525px;
            height: 24px;
        }
        .style35
        {
            height: 24px;
        }
        .style36
        {
            width: 462px;
            height: 10px;
        }
        .style37
        {
            width: 525px;
            height: 10px;
        }
        .style38
        {
            height: 10px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
        </td>
        <td class="style25">
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" 
                Font-Size="X-Large" Text="Ingrese el numero de RUT"></asp:Label>
        </td>
        <td class="style4">
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td class="style24">
            <asp:Label ID="lblRut" runat="server">RUT</asp:Label>
&nbsp;
            <asp:TextBox ID="txtRut" runat="server" Height="22px" Width="202px"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnBuscar" runat="server" Height="30px" Text="Buscar" 
                Width="120px" onclick="btnBuscar_Click" />
            &nbsp;&nbsp;&nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;<asp:Label ID="lblError" runat="server"></asp:Label>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton ID="lnkNuevo" runat="server" onclick="lnkNuevo_Click">Agregar Nuevo</asp:LinkButton>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style21">
        </td>
        <td class="style26">
            <asp:GridView ID="GridView1" runat="server" Height="16px" Width="496px">
            </asp:GridView>
        </td>
        <td class="style23">
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" Visible="False" 
                Width="120px" Height="30px" onclick="btnModificar_Click" />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Visible="False" 
                Width="120px" Height="30px" onclick="btnEliminar_Click" />
        </td>
    </tr>
    <tr>
        <td class="style30">
        </td>
        <td class="style31">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblNom" runat="server">Nombre</asp:Label>
&nbsp;
            <asp:TextBox ID="txtNombre" runat="server" Height="22px" 
                Width="202px"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAgregar" runat="server" Height="32px" 
                onclick="btnAgregar_Click" Text="Agregar" Width="71px" />
            <br />
            <br />&nbsp;<asp:Label ID="lblEsp" runat="server">Especialidad</asp:Label>
            &nbsp;&nbsp;<asp:DropDownList ID="ddlEspecializacion" runat="server" 
                Height="22px" Width="202px" 
                onselectedindexchanged="ddlEspecializacion_SelectedIndexChanged">
                <asp:ListItem>Pizzeria</asp:ListItem>
                <asp:ListItem>Minutas</asp:ListItem>
                <asp:ListItem>Vegetariano</asp:ListItem>
                <asp:ListItem>Internacional</asp:ListItem>
                <asp:ListItem>Parrillada</asp:ListItem>
            </asp:DropDownList>
            &nbsp;&nbsp;
            <asp:Button ID="btnGuardar" runat="server" Height="32px" Text="Guardar" 
                Width="71px" onclick="btnGuardar_Click" />
        </td>
        <td class="style32">
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td class="style33">
        </td>
        <td class="style34">
        </td>
        <td class="style35">
            <br />
        </td>
    </tr>
    <tr>
        <td class="style36">
            </td>
        <td class="style37">
            &nbsp;</td>
        <td class="style38">
            </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style18">
        </td>
        <td class="style29">
        </td>
        <td class="style20">
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style24">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>

