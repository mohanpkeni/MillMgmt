<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="drawing.aspx.cs" Inherits="MILLMGMT.drawing" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += txtDate();
            summary += shiftVal();
            summary += SW();

            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }

        function txtDate() {
            var Date = document.getElementById('<%=txtDate.ClientID%>').value;
            if (Date == "") {
                return ("Please Select Date\n");
            }
            else {
                return "";
            }
        }
        function shiftVal() {
            var shiftID = document.getElementById('<%=ddlshift.ClientID %>').value;
            if (shiftID == 0) {
                return ("Please Select Shift\n");
            }
            else {
                return "";
            }
        }

        function SW() {
            var swwaste = document.getElementById('<%=txtSWWaste.ClientID %>').value;
            if (swwaste == "") {
                return ("Please Enter SW Waste\n");
            }
            else {
                return "";
            }
        }
    </script>
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".gridtxt").on("change", function () {
                var currectRow = $(this).closest("tr");
                //convert string to int
                var txt1 = parseFloat(currectRow.find(".txt1").val());
                var txt2 = parseFloat(currectRow.find(".txt2").val());
                //judgement if valid numbers
                if (!isNaN(txt1) && !isNaN(txt2)) {
                    if (parseFloat(txt1) <= parseFloat(txt2)) {
                        var diff = parseFloat(txt2) - parseFloat(txt1);
                        currectRow.find(".txt3").val(diff);
                    } else {
                        alert('Opening is Larger than Closing');
                    }
                }
            });
        });

        $(document).ready(function () {
            $('.gridtxt').change(function () {
                var currentRow = $(this).closest('tr');
                if (this.value.length != 0) {
                    if (!($.isNumeric(this.value))) {
                        alert('Enter Number Only');
                    }
                    else {
                        if (!(this.value >= 0)) {
                            alert('Value is a Negative');
                        }
                    }
                }
            });
        });

        $(document).ready(function () {
            $(".gridtxt").on("change", function () {
                var currectRow = $(this).closest("tr");
                //convert string to int
                var txt1 = parseFloat(currectRow.find(".txt4").val());
                var txt2 = parseFloat(currectRow.find(".txt5").val());
                //judgement if valid numbers
                if (!isNaN(txt1) && !isNaN(txt2)) {
                    if (parseFloat(txt1) <= parseFloat(txt2)) {
                        var diff = parseFloat(txt2) - parseFloat(txt1);
                        currectRow.find(".txt6").val(diff);
                    } else {
                        alert('Opening is Larger than Closing');
                    }
                }
            });
        });

        $(document).ready(function () {
            $('.gridtxt').change(function () {
                var currentRow = $(this).closest('tr');
                if (this.value.length != 0) {
                    if (!($.isNumeric(this.value))) {
                        alert('Enter Number Only');
                    }
                    else {
                        if (!(this.value >= 0)) {
                            alert('Value is a Negative');
                        }
                    }
                }
            });
        });


        $(document).ready(function () {
            $('.popup').change(function () {
                var currentRow = $(this).closest('tr');
                if (this.value.length != 0) {
                    if (!($.isNumeric(this.value))) {
                        alert('Enter Number Only');
                    }
                    else {
                        if (!(this.value >= 0)) {
                            alert('Value is a Negative');
                        }
                    }
                }
            });
        });

        $(document).ready(function () {
            $(".popup").on("change", function () {
                var currectRow = $(this).closest("tr");
                //convert string to int
                var txt1 = parseFloat(currectRow.find(".txt4").val());
                var txt2 = parseFloat(currectRow.find(".txt5").val());
                //judgement if valid numbers
                if (!isNaN(txt1) && !isNaN(txt2)) {
                    if (parseFloat(txt1) < parseFloat(txt2)) {
                        var diff = parseFloat(txt2) - parseFloat(txt1);
                        currectRow.find(".txt6").val(diff);
                    } else {
                        alert('Opening is Larger than Closing');
                    }
                }
            });
        });

    </script>
    <script type="text/javascript">
        $(function () {
            $("[id*=gvdrawing] td").hover(function () {
                $("td", $(this).closest("tr")).addClass("hover_row");
            }, function () {
                $("td", $(this).closest("tr")).removeClass("hover_row");
            });
        });
    </script>
    <style type="text/css">
        .hover_row
        {
            background-color:#ff6600;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="topdic">
        <center>
            <table width="100%">
                <tr>
                    <td align="center" style="width: 90%">
                        <h3>
                            DRAWING</h3>
                    </td>
                </tr>
            </table>
        </center>
        <br />
    </div>
    <div id="datesection">
        <center>
            <table style="width: 300px">
                <tr>
                    <td align="left">
                        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox" Width="150px"></asp:TextBox>
                        <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="txtDate" Format="dd/MM/yyyy" PopupPosition="Right">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblshift" runat="server" Text="Shift"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlshift" runat="server" CssClass="inputbox" AutoPostBack="True"
                            Width="150px" OnSelectedIndexChanged="ddlshift_SelectedIndexChanged">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </center>
        <br />
    </div>
    <div id="choose">
        <div id="choosesec" align="right">
            <asp:Button ID="btnChoose" runat="server" Text="Choose Employee" />
        </div>
        <asp:ModalPopupExtender ID="mpeChoose" runat="server" BackgroundCssClass="modalbackground"
            PopupControlID="PanelAdd" TargetControlID="btnChoose" PopupDragHandleControlID="PanelAddTitle"
            CancelControlID="btnRCancel" DropShadow="True">
        </asp:ModalPopupExtender>
        <asp:Panel ID="PanelAdd" runat="server" Style="display: none;" BackColor="Gray" ForeColor="Black"
            Height="300" Width="500">
            <asp:Panel ID="PanelAddTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                Height="25">
                <b>Select Employee</b>
            </asp:Panel>
            <center>
                <table width="100%" style="padding: 5">
                   <%-- <tr>
                        <td>
                            <asp:Label ID="lblSelectDate" runat="server" Text="Select Date"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtSelectDate" runat="server"></asp:TextBox>
                            <asp:CalendarExtender ID="txtSelectDate_CalendarExtender" TargetControlID="txtSelectDate"
                                PopupPosition="Right" Enabled="true" runat="server" Format="dd/MM/yyyy">
                            </asp:CalendarExtender>
                        </td>
                    </tr>--%>
                    <tr>
                        <td>
                            <asp:Label ID="lblShiftP" runat="server" Text="Shift"></asp:Label>
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlshiftP" runat="server" Width="174px">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmpCode" runat="server" Text="Enter Employee Code"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmpCode" runat="server" AutoPostBack="True" OnTextChanged="txtEmpCodePop_TextChanged"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblEmployeeNames" runat="server" Text="EmployeeName"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtEmployeeName" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblNoofCanes" runat="server" Text="No of Canes"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtNofCanes" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMachine1" runat="server" Text="Machine - 1"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMachine1Open" runat="server" Width="100px" CssClass="popup txt4"></asp:TextBox>&nbsp&nbsp&nbsp
                            <asp:TextBox ID="txtMachine1Close" runat="server" Width="100px" CssClass="popup txt5"></asp:TextBox>&nbsp&nbsp&nbsp
                            <asp:TextBox ID="txtMachine1Read" runat="server" Width="100px" CssClass="popup txt6"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <asp:Label ID="lblMachine2" runat="server" Text="Machine - 2"></asp:Label>
                        </td>
                        <td>
                            <asp:TextBox ID="txtMachine2Open" runat="server" Width="100px" CssClass="popup txt4"></asp:TextBox>&nbsp&nbsp&nbsp
                            <asp:TextBox ID="txtMachine2Close" runat="server" Width="100px" CssClass="popup txt5"></asp:TextBox>&nbsp&nbsp&nbsp
                            <asp:TextBox ID="txtMachine2Read" runat="server" Width="100px" CssClass="popup txt6"></asp:TextBox>
                        </td>
                    </tr>
                </table>
            </center>
            <div align="center">
                <asp:Button ID="btnSaveEmployee" runat="server" Text="Save" OnClick="btnSaveEmployee_Click" />&nbsp&nbsp&nbsp
                <asp:Button ID="btnRCancel" runat="server" Text="Cancel" /><br />
                <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                <asp:Label ID="lblEIDS" runat="server" Visible="false"></asp:Label>
            </div>
        </asp:Panel>
        <br />
    </div>
    <div id="griddiv">
        <center>
            <asp:GridView ID="gvdrawing" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                PageSize="50" ShowFooter="True" OnRowCommand="gvdrawing_RowCommand">
                <AlternatingRowStyle BackColor="#FFFF99" />
                <Columns>
                    <asp:TemplateField HeaderText="EmpID">
                        <ItemTemplate>
                            <asp:Label ID="lblEID" runat="server" Text='<%# Bind("EID") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftEID" runat="server"></asp:TextBox>
                        </FooterTemplate>
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Code">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpCode" runat="server" Text='<%#Bind("EmployeeCode")%>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftEmpCode" runat="server" AutoPostBack="true" OnTextChanged="txtEmpCode_TextChanged" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Name">
                        <FooterTemplate>
                            <asp:TextBox ID="txtftEName" runat="server" ReadOnly="True"></asp:TextBox>
                        </FooterTemplate>
                        <ItemTemplate>
                            <asp:Label ID="lblEName" runat="server" Text='<%# Bind("EName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No of Canes">
                        <ItemTemplate>
                            <asp:TextBox ID="txtCanes" runat="server" CssClass="txtcanes gridtxt" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftCanes" runat="server" CssClass="txtcanes gridtxt" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Machine 1 Opening">
                        <ItemTemplate>
                            <asp:TextBox ID="txtOpening" runat="server" CssClass="txt1 gridtxt" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftOpening" runat="server" CssClass="txt1 gridtxt" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Machine 1 Closing">
                        <ItemTemplate>
                            <asp:TextBox ID="txtClosing" runat="server" CssClass="txt2 gridtxt" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftClosing" runat="server" CssClass="txt2 gridtxt" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Reading">
                        <ItemTemplate>
                            <asp:TextBox ID="txtTotalReading" runat="server" CssClass="txt3 gridtxt" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftTotalReading" runat="server" CssClass="txt3 gridtxt" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Machine 2 Opening">
                        <ItemTemplate>
                            <asp:TextBox ID="txtOpeningM2" runat="server" CssClass="txt4 gridtxt" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftOpeningM2" runat="server" CssClass="txt4 gridtxt" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Machine 2 Closing">
                        <ItemTemplate>
                            <asp:TextBox ID="txtClosingM2" runat="server" CssClass="txt5 gridtxt" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftClosingM2" runat="server" CssClass="txt5 gridtxt" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Total Reading">
                        <ItemTemplate>
                            <asp:TextBox ID="txtTotalReadingM2" runat="server" CssClass="txt6 gridtxt" Width="100px"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftTotalReadingM2" runat="server" CssClass="txt6 gridtxt" Width="100px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="Add" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FF6600" />
                <HeaderStyle BackColor="#666666" ForeColor="White" />
            </asp:GridView>
        </center>
        <br />
        <br />
    </div>
    <div id="tablecontent">
        <center>
            <table width="400px">
                <tr>
                    <td align="left">
                        <asp:Label ID="lblSWWaste" runat="server" Text="SW Waste"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtSWWaste" CssClass="inputbox" runat="server" Width="200px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblBLWaste" runat="server" Text="BL Waste" Visible="False"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtBLWaste" runat="server" CssClass="inputbox" Width="200px" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td align="center" colspan="2">
                        <asp:Button ID="btnSave" runat="server" Text="Save" Width="100px" OnClick="btnSave_Click"
                            OnClientClick="return Validate()" />
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Button ID="lnkgaurding" runat="server" Text="<< Gaurding" PostBackUrl="~/gaurding.aspx"
                            Width="100px" />
                    </td>
                    <td align="right">
                        <asp:Button ID="lnkSimplex" runat="server" Text="Simplex >>" PostBackUrl="~/simplex.aspx"
                            Width="100px" />
                    </td>
                </tr>
                <tr>
                    <td align="left" colspan="2">
                        <asp:Button ID="btnPrintPreview" runat="server" Text="Print Preview" OnClick="btnPrintPreview_Click"
                            Visible="False" />
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <div id="errlbldiv">
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
