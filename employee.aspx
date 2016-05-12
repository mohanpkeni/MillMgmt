<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="employee.aspx.cs" Inherits="MILLMGMT.employee" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <%--<script type="text/javascript">
        $(document).ready(function () {
            $('#<%=txtname.ClientID %>').focusout(function () {
                var name = $('#<%=txtname.ClientID %>').val();
                if (name == "") {
                    alert("please enter name ");
                    return false;
                }
            });
            $('#<%=txtAddress.ClientID %>').focusout(function () {
                var address = $('#<%=txtAddress.ClientID %>').val();
                if (address == "") {
                    alert("please enter address");
                    return false;
                }
            });
            $('#<%=txtContact.ClientID %>').focusout(function () {
                var contact = $('#<%=txtContact.ClientID %>').val();
                if (contact == "") {
                    alert("please enter contact");
                    return false;
                }
                else if (!$.isNumeric(contact)) {
                    alert("Contact value is not Number");
                    return false;
                }
            });
        });
      
    </script>--%>
    <script type="text/javascript">
        function Validation() {
            var name = document.getElementById('<%=txtname.ClientID %>').value;
            var contact = document.getElementById('<%=txtContact.ClientID %>').value;
            var address = document.getElementById('<%=txtAddress.ClientID %>').value;
            var isPermanent = document.getElementById('chkPermanent').checked;
            var Department = document.getElementById('<%=ddlDepart.ClientID%>').selectedIndex;

            if (name == "") {
                alert("please enter name ");
                return false;
            }
            if (address == "") {
                alert("please enter address");
                return false;
            }
            if (contact == "") {
                alert("please enter contact");
                return false;
            }
            else if (isNaN(contact)) {
                alert("Contact value is not Number");
                return false;
            }

            if (isPermanent) {
                var Salary = document.getElementById('<%=txtSalary.ClientID %>').value;
                var ESI = document.getElementById('<%=txtESI.ClientID %>').value;
                var PF = document.getElementById('<%=txtPF.ClientID %>').value;
                var Designation = document.getElementById('<%=txtDesignation.ClientID%>').value;

                if (Designation == "") {
                    alert("Please Enter Designation.");
                    return false;
                }
                if (Salary == "") {
                    alert("plaese enter salary");
                    return false;
                }
                else if (isNaN(Salary)) {
                    alert("Salary value is not Number");
                    return false;
                }
                if (ESI == "") {
                    alert("please enter ESI");
                    return false;
                }
                else if (isNaN(ESI)) {
                    alert("ESI value is not Number");
                    return false;
                }
                if (PF == "") {
                    alert("please enter PF");
                    return false;
                }
                else if (isNaN(PF)) {
                    alert("PF value is not Number");
                    return false;
                }
            }
            else {
                if (Department <= 0) {
                    alert("Please Select Department");
                    return false;
                }
            }
        }

        function EditValidate() {
            var ename = document.getElementById('<%=txtEName.ClientID %>').value;
            var econtact = document.getElementById('<%=txtEContact.ClientID %>').value;
            var eaddress = document.getElementById('<%=txtEAddress.ClientID %>').value;
            var eSalary = document.getElementById('<%=txtESalary.ClientID %>').value;
            var eESI = document.getElementById('<%=txtEESI.ClientID %>').value;
            var ePF = document.getElementById('<%=txtEPF.ClientID %>').value;

            if (ename == "") {
                alert("please enter name ");
                return false;
            }
            if (eaddress == "") {
                alert("please enter address");
                return false;
            }
            if (econtact == "") {
                alert("please enter contact");
                return false;
            }
            else if (isNaN(econtact)) {
                alert("Contact value is not Number");
                return false;
            }

            if (eSalary == "") {
                alert("plaese enter Wages");
                return false;
            }
            else {
                if (isNaN(eWages)) {
                    alert("WAGES value is not Number");
                    return false;
                }
            }
            if (eESI == "") {
                alert("please enter ESI");
                return false;
            }
            else {
                if (isNaN(eESI)) {
                    alert("ESI value is not Number");
                    return false;
                }
            }
            if (ePF == "") {
                alert("please enter PF");
                return false;

            }
            else {
                if (isNaN(ePF)) {
                    alert("PF value is not Number");
                    return false;
                }
            }
        }               
    </script>
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $('.btnCancel').click(function () {
            $('.lblMsg').val();
        });
    </script>
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .modalbackground
        {
            background-color: Silver;
            opacity: 0.7;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <center>
            <h3>
                EMPLOYEE MANAGEMENT</h3>
        </center>
        <%--<asp:Label ID="lbluser" runat="server"></asp:Label>--%>
        <br />
    </div>
    <div id="emplistupload">
        <center>
            <table>
                <tr>
                    <td>
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td>
                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                    </td>
                </tr>
            </table>
        </center>
    </div>
    <div id="emplist">
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <center>
                    <table>
                        <tr>
                            <td colspan="2">
                                <asp:Button ID="btnAddNew" runat="server" Text="New Employee" />
                            </td>
                        </tr>
                    </table>
                </center>
                <asp:ModalPopupExtender ID="mpeAdd" runat="server" TargetControlID="btnAddNew" PopupControlID="PanelAddNew"
                    CancelControlID="btnCancel" BackgroundCssClass="modalbackground" DropShadow="True"
                    Drag="true" PopupDragHandleControlID="panelAddNewTitle">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAddNew" runat="server" Style="display: none;" BackColor="#8A8080"
                    ForeColor="Black" Height="450" Width="400">
                    <asp:Panel ID="panelAddNewTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                        Height="25">
                        <b>Add Employee</b>
                    </asp:Panel>
                    <table width="100%" style="padding: 5px">
                        <%-- <tr>
                            <td>
                                <asp:Label ID="lblMID" runat="server" Text="Machine ID"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMID" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>--%>
                        <tr>
                            <td>
                                <asp:Label ID="lblEmpCode" runat="server" Text="Employee Code"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmpCode" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblname" runat="server" Text="Employee Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtname" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAddress" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAddress" runat="server" CssClass="inputbox" TextMode="MultiLine"
                                    Height="70" Width="170"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblContact" runat="server" Text="Contact No"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtContact" runat="server" CssClass="inputbox" MaxLength="10"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlUnit" runat="server" CssClass="inputbox" AutoPostBack="true"
                                    Width="170" Height="25" OnSelectedIndexChanged="ddlUnit_SelectedIndexChanged"
                                    AppendDataBoundItems="true">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDepart" runat="server" Text="Department"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDepart" runat="server" Width="170" Height="25" CssClass="inputbox">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <%--<asp:CheckBox ID="chkPermanent" runat="server" Text="Permanent" />--%>
                                <asp:Label ID="lblPermanent" runat="server" Text="Permanent"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkPermanent" runat="server" CssClass="inputbox" OnCheckedChanged="chkPermanent_OnCheckedChanged"
                                    AutoPostBack="true" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDesignation" runat="server" Text="Designation" Visible="false"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDesignation" runat="server" CssClass="inputbox" Visible="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblSalary" runat="server" Text="Salary"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtSalary" runat="server" CssClass="inputbox"></asp:TextBox>
                                <asp:DropDownList ID="ddlSalaryType" runat="server" CssClass="inputbox">
                                    <asp:ListItem Value="1" Text="Wages">
                                    </asp:ListItem>
                                    <asp:ListItem Value="2" Text="Salary"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAutoIncentives" runat="server" Text="Auto Incentive"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkAutoIncentive" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblPF" runat="server" Text="PF" Visible="false"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtPF" runat="server" CssClass="inputbox" Visible="false"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblESI" runat="server" Text="ESI" Visible="false"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtESI" runat="server" CssClass="inputbox" Visible="false"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btnSave" OnClick="btnSave_Click"
                            OnClientClick="return Validation()" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btnCancel" OnClick="btnCancel_Click" /><br />
                        <asp:Label ID="lblMsg" runat="server" Text="" CssClass="lblMsg"></asp:Label>
                    </div>
                </asp:Panel>
                <br />
                <center>
                    <asp:GridView ID="gvEmployeeList" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        PageSize="20" DataKeyNames="EID" OnPageIndexChanging="gvEmployeeList_PageIndexChanging"
                        Width="1000px">
                        <AlternatingRowStyle BackColor="#FFFF66" BorderStyle="None" />
                        <Columns>
                            <asp:BoundField DataField="EID" HeaderText="EID" ReadOnly="true" SortExpression="EID"
                                Visible="False" />
                            <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" />
                            <asp:BoundField DataField="EName" HeaderText="Employee Name">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EAddress" HeaderText="Address">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField DataField="EContact" HeaderText="Contact">
                                <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" ID="btnEdit" Text="Edit" OnClick="btnEdit_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <%-- <asp:ButtonField CommandName="del" Text="Delete" />--%>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                </center>
                <asp:Button ID="btndummy" runat="server" Style="display: none" />
                <asp:ModalPopupExtender ID="mpeEdit" runat="server" DropShadow="True" PopupControlID="PanelEdit"
                    CancelControlID="btnCancelEdit" BackgroundCssClass="modalbackground" TargetControlID="btndummy">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelEdit" runat="server" BackColor="Gray" ForeColor="Black" Height="450"
                    Width="400" Style="display: none">
                    <asp:Panel ID="PanelEditTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25">
                        <b>Edit Employee</b>
                    </asp:Panel>
                    <table width="100%" style="padding: 5px">
                        <tr>
                            <td>
                                <asp:Label ID="lblEEmpCode" runat="server" Text="Employee Code"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEEmpCode" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEName" runat="server" Text="Name"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEName" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEAddress" runat="server" Text="Address"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEAddress" runat="server" CssClass="inputbox" TextMode="MultiLine"
                                    Height="70" Width="170"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEContact" runat="server" Text="Contact"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEContact" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEUnit" runat="server" Text="Unit"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEUnit" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlEUnit_SelectedIndexChanged"
                                    Width="170" CssClass="inputbox">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEDepart" runat="server" Text="Department"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEDepart" runat="server" Width="170" CssClass="inputbox">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEPermanent" runat="server" Text="Permanent"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkEPermanent" runat="server" AutoPostBack="true" OnCheckedChanged="chkEPermanent_OnCheckedChanged" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEDesignation" runat="server" Text="Designation"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEDesignation" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblESalary" runat="server" Text="Salary"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtESalary" runat="server" CssClass="inputbox"></asp:TextBox>
                                <asp:DropDownList ID="ddlESalaryType" runat="server" CssClass="inputbox">
                                    <asp:ListItem Value="1" Text="Wages"></asp:ListItem>
                                    <asp:ListItem Value="2" Text="Salary"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEAutoIncentive" runat="server" Text="Auto Incentive"></asp:Label>
                            </td>
                            <td>
                                <asp:CheckBox ID="chkEAutoIncentive" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEESI" runat="server" Text="ESI"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEESI" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEPF" runat="server" Text="PF"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEPF" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <center>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return EditValidate();"
                                OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" /><br />
                            <asp:Label ID="lblUMsg" runat="server" Text=""></asp:Label>
                        </center>
                    </div>
                </asp:Panel>
                <asp:Button ID="btnDummy2" runat="server" Style="display: none" />
                <asp:ModalPopupExtender ID="mpeDelete" runat="server" BackgroundCssClass="modalbackground"
                    CancelControlID="btnCancelDel" DropShadow="True" PopupControlID="PanelDelete"
                    TargetControlID="btnDummy2">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelDelete" runat="server" BackColor="Gray" ForeColor="Black" Style="display: none"
                    Height="100px" Width="250px">
                    <asp:Panel ID="PanelDeleteTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25">
                        <b>Delete Employee</b>
                    </asp:Panel>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    Are You Delete this Employee?
                                </td>
                            </tr>
                        </table>
                    </center>
                    <div>
                        <center>
                            <asp:Button ID="btnYes" runat="server" Text="Yes" OnClick="btnYes_Click" />
                            <asp:Button ID="btnCancelDel" runat="server" Text="No" />
                        </center>
                    </div>
                </asp:Panel>
                <asp:Button ID="btndummyupload" runat="server" Style="display: none;" />
                <asp:ModalPopupExtender ID="mpeEmplist" runat="server" BackgroundCssClass="modalbackground"
                    PopupControlID="PanelEmpList" CancelControlID="btnCancelEmp" Drag="True" DropShadow="True"
                    TargetControlID="btndummyupload">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelEmpList" runat="server" Style="display: none;" Height="110px"
                    Width="300px" BackColor="#8A8080" ForeColor="Black">
                    <asp:Panel ID="Panel1" runat="server" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                        Height="25px" Style="cursor: move; font-family: Tahoma; padding: 2px;">
                        <b>Employee List</b>
                    </asp:Panel>
                    <center>
                    </center>
                    <br />
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <br />
    <br />
    <div id="diverr">
        <asp:Label ID="lblErr" runat="server" ForeColor="Red"></asp:Label>
    </div>
</asp:Content>
