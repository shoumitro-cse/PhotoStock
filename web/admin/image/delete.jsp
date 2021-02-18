
<%@page import="com.admin.Image"%>
<%@page import="java.io.File"%>
<%
    String images_dir;

    images_dir = getServletContext().getInitParameter("images-upload-dir");

    int image_id = 0;
    String image_id_text = request.getParameter("id");

    if (image_id_text != null && image_id_text != "") {
        image_id = Integer.parseInt(image_id_text);

        // delete database record
        Image.deleteImageRecord(image_id);

        //for relative path
        ServletContext context = request.getServletContext();
        String appPath = context.getRealPath("");

        String rpath = "asset/images/";
//        images_dir = appPath + rpath;

        // delete system folder
        Image.deleteImageFolder(image_id, images_dir);

        response.sendRedirect("view.jsp");
    }


%>