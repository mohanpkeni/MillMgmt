<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserLogin.aspx.cs" Inherits="MILLMGMT.UserLogin" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login </title>
    <link href="style/style.css" rel="stylesheet" type="text/css" />
    <link href="style/reset.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="Title" style="margin: 10px; height: 25%">
        <p>
            SENTHOOR TEXTILE
        </p>
    </div>
    <div class="wrap">
        <fieldset>
            <asp:TextBox ID="txtUserName" runat="server" required placeholder="UserName"></asp:TextBox>
            <br />
            <asp:TextBox ID="txtPassword" runat="server" required Placeholder="Password" TextMode="Password"></asp:TextBox>
            <br />
            <asp:Button ID="btnLogin" runat="server" Text="Login" OnClick="btnLogin_Click" />
        </fieldset>
    </div>
    <%--<div class="Footer">
        <center>
            <p>
                Powered By Keni Technology</p>
        </center>
    </div>--%>
    </form>
    <script src="script/index.js" type="text/javascript"></script>
</body>
</html>
