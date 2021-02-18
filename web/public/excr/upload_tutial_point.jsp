<%-- 
    Document   : upload_tutial_point
    Created on : Jul 17, 2020, 1:43:22 AM
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
        <h3>File Upload:</h3>
        Select a file to upload: <br />
        <form action = "/PhotoStock/UploadServlet" method = "post" enctype = "multipart/form-data">
            <!--<input type = "file" name = "file" size = "50" multiple />-->
            <input type = "file" name = "file" size = "50" multiple />
            <br />
            <input type = "submit" value = "Upload File" />
        </form>
    </body>
</html>
