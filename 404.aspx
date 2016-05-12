<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="404.aspx.cs" Inherits="MILLMGMT._404" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <h1>
            Error Login!!!
        </h1>

        <h1>Login Again  
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="UserLogin.aspx">Click Here</asp:HyperLink> </h1>
    </div>
    </form>
</body>
</html>
