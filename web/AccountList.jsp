<%-- 
    Document   : AccountList
    Created on : May 23, 2023, 7:26:33 AM
    Author     : PREDATOR
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account List Page</title>
    </head>
    <body>
        <h1>All List Of Accounts</h1>
        
        <c:set var="result" value="${requestScope.LIST_ACCOUNT}"/>
        <c:if test="${not empty result}">
            <table border="1">
                <thead>
                    <tr>
                        <th>No.</th>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Department ID</th>
                        <th>Employee Email</th>                         
                    </tr>
                </thead>
                <tbody>
                    
                    <c:forEach var="dto" items="${result}" varStatus="loop">
                        <tr>

                            <td>
                                ${loop.count}           
                            </td>
                            <td>
                                ${dto.employee_id}
                            </td>
                            <td>
                                <c:url var="AccDetail" value="DispatchServlet">
                                    <c:param name="btnAction" value="AccDetail" />
                                    <c:param name="employee_name" value="${dto.employee_name}"/>
                                </c:url>
                                <a href="${AccDetail}"> ${dto.employee_name}</a>
                            </td>
                            <td>
                                ${dto.department_id}
                            </td>      
                            <td>
                                ${dto.employee_email}
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
        
        
    </body>
</html>
