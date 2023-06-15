<%-- 
    Document   : TimekeepingDetail
    Created on : Jun 11, 2023, 7:55:02 PM
    Author     : PREDATOR
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Timekeeping Detail Page</title>
    </head>
    <body>
        <h1>Timekeeping Detail</h1>
        <c:set var="result" value="${requestScope.TIMEKEEPING_DETAIL}"/>
        <c:if test="${not empty result}">
            
            <table border="1">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Date</th>
                        <th>Time In</th>
                        <th>Time Out</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${result}">
                        <tr>
                            <td>
                                
                                ${dto.employee_id}
                                
                            </td>
                          
                            <td>
                                ${dto.employee_name}
                            </td>
                            <td>
                                ${dto.date}
                            </td>
                            <td>
                                ${dto.timekiN}
                            </td>
                            <td>
                                ${dto.timeOut}
                            </td>
                            <td>
                                ${dto.status}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
       
            
        <c:set var="result2" value="${requestScope.TIMEKEEPING_DETAIL_2}"/>
        <c:if test="${not empty result2}">
            
            <table border="1">
                <thead>
                    <tr>
                        <th>Employee ID</th>
                        <th>Employee Name</th>
                        <th>Date</th>
                        <th>Time In</th>
                        <th>Time Out</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${result2}">
                        <tr>
                            <td>
                                
                                ${dto.employee_id}
                                
                            </td>
                          
                            <td>
                                ${dto.employee_name}
                            </td>
                            <td>
                                ${dto.date}
                            </td>
                            <td>
                                ${dto.timekiN}
                            </td>
                            <td>
                                ${dto.timeOut}
                            </td>
                            <td>
                                ${dto.status}
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </c:if>
    </body>
</html>
