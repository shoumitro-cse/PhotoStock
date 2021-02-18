<%-- 
    Document   : delete_work
    Created on : Jan 13, 2021, 2:47:40 PM
    Author     : shoumitro
--%>

<%@page import="com.admin.Designer"%>
<%@page import="java.io.File"%>
<%@page import="com.admin.DesignerWork"%>
<%
    String images_dir = "";
    
    images_dir = getServletContext().getInitParameter("images-upload-dir");
    
    int work_id = 0;
    String work_id_text = request.getParameter("work_id");

    if (work_id_text != null && work_id_text != "") {
        work_id = Integer.parseInt(work_id_text);

        String path = images_dir+DesignerWork.getImageUrl(work_id);
        
        // delete database record
        DesignerWork.deleteWork(work_id);

        //for relative path
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");

        String rpath = "asset/images/";
//        images_dir = appPath + rpath;
        
        // delete system folder
        DesignerWork.deleteFile(work_id, path);

        response.sendRedirect("work.jsp");
    }


%>