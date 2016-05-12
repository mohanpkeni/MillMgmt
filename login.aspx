<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="MILLMGMT.login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login </title>
    <link href="style/StyleSheet.css" rel="stylesheet" type="text/css" />
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += isUNameEmpty();
            summary += isPassword();
            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }
        function isUNameEmpty() {
            var txtUName = document.getElementById("<%=txtUserName.ClientID %>").value;
            if (txtUName == "") {
                return ("Please Enter User Name\n");

            }
            else {
                return "";
            }
        }
        function isPassword() {
            var txtPassword = document.getElementById("<%=txtPwd.ClientID %>").value;
            if (txtPassword == "") {
                return ("Please Enter Password\n");

            }
            else {
                return "";
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="header" style="height: 300px">
        <center class="TextStyle">
                
                   Senthur Mill & Textiles Ltd
        </center>
    </div>
    <div id="content" style="height:400px">
        <center>
            <fieldset style="height: 150px; width: 200px; border-color: Blue;">
                <legend class="fontcolor">Login</legend>
                <div class='container'>
                    <asp:Label ID="Name" runat="server" Text="UserName:" CssClass="lbl" />
                    <br />
                    <asp:TextBox ID="txtUserName" runat="server" Height="22px" CssClass="inputbox" Text="t" />
                </div>
                <div class='container'>
                    <asp:Label ID="lblPwd" runat="server" Text="Password:" CssClass="lbl" />
                    <br />
                    <asp:TextBox ID="txtPwd" runat="server" CssClass="pwd inputbox" Text="t" Height="22px" />
                </div>
                <br />
                <div class='container'>
                    <asp:Button ID="btnLogIn" runat="server" Text="Sign In" OnClick="btnLogIn_Click"
                        OnClientClick="return Validate();" CssClass="button" />
                </div>
                <br />
                <div class='container'>
                    <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
                </div>
            </fieldset>
        </center>
    </div>
    <div id="footer" style="height: 300px">
    </div>
    </form>
</body>
</html>
