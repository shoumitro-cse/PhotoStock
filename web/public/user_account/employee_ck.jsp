<%-- 
    Document   : employee_ck
    Created on : Jan 13, 2021, 12:07:16 AM
    Author     : shoumitro
--%>

<%@page import="com.admin.DesignerWork"%>
<% 
               
          DesignerWork dw = new DesignerWork();

           String employee_id = "";
           String employee_email = "";
           
           employee_id = request.getParameter("employee_id");
           employee_email = request.getParameter("employee_email");
           
           if (employee_id != null && employee_email != null) {
                int designer_id =  Integer.parseInt(employee_id);

                if(dw.isEmployee(designer_id, employee_email)) {
                    session.setAttribute("designer_id", designer_id);
                    session.setAttribute("employee_email", employee_email);
                    response.sendRedirect("../employee.jsp");
                } else {
                  response.sendRedirect("../employee.jsp?err=true");  
                }
           } else {
             response.sendRedirect("../employee.jsp?err=true");  
           }
%>