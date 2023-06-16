<%--
    Document   : SalaryDetail
    Created on : Jun 1, 2023, 1:21:01 AM
    Author     : quanb
--%>

<%@page import="model.DTO.SalaryDto"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    if (request.getAttribute("message") != null) {
        out.print("<p>" + request.getAttribute("message") + "</p>");
    }
%>

<h1>Salary Detail</h1>
<hr>
<form action="<c:url value='/SalaryDetailServlet' />">
    Name:<br>   
    <% SalaryDto salaryDetail = (SalaryDto) request.getAttribute("Salary_DETAIL");%>
    <input type="text" value="<%= salaryDetail.getEmployee_name()%>" readonly/><br>
    Net Receiver:<br>
    <input type="text" value="<%= salaryDetail.getSalaryBase()%>" readonly/><br>
    Medical Insurance:<br>
    <input type="text" value="<%= salaryDetail.getMedicalInsurance()%>" readonly/><br>
    Accidental Insurance:<br>
    <input type="text" value="<%= salaryDetail.getAccidentalInsurance()%>" readonly/><br>
    Social Assurance:<br>
    <input type="text" value="<%= salaryDetail.getSocialAssurance()%>" readonly/><br>
    Tax:<br>
    <input type="text" value="<%= salaryDetail.getTax()%>" readonly/><br>
    Bonus:<br>
    <input type="text" id='bonusDetails' value="<%= salaryDetail.getBonus()%>" readonly/><br>
    Penalty Money:<br>
    <input type="text" value="<%= salaryDetail.getPenalty()%>" readonly/><br>
    Last Receiver:<br>
    <input type="text" value="<%= salaryDetail.getLastReceiver()%>" readonly/><br>
    Late for work:<br>
    <input type="text" id="lateForWork" value="<%= salaryDetail.getLateForWorktimes()%>" readonly/><br>
    Absent for work:<br>
    <input type="text" id="absentForWork" value="<%= salaryDetail.getAbsentForWork()%>" readonly/><br>
    <input type="hidden" id="applicationId" value="<%= salaryDetail.getApplication_id()%>" />
</form>

<div id="dialog" title="Late Time Details" style="display: none;">
    <form>
        <label for="lateDay">Late Day:</label>
        <input type="text" id="lateDay" readonly><br>
        <label for="lateDayPenalty">Late Day Penalty:</label>
        <input type="text" id="lateDayPenalty" readonly><br>
        <label for="totalPenalty">Total Penalty:</label>
        <input type="text" id="totalPenalty" readonly><br>
    </form>
</div>
<div id="dialog2" title="Absent Time Details" style="display: none;">
    <form>
        <label for="absentDay">Absent Day:</label>
        <input type="text" id="absentDay" readonly><br>
        <label for="absentDayPenalty">Absent Day Penalty:</label>
        <input type="text" id="absentDayPenalty" readonly><br>
        <label for="totalPenaltyAbsent">Total Penalty:</label>
        <input type="text" id="totalPenaltyAbsent" readonly><br>
    </form>
</div>
<div id="dialog3" title="Bonus Details" style="display: none;">
    <form>
        <label for="bonusDay">Bonus Day:</label>
        <input type="text" id="bonusDay" readonly><br>
        <label for="bonusMoney">Bonus per overtime day:</label>
        <input type="text" id="bonusMoney" readonly><br>
        <label for="totalMoney">Total Money:</label>
        <input type="text" id="totalMoney" readonly><br>
    </form>
</div>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
    $(document).ready(function () {
    var dialogInstance1; // Variable to hold the first dialog instance
    var dialogInstance2; // Variable to hold the second dialog instance
    var dialogInstance3;

    $('#lateForWork').click(function () {
        var applicationId = $('#applicationId').val();

        if (dialogInstance2 && dialogInstance2.dialog('isOpen')) {
            dialogInstance2.dialog('close');
        }

        if (dialogInstance3 && dialogInstance3.dialog('isOpen')) {
            dialogInstance3.dialog('close');
        }

        $.ajax({
            type: 'POST',
            url: 'RetrieveLateTimeServlet',
            data: {
                application_id: applicationId
            },
            dataType: 'json',
            success: function (response) {
                $('#lateDay').val(response.lateDay + " Times");
                $('#lateDayPenalty').val(formatCurrency(response.lateDayPenalty));
                $('#totalPenalty').val(formatCurrency(response.totalPenalty));

                if (dialogInstance1 && dialogInstance1.dialog('isOpen')) {
                    dialogInstance1.dialog('close');
                }

                dialogInstance1 = $('#dialog').dialog({
                    buttons: {
                        Cancel: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            },
            error: function (xhr, status, error) {
                console.error(error);
                alert('Failed to retrieve late day details.');
            }
        });
    });

    $('#absentForWork').click(function () {
        var applicationId = $('#applicationId').val();

        if (dialogInstance1 && dialogInstance1.dialog('isOpen')) {
            dialogInstance1.dialog('close');
        }

        if (dialogInstance3 && dialogInstance3.dialog('isOpen')) {
            dialogInstance3.dialog('close');
        }

        $.ajax({
            type: 'POST',
            url: 'RetrieveAbsentTimeServlet',
            data: {
                application_id: applicationId
            },
            dataType: 'json',
            success: function (response) {
                $('#absentDay').val(response.absentDay + " Times");
                $('#absentDayPenalty').val(formatCurrency(response.absentDayPenalty));
                $('#totalPenaltyAbsent').val(formatCurrency(response.totalPenaltyAbsent));

                if (dialogInstance2 && dialogInstance2.dialog('isOpen')) {
                    dialogInstance2.dialog('close');
                }

                dialogInstance2 = $('#dialog2').dialog({
                    buttons: {
                        Cancel: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            },
            error: function (xhr, status, error) {
                console.error(error);
                alert('Failed to retrieve absent day details.');
            }
        });
    });

    $('#bonusDetails').click(function () {
        var applicationId = $('#applicationId').val();

        if (dialogInstance1 && dialogInstance1.dialog('isOpen')) {
            dialogInstance1.dialog('close');
        }

        if (dialogInstance2 && dialogInstance2.dialog('isOpen')) {
            dialogInstance2.dialog('close');
        }

        $.ajax({
            type: 'POST',
            url: 'RetrieveBonusServlet',
            data: {
                application_id: applicationId
            },
            dataType: 'json',
            success: function (response) {
                $('#bonusDay').val(response.bonusDay + " Times");
                $('#bonusMoney').val(formatCurrency(response.bonusMoney));
                $('#totalMoney').val(formatCurrency(response.totalMoney));

                if (dialogInstance3 && dialogInstance3.dialog('isOpen')) {
                    dialogInstance3.dialog('close');
                }

                dialogInstance3 = $('#dialog3').dialog({
                    buttons: {
                        Cancel: function () {
                            $(this).dialog('close');
                        }
                    }
                });
            },
            error: function (xhr, status, error) {
                console.error(error);
                alert('Failed to retrieve bonus details.');
            }
        });
    });
});

function formatCurrency(amount) {
    return amount.toLocaleString('vi-VN') + 'VNĐ';
}

function formatDay(amount) {
    return amount.toLocaleString('vi-VN') + 'VNĐ';
}
</script>