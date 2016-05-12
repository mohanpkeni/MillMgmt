<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="conewinding.aspx.cs" Inherits="MILLMGMT.conewinding" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += txtDate();
            summary += shift();
            summary += TotalCones();
            summary += HW();
            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }
        function txtDate() {
            var Date = document.getElementById('<%=txtDate.ClientID %>').value;
            if (Date == "") {
                return ("Please Select Date\n");
            }
            else {
                return "";
            }
        }
        function shift() {
            var shiftid = document.getElementById('<%=ddlshift.ClientID %>').value;
            if (shiftid == 0) {
                return ("Please Select Shift\n");
            }
            else {
                return "";
            }
        }
        function TotalCones() {
            var totcones = document.getElementById('<%=txtCumTotalCones.ClientID %>').value;
            if (totcones == "") {
                return ("Please Enter Total Cones\n");
            }
            else {
                return "";
            }
        }
        function HW() {
            var hardwaste = document.getElementById('<%=txtHardWaste.ClientID%>').value;
            if (hardwaste == "") {
                return ("Please Enter Hard Waste\n");
            }
            else {
                return "";
            }
        }         
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
    <script src="script/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            noofCones();
        });


        function noofCones() {
            $(document).ready(function () {
                $(".noofcones").each(function () {
                    $(this).keyup(function () {
                        var sum = 0;
                        $(".noofcones").each(function () {
                            if (!isNaN(this.value) && this.value.length != 0) {
                                sum += parseFloat(this.value);
                            }
                        });
                        $("#<%=txtCumTotalCones.ClientID %>").val(sum);
                        $("#<%=txtCumTotalCones.ClientID %>").attr("readonly", "readonly");
                        $(".totalcone").attr("readonly", "readonly");
                    });
                });
            });
        }
    </script>
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            ReadingCalc();


        });


        function ReadingCalc() {
            $(document).ready(function () {
                $(".gridtxt").on("change", function () {
                    var currectRow = $(this).closest("tr");
                    //convert string to int
                    var rowChar = currectRow.find(".lblside").text();
                    var opening = parseFloat(currectRow.find(".opening").val());
                    var closing = parseFloat(currectRow.find(".closing").val());
                    //judgement if valid numbers
                    if (rowChar == 'I' || rowChar == 'J' || rowChar == 'K' || rowChar == 'L') {
                        if (!isNaN(opening) && !isNaN(closing)) {
                            if (opening > closing) {
                                var adjustval = ((opening - closing) * 40);
                                currectRow.find(".readadjust").val(adjustval.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((opening - closing) * 40) / 1.250));
                            }
                            else {
                                var adjustval1 = ((closing - opening) * 40);
                                currectRow.find(".readadjust").val(adjustval1.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((closing - opening) * 40) / 1.250));
                            }
                        }

                    } else {
                        if (!isNaN(opening) && !isNaN(closing)) {
                            if (opening > closing) {
                                var adjustval = ((opening - closing) * 30);
                                currectRow.find(".readadjust").val(adjustval.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((opening - closing) * 30) / 1.250));
                            }
                            else {
                                var adjustval1 = ((closing - opening) * 30);
                                currectRow.find(".readadjust").val(adjustval1.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((closing - opening) * 30) / 1.250));
                            }
                        }
                    }
                });
            });
        }

        function ReadingCalcFooter() {
            $(document).ready(function () {
                $(".gridtxt").on("change", function () {
                    var currectRow = $(this).closest("tr");
                    //convert string to int
                    //var rowChar = $(".ddlSide").prop('selectedIndex');
                    var rowChar = $("select.ddlSide").text();
                    var opening = parseFloat(currectRow.find(".opening").val());
                    var closing = parseFloat(currectRow.find(".closing").val());
                    //judgement if valid numbers
                    if (rowChar == 'I' || rowChar == 'J' || rowChar == 'K' || rowChar == 'L') {
                        if (!isNaN(opening) && !isNaN(closing)) {
                            if (opening > closing) {
                                var adjustval = ((opening - closing) * 40);
                                currectRow.find(".readadjust").val(adjustval.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((opening - closing) * 40) / 1.250));
                            }
                            else {
                                var adjustval1 = ((closing - opening) * 40);
                                currectRow.find(".readadjust").val(adjustval1.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((closing - opening) * 40) / 1.250));
                            }
                        }

                    } else {
                        if (!isNaN(opening) && !isNaN(closing)) {
                            if (opening > closing) {
                                var adjustval = ((opening - closing) * 30);
                                currectRow.find(".readadjust").val(adjustval.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((opening - closing) * 30) / 1.250));
                            }
                            else {
                                var adjustval1 = ((closing - opening) * 30);
                                currectRow.find(".readadjust").val(adjustval1.toFixed(2));
                                currectRow.find(".readcone").val(Math.round(((closing - opening) * 30) / 1.250));
                            }
                        }
                    }
                });
            });
        }

        function ReadingCalcPopup() {
            $(document).ready(function () {
                $(".popup").on("change", function () {
                    var currectRow = $(this).closest("tr");
                    //convert string to int
                    var rowCharp = $("select.ddlSideP option:selected").text();
                    var opening = parseFloat(currectRow.find(".openingp").val());
                    var closing = parseFloat(currectRow.find(".closingp").val());
                    //judgement if valid numbers
                    if (rowCharp != 'Select') {
                        if (rowCharp == 'I' || rowCharp == 'J' || rowCharp == 'K' || rowCharp == 'L') {
                            if (!isNaN(opening) && !isNaN(closing)) {
                                if (opening > closing) {
                                    var adjustval = ((opening - closing) * 40);
                                    currectRow.find(".readadjustp").val(adjustval.toFixed(2));
                                    currectRow.find(".readconep").val(Math.round(((opening - closing) * 40) / 1.250));
                                }
                                else {
                                    var adjustval1 = ((closing - opening) * 40);
                                    currectRow.find(".readadjustp").val(adjustval1.toFixed(2));
                                    currectRow.find(".readconep").val(Math.round(((closing - opening) * 40) / 1.250));
                                }
                            }

                        } else {
                            if (!isNaN(opening) && !isNaN(closing)) {
                                if (opening > closing) {
                                    var adjustval = ((opening - closing) * 30);
                                    currectRow.find(".readadjustp").val(adjustval.toFixed(2));
                                    currectRow.find(".readconep").val(Math.round(((opening - closing) * 30) / 1.250));
                                }
                                else {
                                    var adjustval1 = ((closing - opening) * 30);
                                    currectRow.find(".readadjustp").val(adjustval1.toFixed(2));
                                    currectRow.find(".readconep").val(Math.round(((closing - opening) * 30) / 1.250));
                                }
                            }
                        }
                    }
                });
            });
        }

    </script>
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            TotalCone();
            TotalConePopup();
        });



        function TotalCone() {
            $(document).ready(function calc() {
                $(".gridtxt").on("change", function () {
                    var currectRow = $(this).closest("tr");
                    //convert string to int
                    var opening = parseFloat(currectRow.find(".opening").val());
                    var closing = parseFloat(currectRow.find(".closing").val());
                    var readcone = parseFloat(currectRow.find(".readcone").val());
                    var noofcones = parseFloat(currectRow.find(".noofcones").val());

                    if (!isNaN(opening) && !isNaN(closing) && !isNaN(readcone) && !isNaN(noofcones)) {
                        if (closing > opening) {
                            currectRow.find(".totalcone").val(readcone + noofcones);
                        }
                        else {
                            currectRow.find(".totalcone").val(noofcones - readcone);
                        }
                    }
                });
            });
        }

        function TotalConePopup() {
            $(document).ready(function calc() {
                $(".popup").on("change", function () {
                    var currectRow = $(this).closest("tr");
                    //convert string to int
                    var opening = parseFloat(currectRow.find(".openingp").val());
                    var closing = parseFloat(currectRow.find(".closingp").val());
                    var readcone = parseFloat(currectRow.find(".readconep").val());
                    var noofcones = parseFloat(currectRow.find(".noofconesp").val());

                    if (!isNaN(opening) && !isNaN(closing) && !isNaN(readcone) && !isNaN(noofcones)) {
                        if (closing > opening) {
                            currectRow.find(".totalconep").val(readcone + noofcones);
                        }
                        else {
                            currectRow.find(".totalconep").val(noofcones - readcone);
                        }
                    }
                });
            });

        }
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            NumberOnly();
        });


        function NumberOnly() {
            $(document).ready(function () {
                $('.gridtxt').change(function () {
                    if (this.value.length != 0) {
                        if (!($.isNumeric(this.value))) {
                            alert('Enter Number Only');
                        }
                    }
                });
            });
        }

        $(document).ready(function check(lnk) {
            $('.dlemp').change(function () {
                var CurrentRow = $(this).closest('tr');
                var selectvalue = CurrentRow.find('select.dlemp').val();
                var selectfst = CurrentRow.find('select.dlemp').text();
                var i = 0;
                $('.dlemp').each(function () {
                    var sltvalue = $(this).find('option:selected').val();
                    var selectsec = $(this).find('option:selected').text();
                    if (selectfst != 'Select' && selectsec != 'Select') {
                        if (selectvalue == sltvalue) {
                            i = parseInt(i) + 1;
                        }
                    }
                });
                if (i > 2) {
                    alert('Employee Selected ' + i + ' times');
                }
            });
        });       
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            Waste();
        });
        function Waste() {
            $(document).ready(function () {
                $(".hardwaste").each(function () {
                    $(this).keyup(function () {
                        var sum = 0;
                        $(".hardwaste").each(function () {
                            if (!isNaN(this.value) && this.value.length != 0) {
                                sum += parseFloat(this.value);
                            }
                        });
                        $("#<%=txtHardWaste.ClientID %>").val(sum.toPrecision(3));
                        $("#<%=txtHardWaste.ClientID %>").attr("readonly", "readonly");
                    });
                });
            });
        }


        function WastePopup() {
            $(document).ready(function () {
                $(".hardwastep").each(function () {
                    $(this).keyup(function () {
                        var sum = 0;
                        $(".hardwastep").each(function () {
                            if (!isNaN(this.value) && this.value.length != 0) {
                                sum += parseFloat(this.value);
                            }
                        });
                        $("#<%=txtHardWaste.ClientID %>").val(sum.toPrecision(3));
                        $("#<%=txtHardWaste.ClientID %>").attr("readonly", "readonly");
                    });
                });
            });
        }
        function pageLoad(sender, args) {
            Waste();
            NumberOnly();
            noofCones();
            ReadingCalc();
            TotalCone();
            CheckFooter();
            ReadingCalcFooter();
            ReadingCalcPopup();
            WastePopup()
        }

        function CheckFooter() {
            $('.btnAdd').click(function () {
                var selectedIndex = $('select.ddlSide').prop('selectedIndex');
                var empcode = $('.ftEmpCode').val();
                var ename = $('ftename').val();
                var ftopen = $('ftopen').val();
                var ftclose = $('ftclose').val();
                var ftreadadjust = $('ftreadadjust').val();
                var ftreadcone = $('ftreadcone').val();
                var ftnoofcones = $('ftnoofcone').val();
                var fttotalcone = $('fttotalcone').val();

                if (selectedIndex == 0) {
                    alert('Select any Side');
                    return false;
                }
                if (empcode == '') {
                    alert('enter employee code');
                    return false;
                }
                if (ename == '') {
                    alert('enter employee name');
                    return false;
                }
                if (ftopen == '') {
                    alert('enter opening reading');
                    return false;
                }
                if (ftclose == '') {
                    alert('enter closing reading');
                    return false;
                }
                if (ftnoofcones == '') {
                    alert('enter no of cones');
                    return false;
                }
            });
        }
    </script>
    <script type="text/javascript">
        $(function () {
            $("[id*=gvConeWinding] td").hover(function () {
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
    <div id="topsec">
        <table width="100%">
            <tr>
                <td align="center" style="width: 90%">
                    <center>
                        <h3>
                            CONE WINDING</h3>
                    </center>
                </td>
            </tr>
        </table>
        <br />
    </div>
    <div id="datesec">
        <center>
            <table width="350px">
                <tr>
                    <td align="left">
                        <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox" Width="150px"></asp:TextBox>
                        <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                            PopupPosition="Right" TargetControlID="txtDate" Format="dd/MM/yyyy">
                        </asp:CalendarExtender>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblshift" runat="server" Text="Shift"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:DropDownList ID="ddlshift" runat="server" CssClass="inputbox" Width="150px"
                            OnSelectedIndexChanged="ddlshift_SelectedIndexChanged" AutoPostBack="True">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <br />
        </center>
        <div id="choose">
            <div id="choosesec" align="right">
                <asp:Button ID="btnChoose" runat="server" Text="Choose Employee" />
            </div>
            <asp:ModalPopupExtender ID="mpeChoose" runat="server" BackgroundCssClass="modalbackground"
                PopupControlID="PanelAdd" TargetControlID="btnChoose" PopupDragHandleControlID="PanelAddTitle"
                CancelControlID="btnRCancel" DropShadow="True">
            </asp:ModalPopupExtender>
            <asp:Panel ID="PanelAdd" runat="server" Style="display: none;" BackColor="Gray" ForeColor="Black"
                Height="260" Width="770">
                <asp:Panel ID="PanelAddTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                    padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                    Height="25">
                    <b>Select Employee</b>
                </asp:Panel>
                <center>
                    <table width="100%" style="padding: 5">
                        <%--  <tr>
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
                                <asp:Label ID="lblSideP" runat="server" Text="Side"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlSideP" runat="server" Width="174px" CssClass="ddlSideP">
                                    <asp:ListItem Value="0" Text="Select"></asp:ListItem>
                                    <asp:ListItem Value="1" Text="A"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="B"></asp:ListItem>
                                    <asp:ListItem Value="3" Text="C"></asp:ListItem>
                                    <asp:ListItem Value="4" Text="D"></asp:ListItem>
                                    <asp:ListItem Value="5" Text="E"></asp:ListItem>
                                    <asp:ListItem Value="6" Text="F"></asp:ListItem>
                                    <asp:ListItem Value="7" Text="G"></asp:ListItem>
                                    <asp:ListItem Value="8" Text="H"></asp:ListItem>
                                    <asp:ListItem Value="9" Text="I"></asp:ListItem>
                                    <asp:ListItem Value="10" Text="J"></asp:ListItem>
                                    <asp:ListItem Value="11" Text="K"></asp:ListItem>
                                    <asp:ListItem Value="12" Text="L"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                <table>
                                    <tr>
                                        <td>
                                            <asp:Label ID="lblOpeningP" runat="server" Text="Opening"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblClosingP" runat="server" Text="Closing"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblReadingAdjustP" runat="server" Text="Adjustment"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblReadingCones" runat="server" Text="Reading Cones"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblNoofConesP" runat="server" Text="No of Cones"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblTotalConesP" runat="server" Text="Total Cones"></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="lblHardWasteP" runat="server" Text="Hard Waste"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <asp:TextBox ID="txtOpeningP" runat="server" Width="100px" CssClass="popup openingp"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtClosingP" runat="server" Width="100px" CssClass="popup closingp"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtReadingAdjustP" runat="server" Width="100px" CssClass="popup readadjustp"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtReadConeP" runat="server" CssClass="popup readconep" Width="100px"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtNoofConesP" runat="server" Width="100px" CssClass="popup noofconesp"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtTotalConesP" runat="server" Width="100px" CssClass="popup totalconep"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:TextBox ID="txtHardWasteP" runat="server" Width="100px" CssClass="popup hardwastep"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
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
    <div id="gridsec">
        <center>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <asp:GridView ID="gvConeWinding" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                        OnRowCommand="gvConeWinding_RowCommand" PageSize="30" ShowFooter="True">
                        <AlternatingRowStyle BackColor="#FFFF99" />
                        <Columns>
                            <asp:TemplateField HeaderText="Side">
                                <ItemTemplate>
                                    <asp:Label ID="lblSide" runat="server" CssClass="lblside"></asp:Label>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:DropDownList ID="ddlSide" runat="server" CssClass="ddlSide inputbox gridtxt">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        <asp:ListItem Text="A" Value="1"></asp:ListItem>
                                        <asp:ListItem Text="B" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="C" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="D" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="E" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="F" Value="6"></asp:ListItem>
                                        <asp:ListItem Text="G" Value="7"></asp:ListItem>
                                        <asp:ListItem Text="H" Value="8"></asp:ListItem>
                                        <asp:ListItem Text="I" Value="9"></asp:ListItem>
                                        <asp:ListItem Text="J" Value="10"></asp:ListItem>
                                        <asp:ListItem Text="K" Value="11"></asp:ListItem>
                                        <asp:ListItem Text="L" Value="12"></asp:ListItem>
                                    </asp:DropDownList>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Employee Name">
                                <ItemTemplate>
                                    <asp:DropDownList ID="ddlEmpName" runat="server" CssClass="dlemp inputbox" Width="100px">
                                        <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                    </asp:DropDownList>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:Label ID="lblftEID" runat="server" Visible="false"></asp:Label>
                                    <asp:TextBox ID="txtftEmpCode" runat="server" Width="50px" AutoPostBack="true" OnTextChanged="txtEmpCode_TextChanged"
                                        CssClass="ftEmpCode inputbox"></asp:TextBox>
                                    <asp:TextBox ID="txtftEName" runat="server" CssClass="inputbox ftename" Width="100px"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Opening Balance">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtOpening" runat="server" Width="100px" CssClass="opening gridtxt inputbox"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftOpening" runat="server" Width="100px" CssClass="opening gridtxt inputbox ftopen"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Closing Balance">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtClosing" runat="server" Width="100px" CssClass="closing gridtxt inputbox"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftClosing" runat="server" Width="100px" CssClass="closing gridtxt inputbox ftclose"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reading Adjustment">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtReadingAdjust" runat="server" Width="100px" CssClass="readadjust gridtxt inputbox"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftReadingAdjust" runat="server" Width="100px" CssClass="readadjust gridtxt inputbox ftreadadjust"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Reading Cone">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtReadCone" runat="server" Width="100px" CssClass="readcone gridtxt inputbox"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftReadCone" runat="server" Width="100px" CssClass="readcone gridtxt inputbox ftreadcone"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="No of Cones">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtNoofCones" runat="server" Width="100px" CssClass="noofcones gridtxt inputbox"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftNoofCones" runat="server" Width="100px" CssClass="noofcones gridtxt inputbox ftnoofcones"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Total Cones">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtTotalCones" runat="server" Width="100px" CssClass="totalcone gridtxt inputbox"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftTotalCones" runat="server" Width="100px" CssClass="totalcone gridtxt inputbox fttotalcones"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Hard Waste">
                                <ItemTemplate>
                                    <asp:TextBox ID="txtEmpHardWaste" runat="server" Width="100px" CssClass="inputbox hardwaste"></asp:TextBox>
                                </ItemTemplate>
                                <FooterTemplate>
                                    <asp:TextBox ID="txtftEmpHardWaste" runat="server" Width="100px" CssClass="inputbox hardwaste fthw"></asp:TextBox>
                                </FooterTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <FooterTemplate>
                                    <asp:Button ID="btnAdd" runat="server" Text="Add" CommandName="Add" CssClass="btnAdd" />
                                </FooterTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="#FF6600" />
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                </ContentTemplate>
            </asp:UpdatePanel>
        </center>
        <br />
        <br />
    </div>
    <div id="txtsec">
        <table align="center" width="300px">
            <tr>
                <td>
                    <asp:Label ID="lblTotalCones" runat="server" Text="Total Cones"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtCumTotalCones" runat="server" CssClass="inputbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Label ID="lblHardWaste" runat="server" Text="Hard Waste"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtHardWaste" CssClass="inputbox" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return Validate()" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left">
                    <asp:Button ID="lnkspinning" runat="server" Text="<< Spinning" Width="120px" PostBackUrl="~/spinningProduction.aspx" />
                </td>
            </tr>
            <tr>
                <td colspan="2" align="left">
                    <asp:Button ID="btnPrintPreview" runat="server" Text="Print Preview" OnClick="btnPrintPreview_Click"
                        Visible="False" />
                </td>
            </tr>
        </table>
        <br />
        <br />
    </div>
    <div id="errsec">
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
