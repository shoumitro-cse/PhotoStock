<%-- 
    Document   : success
    Created on : Jul 6, 2020, 12:54:29 AM
    Author     : shoumitro
--%>

<%
    String log = session.getAttribute("login").toString();
//    out.write("{'login':'" + log + "'}");
    out.write("true");

%>