<%-- 
    Document   : ApplyForm
    Created on : Jun 13, 2023, 9:00:01 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Apply Page</title>
    </head>
    <body>
        <form action="ApplyApplicantServlet" method="POST" enctype="multipart/form-data">
            Name <input type="text" name="txtName" value=""/> <br/>
            Phone <input type="text" name="txtPhone" value=""/> <br/>
            Sex <select name="txtSex">
                <option value="male">Male</option>
                <option value="female">Female</option>
            </select>
            Email <input type="text" name="txtEmail" value=""/> <br/>
            CV <input type="file" name="cv" value=""/> <br/>
            <input type="submit" value="Apply"/>
        </form>
    </body>
</html>
