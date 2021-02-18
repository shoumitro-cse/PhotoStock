
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%@page import="com.admin.Designer"%>
<%
    String desginer_id_text = session.getAttribute("desginer_id").toString();

    String view_create = "";
    if (session.getAttribute("view_create") != null) {
        view_create = session.getAttribute("view_create").toString();
    }
    String add_form = "";
    if (session.getAttribute("add_form") != null) {
        add_form = session.getAttribute("add_form").toString();
    }

    String update = "";
    if (session.getAttribute("update") != null) {
        update = session.getAttribute("update").toString();
    }

    int desginer_id = Integer.parseInt(desginer_id_text);

    session.setAttribute("desginer_id", "");

    String picture_url;

    File file;
    int maxFileSize = 3 * 1024 * 1024; // 3 MB
    int maxMemSize = 3 * 1024 * 1024; // 3 MB

    String images_dir = getServletContext().getInitParameter("images-upload-dir");

    String filePath = images_dir + "designer_account/" + desginer_id + "/";

    ServletContext context = request.getServletContext();
    String appPath = context.getRealPath("");

    //good for /home/shoumitro/apache-tomcat-9.0.11/webapps/ location.
        String rpath = "asset/images/designer_account/";
    //    filePath = appPath + rpath + desginer_id + "/";
    
    
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
                            file = new File(filePath + "designer_" + desginer_id + "." + format);
                            fi.write(file);

                            picture_url = "images/designer_account/" + desginer_id + "/" + "designer_" + desginer_id + "." + format;

                            Designer.updateDesignerPicture(picture_url, desginer_id);

                            if (view_create.contentEquals("view_create")) {
                                session.setAttribute("view_create", "");
                                response.sendRedirect("view.jsp");
                            } else if (update.contentEquals("update_form")) {
                                session.setAttribute("update", "");
                                response.sendRedirect("view.jsp");
                            } else if (add_form.contentEquals("add")) {
                                session.setAttribute("add_form", "");
                                response.sendRedirect("add.jsp");
                            } else {
                                response.sendRedirect("view.jsp");
                            }

                        } else {
                            out.write("extension error. ");

                            if (view_create.contentEquals("view_create")) {
                                session.setAttribute("view_create", "");
                                response.sendRedirect("view.jsp");
                            } else if (update.contentEquals("update_form")) {
                                session.setAttribute("update", "");
                                response.sendRedirect("view.jsp");
                            } else if (add_form.contentEquals("add")) {
                                session.setAttribute("add_form", "");
                                response.sendRedirect("add.jsp");
                            } else {
                                response.sendRedirect("view.jsp");
                            }

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