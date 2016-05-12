<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Attend.aspx.cs" Inherits="MILLMGMT.Attend" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="headsec">
        <center>
            <h3>
                Attendance
            </h3>
        </center>
    </div>
    <div id="btnsec">
        <center>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblbtnSec" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
                        <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" 
                            Enabled="True" TargetControlID="txtDate" Format="dd/MM/yyyy">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnSubmit" runat="server" Text="Show" 
                            onclick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </center><br />
    </div>
    <div id="tablesec">
        <center>
            <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="EID" HeaderText="EmpID" />
                    <asp:BoundField DataField="EName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="InTime" HeaderText="In Time" />
                    <asp:BoundField DataField="OutTime" HeaderText="OutTime" />
                    <asp:BoundField HeaderText="Worked Hours" />
                    <asp:BoundField HeaderText="OT Hours" />
                    <asp:TemplateField HeaderText="Deparment">
                    <ItemTemplate>
                        <asp:DropDownList ID="ddlDepart" runat="server">
                        </asp:DropDownList>
                    </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="Shift" />
                </Columns>
            </asp:GridView>
        </center>
    </div>
</asp:Content>
