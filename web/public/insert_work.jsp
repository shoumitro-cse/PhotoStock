<%-- 
    Document   : insert_work
    Created on : Jan 12, 2021, 7:58:46 PM
    Author     : shoumitro
--%>

<!--insert record-->
<%@page import="com.admin.DesignerWork"%>
<%@ page import="java.io.*,java.util.*, javax.servlet.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="org.apache.commons.fileupload.*" %>
<%@ page import="org.apache.commons.fileupload.disk.*" %>
<%@ page import="org.apache.commons.fileupload.servlet.*" %>
<%
    DesignerWork dw = new DesignerWork();
    
    int work_id = 0;
    
    boolean bool = false;
    
    if (session.getAttribute("work_id") != null) {
        String work_str = session.getAttribute("work_id").toString();
        if (work_str != null) {
            work_id = Integer.parseInt(work_str);
            bool = true;
        }
            
    }
    

    
    File file;
    int maxFileSize = 3 * 1024 * 1024; // 3 MB
    int maxMemSize = 3 * 1024 * 1024; // 3 MB

    String images_dir = getServletContext().getInitParameter("images-upload-dir");
    String filePath = images_dir+"work/";

    ServletContext context = request.getServletContext();
    String appPath = context.getRealPath("");

    //good for /home/shoumitro/apache-tomcat-9.0.11/webapps/ location.
    String rpath = "asset/images/user_account/";
//    filePath = appPath + rpath + user_id + "/";


    String contentType = request.getContentType();
    if (contentType != null && bool) {
        
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
                                file = new File(filePath + "work_" + work_id + "." + format);
                                fi.write(file);

                                String picture_url = "work/"+"work_" + work_id + "." + format;
                                dw.updateImage(work_id, picture_url);
                                out.write("Successful. ");

                                response.sendRedirect("employee.jsp");

                            } else {
                                out.write("extension error. ");
                            }
                        } else {
                            out.write("Big file size error. ");

                        }
                    }
                }
            } catch (Exception ex) {
                System.out.println(ex);
            }
        }
    } else {
        
        String emp_id = request.getParameter("employee_id");
        String img_name = request.getParameter("img_name");
        String copy = request.getParameter("copy");
    
        if (emp_id != null && img_name != null && copy != null) {
           work_id = dw.inserDesignerWork(Integer.parseInt(emp_id), img_name, Integer.parseInt(copy));
     //      response.sendRedirect("employee.jsp");
           session.setAttribute("work_id", work_id);
        }
    }
%>


        