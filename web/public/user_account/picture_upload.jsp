<%@page import="com.account.UserAccountEdit"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    File file;
    int maxFileSize = 3 * 1024 * 1024; // 3 MB
    int maxMemSize = 3 * 1024 * 1024; // 3 MB

    String images_dir = getServletContext().getInitParameter("images-upload-dir");
    String filePath = images_dir+"user_account/" + user_id + "/";

    ServletContext context = request.getServletContext();
    String appPath = context.getRealPath("");

    //good for /home/shoumitro/apache-tomcat-9.0.11/webapps/ location.
    String rpath = "asset/images/user_account/";
//    filePath = appPath + rpath + user_id + "/";


    String contentType = request.getContentType();
    if ((contentType.indexOf("multipart/form-data") >= 0)) {

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setSizeThreshold(maxMemSize);
        factory.setRepository(new File(filePath + "temp/"));
        ServletFileUpload upload = new ServletFileUpload(factory);
        upload.setSizeMax(maxFileSize);
        try {
            List fileItems = upload.parseRequest(request);
            Iterator it = fileItems.iterator();
            while (it.hasNext()) {
                FileItem fi = (FileItem) it.next();
                if (!fi.isFormField()) {
                    String fieldName = fi.getFieldName();
                    String fileName = fi.getName();

                    //extension
                    String format = "none";
                    int index = fileName.lastIndexOf(".");
                    if (index > 0) {
                        format = fileName.substring(index + 1);
                        format = format.toLowerCase();
                    }
                    boolean isInMemory = fi.isInMemory();
                    long sizeInBytes = fi.getSize();

                    if (sizeInBytes <= maxFileSize && isInMemory) {
                        //(PNG/JPG/JPEG/BMP, Max. 3MB)
                        if (format.equalsIgnoreCase("jpeg") || format.equalsIgnoreCase("jpg") || format.equalsIgnoreCase("png")) {
                            File upload_dir = new File(filePath);
                            if (!upload_dir.exists()) {
                                upload_dir.mkdirs();
                            }
                            file = new File(filePath + "user_" + user_id + "." + format);
                            fi.write(file);

                            String picture_url = "images/user_account/" + user_id + "/" + "user_" + user_id + "." + format;
                            UserAccountEdit userAccountEdit = new UserAccountEdit();
                            userAccountEdit.userPictureChange(user_id, picture_url);
                            out.write("Successful. ");
                            
                            response.sendRedirect("../profile.jsp");

                        } else {
                            out.write("extension error. ");
                        }
                    } else {
                        out.write("Big file size error. ");

                    }

                    out.println("<br>Uploaded Filename: " + filePath + fileName + "<br>");
                    out.println("File size " + sizeInBytes + "<br>");
                    out.println("memory " + fi.isInMemory() + "<br>");
                    out.println("extension : " + format + "<br>");
                }
            }
        } catch (Exception ex) {
            System.out.println(ex);
        }
    }
%>
