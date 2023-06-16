<%-- 
    Document   : ReportDetail
    Created on : Jun 12, 2023, 4:52:00 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Detail Page</title>
    </head>
    <body>
        <%@include file="/Layout/Header.jsp" %>
        <c:set var="result" value="${requestScope.REPORT_DETAIL_LIST}"/>
        <a href="DispatchServlet?btnAction=Report">Back</a> <br/>
        <c:forEach var="dto" items="${result}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Title</th>
                        <th>Report for</th>
                        <th>Create at</th>
                        <th>Present day</th>
                        <th>Absent day</th>
                        <th>Overtime day</th>
                        <th>Late day</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${dto.title}</td>
                        <td>${dto.employeeName}</td>
                        <td>${dto.dateCreate}</td>
                        <td>${dto.presentDay} </td>
                        <td>${dto.absentDay}  </td>
                        <td>${dto.overtimeDay} </td>
                        <td>${dto.lateDay} </td>
                    </tr>               
                </tbody>
            </table>

            
        </c:forEach>
    </body>
</html>
