<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
<%@page import="java.util.List"%>


<table id="social_table" class="table">
    <!--<caption>Social Link</caption>-->
    <caption>
        <span class="caption-searchbox">
            <input id="social_table_search_box" onkeyup="tableSearchBox('social_table_search_box', 'social_table')" type="search" name="social_table_search_box" placeholder="Search..." />
        </span>
        <span class="caption-text">Social Link</span>
        <span class="caption-select-box">
            Show  <select  class="select_box" id="social_table_select_box" name="item1" onchange="pagination(this, 1, 'social_table_select_box', 'social_table', 'social_table_pagination')">
                <option value="5">5</option>
                <option selected="true" value="10">10</option>
                <option value="20">20</option>
                <option value="40">40</option>
                <option value="60">60</option>
                <option value="all">all</option>
            </select> entities
        </span>
    </caption>
    ,<thead>
        <tr>
            <th onclick="sortTable(this, 0, 'social_table')" class="th_down">Fullname</th>
            <th onclick="sortTable(this, 1, 'social_table')" class="th_updown">Linkedin</th>
            <th onclick="sortTable(this, 2, 'social_table')" class="th_updown">Facebook</th>
            <th onclick="sortTable(this, 3, 'social_table')" class="th_updown">Email</th>
            <th onclick="sortTable(this, 4, 'social_table')" class="th_updown">Picture url</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            List list = Designer.getDesignerList();
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                Map map = (Map) it2.next();
                // System.out.println(map.get("facebook"));
        %>
        <tr>
            <td><% out.write(map.get("fullname").toString()); %></td>
            <td><% out.write(map.get("linkedin").toString()); %></td>
            <td><% out.write(map.get("facebook").toString()); %></td>
            <td><% out.write(map.get("email").toString()); %></td>
            <td><% out.write(map.get("picture_url").toString()); %></td>
            <td class="edit">
                <button onclick="viewDesignerProfile(<% out.write(map.get("desginer_id").toString()); %>)" title="view" class="fa fa-eye"></button>
                <button  onclick="updateFormBoxOpen(<% out.write(map.get("desginer_id").toString()); %>)"  title="edit" class="fa fa-edit"></button>
                <button onclick="openDeleteAlert(<% out.write(map.get("desginer_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
            </td>
        </tr>
        <% }%>
    </tbody>
    <tfoot>

    </tfoot>
</table>
<!--for social table pagination-->
<div id="social_table_pagination" class="table-pagination">
</div>