<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="dailyprocess.aspx.cs" Inherits="MILLMGMT.dailyprocess" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .hidden
        {
            display: none;
        }
    </style>
    <link href="style/ControlDesign.css" rel="stylesheet" type="text/css" />
    <script src="script/jquery-1.9.1.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.6.2/jquery.min.js"></script>
    <script type="text/javascript">
        //        $(document).ready(function () {
        //            $("[id$=btnSave]").click(function () {
        //                if ($("[id$=ddlUnit]").val() > 0 && $("[id$=ddlshift]").val() > 0) {
        //                    //Selected option from dropdownlist
        //                    return true;
        //                } else {
        //                    //Not selected so alert user to select any option
        //                    alert('Please select from the list.');
        //                    return false;
        //                }
        //            });
        //        });
        $(document).ready(function () {
            $("#btnSave").click(function () {
                if ($("#txtDate").val() == "") {
                    alert("Please Select Date");
                    return false;
                }
            })
        });
    </script>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript">
        $("[id*=chkHeader]").live("click", function () {
            var chkHeader = $(this);
            var grid = $(this).closest("table");
            $("input[type=checkbox]", grid).each(function () {
                if (chkHeader.is(":checked")) {
                    $(this).attr("checked", "checked");
                    $("td", $(this).closest("tr")).addClass("selected");
                } else {
                    $(this).removeAttr("checked");
                    $("td", $(this).closest("tr")).removeClass("selected");
                }
            });
        });
        $("[id*=chkRow]").live("click", function () {
            var grid = $(this).closest("table");
            var chkHeader = $("[id*=chkHeader]", grid);
            if (!$(this).is(":checked")) {
                $("td", $(this).closest("tr")).removeClass("selected");
                chkHeader.removeAttr("checked");
            } else {
                $("td", $(this).closest("tr")).addClass("selected");
                if ($("[id*=chkRow]", grid).length == $("[id*=chkRow]:checked", grid).length) {
                    chkHeader.attr("checked", "checked");
                }
            }
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContentPlaceHolder" runat="server">
    <div>
        <div>
            <center>
                <table width="100%">
                    <tr>
                        <td style="width: 90%; text-align: center;">
                            <h3>
                                EMPLOYEE SELECTION
                            </h3>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
            <%-- <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />--%>
        </div>
        <div>
            <center>
                <table style="width: 400px">
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblDate" runat="server" Text="Date" Width="100px"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                                <ContentTemplate>
                                    <asp:TextBox ID="txtDate" runat="server" CssClass="inputbox" Width="150px" 
                                        AutoPostBack="true"></asp:TextBox>
                                    <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True" TargetControlID="txtDate" Format="dd/MM/yyyy" PopupPosition="Right">
                                    </asp:CalendarExtender>
                                </ContentTemplate>
                            </asp:UpdatePanel>
                        </td>
                    </tr>
                    <%-- <asp:BoundField DataField="Duration" HeaderText="Duration" />
                        <asp:BoundField DataField="ShiftId" HeaderText="Shift" />
                        <asp:BoundField DataField="Present" HeaderText="Present" />
                        <asp:BoundField DataField="Absent" HeaderText="Absent" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="StatusCode" HeaderText="Status Code" />--%>
                    <tr>
                        <td align="left">
                            <asp:Label ID="lblFileUpload" runat="server" Text="Select File"></asp:Label>
                        </td>
                        <td align="left">
                            <asp:FileUpload ID="FileUpload1" runat="server" Width="150px" />
                        </td>
                    </tr>
                    <tr>
                        <td>
                        </td>
                        <td align="center">
                            <table width="100%">
                                <tr>
                                    <td align="center">
                                        <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                                    </td>
                                    <td align="center">
                                        <asp:Button ID="btnReport" runat="server" Text="Report" OnClick="btnReport_Click" />
                                    </td>
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <%-- <asp:BoundField DataField="EmployeeId" HeaderText="Employee ID">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>--%>
                    <%--  <HeaderTemplate>
                                 <asp:CheckBox ID="chkHeader" runat="server" />
                            </HeaderTemplate>--%>
                </table>
            </center>
            <br />
        </div>
        <div>
            <center>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                    <ContentTemplate>
                        <asp:GridView ID="gvEmployee" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                            OnRowDataBound="dlDepartment_RowDataBound" Width="1000px" PageSize="250">
                            <Columns>
                                <%-- <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" />--%>
                                <%-- <asp:BoundField DataField="Duration" HeaderText="Duration" />
                        <asp:BoundField DataField="ShiftId" HeaderText="Shift" />
                        <asp:BoundField DataField="Present" HeaderText="Present" />
                        <asp:BoundField DataField="Absent" HeaderText="Absent" />
                        <asp:BoundField DataField="Status" HeaderText="Status" />
                        <asp:BoundField DataField="StatusCode" HeaderText="Status Code" />--%>
                                <asp:BoundField DataField="AttendanceDate" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <%-- <asp:BoundField DataField="EmployeeId" HeaderText="Employee ID">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>--%>
                                <asp:BoundField DataField="EmployeeID" HeaderText="Employee ID">
                                    <HeaderStyle CssClass="hidden" />
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" CssClass="hidden" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Employee Code">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEmpCode" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="EmployeeName">
                                    <ItemTemplate>
                                        <asp:Label ID="lblEName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="InTime" HeaderText="In Time">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:BoundField DataField="OutTime" HeaderText="Out Time">
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:BoundField>
                                <asp:TemplateField HeaderText="Worked Hours">
                                    <ItemTemplate>
                                        <asp:Label ID="lblWT" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Shift">
                                    <ItemTemplate>
                                        <asp:Label ID="lblShift" runat="server"></asp:Label>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Unit">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="ddlUnit" runat="server" CssClass="inputbox">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Department">
                                    <ItemTemplate>
                                        <asp:DropDownList ID="dlDepartment" runat="server" CssClass="inputbox">
                                            <asp:ListItem Text="Select" Value="0"></asp:ListItem>
                                        </asp:DropDownList>
                                    </ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="OT Approval">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkRow" runat="server" Enabled="false" />
                                    </ItemTemplate>
                                    <%--  <HeaderTemplate>
                                 <asp:CheckBox ID="chkHeader" runat="server" />
                            </HeaderTemplate>--%>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                <%--  <HeaderTemplate>
                                 <asp:CheckBox ID="chkHeader" runat="server" />
                            </HeaderTemplate>--%>
            </center>
            <br />
            <br />
        </div>
        <div>
            <center>
                <table width="300px">
                    <tr>
                        <td align="center">
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Width="100px" />
                        </td>
                    </tr>
                    <tr>
                        <td align="right">
                            <asp:Button ID="btnBlowRoom" runat="server" Text="Blow Room  >>" PostBackUrl="blowroom.aspx"
                                Width="120px" />
                        </td>
                    </tr>
                </table>
            </center>
            <br />
        </div>
        <div>
            <asp:Label ID="lblErr" runat="server"></asp:Label>
        </div>
    </div>
</asp:Content>
