<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PRAdvance.aspx.cs" Inherits="MILLMGMT.PRAdvance" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function txtBoxClear() {
            var values = document.getElementById('txtEmpID').value = "";
            alert(values);
            return true;
        }
        $(document).ready(function () {
            $('input.txtamt').keyup(function () {
                if (this.value.length != 0) {
                    if (!$.isNumeric(this.value)) {
                        alert('Enter Number Only');
                        this.focus();
                    }
                }
            });
        });
    </script>
     
    <script type="text/javascript">
        $(function () {
            $("[id*=gvAdvance] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("hover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("hover_row");
            });
        });
    </script>
    <style type="text/css">
        .hover_row
        {
            background-color: #ff6600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <center>
            <h3>
                ADVANCE MANAGEMENT</h3>
        </center>
        <br />
    </div>
    <div id="tablesec">
        <center>
            <table>
                <tr>
                    <td align="left">
                        <asp:Label ID="lbldate" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox" Width="200px"></asp:TextBox>
                        <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                            Format="dd/MM/yyyy" PopupPosition="Right" TargetControlID="txtDate">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <%--<tr>
                    <td align="left">
                        <asp:Label ID="lblEmpID" runat="server" Text="Employee ID" Style="text-align: left"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtEmpID" runat="server" CssClass="inputbox"></asp:TextBox>
                    </td>
                </tr>--%>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblEmpName" runat="server" Text="Employee Name"></asp:Label>
                    </td>
                    <td align="left">
                        <%--<asp:TextBox ID="txtEmpName" runat="server" CssClass="inputbox"></asp:TextBox>--%>
                        <asp:DropDownList ID="ddlEmpName" runat="server" CssClass="inputbox" Width="200px">
                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblAdvAmount" runat="server" Text="Amount"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtAdvAmount" runat="server" CssClass="inputbox txtamt" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                    </td>
                    <td>
                        <table width="100%">
                            <tr>
                                <td align="center">
                                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" />
                                </td>
                                <td align="center">
                                    <asp:Button ID="btnClear" runat="server" Text="Clear" OnClientClick="return txtBoxClear();"
                                        OnClick="btnClear_Click" />
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
            <br />
        </center>
    </div>
    <div id="grdsec">
        <center>
            <asp:GridView ID="gvAdvance" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                PageSize="80" Width="60%">
                <AlternatingRowStyle BackColor="#FFFF99" />
                <Columns>
                    <asp:BoundField DataField="EID" HeaderText="EID">
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                    </asp:BoundField>
                    <asp:BoundField DataField="EmployeeCode" HeaderText="EmployeeCode" />
                    <asp:BoundField DataField="EName" HeaderText="Employee Name" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount">
                        <ItemStyle HorizontalAlign="Right" VerticalAlign="Middle" />
                        <ControlStyle BackColor="Aqua" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#999999" />
            </asp:GridView>
        </center>
        <br />
    </div>
    <div id="btnsec">
        <center>
            <asp:Button ID="btnPrint" runat="server" Text="Print Preview" OnClick="btnPrint_Click" />
        </center>
    </div>
</asp:Content>
