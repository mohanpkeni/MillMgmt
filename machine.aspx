<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="machine.aspx.cs" Inherits="MILLMGMT.machine" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += isUnitEmpty();
            summary += isDepartEmpty();
            summary += isMacEmpty();
            summary += isMacIDEmpty();

            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }
        function isUnitEmpty() {
            var Unit = document.getElementById("<%=ddlUnit.ClientID %>").value;
            if (Unit == 0) {
                return ("Please Select any Unit\n");
            }
            else {
                return "";
            }
        }
        function isDepartEmpty() {
            var Depart = document.getElementById("<%=ddlDepart.ClientID %>").value;
            if (Depart == 0) {
                return ("Please Select any Department\n");
            }
            else {
                return "";
            }
        }
        function isMacEmpty() {
            var Mac = document.getElementById("<%=txtMachine.ClientID %>").value;
            if (Mac == "") {
                return ("Please Enter Machine Name\n");
            }
            else {
                return "";
            }
        }
        function isMacIDEmpty() {
            var MacID = document.getElementById("<%=txtMachineID.ClientID %>").value;
            if (MacID == "") {
                return ("Please Enter Machine ID\n");
            }
            else {
                return "";
            }
        }
        function ValidateEdit() {
            var summary = "";
            summary += EUnit();
            summary += emachinename();
            summary += emachineID();
            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }
        function EUnit() {
            var eunit = document.getElementById('<%=ddlEUnit.ClientID %>').value;
            if (eunit == 0) {
                return "Please Select Unit\n";
            }
            else {
                return "";
            }
        }
        function emachinename() {
            var emachine = document.getElementById('<%=txtEMachine.ClientID %>').value;
            if (emachine == "") {
                return "Please Select Machine Name\n";
            }
            else {
                return "";
            }
        }
        function emachineID() {
            var emacID = document.getElementById('<%=txtEMachineID.ClientID %>').value;
            if (emacID == "") {
                return "Please Enter Machine ID\n";
            }
            else {
                return "";
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <center>
            <h3>
                MACHINE MANAGEMENT</h3>
        </center>
        <br />
        <%--<asp:Label ID="lbluser" runat="server"></asp:Label>--%>
    </div>
    <div>
        <asp:UpdatePanel ID="UpdatePanelMachine" runat="server">
            <ContentTemplate>
                <center>
                    <asp:Button ID="btnAdd" runat="server" Text="Add" /></center>
                <br />
                <asp:ModalPopupExtender ID="mpeAdd" runat="server" BackgroundCssClass="modalbackground"
                    CancelControlID="btnCancel" DropShadow="True" PopupControlID="PanelAdd" TargetControlID="btnAdd">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAdd" runat="server" BackColor="Gray" Height="200px" Style="display: none"
                    Width="350px" ForeColor="Black">
                    <asp:Panel ID="PanelTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                        Height="25">
                        <b>Add New</b>
                    </asp:Panel>
                    <table width="100%" style="padding: 5px">
                        <tr>
                            <td>
                                <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                            </td>
                            <td>
                                <%--<asp:TextBox ID="txtUnit" CssClass="inputbox" runat="server"></asp:TextBox>--%>
                                <asp:DropDownList ID="ddlUnit" runat="server" CssClass="inputbox" Width="170px" OnSelectedIndexChanged="ddlUnit_SelectedIndexChanged"
                                    AppendDataBoundItems="True" AutoPostBack="True">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblDepart" runat="server" Text="Department"></asp:Label>
                            </td>
                            <td>
                                <%--<asp:TextBox ID="txtDepartment" runat="server" CssClass="inputbox"></asp:TextBox>--%>
                                <asp:DropDownList ID="ddlDepart" runat="server" CssClass="inputbox" Width="170px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMachine" runat="server" Text="Machine"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMachine" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblMachineID" runat="server" Text="Machine ID"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtMachineID" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <center>
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClientClick="return Validate();"
                                OnClick="btnSave_Click" />
                            <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                        </center>
                    </div>
                </asp:Panel>
                <center>
                    <asp:GridView ID="gvMachnine" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                        OnPageIndexChanging="gvMachnine_PageIndexChanging" DataKeyNames="MID">
                        <AlternatingRowStyle BackColor="#FFFF66" />
                        <Columns>
                            <asp:BoundField DataField="MID" HeaderText="MID" >
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Unit" DataField="UName" >
                            <HeaderStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Department" DataField="DName" >
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="Machine" DataField="MacName" >
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                            <asp:BoundField HeaderText="MachineID" DataField="MacID" >
                            <ItemStyle HorizontalAlign="Left" />
                            </asp:BoundField>
                        </Columns>
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                    <br />
                    <br />
                </center>
                <asp:Button ID="btndummy" runat="server" Style="display: none;" />
                <asp:ModalPopupExtender ID="mpeEdit" runat="server" BackgroundCssClass="modalbackground"
                    CancelControlID="btnCancelEdit" DropShadow="True" PopupControlID="PanelEdit"
                    TargetControlID="btndummy">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelEdit" runat="server" BackColor="Gray" Height="200px" Style="display: none"
                    Width="350px" ForeColor="Black">
                    <asp:Panel ID="PanelEditTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                        Height="25">
                        <b>Edit</b>
                    </asp:Panel>
                    <table width="100%" style="padding: 5px">
                        <tr>
                            <td>
                                <asp:Label ID="lblEUnit" runat="server" Text="Unit"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEUnit" runat="server" AutoPostBack="true" CssClass="inputbox"
                                    OnSelectedIndexChanged="ddlEUnit_SelectedIndexChanged" Width="170px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEDepart" runat="server" Text="Department"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlEDepart" runat="server" CssClass="inputbox" Width="170px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEMachine" runat="server" Text="Machine"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEMachine" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Label ID="lblEMachineID" runat="server" Text="Machine ID"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtEMachineID" runat="server" CssClass="inputbox"></asp:TextBox>
                            </td>
                        </tr>
                    </table>
                    <div>
                        <center>
                            <asp:Button ID="btnEdit" runat="server" Text="Save" OnClientClick="return ValidateEdit();" />
                            <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" />
                        </center>
                    </div>
                </asp:Panel>
                <asp:Button ID="btndummy1" runat="server" Style="display: none;" />
                <asp:ModalPopupExtender ID="mpeDelete" runat="server" PopupControlID="PanelDelete"
                    CancelControlID="btnCancelDelete" TargetControlID="btndummy1" DropShadow="true"
                    BackgroundCssClass="modalbackground">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelDelete" runat="server" BackColor="Gray" ForeColor="Black" Height="130"
                    Width="350" Style="display: none">
                    <asp:Panel ID="PanelDeleteTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25">
                        <b>Delete</b>
                    </asp:Panel>
                    <div>
                        <p>
                            Are You Sure Want to Delete?
                        </p>
                        <br />
                        <center>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel" />
                        </center>
                    </div>
                </asp:Panel>
            </ContentTemplate>
        </asp:UpdatePanel>
        <br />
    </div>
    <div>
        <asp:Label ID="lblmsg" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
