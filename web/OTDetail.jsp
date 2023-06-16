<%-- 
    Document   : OTDetail
    Created on : May 23, 2023, 10:43:50 PM
    Author     : 23030
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Overtime Details</title>
    </head>
    <body>
        
        <h1>Overtime Details</h1>
        <c:set var="result" value="${requestScope.OT_DETAIL}"/>
        <c:if test="${not empty result}">

            <table border="1">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Department ID</th>
                        <th>Role</th>
                        <th>Working Status</th>
                        <th>Has OverTime</th>
                        <th>Overtime Start Date Time</th>
<!--                        <th>Overtime Duration</th>-->
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach var="dto" items="${result}">
                        <tr>
                            <td>
                                ${dto.employeeId}
                            </td>
                            <td>
                                ${dto.employee_name}                                                      
                            </td>
                            <td>
                                ${dto.department_id}
                            </td>
                            <td>
                                ${dto.role}
                            </td>
                            <td>
                                ${dto.workingStatus}
                            </td>        
                            <td>
                                <c:if test="${dto.hasOvertime}">
                                    Yes
                                </c:if>
                                <c:if test="${!dto.hasOvertime}">
                                    No
                                </c:if>
                            </td>
                            <td>
                                ${dto.overtimeStartDateTime}
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
           
        </c:if>

        <c:set var="result2" value="${requestScope.OT_DETAIL_2}"/>
        <c:if test="${not empty result2}">

            <table border="1">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Department ID</th>
                        <th>Role</th>
                        <th>Working Status</th>
                        <th>Has OverTime</th>
                        <th>Overtime Start Date Time</th>
<!--                        <th>Overtime Duration</th>-->
                    </tr>
                </thead>
                
                <tbody>
                    <c:forEach var="dto" items="${result2}">
                        <tr>
                            <td>
                                ${dto.employeeId}
                            </td>
                            <td>
                                ${dto.employee_name}                                                      
                            </td>
                            <td>
                                ${dto.department_id}
                            </td>
                            <td>
                                ${dto.role}
                            </td>
                            <td>
                                ${dto.workingStatus}
                            </td>        
                            <td>
                                <c:if test="${dto.hasOvertime}">
                                    Yes
                                </c:if>
                                <c:if test="${!dto.hasOvertime}">
                                    No
                                </c:if>
                            </td>
                            <td>
                                ${dto.overtimeStartDateTime}
                            </td>

                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
    </body>
</html>
