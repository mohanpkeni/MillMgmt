<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeList.aspx.cs" Inherits="MILLMGMT.EmployeeList"
    MasterPageFile="~/Site.Master" %>

<asp:Content ContentPlaceHolderID="head" ID="Content1" runat="server">
    <style type="text/css">
        .hidden
        {
            display: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="gridemplouyeelist">
        <center>
            <h3>
                Employee List
            </h3>
            <asp:GridView ID="gvEmpListUpload" runat="server" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="EmployeeId" HeaderText="Employee Id">
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="EmployeeName" />
                    <asp:TemplateField HeaderText="Address">
                        <ItemTemplate>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="inputbox" TextMode="MultiLine"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Contact No">
                        <ItemTemplate>
                            <asp:TextBox ID="txtContact" runat="server" CssClass="inputbox"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Permanent">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkPermanent" runat="server" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Unit">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlUnit" runat="server" CssClass="inputbox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Department">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlDepart" runat="server" CssClass="inputbox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Designation">
                        <ItemTemplate>
                            <asp:TextBox ID="txtDesignation" runat="server" CssClass="inputbox"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary">
                        <ItemTemplate>
                            <asp:TextBox ID="txtSalary" runat="server" CssClass="inputbox"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Salary Type">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlSalaryType" runat="server" CssClass="inputbox">
                                <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                <asp:ListItem Text="Wage" Value="1"></asp:ListItem>
                                <asp:ListItem Text="Salary" Value="2"></asp:ListItem>
                            </asp:DropDownList>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Auto Incentives">
                        <ItemTemplate>
                            <asp:CheckBox ID="chkAutoIncentive" runat="server" Checked="true" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="PF">
                        <ItemTemplate>
                            <asp:TextBox ID="txtPF" runat="server" CssClass="inputbox"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="ESI">
                        <ItemTemplate>
                            <asp:TextBox ID="txtESI" runat="server" CssClass="inputbox"></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </center>
        <br />
    </div>
    <div id="btnsec">
        <center>
            <asp:Button ID="btnSaveEmpList" runat="server" Text="Save" OnClick="btnSaveEmpList_Click"
                Width="75px" />
        </center>
    </div>
</asp:Content>
