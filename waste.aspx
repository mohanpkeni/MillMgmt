<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="waste.aspx.cs" Inherits="MILLMGMT.waste" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //        function tab(tab) {
        //            document.getElementById('tab1').style.display = 'none';
        //            document.getElementById('tab2').style.display = 'none';
        //            document.getElementById('tab3').style.display = 'none';
        //            document.getElementById('li_tab1').setAttribute("class", "");
        //            document.getElementById('li_tab2').setAttribute("class", "");
        //            document.getElementById('li_tab3').setAttribute("class", "");
        //            document.getElementById(tab).style.display = 'block';
        //            document.getElementById('li_' + tab).setAttribute("class", "active");
        //        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <center>
            <h3>
                WASTE MANAGEMENT
            </h3>
        </center>
        <br />
        <asp:Label ID="lbluser" runat="server"></asp:Label>
    </div>
    <div>
        <%-- <div id="Tabs">
            <ul>
                <li id="li_tab1" onclick="tab('tab1')"><a>FS Waste</a></li>
                <li id="li_tab2" onclick="tab('tab2')"><a>Other Waste</a></li>
                <li id="li_tab3" onclick="tab('tab3')"><a>Hard Waste</a></li>
            </ul>
            <div id="Content_Area">
                <div id="tab1">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblhardwaste" runat="server" Text="Hard Waste"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtHardwaste" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSavehw" runat="server" Text="Save" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tab2" style="display: none;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblFS" runat="server" Text="FS"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtFS" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSaveFS" runat="server" Text="Save" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="tab3" style="display: none;">
                    <table>
                        <tr>
                            <td>
                                <asp:Label ID="lblOtherWaste" runat="server" Text="Other Waste"></asp:Label>
                            </td>
                            <td>
                                <asp:TextBox ID="txtOtherWaste" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <asp:Button ID="btnSaveOW" runat="server" Text="Save" />
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>--%>
        <center>
            <table style="width: 500px">
                <tr>
                    <td align="center">
                        <asp:Label ID="lblType" runat="server" Text="Type"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="lblPresent" runat="server" Text="Present"></asp:Label>
                    </td>
                    <td align="center">
                        <asp:Label ID="lblAvailableWaste" runat="server" Text="Available Waste"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblHW" runat="server" Text="Hard Waste"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtHW" runat="server" Width="150px" CssClass="inputbox"></asp:TextBox>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblAvialHW" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblFS" runat="server" Text="FS Waste"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtFS" runat="server" Width="150px" CssClass="inputbox"></asp:TextBox>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblAvailFS" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td align="left">
                        <asp:Label ID="lblOtherWaste" runat="server" Text="Other Waste"></asp:Label>
                    </td>
                    <td align="left">
                        <asp:TextBox ID="txtOW" runat="server" Width="150px" CssClass="inputbox"></asp:TextBox>
                    </td>
                    <td align="left">
                        <asp:Label ID="lblAvailOW" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="3" align="center">
                        <asp:Button ID="btnSave" runat="server" Text="Save" />
                        &nbsp;<asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </center>
        <br />
    </div>
    <div>
        <asp:Label ID="lblErr" runat="server"></asp:Label>
    </div>
</asp:Content>
