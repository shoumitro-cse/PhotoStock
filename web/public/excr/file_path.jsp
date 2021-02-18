

<%

    String images_dir = getServletContext().getInitParameter("images-upload-dir");

    out.write(images_dir);
    out.write("<br/>");
    

    int image_id = 1100;
    
    //for relative path
    ServletContext context = request.getServletContext();
    String appPath = context.getRealPath("");

    String rpath = "asset/images/image/";
    String filePath = appPath + rpath + image_id + "/";
    
   out.write(filePath);

%>