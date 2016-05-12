<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="PROTSalary.aspx.cs" Inherits="MILLMGMT.PROTSalary" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="script/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("[id*=gvOTTime] td").hover(function () {
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
    <script type="text/javascript">
        $(document).ready(function () {
            $('.Duepaid').change(function () {
                var currentRow = $(this).closest('tr');
                var TotalSalary = parseFloat(currentRow.find('.TotalSalary').val());
                var Advance = parseFloat(currentRow.find('.Advance').val());
                var Deduction = parseFloat(currentRow.find('.Duepaid').val());

                if (Deduction != '') {
                    if (Advance > 0) {
                        if (TotalSalary >= Deduction) {
                            var netsalary = TotalSalary - Deduction;
                            var advancebalance = Advance - Deduction;
                            currentRow.find('.netsalary').val(netsalary.toFixed(2));
                            currentRow.find('.advancebalance').val(advancebalance.toFixed(2));
                            var totaldeuction = 0;
                            var duesum = 0, salsum = 0, advancebalancesum = 0;
                            $('.Duepaid').each(function () {
                                var cr = $(this).closest('tr');
                                var duevalue = cr.find('.Duepaid').val();
                                var salvalue = cr.find('.netsalary').val();
                                var advancebalancevalue = cr.find('.advancebalance').val();

                                // add only if the value is number
                                if (!isNaN(duevalue) && duevalue.length != 0) {
                                    duesum += parseFloat(duevalue);
                                }
                                if (!isNaN(salvalue) && salvalue.length != 0) {
                                    salsum += parseFloat(salvalue);
                                }
                                if (!isNaN(advancebalancevalue) && advancebalancevalue.length != 0) {
                                    advancebalancesum += parseFloat(advancebalancevalue);
                                }
                            });
                            $('.ftDuepaid').val(duesum.toFixed(2));
                            $('.ftnetsalary').val(salsum.toFixed(2));
                            $('.ftadvancebalance').val(advancebalancesum.toFixed(2));
                        }
                        else {
                            alert('Deduction Amount is higher than Total Salary.');
                            return false;
                        }
                    }
                    else {
                        alert(' Employee advance is zero.');
                        return false;

                    }
                }
            });
        });
        $(document).ready(function () {
            $('#<%=btnSave.ClientID %>').click(function () {
                var FromDate = $('#<%=txtFromDate.ClientID %>').val();
                var ToDate = $('#<%=txtToDate.ClientID %>').val();

                if (FromDate == '' && ToDate != '') {
                    alert('Select From Date.');
                    return false;
                }
                if (ToDate == '' && FromDate != '') {
                    alert('Select To Date.');
                    return false;
                }
                if (FromDate == '' && ToDate == '') {
                    alert('Select From and  To Date.');
                    return false;
                }
            });
        });
        $(document).ready(function () {
            $('#<%=btnSubmit.ClientID %>').click(function () {
                var FromDate = $('#<%=txtFromDate.ClientID %>').val();
                var ToDate = $('#<%=txtToDate.ClientID %>').val();

                if (FromDate == '' && ToDate != '') {
                    alert('Select From Date.');
                    return false;
                }
                if (ToDate == '' && FromDate != '') {
                    alert('Select To Date.');
                    return false;
                }
                if (FromDate == '' && ToDate == '') {
                    alert('Select From and  To Date.');
                    return false;
                }
            });
        });

        $(document).ready(function () {
            $('#<%=btnPrint.ClientID %>').click(function () {
                var FromDate = $('#<%=txtFromDate.ClientID %>').val();
                var ToDate = $('#<%=txtToDate.ClientID %>').val();

                if (FromDate == '' && ToDate != '') {
                    alert('Select From Date.');
                    return false;
                }
                if (ToDate == '' && FromDate != '') {
                    alert('Select To Date.');
                    return false;
                }
                if (FromDate == '' && ToDate == '') {
                    alert('Select From and  To Date.');
                    return false;
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="header">
        <center>
            <h3>
                OT Salary
            </h3>
        </center>
    </div>
    <div id="grid">
        <br />
        <center>
            <table>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblFromDate" runat="server" Text="From"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtFromDate" runat="server" CssClass="inputbox"></asp:TextBox>
                        <asp:CalendarExtender ID="txtFromDate_CalendarExtender" runat="server" Enabled="True"
                            Format="dd/MM/yyyy" PopupPosition="Right" TargetControlID="txtFromDate">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblTo" runat="server" Text="To"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtToDate" runat="server" CssClass="inputbox"></asp:TextBox>
                        <asp:CalendarExtender ID="txtToDate_CalendarExtender" runat="server" Enabled="True"
                            Format="dd/MM/yyyy" TargetControlID="txtToDate">
                        </asp:CalendarExtender>
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
        <center>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                <ContentTemplate>
                    <asp:GridView ID="gvOTTime" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        PageSize="70" OnPageIndexChanging="gvOTTime_PageIndexChanging" Width="75%" 
                        ShowFooter="True">
                        <AlternatingRowStyle BackColor="#FFFF99" />
                        <Columns>
                            <asp:BoundField DataField="EID" HeaderText="EID">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                                <FooterStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" />
                            <asp:BoundField DataField="EName" HeaderText="Emp Name" />
                            <asp:TemplateField HeaderText="Total OT Hours">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtTOT" runat="server" CssClass="inputbox"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Rs /Hr">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtRsPHr" runat="server" CssClass="inputbox"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Salary">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtSalary" runat="server" CssClass="inputbox netsalary"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftSalary" runat="server" CssClass="inputbox ftnetsalary"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <%-- <asp:TemplateField HeaderText="Net Salary">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtNetSalary" runat="server" CssClass="inputbox"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                            <%--<asp:TemplateField HeaderText="Advance">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAdvacne" runat="server" CssClass="inputbox"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Due Paid">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtDuePaid" runat="server" CssClass="inputbox" OnTextChanged="txtDuePaid_TextChanged"
                                        AutoPostBack="True"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Advance Balance">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtAdBal" runat="server" CssClass="inputbox"></asp:TextBox>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                        </Columns>
                        <HeaderStyle BackColor="Gray" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
        <br />
    </div>
    <div id="btns">
        <center>
            <table width="250">
                <tr>
                    <td>
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Visible="false" />
                    </td>
                    <td>
                        <asp:Button ID="btnPrint" runat="server" Text="Print" OnClick="btnPrint_Click" />
                    </td>
                </tr>
            </table>
        </center>
    </div>
</asp:Content>
