<%@page import="com.admin.Image"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%
    List list = Image.getAllImage();
    int size = list.size();
%>
<table id="meta_table" class="table">
    <caption>
        <span class="caption-searchbox">
            <input id="meta_search_box" onkeyup="tableSearchBox('meta_search_box', 'meta_table')" type="search" placeholder="Search..." />
        </span>
        <span class="caption-text">Meta Content (<% out.write(size+""); %>)</span>
        <span class="caption-select-box">
            Show  <select class="select_box" id="meta_option_box" onchange="pagination(this, 1, 'meta_option_box', 'meta_table', 'meta_table_pagination')">
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
            <th onclick="sortTable(this, 0, 'meta_table')" class="th_down">ID</th>
            <th onclick="sortTable(this, 1, 'meta_table')" class="th_updown">Keyword</th>
            <th onclick="sortTable(this, 2, 'meta_table')" class="th_updown">isTaxed</th>
            <th onclick="sortTable(this, 3, 'meta_table')" class="th_updown">Description</th>
            <th onclick="sortTable(this, 4, 'meta_table')" class="th_updown">Image url</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <%

            Iterator it4 = list.iterator();
            while (it4.hasNext()) {
                Map map = (Map) it4.next();
        %>
        <tr>
            <td><% out.write(map.get("image_id").toString()); %></td>
            <td><% out.write(map.get("keyword").toString()); %></td>
            <td><% out.write(map.get("isTaxed").toString()); %></td>
            <td><% out.write(map.get("longDescription").toString()); %></td>
            <td><% out.write(map.get("largeImage").toString()); %></td>
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
<div id="meta_table_pagination" class="table-pagination">
</div>