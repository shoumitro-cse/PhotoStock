<%@page import="com.admin.Image"%>
<%@page import="com.admin.Designer"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%

    String image_id_text = request.getParameter("image_id");
    int image_id = Integer.parseInt(image_id_text);

    List list = Image.getImageById(image_id);

    JSONObject obj = new JSONObject();
    obj.put("imageList", list);
    out.write(obj.toJSONString());

%>