package excr;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class guru_download extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        System.out.println(request.getParameter("a"));
        
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        
//        String gurufile = "t.jpg";
        String file_name = "commons-fileupload-1.4-bin.tar.gz";
        String path = "/home/shoumitro/Documents/html_ex/er/ps/upload/";
        
        response.setContentType("APPLICATION/OCTET-STREAM");
        response.setHeader("Content-Disposition", "attachment; filename=\"" + file_name + "\"");

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
