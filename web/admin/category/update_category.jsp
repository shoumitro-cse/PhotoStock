
<%@page import="com.admin.Category"%>
<%
   String category_id = request.getParameter("category_id");
   String category_name = request.getParameter("category_name");

  if(category_id != null && category_name != null) {
      
      Category.updateCategory(category_id, category_name);
      response.sendRedirect("category.jsp");
  }

%>