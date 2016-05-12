<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="gaurding.aspx.cs" Inherits="MILLMGMT.gaurding" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += ValidateDate();
            summary += shiftValid();
            summary += TOTCANES();
            summary += FS();
            summary += LF();
            summary += CF();
            summary += SW();

            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }


        function shiftValid() {
            var shift = document.getElementById('<%=ddlshift.ClientID %>').value;
            if (shift == 0) {
                return ("Please Select Shift\n");
            }
            else {
                return "";
            }
        }
        function ValidateDate() {
            var txtDate = document.getElementById('<%=txtDate.ClientID%>').value;
            if (txtDate == "") {
                return ("Please Select Date\n");
            }
            else {
                return "";
            }
        }
        function TOTCANES() {
            var totcanes = document.getElementById('<%=txtTotcans.ClientID %>').value;

            if (totcanes == "") {
                return ("Please Enter Canes\n");
            }
            else {
                return "";
            }
        }
        function FS() {
            var txtFS = document.getElementById('<%=txtFS.ClientID %>').value;
            if (txtFS == "") {
                return ("Please Enter FS\n");
            }
            else {
                return "";
            }
        }
        function LF() {
            var txtLF = document.getElementById('<%=txtLF.ClientID %>').value;
            if (txtLF == "") {
                return ("Please Enter LF\n");
            }
            else {
                return "";
            }
        }

        function CF() {
            var txtCF = document.getElementById('<%=txtCF.ClientID %>').value;
            if (txtCF == "") {
                return ("Please Enter CF\n");
            }
            else {
                return "";
            }
        }

        function SW() {
            var txtSW = document.getElementById('<%=txtBW.ClientID %>').value;
            if (txtSW == "") {
                return ("Please Enter BW Waste\n");
            }
            else {
                return "";
            }
        }        
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".total1").each(function () {
                $(this).keyup(function () {
                    var sum = 0;
                    $(".total1").each(function () {
                        if (!isNaN(this.value) && this.value.length != 0) {
                            sum += parseFloat(this.value);
                        }
                    });

                    $("#<%=txtTotcans.ClientID %>").val(sum.toFixed(0));
                    $("#<%=txtTotcans.ClientID %>").attr("readonly", "readonly");
                });

            });
        });
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".total").each(function () {
                $(this).keyup(function () {
                    var sum = 0;
                    $(".total").each(function () {
                        if (!isNaN(this.value) && this.value.length != 0) {
                            sum += parseFloat(this.value);
                        }
                    });

                    $("#<%=txtTotallapes.ClientID %>").val(sum.toFixed(0));
                    $("#<%=txtTotallapes.ClientID %>").attr("readonly", "readonly")
                });

            });
        });
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('.total').change(function () {
                if (this.value.length != 0) {
                    if (!($.isNumeric(this.value))) {
                        alert('Enter Number Only');
                    }
                }
            })
        });
        $(document).ready(function () {
            $('.total1').change(function () {
                if (this.value.length != 0) {
                    if (!($.isNumeric(this.value))) {
                        alert('Enter Number Only');
                    }
                }
            });
        });
    </script>
      <script type="text/javascript">
          $(function () {
              $("[id*=gvgaurding] td").hover(function () {
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
    <div id="topsec">
        <center>
            <table width="100%">
                <tr>
                    <td align="center">
                        <h3>
                            GAURDING</h3>
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <div id="datesec">
        <center>
            <table style="width: 300px">
                <tr>
                    <td align="left">
                        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox" Width="150" EnableViewState="False"></asp:TextBox>
                        <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                            PopupPosition="Right" Format="dd/MM/yyyy" TargetControlID="txtDate">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblshift" runat="server" Text="Shift"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlshift" runat="server" Width="150px" CssClass="inputbox"
                            AutoPostBack="True" OnSelectedIndexChanged="ddlshift_SelectedIndexChanged">
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
                    Height="250" Width="400">
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
                                    <asp:Label ID="lblMachine" runat="server" Text="Machine"></asp:Label>
                                </td>
                                <td>
                                    <asp:DropDownList ID="ddlMachinePop" runat="server" Width="174px">
                                    </asp:DropDownList>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCanesProducedP" runat="server" Text="Cans Produced"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCansProducedP" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblLapesUsedP" runat="server" Text="Lapes Used"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtLapesUsedP" runat="server"></asp:TextBox>
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
           
    </div>
    <div id="uppanel1">
        <center>
            <asp:GridView ID="gvgaurding" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                ShowFooter="True" PageSize="50" OnRowCommand="gvgaurding_RowCommand">
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
                            <asp:Label ID="lblEmpCode" runat="server" Text='<%#Bind("EmployeeCode") %>'></asp:Label>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftEmpCode" runat="server" AutoPostBack="true" OnTextChanged="txtEmpCode_TextChanged"></asp:TextBox>
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
                    <asp:TemplateField HeaderText="Machine ID">
                        <ItemTemplate>
                            <asp:DropDownList ID="ddlMachineID" runat="server">
                            </asp:DropDownList>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:DropDownList ID="ddlftMachineID" runat="server">
                            </asp:DropDownList>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No of Cans Produced">
                        <ItemTemplate>
                            <asp:TextBox ID="txtcansProduced" runat="server" CssClass="total1"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftcansProduced" runat="server" CssClass="total1"></asp:TextBox>
                        </FooterTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="No of Lapes Used">
                        <ItemTemplate>
                            <asp:TextBox ID="txtLapesUsed" runat="server" CssClass="total"></asp:TextBox>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:TextBox ID="txtftLapesUsed" runat="server" CssClass="total"></asp:TextBox>
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
    <div id="sumpanl">
        <table align="center" style="width: 450px">
            <tr>
                <td>
                    <asp:Label ID="lblTotCans" runat="server" Text="Total Can's Produced"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTotcans" CssClass="inputbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblTotalLapes" runat="server" Text="Total Lape's Used"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtTotallapes" CssClass="inputbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblFS" runat="server" Text="FS Waste"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtFS" CssClass="inputbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblLF" runat="server" Text="LF Waste"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtLF" CssClass="inputbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblCF" runat="server" Text="CF Waste"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCF" CssClass="inputbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblSW" runat="server" Text="BW Waste"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtBW" CssClass="inputbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return Validate()" />
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Button ID="lnkBlowRoom" runat="server" Text="&lt;&lt; Blow Room" PostBackUrl="~/blowroom.aspx"
                        Width="120px" />
                </td>
                <td align="right">
                    <asp:Button ID="lnkDrawing" runat="server" Text="Drawing >>" PostBackUrl="~/drawing.aspx"
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
        <br />
        <br />
    </div>
    <div id="errdiv">
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
