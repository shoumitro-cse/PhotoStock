
<%@page import="java.io.File"%>
<%@page import="com.admin.Designer"%>
<%
    String images_dir = "";
    
    images_dir = getServletContext().getInitParameter("images-upload-dir");
    
    int desginer_id = 0;
    String desginer_id_text = request.getParameter("id");

    if (desginer_id_text != null && desginer_id_text != "") {
        desginer_id = Integer.parseInt(desginer_id_text);

        // delete database record
        Designer.deleteRecord(desginer_id);

        //for relative path
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");

        String rpath = "asset/images/";
//        images_dir = appPath + rpath;
        
        // delete system folder
        Designer.deleteFolder(desginer_id, images_dir);

        response.sendRedirect("view.jsp");
    }


%>