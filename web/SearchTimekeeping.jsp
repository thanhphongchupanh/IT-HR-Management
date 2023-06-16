<%-- 
    Document   : SearchTimekeeping
    Created on : Jun 11, 2023, 6:36:51 PM
    Author     : PREDATOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Timekeeping Page</title>
    </head>
    <body>
        <h1>Timekeeping 2</h1>
       

        <c:set var="Date" value="${requestScope.MONTH}"/>
        <c:set var="resultDate" value="${requestScope.SEARCH_DATE}"/>
        
         <form action="DispatchServlet">
            <select name="Month" onchange="toggleButton(this)">
                <option value="" disabled selected>Month: ${Date}</option>
                <option value="01">January</option>
                <option value="02">February</option>
                <option value="03">March</option>
                <option value="04">April</option>
                <option value="05">May</option>
                <option value="06">June</option>
                <option value="07">July</option>
                <option value="08">August</option>
                <option value="09">September</option>
                <option value="10">October</option>
                <option value="11">November</option>
                <option value="12">December</option>
            </select>
            <input type="submit" value="SearchMonth" name="btnAction" id="myButton" disabled />
            <script>
                function toggleButton(selectElement) {
                    var button = document.getElementById("myButton");
                    if (selectElement.value === "") {
                        button.disabled = true; // Disable the button if the placeholder option is selected
                    } else {
                        button.disabled = false; // Enable the button for other selected options
                    }
                }
            </script>
        </form>
        
        <c:if test="${not empty resultDate}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Detail</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="displayedEmployees" value="" scope="request" />

                    <c:forEach var="dto" items="${resultDate}">

                        <c:if test="${not displayedEmployees.contains(dto.employee_id)}">
                            <c:set var="displayedEmployees" value="${displayedEmployees},${dto.employee_id}" scope="request" />
                            <tr>
                                <td>

                                    ${dto.employee_id}

                                </td>

                                <td>
                                    ${dto.employee_name}
                                </td>
                                <td>
                                    <c:url var="timekeepingDetail" value="DispatchServlet">
                                        <c:param name="btnAction" value="timekeepingDetail" />
                                        <c:param name="employeeName" value="${dto.employee_name}"/>
                                        <c:param name="monthParam" value="${Date}"/>
                                    </c:url>
                                    <a href="${timekeepingDetail}"> Detail</a> 
                                </td>
                            </tr>
                        </c:if>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
        <c:if test="${empty resultDate}">
            EMPTY 
        </c:if>
    </body>
</html>
