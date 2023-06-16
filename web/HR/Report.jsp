<%-- 
    Document   : Report
    Created on : Jun 10, 2023, 10:08:00 AM
    Author     : ADMIN
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Report Page</title>
    </head>
    <body>
        <%@include file="/Layout/Header.jsp" %>

        <h1>Report List</h1>

        <c:set var="result" value="${requestScope.REPORT_LIST}"/>
        <c:if test="${not empty result}">
            <table border="1">
                <thead>
                    <tr>
                        <th>Employee</th>
                        <th>Title</th>
                        <th>Description</th>
                        <th>Create at</th>
                        <th>Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="dto" items="${result}">
                        <tr>
                            <td>
                                ${dto.employeeName}
                            </td>
                            <td>${dto.title}</td>
                            <td>${dto.description}</td>
                            <td>
                                ${dto.dateCreate}
                            </td>
                            <td>
                                <a href="DispatchServlet?btnAction=ViewReport&txtEmployeeName=${dto.employeeName}&txtDateCreate=${dto.dateCreate}">
                                        View
                                </a> 
                            </td>
                        </tr>
                    </c:forEach>                   
                </tbody>
            </table>


<!--        </c:if>  end if table exist-->
       

<!--        <script>
            function showAdditionalFields(element) {
                var additionalFields = document.getElementById("additional-fields");
                additionalFields.style.display = "block";
                // Cập nhật vị trí cuối cùng của các thẻ <td> chứa phần tử được nhấp vào
                var tdElement = element.parentNode;
                tdElement.colSpan = 5;
            }
        </script>-->
    </body>
</html>
