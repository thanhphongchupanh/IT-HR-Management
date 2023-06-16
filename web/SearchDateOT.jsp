<%-- 
    Document   : SearchDateOT
    Created on : Jun 15, 2023, 9:55:19 AM
    Author     : 23030
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Search Overtime Page</title>
    </head>
    <body>
        <h1>Overtime 2</h1>
        
        <c:set var="Date" value="${requestScope.MONTH}"/>
        <c:set var="resultDate" value="${requestScope.SEARCH_DATE}"/>
        
        <form action="DispatchServlet">
            <select name="monthparam" onchange="toggleButton(this)">
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
            <input type="submit" value="SearchOTMonth" name="btnAction" id="myButton" disabled />
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
                        <th>No</th>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Department ID</th>
                        <th>Role</th>
                    </tr>
                </thead>
                <tbody>
                    <c:set var="displayedOT" value="" scope="request" />
                    
                    <c:forEach var="dto" items="${resultDate}">
                    
                        <c:if test="${not displayedEmployees.contains(dto.employeeId)}">
                            <c:set var="displayedEmployees" value="${displayedEmployees},${dto.employeeId}" scope="request" />
                                <tr>
                                    <td>
                                        ${loop.count}   
                                    </td>
                                    <td>
                                        ${dto.employeeId}
                                    </td>
                                    <td>
                                        <c:url var="OTDetail" value="DispatchServlet">
                                        <c:param name="btnAction" value="OTDetail" />
                                        <c:param name="employee_name" value="${dto.employee_name}"/>
                                        <c:param name="month" value="${Date}"/>
                                        </c:url>
                                    <a href="${OTDetail}"> ${dto.employee_name}</a> 
                                    </td>
                                    <td>
                                        ${dto.department_id}
                                    </td>
                                    <td>
                                        ${dto.role}
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
