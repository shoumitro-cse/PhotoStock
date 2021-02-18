
<%@page import="com.admin.AdminAccount"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="com.admin.Designer"%>
<%
    int admin_id = 0;
    if (session.getAttribute("admin_id") != null) {
        String admin_id_text = session.getAttribute("admin_id").toString();
        if (admin_id_text != null && admin_id_text != "") {
            admin_id = Integer.parseInt(admin_id_text);
        }
    }

    String page_name = "";
    if (session.getAttribute("page") != null && session.getAttribute("page") != "") {
        page_name = session.getAttribute("page").toString();
    }

    String picture_url;

    File file;
    int maxFileSize = 3 * 1024 * 1024; // 3 MB
    int maxMemSize = 3 * 1024 * 1024; // 3 MB

    String images_dir = getServletContext().getInitParameter("images-upload-dir");

    String filePath = images_dir + "admin_account/" + admin_id + "/";

    ServletContext context = request.getServletContext();
    String appPath = context.getRealPath("");

    //good for /home/shoumitro/apache-tomcat-9.0.11/webapps/ location.
    String rpath = "asset/images/admin_account/";
    //    filePath = appPath + rpath + admin_id + "/";

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
                            file = new File(filePath + "admin_" + admin_id + "." + format);
                            fi.write(file);

                            picture_url = "images/admin_account/" + admin_id + "/" + "admin_" + admin_id + "." + format;

                            AdminAccount.updateAdminPicture(picture_url, admin_id);

                            if (page_name == "") {
                                response.sendRedirect("account.jsp");
                            } else {
                                response.sendRedirect(page_name);
                            }

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