<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Customer.aspx.cs" Inherits="MILLMGMT.Customer" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    
    <script type="text/javascript">
        function Validate() {
            var summary = "";
            summary += NameVal();
            summary += PhoneVal();
            summary += AddressVal();
            summary += CityVal();
            summary += StateVal();
            summary += PostCodeVal();

            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                document.getElementById('#<%=btnSave.ClientID %>').disabled = true;
                return true;
            }
        }


        function NameVal() {
            var nameval = document.getElementById('<%=txtName.ClientID%>').value;
            if (nameval == "") {
                return "Please Enter Name\n";
            }
            else {
                return "";
            }
        }
        function PhoneVal() {
            var phone = document.getElementById('<%=txtPhone.ClientID%>').value;
            if (phone == "") {
                return "Please Enter Phone No\n";
            }
            else if (isNaN(phone)) {
                return "Contact is only Number\n";
            }
            else {
                return "";
            }
        }
        function AddressVal() {
            var add = document.getElementById('<%=txtAddress.ClientID%>').value;
            if (add == "") {
                return "Please Enter Address\n";
            }
            else {
                return "";
            }
        }
        function CityVal() {
            var city = document.getElementById('<%=txtCity.ClientID%>').value;
            if (city == "") {
                return "Please Enter City\n";
            }
            else {
                return "";
            }
        }
        function StateVal() {
            var state = document.getElementById('<%=txtState.ClientID%>').value;
            if (state == "") {
                return "Please Enter State\n";

            }
            else {
                return "";
            }
        }
        function PostCodeVal() {
            var postcode = document.getElementById('<%=txtPostCode.ClientID %>').value;
            if (postcode == "") {
                return "Please Enter Postal Code\n";
            }
            else if (isNaN(postcode)) {
                return "Postal Code only Number"
            }
            else {
                return "";
            }      
        }

        function EditValidate() {
            var summary = "";
            summary += ENameVal();
            summary += EAddressVal();
            summary += EPhoneVal();
            summary += ECityVal();
            summary += EPostalVal();

            if (summary != "") {
                alert(summary);
                return false;
            }
            else {
                return true;
            }
        }
        function ENameVal() {
            var ename = document.getElementById('<%=txtEName.ClientID%>').value;
            if (ename == "") {
                return "Please Enter Name\n";
            }
            else {
                return "";
            }
        }
        function EPhoneVal() {
            var ephone = document.getElementById('<%=txtEPhone.ClientID%>').value;
            if (ephone == "") {
                return "Please Enter Phone\n";
            }
            else if (isNaN(ephone)) {
                return "Contact is only Number";
            }
            else {
                return "";
            }
        }
        function EAddressVal() {
            var eAdddress = document.getElementById('<%=txtEAddress.ClientID %>').value;
            if (eAdddress == "") {
                return "Please Enter Address\n";
            }
            else {
                return "";
            }
        }

        function ECityVal() {
            var eCity = document.getElementById('<%=txtECity.ClientID %>').value;
            if (eCity == "") {
                return "Please Enter City\n";
            }
            else {
                return "";
            }
        }
        function EPostalVal() {
            var ePostalCode = document.getElementById('<%=txtEPostCode.ClientID%>').value;
            if (isNaN(ePostalCode)) {
                return "Post Code only Number";
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
                CUSTOMER MANAGEMENT
            </h3>
        </center>
        <br />
        <%--<asp:Label ID="lblUser" runat="server"></asp:Label>--%>
    </div>
    <div>
        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <center>
                    <asp:Button ID="btnAdd" runat="server" Text="New Customer" />
                </center>
                <asp:ModalPopupExtender ID="mpeAdd" runat="server" BackgroundCssClass="modalbackground"
                    PopupControlID="PanelAdd" TargetControlID="btnAdd" PopupDragHandleControlID="PanelAddTitle"
                    DropShadow="True">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelAdd" runat="server" Style="display: none;" BackColor="Gray" ForeColor="Black"
                    Height="290" Width="350">
                    <asp:Panel ID="PanelAddTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                        Height="25">
                        <b>Add Customer</b>
                    </asp:Panel>
                    <center>
                        <table width="100%" style="padding: 5">
                            <tr>
                                <td>
                                    <asp:Label ID="lblName" runat="server" Text="Name"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtName" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPhone" runat="server" Text="Phone No"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPhone" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblAddres" runat="server" Text="Address"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtAddress" runat="server" CssClass="inputbox" TextMode="MultiLine"
                                        Width="170px" Height="50px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblCity" runat="server" Text="City"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtCity" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblState" runat="server" Text="State"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtState" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblPostCode" runat="server" Text="Post Code"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtPostCode" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </center>
                    <div align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return Validate();" />
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" />
                    </div>
                </asp:Panel>
                <br />
                <center>
                    <asp:GridView ID="gvCustomer" runat="server" AutoGenerateColumns="False" DataKeyNames="CID"
                        Width="700px" AllowPaging="True" OnPageIndexChanging="gvCustomer_PageIndexChanging"
                        PageSize="20">
                        <AlternatingRowStyle BackColor="#FFFF66" />
                        <Columns>
                            <asp:BoundField DataField="CID" HeaderText="ID" Visible="False" />
                            <asp:BoundField DataField="CName" HeaderText="Name" />
                            <asp:BoundField DataField="CAddress" HeaderText="Address" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" OnClick="lnkEdit_Click">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkDelete" runat="server" OnClick="lnkDelete_Click">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <HeaderStyle BackColor="#666666" ForeColor="White" />
                    </asp:GridView>
                </center>
                <asp:Button ID="btnDummyEdit" runat="server" Style="display: none" />
                <asp:ModalPopupExtender ID="mpeEdit" runat="server" BackgroundCssClass="modalbackground"
                    CancelControlID="btnECancel" DropShadow="True" PopupControlID="PanelEdit" PopupDragHandleControlID="PanelEditTitle"
                    TargetControlID="btnDummyEdit">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelEdit" runat="server" Style="display: none;" BackColor="Gray"
                    ForeColor="Black" Height="290" Width="350">
                    <asp:Panel ID="PanelEditTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                        Height="25">
                        <b>Edit Customer</b>
                    </asp:Panel>
                    <center>
                        <table width="100%" style="padding: 5px">
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
                                    <asp:Label ID="lblEPhone" runat="server" Text="Phone"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEPhone" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEAddress" runat="server" Text="Address"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEAddress" runat="server" CssClass="inputbox" TextMode="MultiLine"
                                        Width="170px" Height="50px"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblECity" runat="server" Text="City"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtECity" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEState" runat="server" Text="State"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEState" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEPostCode" runat="server" Text="Postal Code"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEPostCode" runat="server" CssClass="inputbox"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </center>
                    <div align="center">
                        <asp:Button ID="btnUpdate" runat="server" Text="Update" OnClick="btnUpdate_Click"
                            OnClientClick="return EditValidate()" />
                        <asp:Button ID="btnECancel" runat="server" Text="Cancel" />
                    </div>
                </asp:Panel>
                <asp:Button ID="btnDummy2" runat="server" Style="display: none" />
                <asp:ModalPopupExtender ID="mpeDelete" runat="server" BackgroundCssClass="modalbackground"
                    CancelControlID="btnDCancel" DropShadow="True" PopupControlID="PanelDelete" PopupDragHandleControlID="PanelDeleteTitle"
                    TargetControlID="btnDCancel">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelDelete" runat="server" Style="display: none;" BackColor="Gray"
                    ForeColor="Black" Height="150" Width="300">
                    <asp:Panel ID="PanelDeleteTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                        Height="25">
                        <b>Delete Customer</b>
                    </asp:Panel>
                    <div>
                        <center>
                            <asp:Label ID="lblDelete" runat="server" Text="Are You Sure want to delete?"></asp:Label>
                            <br />
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" OnClick="btnDelete_Click" />
                            <asp:Button ID="btnDCancel" runat="server" Text="Cancel" />
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
