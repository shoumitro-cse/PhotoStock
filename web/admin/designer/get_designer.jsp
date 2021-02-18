<%@page import="com.admin.Designer"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%

    String desginer_id_text = request.getParameter("designer_id");
    int desginer_id = Integer.parseInt(desginer_id_text);

    List list = Designer.getDesignerListById(desginer_id);

    JSONObject obj = new JSONObject();
    obj.put("desginerList", list);
    out.write(obj.toJSONString());

%>