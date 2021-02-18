<%-- 
    Document   : action
    Created on : Jul 17, 2020, 12:43:45 AM
    Author     : shoumitro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Guru File</title>
    </head>
    <body>
        <a>Guru File Upload:</a>
        Select file: <br />
        <form action="f_u.jsp" method="post" enctype="multipart/form-data">
            <!--<input type="file" name="file" size="50" multiple  />-->
            <input type="file" name="file" size="50"  />
            <br />
            <input type="submit" value="Upload File" />
        </form>

        Downloading File Form Servlet (Best) : <a href="/PhotoStock/guru_download?a=Hello"> Download here!!!</a><BR/>
        Downloading File Form JSP (not work perfectly) : <a href="action_download_file.jsp"> Download here!!!</a>

    </body>
</html>