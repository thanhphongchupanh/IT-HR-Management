<%-- 
    Document   : SentLeaveReport
    Created on : Jun 4, 2023, 4:47:22 PM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sent Page</title>
    </head>
    <body>
        <%@include file="/Layout/Header.jsp" %>

        <c:set var="sentResult" value="${requestScope.SENT_LIST}"/>
        <c:if test="${not empty sentResult}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Create at</th>
                        <th>Status</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${sentResult}">
                        <tr>
                            <td>${dto.employeeName}</td>
                            <td>${dto.title}</td>
                            <td>${dto.description}</td>
                            <td>${dto.dateCreate}</td>
                            <td>
                                <c:if test="${dto.status}">Approved</c:if>
                                <c:if test="${!dto.status}">Rejected</c:if>
                                <c:if test="${empty dto.status}">
                                    hoping
                                </c:if>

                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>

        </c:if> 

    </body>
</html>
