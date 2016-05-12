<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="depart.aspx.cs" Inherits="MILLMGMT.depart" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="script/jquery-1.10.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function () {
            $('input.btnSave').click(function () {
                var txtdepartval = $('.txtDepart').val();
                if (txtdepartval == "") {
                    alert('Please Enter Department Name');
                    return false;
                }
               
            });
        });
        $(document).ready(function () {
            $('input.btnAssignSave').click(function () {
                var ddlUnitval = $('select.ddlUnit').val();
                var ddldepartval = $('select.ddlDepartment').val();
                if (ddlUnitval == 0) {
                    alert('Please Enter Unit');
                    return false;
                } else if (ddldepartval == 0) {
                    alert('Please Enter Department');
                    return false;
                }
            });
            $('input.btncancelassign').click(function () {
                $('select.ddlUnit').val(0);
                $('select.ddlDepartment').val(0);
            });
            $('input.btncancel').click(function () {
                $('.txtDepart').val('');
            });
        });
    </script>
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <center>
            <h3>
                DEPARTMENT MANAGEMENT</h3>
        </center>
        <br />
        <%--<asp:Label ID="lbluser" runat="server"></asp:Label>--%><br />
    </div>
    <div>
        <%--  <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>--%>
        <center>
            <table>
                <tr>
                    <td>
                        <asp:Button ID="btnAdd" runat="server" Text="Add Department" />
                    </td>
                    <td>
                        <asp:Button ID="btnAssign" runat="server" Text="Assign Unit" OnClick="btnAssign_Click" />
                    </td>
                </tr>
            </table>
        </center>
        <br />
        <br />
        <asp:ModalPopupExtender ID="mpeAdd" runat="server" BackgroundCssClass="modalbackground"
            CancelControlID="btnCancel" PopupControlID="panelAdd" TargetControlID="btnAdd"
            DropShadow="true">
        </asp:ModalPopupExtender>
        <asp:Panel ID="panelAdd" runat="server" Height="100px" Width="350px" Style="display: none"
            BackColor="gray" ForeColor="Black">
            <asp:Panel ID="PanelTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                Height="25">
                <b>Add New</b>
            </asp:Panel>
            <table width="100%" style="padding: 5px">
                <%--<tr>
                            <td>
                                <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                            </td>
                            <td>
                                <asp:DropDownList ID="ddlUnit" runat="server" Width="170px" CssClass="inputbox">
                                </asp:DropDownList>
                            </td>
                        </tr>--%>
                <tr>
                    <td>
                        <asp:Label ID="lblDepart" runat="server" Text="Department"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtDepart" runat="server" CssClass="inputbox txtDepart"></asp:TextBox>
                    </td>
                </tr>
            </table>
            <div>
                <center>
                    <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" CssClass="btnSave" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel"
                        CssClass="btncancel" />
                </center>
            </div>
        </asp:Panel>
        <asp:ModalPopupExtender ID="mpeAssign" runat="server" BackgroundCssClass="modalbackground"
            CancelControlID="btnAssignCancel" PopupControlID="PanelAssign" TargetControlID="btnAssign"
            DropShadow="true">
        </asp:ModalPopupExtender>
        <asp:Panel ID="PanelAssign" runat="server" Height="150px" Width="350px" Style="display: none"
            BackColor="gray" ForeColor="Black">
            <asp:Panel ID="PanelAssignTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="#CC9900"
                Height="25">
                <b>Assign Unit</b>
            </asp:Panel>
            <table width="100%" style="padding: 5px">
                <tr>
                    <td>
                        <asp:Label ID="lblUnit" runat="server" Text="Unit"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlUnit" runat="server" Width="170px" CssClass="inputbox ddlUnit">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblAssignDepart" runat="server" Text="Department"></asp:Label>
                    </td>
                    <td>
                        <asp:DropDownList ID="ddlDepartment" runat="server" Width="170px" CssClass="inputbox ddlDepartment">
                        </asp:DropDownList>
                    </td>
                </tr>
            </table>
            <div>
                <center>
                    <asp:Button ID="btnAssignSave" runat="server" Text="Save" OnClick="btnAssignSave_Click"
                        CssClass="btnAssignSave" />
                    <asp:Button ID="btnAssignCancel" runat="server" Text="Cancel" OnClick="btnAssignCancel_Click"
                        CssClass="btncancelassign" />
                </center>
            </div>
        </asp:Panel>
        <center>
            <asp:GridView ID="gvDepartmentList" runat="server" AutoGenerateColumns="False" AllowPaging="True"
                OnPageIndexChanging="gvDepartmentList_PageIndexChanging" Width="300px" 
                PageSize="30">
                <AlternatingRowStyle BackColor="#FFFF66" />
                <Columns>
                    <%--  <asp:TemplateField>
                              <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server">Edit</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton2" runat="server">Delete</asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>--%>
                    <asp:BoundField DataField="UName" HeaderText="Unit">
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DName" HeaderText="Department">
                        <ItemStyle HorizontalAlign="Left" />
                    </asp:BoundField>
                </Columns>
                <HeaderStyle BackColor="#666666" ForeColor="White" />
            </asp:GridView>
        </center>
        <%-- <asp:Button ID="btndummy" runat="server" Style="display: none;" />
                <asp:ModalPopupExtender ID="Editmpe" runat="server" PopupControlID="PanelEdit" CancelControlID="btncancelEdit"
                    TargetControlID="btndummy" DropShadow="true" BackgroundCssClass="modalbackground">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelEdit" runat="server" BackColor="Gray" ForeColor="Black" Height="300"
                    Width="350" Style="display: none">
                    <asp:Panel ID="PanelEditTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25">
                        <b>Edit</b>
                    </asp:Panel>
                    <center>
                        <table>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEUnit" runat="server" Text="Unit"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtUnit" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:Label ID="lblEDepart" runat="server" Text="Department"></asp:Label>
                                </td>
                                <td>
                                    <asp:TextBox ID="txtEDepart" runat="server"></asp:TextBox>
                                </td>
                            </tr>
                        </table>
                    </center>
                    <div>
                        <center>
                            <asp:Button ID="btnUpdate" runat="server" Text="Update" />
                            <asp:Button ID="btnCancelEdit" runat="server" Text="Cancel" />
                        </center>
                    </div>
                </asp:Panel>
                <asp:Button ID="btndummy1" runat="server" Style="display: none;" />
                <asp:ModalPopupExtender ID="Deletempe" runat="server" PopupControlID="PanelDelete"
                    CancelControlID="btnCancelDelete" TargetControlID="btndummy1" DropShadow="true"
                    BackgroundCssClass="modalbackground">
                </asp:ModalPopupExtender>
                <asp:Panel ID="PanelDelete" runat="server" BackColor="Gray" ForeColor="Black" Height="300"
                    Width="350" Style="display: none">
                    <asp:Panel ID="PanelDeleteTitle" runat="server" Style="cursor: move; font-family: Tahoma;
                        padding: 2px;" HorizontalAlign="Center" BackColor="Blue" ForeColor="White" Height="25">
                        <b>Delete</b>
                    </asp:Panel>
                    <div>
                        Are You Sure Want to Delete?<br />
                        <center>
                            <asp:Button ID="btnDelete" runat="server" Text="Delete" />
                            <asp:Button ID="btnCancelDelete" runat="server" Text="Cancel" />
                        </center>
                    </div>
                </asp:Panel>--%>
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
        <br />
    </div>
    <div>
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
