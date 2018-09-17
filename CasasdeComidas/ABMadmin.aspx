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
        .style12
        {
            width: 462px;
            height: 190px;
        }
        .style13
        {
            width: 607px;
            height: 190px;
        }
        .style14
        {
            height: 190px;
        }
        .style15
        {
            width: 462px;
            height: 38px;
        }
        .style16
        {
            width: 607px;
            height: 38px;
        }
        .style17
        {
            height: 38px;
        }
        .style21
        {
            width: 462px;
            height: 23px;
        }
        .style22
        {
            width: 607px;
            height: 23px;
        }
        .style23
        {
            height: 23px;
        }
        .style24
        {
            width: 462px;
            height: 125px;
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
        <td class="style21">
            </td>
        <td class="style22">
            </td>
        <td class="style23">
            </td>
    </tr>
    <tr>
        <td class="style7">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        </td>
        <td class="style5">
            <asp:Label ID="lblDoc" runat="server">C.I</asp:Label>
&nbsp;
            <asp:TextBox ID="txtDocumento" runat="server" Height="22px" Width="202px" 
                ontextchanged="txtDocumento_TextChanged"></asp:TextBox>
&nbsp;
            <asp:Button ID="btnBuscar" runat="server" Height="29px" Text="Buscar" 
                Width="116px" onclick="btnBuscar_Click" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnAgregar" runat="server" Height="33px" 
                Text="Crear Administrador" Visible="False" onclick="btnAgregar_Click" 
                Width="135px" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
        </td>
        <td class="style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblError" runat="server"></asp:Label>
        </td>
        <td>
        </td>
    </tr>
    <tr>
        <td class="style24" rowspan="3">
            </td>
    </tr>
    <tr>
        <td class="style5">
            <asp:Label ID="lblUsu" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtNombreUsu" runat="server" Height="22px" Visible="False" 
                Width="202px" ontextchanged="txtNombreUsu_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblPas" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtContraseña" runat="server" Height="22px" 
                TextMode="Password" Visible="False" Width="202px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5">
            <asp:Label ID="lblNom" runat="server"></asp:Label>
&nbsp;
            <asp:TextBox ID="txtNombreComp" runat="server" Height="22px" Visible="False" 
                Width="202px" ontextchanged="txtNombreComp_TextChanged"></asp:TextBox>
            &nbsp;&nbsp;
            <asp:Label ID="lblCar" runat="server"></asp:Label>
&nbsp;
            <asp:DropDownList ID="ddlCargo" runat="server" Visible="False">
                <asp:ListItem>Empleado</asp:ListItem>
                <asp:ListItem>Encargado</asp:ListItem>
                <asp:ListItem>Gerente</asp:ListItem>
            </asp:DropDownList>
&nbsp;
            <asp:Button ID="btnGuardar" runat="server" Height="30px" Text="Guardar" 
                Visible="False" Width="100px" />
        </td>
    </tr>
    <tr>
        <td class="style12">
            </td>
        <td class="style13">
            <asp:GridView ID="GridView1" runat="server" Height="128px" Width="521px" 
                AutoGenerateColumns="False" Visible="False">
                <Columns>
                    <asp:BoundField DataField="NombreUsu" HeaderText="Usuario" />
                    <asp:BoundField DataField="NombreComp" HeaderText="Nombre" />
                    <asp:BoundField DataField="Documento" HeaderText="Documento" />
                    <asp:BoundField DataField="Cargo" HeaderText="Cargo" />
                </Columns>
            </asp:GridView>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnModificar" runat="server" Text="Modificar" Visible="False" 
                Width="120px" Height="30px" onclick="btnModificar_Click" />
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="btnEliminar" runat="server" Text="Eliminar" Visible="False" 
                Width="120px" Height="30px" />
        </td>
        <td class="style14">
            <br />
            &nbsp;
            <br />
            <br />
&nbsp;
            <br />
            <br />
&nbsp;
            <br />
            <br />
&nbsp;
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
        <td class="style15">
            </td>
        <td class="style16">
            &nbsp; </td>
        <td class="style17">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp; </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style8">
            </td>
        <td class="style6">
            &nbsp; </td>
        <td class="style4">
            </td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp; </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style7">
            &nbsp;</td>
        <td class="style5">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
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

