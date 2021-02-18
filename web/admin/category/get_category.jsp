<%@page import="com.admin.Category"%>
<%@page import="com.admin.Designer"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%

    String category_id_text = request.getParameter("category_id");
    int category_id = Integer.parseInt(category_id_text);

    List list = Category.getImageCategoryById(category_id);

    JSONObject obj = new JSONObject();
    obj.put("categoryList", list);
    out.write(obj.toJSONString());

%>