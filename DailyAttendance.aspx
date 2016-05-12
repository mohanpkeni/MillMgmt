<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="DailyAttendance.aspx.cs" Inherits="MILLMGMT.DailyAttendance" %>

<%@ Register Assembly="TimePicker" Namespace="MKB.TimePicker" TagPrefix="MKB" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="script/jquery-1.11.3.min.js" type="text/javascript"></script>
    <script src="DateTimePicker/jquery.js" type="text/javascript"></script>
    <link href="DateTimePicker/jquery.datetimepicker.css" rel="stylesheet" type="text/css" />
    <script src="DateTimePicker/jquery.datetimepicker.full.min.js" type="text/javascript"></script>
    <script src="DateTimePicker/moment.js" type="text/javascript"></script>
    <script src="DateTimePicker/jquery.validate.js" type="text/javascript"></script>
    <%--  <script type="text/javascript">
        $(document).ready(function () {
            $('input.datemask').datetimepicker({ format: 'Y-m-d h:m a', startDate: new Date(), step: 30 });
        });
    </script>--%>
    <link href="TimePicker/jquery.timepicker.min.css" rel="stylesheet" type="text/css" />
    <script src="TimePicker/jquery.timepicker.min.js" type="text/javascript"></script>
    <script src="DatePair/Datepair.js" type="text/javascript"></script>
    <script src="DatePair/jquery.datepair.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ConvertMinutesToHours(n) {
            var minutes = n % 60
            var hours = (n - minutes) / 60
            return (hours + ":" + minutes);
        }

        $(document).ready(function () {
            $('.InTime').timepicker({ interval: 30 });
            $('.OutTime').timepicker({ interval: 30 });

            $('.OutTime').focusout(function () {
                var currentRow = $(this).closest('tr');
                var InTimeStr = currentRow.find('.InTime').val();
                var OutTimeStr = currentRow.find('.OutTime').val();
                if (InTimeStr != '' && OutTimeStr != '') {
                    var InTime = moment(InTimeStr, 'HH:mm a');
                    var OutTime = moment(OutTimeStr, 'HH:mm a');

                    var InAMPM = InTimeStr.match(/\s(.*)$/)[1];
                    var OutAMPM = OutTimeStr.match(/\s(.*)$/)[1];

                    var InTime24 = ConvertTimeformat("24", InTimeStr);
                    var OutTime24 = ConvertTimeformat("24", OutTimeStr);

                    var starttime = moment(GetToday(1) + ' ' + InTime24);
                    var endtime = moment(GetToday(1) + ' ' + OutTime24)
                    var endtimetomorow = moment(GetToday(2) + ' ' + OutTime24);
                    var ddlDepartmentValue = currentRow.find('select.ddldepartment').val();

                    if (InAMPM == "AM" && OutAMPM == "AM") {
                        if (moment(starttime).isBefore(endtime)) {
                            var duration = moment.duration(endtime.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                            alert(duration + ' ' + totalMins + ' ' + totalHrs + '' + TotalWorkingHours);
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeminutes = totalMins - regShift;

                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTWorkingTimeHours = ConvertMinutesToHours(OTTimeminutes);

                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTWorkingTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }
                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {
                                    var CWOTTimeMinutes = totalMins - CWRegShift;

                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var CWOTHours = ConvertMinutesToHours(CWOTTimeMinutes);

                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(CWOTHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }
                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                    else if (InAMPM == "PM" && OutAMPM == "PM") {
                        if (moment(starttime).isBefore(endtime)) {
                            var duration = moment.duration(endtime.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins)
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeMinutes = totalMins - regShift;

                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes);

                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }
                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {
                                    var CWOTTimeMinutes = totalMins - CWRegShift;
                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var OTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }

                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                    else if (InAMPM == "AM" && OutAMPM == "PM") {
                        if (moment(starttime).isBefore(endtime)) {
                            var duration = moment.duration(endtime.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeMinutes = totalMins - regShift;
                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes)
                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }
                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {

                                    var CWOTTimeMinutes = totalMins - CWRegShift;
                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var CWOTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(CWOTTimeHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }
                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                    else {
                        if (moment(starttime).isBefore(endtimetomorow)) {
                            var duration = moment.duration(endtimetomorow.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeMinutes = totalMins - regShift;

                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes);

                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }

                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {
                                    var CWOTTimeMinutes = totalMins - CWRegShift;

                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var CWOTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(CWOTTimeHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }

                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                }
            });

            $('.InTime').focusout(function () {
                var currentRow = $(this).closest('tr');
                var InTimeStr = currentRow.find('.InTime').val();
                var OutTimeStr = currentRow.find('.OutTime').val();
                if (InTimeStr != '' && OutTimeStr != '') {
                    var InTime = moment(InTimeStr, 'HH:mm a');
                    var OutTime = moment(OutTimeStr, 'HH:mm a');

                    var InAMPM = InTimeStr.match(/\s(.*)$/)[1];
                    var OutAMPM = OutTimeStr.match(/\s(.*)$/)[1];

                    var InTime24 = ConvertTimeformat("24", InTimeStr);
                    var OutTime24 = ConvertTimeformat("24", OutTimeStr);

                    var starttime = moment(GetToday(1) + ' ' + InTime24);
                    var endtime = moment(GetToday(1) + ' ' + OutTime24)
                    var endtimetomorow = moment(GetToday(2) + ' ' + OutTime24);
                    var ddlDepartmentValue = currentRow.find('select.ddldepartment').val();

                    if (InAMPM == "AM" && OutAMPM == "AM") {
                        if (moment(starttime).isBefore(endtime)) {
                            var duration = moment.duration(endtime.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                            alert(duration + ' ' + totalMins + ' ' + totalHrs + '' + TotalWorkingHours);
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeminutes = totalMins - regShift;

                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTWorkingTimeHours = ConvertMinutesToHours(OTTimeminutes);

                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTWorkingTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }
                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {
                                    var CWOTTimeMinutes = totalMins - CWRegShift;

                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var CWOTHours = ConvertMinutesToHours(CWOTTimeMinutes);

                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(CWOTHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }
                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                    else if (InAMPM == "PM" && OutAMPM == "PM") {
                        if (moment(starttime).isBefore(endtime)) {
                            var duration = moment.duration(endtime.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins)
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeMinutes = totalMins - regShift;

                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes);

                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }
                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {
                                    var CWOTTimeMinutes = totalMins - CWRegShift;
                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var OTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }

                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                    else if (InAMPM == "AM" && OutAMPM == "PM") {
                        if (moment(starttime).isBefore(endtime)) {
                            var duration = moment.duration(endtime.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeMinutes = totalMins - regShift;
                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes)
                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }
                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {

                                    var CWOTTimeMinutes = totalMins - CWRegShift;
                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var CWOTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(CWOTTimeHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }
                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                    else {
                        if (moment(starttime).isBefore(endtimetomorow)) {
                            var duration = moment.duration(endtimetomorow.diff(starttime));
                            var totalMins = duration.asMinutes();
                            var totalHrs = duration.asHours();
                            var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                            currentRow.find('.workedhrs').val(TotalWorkingHours);
                            var currentRows = $(this).closest('tr');
                            if (!(ddlDepartmentValue == 6)) {
                                var regShift = 480;
                                if (totalMins > regShift) {
                                    var OTTimeMinutes = totalMins - regShift;

                                    var regShiftHrs = ConvertMinutesToHours(regShift);
                                    var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes);

                                    currentRows.find('.regHrs').val(regShiftHrs);
                                    currentRows.find('.OTHrs').val(OTTimeHours);
                                }
                                else {
                                    currentRows.find('.regHrs').val(TotalWorkingHours);
                                    currentRows.find('.OTHrs').val('00:00');
                                }
                            }

                            else {
                                var CWRegShift = 720;
                                if (totalMins > CWRegShift) {
                                    var CWOTTimeMinutes = totalMins - CWRegShift;

                                    var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                    var CWOTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                    currentRow.find('.regHrs').val(CWRegShiftHrs);
                                    currentRow.find('.OTHrs').val(CWOTTimeHours);
                                }
                                else {
                                    currentRow.find('.regHrs').val(TotalWorkingHours);
                                    currentRow.find('.OTHrs').val('00:00');
                                }
                            }

                        }
                        else {
                            alert('Start Time must be Eariler than End Time');
                        }
                    }
                }
            });

        });


        function ConvertTimeformat(format, str) {
            var time = str;
            var hours = Number(time.match(/^(\d+)/)[1]);
            var minutes = Number(time.match(/:(\d+)/)[1]);
            var AMPM = time.match(/\s(.*)$/)[1];
            if (AMPM == "PM" && hours < 12) hours = hours + 12;
            if (AMPM == "AM" && hours == 12) hours = hours - 12;
            var sHours = hours.toString();
            var sMinutes = minutes.toString();
            if (hours < 10) sHours = "0" + sHours;
            if (minutes < 10) sMinutes = "0" + sMinutes;
            return (sHours + ":" + sMinutes);
        }

        function GetToday(str) {
            var today = new Date();
            var day = today.getDate();
            var day2 = today.getDate() + 1;
            var month = today.getMonth() + 1;
            var year = today.getFullYear();
            if (day <= 9) {
                day = '0' + day;
            }
            if (day2 <= 9) {
                day2 = '0' + day2;
            }
            if (month <= 10) {
                month = '0' + month;
            }
            if (str != 2) {
                return (year + '-' + month + '-' + day);
            } else {

                return (year + '-' + month + '-' + day2);
            }
        }

        $(document).ready(function () {
            $('.workedhrs').change(function () {
                var currentRow = $(this).closest('tr');
                var InTimeStr = currentRow.find('.InTime').val();

                var workedhrs = currentRow.find('.workedhrs').val();

                if (InTimeStr != '' && workedhrs != '') {
                    var InTime = moment(InTimeStr, 'HH:mm a');
                    var InTime24 = ConvertTimeformat("24", InTimeStr);
                    var starttime = moment(GetToday(1) + ' ' + InTime24);
                    var endtime = moment(starttime).add(workedhrs, 'hours');
                    var newdate = new Date(endtime);
                    var hours = newdate.toLocaleTimeString();
                    var outtime = moment(endtime).format('h:mm A');
                    currentRow.find('.OutTime').val(outtime);
                    if (InTimeStr != '' && outtime != '') {

                        var OutTimeStr = currentRow.find('.OutTime').val();
                        var InAMPM = InTimeStr.match(/\s(.*)$/)[1];
                        var OutAMPM = OutTimeStr.match(/\s(.*)$/)[1];

                        var InTime24 = ConvertTimeformat("24", InTimeStr);
                        var OutTime24 = ConvertTimeformat("24", OutTimeStr);
                        //                alert(GetToday(1) + ' ' + InTime24 + '\n' + GetToday(1) + ' ' + OutTime24);

                        var starttime = moment(GetToday(1) + ' ' + InTime24);
                        var endtime = moment(GetToday(1) + ' ' + OutTime24)
                        var endtimetomorow = moment(GetToday(2) + ' ' + OutTime24);
                        var ddlDepartmentValue = currentRow.find('select.ddldepartment').val();

                        if (InAMPM == "AM" && OutAMPM == "AM") {
                            if (moment(starttime).isBefore(endtime)) {
                                var duration = moment.duration(endtime.diff(starttime));
                                var totalMins = duration.asMinutes();
                                var totalHrs = duration.asHours();
                                var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                                currentRow.find('.workedhrs').val(TotalWorkingHours);
                                var currentRows = $(this).closest('tr');
                                if (!(ddlDepartmentValue == 6)) {
                                    var regShift = 480;
                                    if (totalMins > regShift) {
                                        var OTTimeMinutes = totalMins - regShift;
                                        var regShiftHrs = ConvertMinutesToHours(regShift);
                                        var OTTimeHour = ConvertMinutesToHours(OTTimeMinutes);
                                        currentRows.find('.regHrs').val(regShiftHrs);
                                        currentRows.find('.OTHrs').val(OTTimeHour);
                                    }
                                    else {
                                        currentRows.find('.regHrs').val(TotalWorkingHours);
                                        currentRows.find('.OTHrs').val('00:00');
                                    }
                                }
                                else {
                                    var CWRegShift = 720;
                                    if (totalMins > CWRegShift) {
                                        var CWOTTime = totalMins - CWRegShift;

                                        var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                        var CWOTTimeHours = ConvertMinutesToHours(CWOTTime);
                                        currentRow.find('.regHrs').val(CWRegShiftHrs);
                                        currentRow.find('.OTHrs').val(CWOTTimeHours);
                                    }
                                    else {
                                        currentRow.find('.regHrs').val(TotalWorkingHours);
                                        currentRow.find('.OTHrs').val('00:00');
                                    }
                                }
                            }
                            else {
                                alert('Start Time must be Eariler than End Time');
                            }
                        }
                        else if (InAMPM == "PM" && OutAMPM == "PM") {
                            if (moment(starttime).isBefore(endtime)) {
                                var duration = moment.duration(endtime.diff(starttime));
                                var totalMins = duration.asMinutes();
                                var totalHrs = duration.asHours();
                                var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                                currentRow.find('.workedhrs').val(TotalWorkingHours);
                                var currentRow = $(this).closest('tr');
                                if (!(ddlDepartmentValue == 6)) {
                                    var regShift = 480;
                                    if (totalMins > regShift) {
                                        var OTTimeMinutes = totalMins - regShift;
                                        var regShiftHrs = ConvertMinutesToHours(regShift);
                                        var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes);
                                        currentRows.find('.regHrs').val(regShiftHrs);
                                        currentRows.find('.OTHrs').val(OTTimeHours);
                                    }
                                    else {
                                        currentRows.find('.regHrs').val(TotalWorkingHours);
                                        currentRows.find('.OTHrs').val('00:00');
                                    }
                                }
                                else {
                                    var CWRegShift = 720;
                                    if (totalMins > CWRegShift) {
                                        var CWOTTimeMinutes = totalMins - CWRegShift;
                                        var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                        var CWOTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                        currentRow.find('.regHrs').val(CWRegShiftHrs);
                                        currentRow.find('.OTHrs').val(CWOTTimeHours);
                                    }
                                    else {
                                        currentRow.find('.regHrs').val(TotalWorkingHours);
                                        currentRow.find('.OTHrs').val('00:00');
                                    }
                                }

                            }
                            else {
                                alert('Start Time must be Eariler than End Time');
                            }
                        }
                        else if (InAMPM == "AM" && OutAMPM == "PM") {
                            if (moment(starttime).isBefore(endtime)) {
                                var duration = moment.duration(endtime.diff(starttime));
                                var totalMins = duration.asMinutes();
                                var totalHrs = duration.asHours();
                                var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                                currentRow.find('.workedhrs').val(TotalWorkingHours);
                                var currentRow = $(this).closest('tr');
                                if (!(ddlDepartmentValue == 6)) {
                                    var regShift = 480;
                                    if (totalMins > regShift) {
                                        var OTTimeMinutes = totalMins - regShift;
                                        var regShiftHrs = ConvertMinutesToHours(regShift);
                                        var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes);
                                        currentRows.find('.regHrs').val(regShiftHrs);
                                        currentRows.find('.OTHrs').val(OTTimeHours);
                                    }
                                    else {
                                        currentRows.find('.regHrs').val(TotalWorkingHours);
                                        currentRows.find('.OTHrs').val('00:00');
                                    }
                                }

                                else {
                                    var CWRegShift = 720;
                                    if (totalMins > CWRegShift) {
                                        var CWOTTimeMinutes = totalMins - CWRegShift;
                                        var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                        var CWOTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);
                                        currentRow.find('.regHrs').val(CWRegShiftHrs);
                                        currentRow.find('.OTHrs').val(CWOTTimeHours);
                                    }
                                    else {
                                        currentRow.find('.regHrs').val(TotalWorkingHours);
                                        currentRow.find('.OTHrs').val('00:00');
                                    }
                                }

                            }
                            else {
                                alert('Start Time must be Eariler than End Time');
                            }
                        }
                        else {
                            if (moment(starttime).isBefore(endtimetomorow)) {
                                var duration = moment.duration(endtimetomorow.diff(starttime));
                                var totalMins = duration.asMinutes();
                                var totalHrs = duration.asHours();
                                var TotalWorkingHours = ConvertMinutesToHours(totalMins);
                                currentRow.find('.workedhrs').val(TotalWorkingHours);
                                var currentRow = $(this).closest('tr');
                                if (!(ddlDepartmentValue == 6)) {
                                    var regShift = 480;
                                    if (totalMins > regShift) {
                                        var OTTimeMinutes = totalMins - regShift;
                                        var regShiftHrs = ConvertMinutesToHours(regShift);
                                        var OTTimeHours = ConvertMinutesToHours(OTTimeMinutes);
                                        currentRows.find('.regHrs').val(regShiftHrs);
                                        currentRows.find('.OTHrs').val(OTTimeHours);
                                    }
                                    else {
                                        currentRows.find('.regHrs').val(TotalWorkingHours);
                                        currentRows.find('.OTHrs').val('00:00');
                                    }
                                }
                                else {
                                    var CWRegShift = 720;
                                    if (totalMins > CWRegShift) {
                                        var CWOTTimeMinutes = totalMins - CWRegShift;
                                        var CWRegShiftHrs = ConvertMinutesToHours(CWRegShift);
                                        var CWOTTimeHours = ConvertMinutesToHours(CWOTTimeMinutes);

                                        currentRow.find('.regHrs').val(CWRegShiftHrs);
                                        currentRow.find('.OTHrs').val(CWOTTimeHours);
                                    }
                                    else {
                                        currentRow.find('.regHrs').val(TotalWorkingHours);
                                        currentRow.find('.OTHrs').val('00:00');
                                    }
                                }
                            }
                            else {
                                alert('Start Time must be Eariler than End Time');
                            }
                        }
                    }
                }
            });
        });
                     
    </script>
    <script type="text/javascript">
        $(function () {
            $("[id*=GVAttend] td").hover(function () {
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
    <div id="pagesec">
        <div id="headsec">
            <center>
                <table>
                    <tr>
                        <td>
                            <h3>
                                Attendance
                            </h3>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
        </div>
        <div id="deptsec">
            <center>
                <table>
                    <tr align="left">
                        <td>
                            Date
                        </td>
                        <td>
                            <asp:TextBox ID="txtDate" runat="server" Width="150px" CssClass="inputbox txtdate"></asp:TextBox>
                            <asp:CalendarExtender ID="txtDate_CalendarExtender" runat="server" Enabled="True"
                                Format="dd/MM/yyyy" TargetControlID="txtDate">
                            </asp:CalendarExtender>
                        </td>
                    </tr>
                    <tr align="left">
                        <td>
                            Department
                        </td>
                        <td>
                            <asp:DropDownList ID="ddlDeprtments" runat="server" Width="150px" CssClass="inputbox">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2">
                            <center>
                                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                            </center>
                        </td>
                    </tr>
                </table>
            </center>
            <br />
        </div>
        <div id="grdsec">
            <center>
                <asp:GridView ID="GVAttend" runat="server" AutoGenerateColumns="False" OnRowDataBound="GVAttend_RowDataBound"
                    Width="90%">
                    <AlternatingRowStyle BackColor="#FFFF99" />
                    <Columns>
                        <asp:BoundField DataField="EID" HeaderText="Emp ID">
                            <HeaderStyle CssClass="hidden" />
                            <ItemStyle CssClass="hidden" />
                        </asp:BoundField>
                        <asp:BoundField DataField="EmployeeCode" HeaderText="Employee Code" />
                        <asp:BoundField DataField="EName" HeaderText="Emp Name" />
                        <asp:TemplateField HeaderText="In Time">
                            <ItemTemplate>
                                <asp:TextBox ID="txtInTime" runat="server" CssClass="inputbox InTime" Width="110px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Out Time">
                            <ItemTemplate>
                                <asp:TextBox ID="txtOutTime" runat="server" CssClass="inputbox OutTime" Width="110px"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Total Worked Hours">
                            <ItemTemplate>
                                <asp:TextBox ID="txtWorkedHrs" runat="server" CssClass="inputbox workedhrs"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText=" Regular Shift Hour">
                            <ItemTemplate>
                                <asp:TextBox ID="txtWorkedMinutes" runat="server" CssClass="inputbox regHrs"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="OT Hours">
                            <ItemTemplate>
                                <asp:TextBox ID="txtOT" runat="server" CssClass="inputbox OTHrs"></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Shift ID">
                            <ItemTemplate>
                                <asp:Label ID="lblShift" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Department">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlDepart" runat="server" CssClass="ddldepartment  inputbox">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Unit">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlUnit" runat="server" CssClass="inputbox">
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <HeaderStyle BackColor="#999999" ForeColor="White" />
                </asp:GridView>
            </center>
            <br />
            <center>
                <table style="width: 261px">
                    <tr>
                        <td>
                            <asp:Button ID="btnCalculate" runat="server" Text="Calculate Shift" OnClick="btnCalculate_Click"
                                Enabled="False" Visible="False" />
                        </td>
                        <td class="style7">
                            <asp:Button ID="btnSave" runat="server" Text="Save" OnClick="btnSave_Click" Enabled="False"
                                Visible="False" />
                        </td>
                    </tr>
                </table>
            </center>
        </div>
    </div>
    <br />
</asp:Content>
