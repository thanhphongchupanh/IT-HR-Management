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
                    <td colspan="4">
                        <c:if test="${empty result2 && empty result}">
                            <p class="text-lg">Empty list</p>
                            <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke-width="1.5" stroke="currentColor" class="w-10 h-10">
                                <path stroke-linecap="round" stroke-linejoin="round" d="M2.25 13.5h3.86a2.25 2.25 0 012.012 1.244l.256.512a2.25 2.25 0 002.013 1.244h3.218a2.25 2.25 0 002.013-1.244l.256-.512a2.25 2.25 0 012.013-1.244h3.859m-19.5.338V18a2.25 2.25 0 002.25 2.25h15A2.25 2.25 0 0021.75 18v-4.162c0-.224-.034-.447-.1-.661L19.24 5.338a2.25 2.25 0 00-2.15-1.588H6.911a2.25 2.25 0 00-2.15 1.588L2.35 13.177a2.25 2.25 0 00-.1.661z" />
                            </svg>
                        </c:if>
                    </td>
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
