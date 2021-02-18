<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%

    String desginer_id_text = request.getParameter("designer_id");
    int desginer_id = Integer.parseInt(desginer_id_text);

    String type = "";

    List list = Designer.getDesignerListById(desginer_id);

    Iterator it = list.iterator();
    if (it.hasNext()) {
        Map map = (Map) it.next();

        type = map.get("type").toString();
    }

    if (type != "") {
        JSONObject obj = new JSONObject();
        obj.put("desginerType", type);
        out.write(obj.toJSONString());
    }

%>