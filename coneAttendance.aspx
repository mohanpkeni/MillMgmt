<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="coneAttendance.aspx.cs" Inherits="MILLMGMT.coneAttendance" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="headsec">
        <center>
            <h3>
                Cone Attendane</h3>
        </center>
    </div>
    <div id="gridsec">
        <center>
            <asp:GridView ID="gvConeattend" runat="server" AutoGenerateColumns="False" 
                AllowSorting="True">
                <Columns>
                    <asp:BoundField HeaderText="Date" DataField="AttendanceDate" DataFormatString="{0:dd/MM/yyyy}"/>
                    <asp:BoundField HeaderText="EmployeeID" DataField="EmployeeId" />
                    <asp:TemplateField HeaderText="Employee Code">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpCode" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpName" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField HeaderText="InTime" DataField="InTime" />
                    <asp:BoundField HeaderText="OutTime" DataField="OutTime" />
                    <asp:TemplateField HeaderText="Duration">
                        <ItemTemplate>
                            <asp:Label ID="lblDuration" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Shift">
                        <ItemTemplate>
                            <asp:Label ID="lblShift" runat="server"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center><br />
    </div>
    <div id="btnsec">
    <center>
        <asp:Button ID="btnSave" runat="server" Text="Save" onclick="btnSave_Click" />    
    </center>
    </div>
</asp:Content>
