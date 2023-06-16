<%-- 
    Document   : CreateDayLeave
    Created on : May 31, 2023, 3:26:15 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Page</title>
    </head>
    <body>
        <%@include file="/Layout/Header.jsp" %>

        <h1>Create Application</h1>
        <form action="CreateHrApplicationServlet">
            Title <input type="text" name="txtTitle" value="" size="40"> <br/>
            Type of application  <select name="txtType" id="lang-select" onchange="showAdditionalFields()">
                <option value="dayleave">Day leave</option>
                <option value="recruitment">Recruitment</option>
                <option value="report">Report</option>
            </select><br/>

            <c:set var="result" value="${requestScope.LIST_DEPARTMENT_EMPLOYEE}" />
            <div id="additional-fields" style="display: none;">

                Report For <input type="text" name="txtEmployeeName" list="options" id="myInput">
                <datalist id="options">
                    <c:forEach var="dto" items="${result}">
                        <option value="${dto.employee_name}"></option>
                    </c:forEach>
                </datalist>

                Present days <input type="text" name="presentDays" value=""><br/>
                Absent days <input type="text" name="AbsentDays" value=""><br/>
                Late days <input type="text" name="LateDays" value=""><br/>
                Overtime days <input type="text" name="OvertimeDays" value=""><br/>
            </div>
            Description <input type="text" name="txtDescr" value="" size=100"><br/>

            <input type="submit" name="btnAction" value="Create"/>

        </form>



        <script>
            function showAdditionalFields() {
                var selectElement = document.getElementById("lang-select");
                var additionalFields = document.getElementById("additional-fields");

                if (selectElement.value === "report") {
                    additionalFields.style.display = "block";
                } else {
                    additionalFields.style.display = "none";
                }
            }
        </script>


    </body>
</html>
