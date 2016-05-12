<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="wages.aspx.cs" Inherits="MILLMGMT.wages" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.6.4/jquery.min.js"></script>
    <link rel="stylesheet" type="text/css" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8.22/themes/redmond/jquery-ui.css" />
    <script src="script/jquery.ptTimeSelect.js" type="text/javascript"></script>
    <link href="style/jquery.ptTimeSelect.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#<%=btnSave.ClientID%>").click(function () {
                var txtshiftval = $("#<%=txtShift.ClientID%>").val();
                var txtFromval = $("#<%=txtFrom.ClientID%>").val();
                var txtToval = $("#<%=txtTo.ClientID%>").val();
                if (txtshiftval == "") {
                    alert('Enter Shift ID');
                    return false;
                } else if (txtFromval == "") {
                    alert('Enter From Time');
                    return false;
                } else if (txtToval == "") {
                    alert('Enter To Time');
                    return false;
                }

                if (txtshiftval != "" && txtFromval != "" && txtToval != "") {
                    $('#<%=btnSave.ClientID %>').one('click', 'disabled', true);
                    return true;
                }
            });
            $('#<%=txtFrom.ClientID %>').focusout(function () {
                var fromtime = $('#<%=txtFrom.ClientID %>').val();
                if (fromtime.length != 0) {
                    var validTime = /^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])(:([0-5]?[0-9]))?$/i.test(fromtime);
                    if (!validTime) {
                        alert('Entered From Time Format is In Valid.\nPlease Enter Correct Format(HH:MM AM/PM)');
                        $('#<%=txtFrom.ClientID %>').val('');
                        $('#<%=txtFrom.ClientID %>').focus();
                        return false;
                    }
                }
            });
            $('#<%=txtTo.ClientID %>').focusout(function () {
                var Totime = $('#<%=txtTo.ClientID %>').val();
                if (Totime.length != 0) {
                    var validTime = /^(([0-1]?[0-9])|([2][0-3])):([0-5]?[0-9])(:([0-5]?[0-9]))?$/i.test(Totime);
                    if (!validTime) {
                        alert('Entered From Time Format is In Valid.\nPlease Enter Correct Format(HH:MM AM/PM)');
                        $('#<%=txtTo.ClientID %>').val('');
                        $('#<%=txtTo.ClientID %>').focus();
                        return false;
                    }
                }
            });
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div id="dheading">
        <center>
            <h3>
                CONE DEPARTMENT</h3>
        </center>
        <br />
    </div>
    <div id="dcontent1">
        <%--<center>
            <table>
                <tr>
                    <td>
                        <asp:Label ID="lblPerShift" runat="server" Text="For One Shift Rs."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPerShift" runat="server" CssClass="inputbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="lblPerCone" runat="server" Text="For One Cone Rs."></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtPerCone" runat="server" CssClass="inputbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" OnClientClick="return Validate();" />
                    </td>
                </tr>
            </table>
        </center>--%>
        <div id="shiftid">
            <center>
                <table>
                    <tr>
                        <td>
                            <div id="Div5" class="ui-widget-content" style="padding: 0.5em">
                                <asp:Label ID="lblShift" runat="server" Text="Shift"></asp:Label></div>
                        </td>
                        <td>
                            <div id="Div6" class="ui-widget-content" style="padding: 0.5em">
                                <asp:TextBox ID="txtShift" runat="server" CssClass="inputbox"></asp:TextBox>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="Div1" class="ui-widget-content" style="padding: 0.5em">
                                <asp:Label ID="lblFrom" runat="server" Text="From"></asp:Label></div>
                        </td>
                        <td>
                            <div id="sample1" class="ui-widget-content" style="padding: 0.5em">
                                <asp:TextBox ID="txtFrom" runat="server" CssClass="inputbox"></asp:TextBox></div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="Div2" class="ui-widget-content" style="padding: 0.5em">
                                <asp:Label ID="lblTo" runat="server" Text="To"></asp:Label></div>
                        </td>
                        <td>
                            <div id="sample" class="ui-widget-content" style="padding: 0.5em">
                                <asp:TextBox ID="txtTo" runat="server" CssClass="inputbox"></asp:TextBox></div>
                        </td>
                    </tr>
                   <%-- <tr>
                        <td>
                            <div id="Div3" class="ui-widget-content" style="padding: 0.5em">
                                <asp:Label ID="lblAmount" runat="server" Text="Amount"></asp:Label></div>
                        </td>
                        <td>
                            <div id="Div4" class="ui-widget-content" style="padding: 0.5em">
                                <asp:TextBox ID="txtAmount" runat="server" CssClass="inputbox"></asp:TextBox></div>
                        </td>
                    </tr>--%>
                    <tr>
                        <td colspan="2">
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" 
                                            style="margin-left: 0px" />
                                        <asp:Button ID="btnUpdate" runat="server" onclick="btnUpdate_Click" 
                                            Text="Update" Visible="False" />
                                    </td>
                                   <%-- <td align="center">
                                        <asp:Button ID="btnUpdate" runat="server" Visible="false" Text="Update" OnClick="btnUpdate_Click" />
                                    </td>
                                    <td align="center">
                                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                                    </td>--%>
                                </tr>
                            </table>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
        </div>
    </div>
    <div id="dgridcontent">
        <center>
            <asp:GridView ID="gvWage" runat="server" AutoGenerateColumns="False" Width="400px"
                DataKeyNames="ID">
                <AlternatingRowStyle BackColor="#FFFF66" />
                <Columns>
                    <%-- <asp:BoundField HeaderText="Rs /Shift" DataField="WageShift" />--%>
                    <asp:BoundField HeaderText="ID" DataField="ID" Visible="False" />
                    <asp:BoundField HeaderText="Shift" DataField="SCShift" />
                    <asp:BoundField HeaderText="From" DataField="SCFrom" />
                    <asp:BoundField HeaderText="To" DataField="SCTo" />
                    <%--<asp:BoundField HeaderText="Rs /Cone" DataField="Amount" />--%>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" OnClick="lnkEdit_Click">Edit</asp:LinkButton></ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkDelete" runat="server" OnClick="lnkDelete_Click">Delete</asp:LinkButton></ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <HeaderStyle BackColor="#666666" ForeColor="White" />
            </asp:GridView>
        </center>
        <br />
    </div>
    <script type="text/javascript">
        $(document).ready(function () {
            $('#sample1 input').ptTimeSelect();
            $('#sample input').ptTimeSelect();
        });
    </script>
</asp:Content>
