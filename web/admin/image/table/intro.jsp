<%@page import="com.admin.Image"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%
    List list = Image.getAllImage();
    int size = list.size();
%>

<table id="image_table" class="table">
    <caption>
        <span class="caption-searchbox">
            <input id="image_list_search_box" onkeyup="tableSearchBox('image_list_search_box', 'image_table')" type="search" placeholder="Search..." />
        </span>
        <span class="caption-text">Image List (<% out.write(size+""); %>)</span>
        <span class="caption-select-box">
            Show  <select class="select_box" id="image_table_option_box" onchange="pagination(this, 1, 'image_table_option_box', 'image_table', 'image_table_pagination')">
                <option value="5">5</option>
                <option value="10">10</option>
                <option value="20">20</option>
                <option selected="true" value="30">30</option>
                <option value="40">40</option>
                <option value="60">60</option>
                <option value="all">all</option>
            </select> entities
        </span>
    </caption>
    ,<thead>
        <tr>
            <th onclick="sortTable(this, 0, 'image_table')" class="th_down">ID</th>
            <th onclick="sortTable(this, 1, 'image_table')" class="th_updown">Name</th>
            <th onclick="sortTable(this, 2, 'image_table')" class="th_updown">Designer Name</th>
            <th onclick="sortTable(this, 3, 'image_table')" class="th_updown">Category</th>
            <th onclick="sortTable(this, 4, 'image_table')" class="th_updown">Header Text</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <%
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Map map = (Map) it.next();
        %>
        <tr>
            <td><% out.write(map.get("image_id").toString()); %></td>
            <td><% out.write(map.get("name").toString()); %></td>
            <td><% out.write(map.get("fullname").toString()); %></td>
            <td><% out.write(map.get("category_name").toString()); %></td>
            <td><% out.write(map.get("header").toString()); %></td>
            <td class="edit">
                <button onclick="viewImageProfile(<% out.write(map.get("image_id").toString()); %>)" title="view" class="fa fa-eye"></button>
                <button  onclick="updateImageFormBoxOpen(<% out.write(map.get("image_id").toString()); %>)"   title="edit" class="fa fa-edit"></button>
                <button onclick="openImageDeleteAlert(<% out.write(map.get("image_id").toString()); %>)" title="delete" class="fa fa-trash"></button>
            </td>
        </tr>
        <% }%>
    </tbody>
    <tfoot>
    </tfoot>
</table>
<div id="image_table_pagination" class="table-pagination">
</div>