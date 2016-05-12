<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MacMaintainrpt.aspx.cs" Inherits="MILLMGMT.MacMaintainrpt" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="CrystalDecisions.Web, Version=13.0.2000.0, Culture=neutral, PublicKeyToken=692fbea5521e1304"
    Namespace="CrystalDecisions.Web" TagPrefix="CR" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="title">
        <br />
        <table width="100%">
            <tr>
                <td>
                    <center>
                        <h3>
                            MACHINE MAINTENANCE
                        </h3>
                    </center>
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
    <div id="Div1">
        <center>
            <table width="700px">
                <tr>
                    <td>
                        <asp:Label ID="lblFrom" runat="server" Text="From"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtFromDate" runat="server" CssClass="inputbox"></asp:TextBox>
                        <asp:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" Enabled="True"
                            Format="dd/MM/yyyy" TargetControlID="txtFromDate">
                        </asp:CalendarExtender>
                    </td>
                    <td>
                        <asp:Label ID="lblTo" runat="server" Text="To"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtToDate" runat="server" CssClass="inputbox"></asp:TextBox>
                        <asp:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" Enabled="True"
                            Format="dd/MM/yyyy" TargetControlID="txtToDate">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="4">
                        <center>
                            <asp:Button ID="btnShow" runat="server" Text="Show" Width="100px" OnClick="btnShow_Click" />
                        </center>
                    </td>
                </tr>
            </table>
        </center>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div id="rpt">
            <center>
                <%--<CR:CrystalReportViewer ID="crViewer" runat="server" AutoDataBind="true" ToolPanelView="None" />--%>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="90%" Height="600px">
                </rsweb:ReportViewer>
            </center>
        </div>
    </div>
    <div id="footer1">
    </div>
</asp:Content>
