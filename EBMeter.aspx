<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="EBMeter.aspx.cs" Inherits="MILLMGMT.EBMeter" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <%-- <script src="script/jquery-1.8.3.js" type="text/javascript"></script>--%>
   <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type = "text/javascript">
        $(function () {
            $('#<%=ddlUnit.ClientID %>').change(function () {
                $('#<%=txtMeter1Open.ClientID %>').val('');
                $('#<%=txtMeter1Close.ClientID %>').val('');
                $('#<%=txtMeter1Usage.ClientID %>').val('');
                $('#<%=txtMeter2Open.ClientID %>').val('');
                $('#<%=txtMeter2Close.ClientID %>').val('');
                $('#<%=txtMeter2Usage.ClientID %>').val('');
//                alert('work fine');
            });
        });
    </script>
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += DateVal();
            summary += UnitVal();
            summary += OpenVal();
            summary += CloseVal();

            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }
        function DateVal() {
            var Date = document.getElementById('<%=txtDate.ClientID%>');
            if (Date == "") {
                return "Please Select Date\n";
            }
            else {
                return "";
            }
        }
        function UnitVal() {
            var Unit = document.getElementById('<%=ddlUnit.ClientID %>').value;
            if (Unit == 0) {
                return "Please Select Unit\n";
            } else {
                return "";
            }
        }
        function OpenVal() {
            var open = document.getElementById('<%=txtMeter1Open.ClientID %>').value;
            if (open == "") {
                return "Please Enter Opening Reading\n";
            }
            else {
                return "";
            }
        }
        function CloseVal() {
            var Close = document.getElementById('<%=txtMeter1Close.ClientID %>').value; if (Close == "") {
                return "Please Enter Closing Reading\n";
            }
            else {
                return "";
            }
        }
    </script>


    <style type="text/css">
        .style2
        {
            width: 231px;
        }
        .style3
        {
            width: 104px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td>
                    <center>
                        <h3>
                            ELECTRICITY</h3>
                    </center>
                </td>
            </tr>
        </table>
        <br />
        <%--<asp:Label ID="lbluser" runat="server"></asp:Label>--%>
    </div>
    <div>
        <center>
            <table>
            <tr>
            <td align = "left">
                <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
            </td>
             <td align="left">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox" Width="150px"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                        Format="dd/MM/yyyy" TargetControlID="txtDate">
                    </asp:CalendarExtender>
                </td>
            </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                    </td>
                    <td align="left" class="style2">
                        <asp:DropDownList ID="ddlUnit" runat="server" Width="150px" CssClass="inputbox" 
                            AutoPostBack="True" onselectedindexchanged="ddlUnit_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
                <%-- <tr>
                    <td align="left" class="style3">
                        <asp:Label ID="lblShift" runat="server" Text="Unit"></asp:Label>
                    </td>
                    <td align="left" class="style2">
                        <asp:DropDownList ID="ddlShift" runat="server" CssClass="inputbox" Width="160px">
                        </asp:DropDownList>
                    </td>
                </tr>--%>
            </table>
        </center>
        <br />
    </div>
    <div>
        <center>
            <table>
                <tr>
                    <td>
                    </td>
                    <td align="center">
                        Opening
                    </td>
                    <td class="style4" align="center">
                        Closing
                    </td>
                    <td align="center">
                        Total Consume
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:Label ID="lblMeter1" runat="server" Text="Meter 1"></asp:Label>
                    </td>
                    <td align="center" class="style2">
                        <asp:TextBox ID="txtMeter1Open" runat="server" Width="160px" CssClass="inputbox"
                            AutoPostBack="True" OnTextChanged="txtMeter1Open_TextChanged"></asp:TextBox>
                    </td>
                    <td align="center" class="style2">
                        <asp:TextBox ID="txtMeter1Close" runat="server" Width="160px" CssClass="inputbox"
                            AutoPostBack="True" OnTextChanged="txtMeter1Close_TextChanged"></asp:TextBox>
                    </td>
                    <td align="center" class="style2">
                        <asp:TextBox ID="txtMeter1Usage" runat="server" ReadOnly="true" CssClass="inputbox"
                            Width="160px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left" class="style3">
                        <asp:Label ID="lblMeter2" runat="server" Text="Meter 2"></asp:Label>
                    </td>
                    <td align="center" class="style2">
                        <asp:TextBox ID="txtMeter2Open" runat="server" Width="160px" CssClass="inputbox"
                            AutoPostBack="True" OnTextChanged="txtMeter2Open_TextChanged"></asp:TextBox>
                    </td>
                    <td align="center" class="style2">
                        <asp:TextBox ID="txtMeter2Close" runat="server" Width="160px" CssClass="inputbox"
                            AutoPostBack="True" OnTextChanged="txtMeter2Close_TextChanged"></asp:TextBox>
                    </td>
                    <td align="center" class="style2">
                        <asp:TextBox ID="txtMeter2Usage" ReadOnly="true" runat="server" CssClass="inputbox"
                            Width="160px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="4" align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click"
                            OnClientClick="return Validate()" />
                    </td>
                </tr>
            </table>
        </center>
        <br />
        <br />
    </div>
    <div>
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
