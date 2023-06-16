<%-- 
    Document   : newjsp
    Created on : Jun 4, 2023, 8:37:46 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Day Page</title>
    </head>
    <body>
        <%@include file="/Layout/Header.jsp" %>

        <form action="DispatchServlet">
            <input type="submit" name="btnAction" value="Pending"/>
            <input type="submit" name="btnAction" value="Approved"/>
            <input type="submit" name="btnAction" value="Rejected"/>         
        </form>

        <c:set var="resultApprove" value="${requestScope.APPROVE_LIST}" />
        <c:if test="${not empty resultApprove}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Create at</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${resultApprove}">               
                        <tr>
                            <td>${dto.employeeName}</td>
                            <td>${dto.title}</td>
                            <td>${dto.description}</td>
                            <td>${dto.dateCreate}</td>
                        </tr>
                    </c:forEach>
                </c:if>

                <c:set var="resultReject" value="${requestScope.REJECT_LIST}" />
                <c:if test="${not empty resultReject}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Title</th>
                            <th>Description</th>
                            <th>Create at</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${resultReject}">               
                            <tr>
                                <td>${dto.employeeName}</td>
                                <td>${dto.title}</td>
                                <td>${dto.description}</td>
                                <td>${dto.dateCreate}</td>
                            </tr>
                        </c:forEach>
                    </c:if>

                    <c:set var="resultPending" value="${requestScope.PENDING_LIST}" />
                    <c:if test="${not empty resultPending}">

                    <table border="1">
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Title</th>
                                <th>Description</th>
                                <th>Create at</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="dto" items="${resultPending}">   
                            <form action="DispatchServlet" method="POST">
                                <tr>
                                    <td>${dto.employeeName}</td>
                                    <td>${dto.title}</td>
                                    <td>${dto.description}</td>
                                    <td>${dto.dateCreate}</td>
                                    <td>
                                        <input type="hidden" name="dayLeaveId" value="${dto.id}"/>
                                        <input type="submit" name="btnAction" value="Reject"/>
                                        <input type="submit" name="btnAction" value="Approve"/>
                                    </td>
                                </tr>
                            </form>
                        </c:forEach>

                    </c:if>

                    </tbody>
                </table>
                </body>
                </html>
