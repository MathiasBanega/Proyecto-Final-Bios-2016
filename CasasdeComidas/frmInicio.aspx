<%@ Page Language="C#" AutoEventWireup="true" Inherits="frmInicio" Codebehind="frmInicio.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .style1
        {
            width: 362px;
        }
        .style3
        {
            width: 362px;
            }
        .style5
        {
            height: 23px;
        }
        .style6
        {
            width: 362px;
            height: 63px;
        }
        .style8
        {
            height: 63px;
        }
        .style9
        {
            width: 362px;
            height: 55px;
        }
        .style11
        {
            height: 55px;
        }
        .style12
        {
            width: 362px;
            height: 28px;
        }
        .style14
        {
            height: 28px;
        }
        .style15
        {
            width: 828px;
        }
        .style16
        {
        }
        .style17
        {
            width: 828px;
            height: 63px;
        }
        .style18
        {
            width: 828px;
            height: 28px;
        }
        .style19
        {
            width: 828px;
            height: 55px;
        }
        .style20
        {
            width: 362px;
            height: 22px;
        }
        .style21
        {
            width: 828px;
            height: 22px;
        }
        .style22
        {
            height: 22px;
        }
        .style23
        {
            width: 362px;
            height: 38px;
        }
        .style24
        {
            width: 828px;
            height: 38px;
        }
        .style25
        {
            height: 38px;
        }
        .style26
        {
            width: 362px;
            height: 33px;
        }
        .style27
        {
            width: 828px;
            height: 33px;
        }
        .style28
        {
            height: 33px;
        }
        .style29
        {
            width: 362px;
            height: 6px;
        }
        .style30
        {
            width: 828px;
            height: 6px;
        }
        .style31
        {
            height: 6px;
        }
        .style32
        {
            width: 362px;
            height: 52px;
        }
        .style33
        {
            width: 828px;
            height: 52px;
        }
        .style34
        {
            height: 52px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%; margin-top: 0px;">
            <tr>
                <td bgcolor="#706FD3" class="style3">
                    <asp:Image ID="imgLogo" runat="server" Height="39px" Width="62px" />
                </td>
                <td bgcolor="#706FD3" class="style16" colspan="2" rowspan="2">
                    <asp:Label ID="Label3" runat="server" Font-Size="X-Large" ForeColor="#F7F1E3" 
                        
                        Text=" ¡Bienvenidos a ComidaRapida.com el mejor sitio para ordenar comida a domicilio!"></asp:Label>
                </td>
                </tr>
            <tr>
                <td bgcolor="#706FD3" class="style3">
                </td>
                </tr>
            <tr>
                <td bgcolor="#474787" class="style32">
                </td>
                <td bgcolor="#474787" class="style33">
                </td>
                <td bgcolor="#474787" class="style34">
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style12">
                </td>
                <td class="style18">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Usuario&nbsp;
                    <asp:TextBox ID="txtUsuario" runat="server" Height="25px" Width="200px"></asp:TextBox>
&nbsp;
                </td>
                <td class="style14">
                    </td>
            </tr>
            <tr>
                <td class="style20">
                    </td>
                <td class="style21">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td class="style22">
                    </td>
            </tr>
            <tr>
                <td class="style26">
                    </td>
                <td class="style27">
                    Contraseña&nbsp;
                    <asp:TextBox ID="txtContraseña" runat="server" Height="25px" Width="200px"></asp:TextBox>
                </td>
                <td class="style28">
                    </td>
            </tr>
            <tr>
                <td class="style23">
                    </td>
                <td class="style24">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:LinkButton ID="LinkButton1" runat="server" 
                        PostBackUrl="~/frmRegistroCliente.aspx">Crear cuenta</asp:LinkButton>
                </td>
                <td class="style25">
                    </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btnIngresar" runat="server" Height="35px" 
                        onclick="Button1_Click" Text="Ingresar" Width="105px" />
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style9">
                </td>
                <td class="style19">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label2" runat="server" ForeColor="#F7F1E3" Text="Usuario"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;
                    <asp:Label ID="lblError" runat="server"></asp:Label>
                </td>
                <td class="style11">
                </td>
            </tr>
            <tr>
                <td class="style6">
                </td>
                <td class="style17">
&nbsp;&nbsp;&nbsp;
                    <asp:Label ID="Label1" runat="server" ForeColor="#F7F1E3" Text="Contraseña"></asp:Label>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                <td class="style8">
                </td>
            </tr>
            <tr>
                <td class="style3">
                    </td>
                <td class="style16">
                    </td>
                <td class="style5">
                    </td>
            </tr>
            <tr>
                <td class="style3">
                </td>
                <td class="style16">
                    &nbsp;</td>
                <td class="style5">
                </td>
            </tr>
            <tr>
                <td class="style3">
                </td>
                <td class="style16">
                </td>
                <td class="style5">
                </td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="style1">
                    &nbsp;</td>
                <td class="style15">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    
    </div>
    </form>
</body>
</html>
