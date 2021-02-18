
<%@page import="com.admin.Category"%>
<%
    String category_id = request.getParameter("category_id");

    if (category_id != null) {
        Category.deleteCategory(category_id);
        response.sendRedirect("category.jsp");
    }

%>