<%-- 
    Document   : OTList
    Created on : May 23, 2023, 7:35:28 PM
    Author     : 23030
--%>

<%@page import="model.DAO.OvertimeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overtime List</title>
    </head>
    <body>
        <h1>Overtime List</h1>
        <c:set var="result" value="${requestScope.OT_LIST}"/>
        <c:if test="${not empty result}">
            <h2>List of Employees have Overtime</h2>   
            
            <form action="DispatchServlet">
                <select name="monthparam" onchange="toggleButton(this)">
                    <option value="" disabled selected>Select A Month</option>
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
                <input type="submit" value="SearchOTMonth" name="btnAction" id="myButton" disabled  />
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
                        <c:forEach var="dto" items="${result}" varStatus="loop">
                        <tr>
                            <td>
                                ${loop.count}   
                            </td>
                            <td>
                                ${dto.employeeId}
                            </td>
                            <td>
                                <c:url var="OTDetail2" value="DispatchServlet">
                                    <c:param name="btnAction" value="OTDetail2" />
                                    <c:param name="employee_name" value="${dto.employee_name}"/>
                                </c:url>
                                <a href="${OTDetail2}"> ${dto.employee_name}</a> 
                            </td>
                            <td>
                                ${dto.department_id}
                            </td>
                            <td>
                                
                                ${dto.role}
                            </td>   
                        </tr>
                         </c:forEach>
                    </tbody>
                
        </table>
        </c:if>

    </body>
</html>
