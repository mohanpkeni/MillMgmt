<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DailyProcessReport.aspx.cs" Inherits="MILLMGMT.DailyProcessReport" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="formsec">
        <div id="headsec">
            <center>
                <h3>
                    Daily Report
                </h3>
            </center>
            <br />
        </div>
        <div id="datesec">
            <center>
                <table>
                    <tr>
                        <td align="left">
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
                        <td align="left">
                            <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlUnit" runat="server" CssClass="inputbox" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblDepartment" runat="server" Text="Department"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="inputbox" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblShift" runat="server" Text="Shift"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:DropDownList ID="ddlShift" runat="server" CssClass="inputbox" Width="150px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center">
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                        </td>
                    </tr>
                </table>
            </center>
            <br />
        </div>
        <div id="reportsec">
            <center>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Height="450px" 
                    Width="100%">
                </rsweb:ReportViewer>
            </center>
        </div>
    </div>
</asp:Content>
