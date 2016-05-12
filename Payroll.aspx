<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Payroll.aspx.cs" Inherits="MILLMGMT.Payroll" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <center>
            <h3>
                PAYROLL MANAGEMENT</h3>
        </center>
        <br />
        <%--<asp:Label ID="lbluser" runat="server"></asp:Label>--%>
    </div>
    
    <div>
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
