<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.util.List"%>
<%@page import="com.admin.Image"%>
<%
    Image image = new Image();
    List list = image.getKeyword();

    if (list.size() > 0) {
        List imageKeyword = (List) list.get(0);
        List imageHeading = (List) list.get(1);

        JSONObject obj = new JSONObject();
        obj.put("imageKeywordList", imageKeyword);
        obj.put("imageHeadingList", imageHeading);
        out.write(obj.toJSONString());

    }

%>