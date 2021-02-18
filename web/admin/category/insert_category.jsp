
<%@page import="com.admin.Category"%>
<%
    String category_name = request.getParameter("category_name");

    if (category_name != null) {
        Category.insertCategory(category_name);
        response.sendRedirect("category.jsp");
    }

%>