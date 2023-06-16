<%-- 
    Document   : SalaryList
    Created on : Jun 1, 2023, 3:05:22 PM
    Author     : quanb
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <title>Salary List</title>
        <script>
    var sortDirection = "asc"; // Initial sort direction is ascending

    function sortTable() {
        var table, rows, switching, i, x, y, shouldSwitch;
        table = document.getElementById("salaryTable");
        switching = true;

        while (switching) {
            switching = false;
            rows = table.getElementsByTagName("tr");

            for (i = 1; i < (rows.length - 1); i++) {
                shouldSwitch = false;
                x = parseFloat(rows[i].getElementsByTagName("td")[1].textContent); // Index 1 for the "Salary Amount" column
                y = parseFloat(rows[i + 1].getElementsByTagName("td")[1].textContent);

                if (sortDirection === "asc") {
                    if (x > y) {
                        shouldSwitch = true;
                        break;
                    }
                } else {
                    if (x < y) {
                        shouldSwitch = true;
                        break;
                    }
                }
            }

            if (shouldSwitch) {
                rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
                switching = true;
            }
        }

        // Toggle the sort direction after each click
        sortDirection = sortDirection === "asc" ? "desc" : "asc";
        sortIndicator.innerHTML = sortDirection === "asc" ? "&#x25B2;" : "&#x25BC;";
    }
</script>
    </head>

    <body>
        <h2>Salary List table</h2>



        <form id="searchForm" action="SalaryListServlet" method="post">
            <input name="date" type="month" value="${param.date}" onchange="submitForm()">
        </form>

        <script>
            // Function to submit the form
            function submitForm() {
                document.getElementById("searchForm").submit();
            }
        </script>


        <table border="1" id="salaryTable">
            <tr>    
                <th>Name.</th>
                <th onclick="sortTable()" title="Click here to sort">
                    Salary Amount
                    <span id="sortIndicator">&#x25B2;</span> 
                </th>
                <th>bonus</th>
                <th>penalty</th>
                <th>Actions</th>
            </tr>
            <c:if test="${empty list}">
                <tr>
                    <td colspan="4">No data</td>
                </tr>
            </c:if>
            <c:forEach var="salary" items="${list}">
                <tr>
                    <td>${salary.employee_name}</td>
                    <td>${salary.getSalaryBase()}</td>
                    <td>${salary.bonus}</td>
                    <td>${salary.penalty}</td>
                    <td>
                        <a href="<c:url value="/SalaryDetailServlet" />?application_id=${salary.application_id}">Details</a> 
                    </td>
                </tr>
            </c:forEach>
        </table>


    </body>




</html>
