
<%@page import="com.admin.AdminAccount"%>
<%@page import="java.io.File"%>
<%@page import="com.admin.Designer"%>
<%
    String images_dir = "";
    
    images_dir = getServletContext().getInitParameter("images-upload-dir");
    
    int admin_id = 0;
    String admin_id_text = request.getParameter("id");

    if (admin_id_text != null && admin_id_text != "") {
        admin_id = Integer.parseInt(admin_id_text);

        // delete database record
        AdminAccount.deleteRecord(admin_id);

        //for relative path
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");

        String rpath = "asset/images/";
//        images_dir = appPath + rpath;
        
        // delete system folder
        AdminAccount.deleteFolder(admin_id, images_dir);

        response.sendRedirect("view.jsp");
    }


%>