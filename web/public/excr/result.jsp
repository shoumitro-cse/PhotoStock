<%-- 
    Document   : result
    Created on : Jul 16, 2020, 9:06:50 PM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        Result : 
        <% String msg = (String) request.getAttribute("gurumessage");
            out.println(msg);
        %>
    </body>
</html>
