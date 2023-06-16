<%-- 
    Document   : AccDetail
    Created on : May 26, 2023, 8:30:49 PM
    Author     : 23030
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Account Detail</title>
    </head>
    <body>
        <h1>Account Detail</h1>
        
        <c:set var="error" value="${sessionScope.ACCOUNT_DETAIL_ERROR}" />
        <c:if test="${not empty error}">
            <c:out value="${error}"/>
        </c:if>
        
        <c:set var="result" value="${requestScope.ACCOUNT_DETAIL}"/>
        <c:if test="${not empty result}">
        
        <table border="1">
                <thead>
                    <tr>
                        <th>Employee Id</th>
                        <th>Employee Name</th>
                        <th>Department ID</th>
                        <th>Department</th>
                        <th>Email</th>
                        <th>Username</th>
                        <th>Password</th>
                        <th>Join Date</th>                       
                        <th>Role</th>     
<!--                        <th>Action</th>-->
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${result}">
<!--                    <form action="DispatchServlet" method="POST">-->
                        <tr>
                                <td>
                                    ${dto.employee_id}                       
                                </td>
                                <td>
                                    ${dto.employee_name}                      
                                </td>
                                <td>
                                    ${dto.department_id}                      
                                </td>
                                <td>                               
                                    ${dto.departmentName}
                                </td>
                                <td>
<!--                                    <input type="text" name="txtEmail" value="${dto.employee_email}" />-->
                                    ${dto.employee_email}
                                </td>
                                <td>
<!--                                    <input type="text" name="txtUsername" value="${dto.username}" />-->
                                    ${dto.username}
                                </td>
                                <td>
<!--                                    <input type="text" name="txtPassword" value="${dto.password}" />-->
                                    ${dto.password}
                                </td>
                                <td>
                                    ${dto.datejoin}
                                </td>
                                <td>
                                    ${dto.role}
                                </td>
<!--                                <td>
                                    <input type="submit" value="Update_AccDetail" name="btnAction" />
                                    <input type="hidden" name="txtUsername" value="${username}" />
                                    <a href="DispatchServlet?btnAction=Update_AccDetail&username=${dto.username}&password=${dto.password}"
                                            title="Update user">
                                </a>
                                </td>-->
                            </tr>
<!--                    </form>-->
                            
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        
    </body>
</html>
