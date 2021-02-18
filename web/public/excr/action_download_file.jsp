<%@page import="java.io.FileInputStream"%>

<%
//            String filename = "t.jpg";
    String filename = "commons-fileupload-1.4-bin.tar.gz";
    String filepath = "/home/shoumitro/Documents/html_ex/er/ps/upload/";
    response.setContentType("APPLICATION/OCTET-STREAM");
    response.setHeader("Content-Disposition", "attachment; filename=\"" + filename + "\"");

    java.io.FileInputStream fileInputStream = new java.io.FileInputStream(filepath + filename);

    int i;
    while ((i = fileInputStream.read()) != -1) {
        out.write(i);
    }
    fileInputStream.close();
%>
