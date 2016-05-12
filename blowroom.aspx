<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="blowroom.aspx.cs" Inherits="MILLMGMT.blowroom" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script src="script/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        function GridValidation() {
            var flags = true;
            var grid = document.getElementById('<%=gvblowroom.ClientID%>');
            var texts = new Array();
            for (var i = 0; i < texts.length; i++) {
                if (texts.items(i).value == '') {
                    flags = false;
                    break;
                }
            }
            if (!flags) {
                alert("Please Enter Lapes and Working Hrs");
            }
            return flags;
        }
    </script>
    <script language="javascript" type="text/javascript">
        function Validate() {
            var summary = "";
            summary += ValidateText();
            summary += ValidateDateText();
            summary += ValidateLapes();
            summary += ValidateWaste();

            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }

        function ValidateDateText() {
            var txtdate = document.getElementById('<%=txtDate.ClientID %>').value;
            if (txtdate == "") {
                return ("Please Select Date\n")
            }
            else {
                return "";
            }
        }

        function ValidateText() {
            var txt = document.getElementById('<%=ddlshift.ClientID%>').value;
            if (txt == 0) {
                return ("Please Select any Shift\n")
            }
            else {
                return "";
            }
        }

        function ValidateLapes() {
            var totLapes = document.getElementById('<%=txtTotLapes.ClientID %>').value;
            if (totLapes == "") {
                return ("Please Enter  Total Lapes\n");
            }
            else {
                return "";
            }
        }
        function ValidateWaste() {
            var waste = document.getElementById('<%=txtWaste.ClientID%>').value;
            if (waste == "") {
                return ("Please Enter Waste\n");
            }
            else {
                return "";
            }
        }
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".price").each(function () {
                $(this).keyup(function () {
                    var sum = 0;
                    $(".price").each(function () {
                        if (!isNaN(this.value) && this.value.length != 0) {
                            sum += parseFloat(this.value);
                        }
                    });
                    $("#<%=txtTotLapes.ClientID %>").val(sum.toFixed(0));
                    $("#<%=txtTotLapes.ClientID %>").attr("readonly", "readonly");
                });

            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.price').change(function () {
                if (this.value.length != 0) {
                    if (!($.isNumeric(this.value))) {
                        alert('Enter Number Only');
                    }
                }
            });
        });
       
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.date').focusout(
            function () {
                if (this.value.length != 0) {

                }
            });
        });
    </script>
    <script type="text/javascript">
        $(function () {
            $("[id*=gvblowroom] td").hover(function () {
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
            <table width="100%">
                <tr>
                    <td align="center">
                        <h3>
                            BLOW ROOM</h3>
                    </td>
                </tr>
            </table>
        </center>
        <br />
    </div>
    <div>
        <center>
            <table style="width: 300px">
                <tr>
                    <td align="left">
                        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox date" Width="150px" EnableViewState="False"></asp:TextBox>
                        <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                            TargetControlID="txtDate" Format="dd/MM/yyyy" PopupPosition="Right">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblShift" runat="server" Text="Shift"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlshift" runat="server" CssClass="inputbox" OnSelectedIndexChanged="ddlshift_SelectedIndexChanged"
                            AutoPostBack="True" Width="150px">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
        </center>
        <br />
        <div id="choose">
            <div id="choosesec" align="right">
                <asp:Button ID="btnChoose" runat="server" Text="Choose Employee" />
            </div>
            <asp:ModalPopupExtender ID="mpeChoose" runat="server" BackgroundCssClass="modalbackground"
                PopupControlID="PanelAdd" TargetControlID="btnChoose" PopupDragHandleControlID="PanelAddTitle"
                CancelControlID="btnRCancel" DropShadow="True">
            </asp:ModalPopupExtender>
            <asp:Panel ID="PanelAdd" runat="server" Style="display: none;" BackColor="Gray" ForeColor="Black"
                Height="200" Width="400">
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
                                <asp:Label ID="lblLapes" runat="server" Text="Lapes"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtLapes" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                </center>
                <div align="center">
                    <asp:Button ID="btnSaveEmployee" runat="server" Text="Save" OnClick="btnSaveEmployee_Click" />&nbsp&nbsp&nbsp
                    <asp:Button ID="btnRCancel" runat="server" Text="Cancel" /><br />
                    <asp:Label ID="lblError" runat="server" Text=""></asp:Label>
                    <asp:Label ID="lblEID" runat="server" Visible="false"></asp:Label>
                </div>
            </asp:Panel>
        </div>
    </div>
    <div id="gvdiv">
        <center>
            <asp:GridView ID="gvblowroom" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                Width="800px" OnPageIndexChanging="gvblowroom_PageIndexChanging" PageSize="50"
                ShowFooter="True" OnRowCommand="gvblowroom_RowCommand">
                <AlternatingRowStyle BackColor="#FFFF99" />
                <Columns>
                    <asp:TemplateField HeaderText="EmpID">
                        <ItemTemplate>
                            <asp:Label ID="lblEID" runat="server" Text='<%# Bind("EID") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftEID" runat="server" Text=""></asp:TextBox>
                        </FooterTemplate>
                        <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" HorizontalAlign="Left" />
                        <FooterStyle CssClass="hidden" HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Code">
                        <ItemTemplate>
                            <asp:Label ID="lblEmpCode" runat="server" Text='<%# Bind("EmployeeCode") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftEmployeeCode" runat="server" AutoPostBack="true" OnTextChanged="txtEmpCode_TextChanged" Width="75px"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Employee Name">
                        <ItemTemplate>
                            <asp:Label ID="lblEName" runat="server" Text='<%# Bind("EName") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftEName" runat="server" ReadOnly="true"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No of Lapes">
                        <ItemTemplate>
                            <asp:TextBox ID="txtLapes" runat="server" CssClass="price" Width="75px" Text="0"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftLapes" runat="server" CssClass="price" Width="75px"></asp:TextBox>
                        </FooterTemplate>
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <FooterTemplate>
                            <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="Add" />
                        </FooterTemplate>
                    </asp:TemplateField>
                </Columns>
                <FooterStyle BackColor="#FF9933" />
                <HeaderStyle BackColor="#666666" ForeColor="White" />
            </asp:GridView>
        </center>
        <br />
        <br />
    </div>
    <div id="tablelapes">
        <table align="center" style="width: 450px;">
            <tr>
                <td>
                    <asp:Label ID="lblTotLapesStr" runat="server" Text="Total Lapes Produced"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTotLapes" runat="server" CssClass="inputbox" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblWaste" runat="server" Text="Waste"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtWaste" runat="server" CssClass="inputbox" Width="150px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="100px"
                        OnClientClick="return Validate();" />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Button ID="lnkDailyProcess" runat="server" Text="<< Daily Process" PostBackUrl="~/dailyprocess.aspx"
                        Width="120px" />
                </td>
                <td align="right">
                    <asp:Button ID="lnkGaurding" runat="server" Text="Gaurding >>" PostBackUrl="~/gaurding.aspx"
                        Width="120px" />
                </td>
            </tr>
            <tr>
                <td align="left" colspan="2">
                    <asp:Button ID="btnPrintPreview" runat="server" Text="Print Preview" OnClick="btnPrintPreview_Click"
                        Visible="False" />
                </td>
            </tr>
        </table>
    </div>
    <br />
    <div id="errmsg">
        <center>
            <asp:Label ID="lblmsg" runat="server"></asp:Label>
        </center>
    </div>
</asp:Content>
