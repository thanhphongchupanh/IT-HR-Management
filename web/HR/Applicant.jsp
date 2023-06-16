<%-- 
    Document   : Applicant
    Created on : Jun 12, 2023, 8:14:56 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Applicant Page</title>
    </head>
    <body>
        <%@include file="/Layout/Header.jsp" %>

        <form action="MainController">
            <input type="submit" name="btnAction" value="Pending"/>
            <input type="submit" name="btnAction" value="Passed"/>
            <input type="submit" name="btnAction" value="Rejected"/>         
        </form>

        <c:set var="resultPending" value="${requestScope.LIST_PENDING_APPLICANT}" />
        <c:if test="${not empty resultPending}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Department</th>
                        <th>Interview Date</th>
                        <th>Gender</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${resultPending}">               
                        <tr>
                            <td>${dto.name}</td>
                            <td>${dto.email}</td>
                            <td>${dto.phoneNumber}</td>
                             <td>${dto.departmentName}</td>
                             <td>
                                     ${dto.interviewDate}
                                 <c:if test="${empty dto.interviewDate}">
                                     Not Set
                                 </c:if>
                             </td>
                            <td>${dto.gender}</td>                           
                        </tr>
                    </c:forEach>
                </c:if>
                        
        <c:set var="resultPassed" value="${requestScope.LIST_PASSED_APPLICANT}" />
        <c:if test="${not empty resultPassed}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Department</th>
                        <th>Interview Date</th>
                        <th>Gender</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${resultPassed}">               
                        <tr>
                            <td>${dto.name}</td>
                            <td>${dto.email}</td>
                            <td>${dto.phoneNumber}</td>
                             <td>${dto.departmentName}</td>
                             <td>
                                     ${dto.interviewDate}
                                 <c:if test="${empty dto.interviewDate}">
                                     Not Set
                                 </c:if>
                             </td>
                            <td>${dto.gender}</td>                           
                        </tr>
                    </c:forEach>
                </c:if>
                        
        <c:set var="resultReject" value="${requestScope.LIST_REJECT_APPLICANT}" />
        <c:if test="${not empty resultReject}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Department</th>
                        <th>Interview Date</th>
                        <th>Gender</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${resultReject}">               
                        <tr>
                            <td>${dto.name}</td>
                            <td>${dto.email}</td>
                            <td>${dto.phoneNumber}</td>
                             <td>${dto.departmentName}</td>
                             <td>
                                     ${dto.interviewDate}
                                 <c:if test="${empty dto.interviewDate}">
                                     Not Set
                                 </c:if>
                             </td>
                            <td>${dto.gender}</td>                           
                        </tr>
                    </c:forEach>
                </c:if>
                        
      

                    </tbody>
                </table>
                </body>
</html>
