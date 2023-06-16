<%-- 
    Document   : ContractList
    Created on : Jun 6, 2023, 8:08:27 AM
    Author     : 23030
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contract</title>
    </head>
    <body>
        <h1>Contract List</h1>
        
        <c:set var="result" value="${requestScope.LIST_CONTRACT}"/>
        <c:if test="${not empty result}">
            <h2>List of Employee's Contract</h2>
            
            <table border="1">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Employee's Contract ID</th>
                            <th>Employee Name</th>
<!--                        <th>Salary ID</th>
                            <th>Welfare ID</th>-->
                            <th>Sign Date</th>
                            <th>Expire Date</th>
                            <th>Inspire Date</th>
<!--                        <th>Medical Insurance</th>
                            <th>Accidental Insurance</th>
                            <th>Social Insurance</th>-->
<!--                        <th>Tax</th>
                            <th>Penalty</th>
                            <th>Bonus</th>-->
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="dto" items="${result}" varStatus="loop">
                            <tr>
                                <td>
                                    ${loop.count}   
                                </td>
                                <td>
                                    <c:url var="ContractDetail" value="DispatchServlet">
                                    <c:param name="btnAction" value="ContractDetail" />
                                    <c:param name="employee_contractID" value="${dto.employee_contractID}"/>
                                    </c:url>
                                    <a href="${ContractDetail}"> ${dto.employee_contractID}</a>
                                </td>
                                <td>
                                    ${dto.employee_name}
                                </td>
                                <td>
                                    ${dto.signDate}
                                </td>
                                <td>
                                    ${dto.expDate}
                                </td>   
                                <td>
                                    ${dto.inspireDate}
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
            </table>
        </c:if>
    </body>
</html>
