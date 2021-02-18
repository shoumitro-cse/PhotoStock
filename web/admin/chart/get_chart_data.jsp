<%@page import="java.util.Map"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="com.admin.Chart"%>
<% 
        Map map = Chart.getAllChartData();

        JSONObject obj = new JSONObject();
        obj.put("dataSeries", map);
        out.write(obj.toJSONString());
%>