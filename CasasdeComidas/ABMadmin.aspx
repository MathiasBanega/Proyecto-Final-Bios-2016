<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.master" AutoEventWireup="true" Inherits="ABMadmin" Codebehind="ABMadmin.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
    .style4
    {
        height: 30px;
    }
    .style5
    {
        width: 607px;
    }
    .style6
    {
        height: 30px;
        width: 607px;
    }
    .style7
    {
        width: 462px;
    }
    .style8
    {
        height: 30px;
        width: 462px;
    }
    .style9
    {
        height: 25px;
        width: 462px;
    }
    .style10
    {
        height: 25px;
        width: 607px;
    }
    .style11
    {
        height: 25px;
    }
    .style12
    {
        height: 2px;
        width: 462px;
    }
    .style13
    {
        height: 2px;
        width: 607px;
    }
    .style14
    {
        height: 2px;
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
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
        </td>
        <td class="style6">
            <asp:Label ID="Label2" runat="server" Font-Names="Arial Black" 
                Font-Size="X-Large" Text="Ingrese el numero de documento"></asp:Label>
        </td>
        <td class="style4">
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
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td class="style5">
            <asp:Label ID="lblDoc" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtDocumento" runat="server" Height="22px" Width="202px" 
                ontextchanged="txtDocumento_TextChanged"></asp:TextBox>
&nbsp;
            <asp:Button ID="btnBuscar" runat="server" Height="29px" Text="Buscar" 
                Width="116px" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAgregar" runat="server" Height="33px" 
                Text="Nuevo Administrador" Visible="False" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style9">
        </td>
        <td class="style10">
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td class="style11">
        </td>
    </tr>
    <tr>
        <td class="style12">
            &nbsp;</td>
        <td class="style13">
            <asp:Label ID="lblUsu" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtNombreUsu" runat="server" Height="22px" Visible="False" 
                Width="202px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblNom" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtNombreComp" runat="server" Height="22px" Visible="False" 
                Width="202px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblPas" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtContraseña" runat="server" Height="22px" 
                TextMode="Password" Visible="False" Width="202px"></asp:TextBox>
            <br />
            <br />
            <asp:Label ID="lblCar" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtCargo" runat="server" Height="22px" Visible="False" 
                Width="202px"></asp:TextBox>
            <br />
            <br />
        </td>
        <td class="style14">
            <br />
            <br />
        </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            <asp:GridView ID="GridView1" runat="server" Height="128px" Width="521px">
            </asp:GridView>
        </td>
        <td>
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" Visible="False" 
                Width="87px" />
            <br />
            <br />
            <br />
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Visible="False" 
                Width="87px" />
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

