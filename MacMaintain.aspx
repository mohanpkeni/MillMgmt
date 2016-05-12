<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="MacMaintain.aspx.cs" Inherits="MILLMGMT.MacMaintain" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += DateVal();
            summary += UnitVal();
            summary += DepartVal();
            summary += MachineVal();
            summary += MachineIDVal();
            summary += ServiceVal();
            summary += AmountVal();

            if (summary != "") {
                alert(summary); return false;
            } else {
                return true;
            }
        }
        function DateVal() {
            var date = document.getElementById('<%=txtDate.ClientID%>').value;
            if (date == "") {
                return "Please Select Date\n";
            }
            else {
                return "";
            }
        }
        function UnitVal() {
            var Unit = document.getElementById('<%=ddlUnit.ClientID%>').value;
            if (Unit == 0) {
                return "Please Select Unit\n";
            }
            else {
                return "";
            }
        }
        function DepartVal() {
            var Depart = document.getElementById('<%=ddlDepart.ClientID %>').value;
            if (Depart == 0) {
                return "Please Select Department\n";
            } else {
                return "";
            }
        }

        function MachineVal() {
            var Machine = document.getElementById('<%=ddlMachine.ClientID %>').value;
            if (Machine == 0) {
                return "Please Select Machine\n";
            }
            else {
                return "";
            }
        }

        function MachineIDVal() {
            var machineid = document.getElementById('<%=ddlmachineID.ClientID%>').value;
            if (machineid == 0) {
                return "Please Select MachineID\n";
            }
            else {
                return "";
            }
        }

        function ServiceVal() {
            var service = document.getElementById('<%=txtService.ClientID%>').value;
            if (service == "") {
                return "Please Enter Service Details\n";
            }
            else {
                return "";
            }
        }
        function AmountVal() {
            var amount = document.getElementById('<%=txtAmount.ClientID%>').value;
            if (amount == "") {
                return "Please Enter Amount\n";
            }
            else {
                return "";
            }

        }



    </script>

    <script type="text/javascript">
        function EditValidate() {
            var summary = "";
            summary += DateEVal();
            summary += UnitEVal();
            summary += DepartEVal();
            summary += MachineEVal();
            summary += MachineIDEVal();
            summary += ServiceEVal();
            summary += AmountEVal();

            if (summary != "") {
                alert(summary); return false;
            } else {
                return true;
            }
        }
        function DateEVal() {
            var date = document.getElementById('<%=txtDateEdit.ClientID%>').value;
            if (date == "") {
                return "Please Select Date\n";
            }
            else {
                return "";
            }
        }
        function UnitEVal() {
            var Unit = document.getElementById('<%=ddlUnitEdit.ClientID%>').value;
            if (Unit == 0) {
                return "Please Select Unit\n";
            }
            else {
                return "";
            }
        }
        function DepartEVal() {
            var Depart = document.getElementById('<%=ddlDepartmentEdit.ClientID %>').value;
            if (Depart == 0) {
                return "Please Select Department\n";
            } else {
                return "";
            }
        }

        function MachineEVal() {
            var Machine = document.getElementById('<%=ddlmachineEdit.ClientID %>').value;
            if (Machine == 0) {
                return "Please Select Machine\n";
            }
            else {
                return "";
            }
        }

        function MachineIDEVal() {
            var machineid = document.getElementById('<%=ddlMachineIDEdit.ClientID%>').value;
            if (machineid == 0) {
                return "Please Select MachineID\n";
            }
            else {
                return "";
            }
        }

        function ServiceEVal() {
            var service = document.getElementById('<%=txtServiceEdit.ClientID%>').value;
            if (service == "") {
                return "Please Enter Service Details\n";
            }
            else {
                return "";
            }
        }
        function AmountEVal() {
            var amount = document.getElementById('<%=txtAmountEdit.ClientID%>').value;
            if (amount == "") {
                return "Please Enter Amount\n";
            }
            else {
                return "";
            }

        }
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
        <table width="100%">
            <tr>
                <td>
                    <center>
                        <h3>
                            MACHINE MAINTENANCE</h3>
                    </center>
                </td>
            </tr>
        </table>
        <%--<asp:Label ID="lbluser" runat="server"></asp:Label>--%>
    </div>
    <div style="float: left; width: 60%">
        <table style="height: 100%; width: 100%;">
            <tr>
                <td align="left">
                    <asp:Label ID="lblDate" runat="server" Text="Date"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox" Width="200px"></asp:TextBox>
                    <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                        CssClass="size" Format="dd/MM/yyyy" TargetControlID="txtDate" 
                        PopupPosition="Right">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddlUnit" runat="server" Width="200px" CssClass="inputbox" AutoPostBack="True"
                        OnSelectedIndexChanged="ddlUnit_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblDepart" runat="server" Text="Department"></asp:Label>
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddlDepart" runat="server" Width="198px" CssClass="inputbox"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlDepart_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblMachine" runat="server" Text="Machine"></asp:Label>
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddlMachine" runat="server" Width="200px" CssClass="inputbox"
                        AutoPostBack="True" OnSelectedIndexChanged="ddlMachine_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblMachineID" runat="server" Text="Machine ID"></asp:Label>
                </td>
                <td align="left">
                    <asp:DropDownList ID="ddlmachineID" runat="server" Width="200px" CssClass="inputbox">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblService" runat="server" Text="Servcie"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtService" runat="server" Width="200px" CssClass="inputbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtAmount" runat="server" Width="200px" CssClass="inputbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblParticular" runat="server" Text="Particular"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtParticular" runat="server" TextMode="MultiLine" Height="75px"
                        CssClass="inputbox" Width="200px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblNxtSerDate" runat="server" Text="Next Service Date"></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtNxtSerDate" runat="server" Width="200px" CssClass="inputbox"></asp:TextBox>
                    <asp:CalendarExtender ID="txtNxtSerDate_CalendarExtender" runat="server" Enabled="True"
                        CssClass="size" TargetControlID="txtNxtSerDate" Format="dd/MM/yyyy" PopupPosition="Right"
                        Animated="True">
                    </asp:CalendarExtender>
                </td>
            </tr>
            <tr>
                <td align="left">
                    <asp:Label ID="lblSerFor" runat="server" Text="Service Alert For "></asp:Label>
                </td>
                <td align="left">
                    <asp:TextBox ID="txtSerFor" runat="server" TextMode="MultiLine" Width="200px" Height="75px"
                        CssClass="inputbox"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="100px"
                        OnClientClick="return Validate()" />
                </td>
            </tr>
        </table>
    </div>
    <div style="float: left; width: 40%;">
        <table style="height: 414px; width: 100%">
            <tr style="height: 35px">
                <td>
                    <asp:Label ID="lblUnits" runat="server" Text="Unit"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlUnits" runat="server" AutoPostBack="True" CssClass="inputbox"
                        OnSelectedIndexChanged="ddlUnits_SelectedIndexChanged" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="height: 35px">
                <td>
                    <asp:Label ID="lblDepartments" runat="server" Text="Departments"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlDepartments" runat="server" AutoPostBack="True" CssClass="inputbox"
                        OnSelectedIndexChanged="ddlDepartments_SelectedIndexChanged" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="height: 35px">
                <td>
                    <asp:Label ID="lblMachineList" runat="server" Text="Machine"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="ddlMachineList" runat="server" AutoPostBack="True" CssClass="inputbox"
                        OnSelectedIndexChanged="ddlMachineList_SelectedIndexChanged" Width="150px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr style="height: 100%; width: 100%;">
                <td colspan="2" align="center" style="top: 2px;vertical-align:top;">
                    <asp:GridView ID="gvMachineServicesList" runat="server" AutoGenerateColumns="False"
                        Height="100%" Width="100%" DataKeyNames="ID">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID">
                                <HeaderStyle CssClass="hidden" />
                                <ItemStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Date" DataField="Date" />
                            <asp:BoundField HeaderText="Machine ID" DataField="MacID" />
                            <asp:BoundField HeaderText="Service" DataField="ServicePart" />
                            <asp:BoundField HeaderText="Amount" DataField="Amount" />
                            <asp:BoundField HeaderText="Particular" DataField="Description" />
                            <asp:BoundField HeaderText="Next Service Date" DataField="NextServiceDate" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnEdit" runat="server" OnClick="btnEdit_Click">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" OnClick="btnDelete_Click">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:Button ID="btnDummy" runat="server" Style="display: none" />
                <asp:ModalPopupExtender ID="mpeEidt" runat="server" PopupControlID="PanelEdit" BackgroundCssClass="modalbackground" CancelControlID = "btnCancelEdit"
                    DropShadow="true" TargetControlID="btnDummy">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelEdit" runat="server" BackColor="Gray" ForeColor="Black" Height="450"
                    Width="400" Style="display: none">
                    <asp:Panel ID="PanelEditTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25">
                        <b>Maintenance </b>
                    </asp:Panel>
                    <table width="100%" style="padding: 5px">
                        <tr>
                            <td>
                                <asp:Label ID="lblDateEdit" runat="server" Text="Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtDateEdit" runat="server" CssClass="inputbox"></asp:TextBox>
                                <asp:CalendarExtender ID="txtDateEdit_Calendar" runat="server" Format="dd/MM/yyyy"
                                    TargetControlID="txtDateEdit">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblUnitEdit" runat="server" Text="Unit"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlUnitEdit" runat="server" CssClass="inputbox" AutoPostBack="true"
                                    Width="180px" OnSelectedIndexChanged="ddlUnit1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDepatmentEdit" runat="server" Text="Department"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlDepartmentEdit" runat="server" CssClass="inputbox" Width="180px"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlDepart1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMac" runat="server" Text="Machine"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlmachineEdit" runat="server" CssClass="inputbox" Width="180px"
                                    AutoPostBack="True" OnSelectedIndexChanged="ddlMachine1_SelectedIndexChanged">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMachineIDEdit" runat="server" Text="Machine ID"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlMachineIDEdit" runat="server" CssClass="inputbox" Width="180px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblServiceEdit" runat="server" Text="Service "></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtServiceEdit" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblAmountEdit" runat="server" Text="Amount"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtAmountEdit" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblParticularEdit" runat="server" Text="Particular"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtParticularEdit" runat="server" CssClass="inputbox" TextMode="MultiLine" Width="150px"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblNextServiceDateEdit" runat="server" Text="Next Service Date"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtNextServiceDateEdit" runat="server"></asp:TextBox>
                                <asp:CalendarExtender ID="txtNextServiceDateEdit_Calendar" runat="server" TargetControlID="txtNextServiceDateEdit"
                                    Format="dd/MM/yyyy" Enabled="true">
                                </asp:CalendarExtender>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblServicesAlert" runat="server" Text="Services Alert For"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtServicesAlert" TextMode="MultiLine" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <center>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClientClick="return EditValidate();"
                                OnClick="btnUpdate_Click" />
                            <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" />
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
                        <b>Delete Maintenance</b>
                    </asp:Panel>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    Are You Delete this Maintenance?
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
            </ContentTemplate>
        </asp:UpdatePanel>
    </div>
    <div>
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
