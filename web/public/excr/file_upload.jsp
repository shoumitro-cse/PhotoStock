<%-- 
    Document   : file_upload
    Created on : Jul 16, 2020, 8:47:56 PM
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
        File: <br />
        <form action="/PhotoStock/guru_upload" method="post"
              enctype="multipart/form-data">
            <input type="file" name="guru_file" size="50" />
            <br />
            <input type="submit" value="Upload" />
        </form>
        
        Guru Downloading File<a href="/PhotoStock/guru_download">Download here!!!</a>
    </body>
</html>
