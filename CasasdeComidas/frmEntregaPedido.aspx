<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdmin.master" AutoEventWireup="true" Inherits="frmEntregaPedido" Codebehind="frmEntregaPedido.aspx.cs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style4
        {
            height: 23px;
        }
        .style5
        {
            width: 377px;
        }
        .style6
        {
            height: 23px;
            width: 377px;
        }
        .style7
        {
            width: 707px;
        }
        .style8
        {
            height: 23px;
            width: 707px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <table style="width:100%;">
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style6">
            </td>
            <td class="style8">
                <asp:GridView ID="grdPedidos" runat="server" AutoGenerateSelectButton="True" 
                    Height="249px" style="margin-left: 0px" Width="701px">
                </asp:GridView>
            </td>
            <td class="style4">
                <asp:Button ID="btnEntregado" runat="server" Height="70px" 
                    Text="Pedido Entregado" Width="166px" />
            </td>
        </tr>
        <tr>
            <td class="style5">
                &nbsp;</td>
            <td class="style7">
                <asp:Label ID="lblError" runat="server"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>

