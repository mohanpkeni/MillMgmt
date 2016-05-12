<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="WebForm2.aspx.cs" Inherits="MILLMGMT.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <link href="TimePicker/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
    <script src="TimePicker/jquery.timepicker.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.txt').timepicker();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <asp:TextBox ID="TextBox1" runat="server" CssClass="txt"></asp:TextBox>&nbsp&nbsp&nbsp&nbsp&nbsp
    <asp:TextBox ID="TextBox2" runat="server" CssClass="txt"></asp:TextBox><br />
    
    <br />
    <br />
    <asp:Button ID="Button1" runat="server" Text="Button" onclick="Button1_Click" />
    <br />
    <br />
    <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
    <br />
    <br />
    <br />
    <asp:Label ID="Label3" runat="server" Text="Label"></asp:Label>
</asp:Content>
