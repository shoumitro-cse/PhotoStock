package com.account;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author shoumitro
 */
public class ImageDownload extends HttpServlet{
  
    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println(request.getParameter("image_id"));
        String image_id_text = request.getParameter("image_id").toString().trim();
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
//        out.write(image_id_text);
       
       //  /home/shoumitro/Documents/html_ex/PhotoStock/web/asset/images/
       String images_dir = getServletContext().getInitParameter("images-upload-dir");
        
//        String gurufile = "t.jpg";
        String file_name = "product_"+image_id_text+".zip";
        String new_file_name = "image_"+image_id_text+".zip";
        String path = images_dir+"image/"+image_id_text+"/";
        
//        response.sendRedirect(path);
        
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + new_file_name + "\"");

        FileInputStream fileInputStream = new FileInputStream(path + file_name);

        int i;
        while ((i = fileInputStream.read()) != -1) {
            out.write(i);
        }
        fileInputStream.close();
        out.close();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }  
}
