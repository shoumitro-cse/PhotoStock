<%@page import="com.admin.Image"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%
    List list = Image.getAllImage();
    int size = list.size();
%>
<table id="stock_table" class="table">
    <caption>
        <span class="caption-searchbox">
            <input id="stock_search_box" onkeyup="tableSearchBox('stock_search_box', 'stock_table')" type="search" placeholder="Search..." />
        </span>
        <span class="caption-text">Stock Info (<% out.write(size+""); %>)</span>
        <span class="caption-select-box">
            Show  <select class="select_box" id="stock_option_box" onchange="pagination(this, 1, 'stock_option_box', 'stock_table', 'stock_table_pagination')">
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
            <th onclick="sortTable(this, 0, 'stock_table')" class="th_down">ID</th>
            <th onclick="sortTable(this, 1, 'stock_table')" class="th_updown">Total Stock</th>
            <th onclick="sortTable(this, 2, 'stock_table')" class="th_updown">Current Stock</th>
            <th onclick="sortTable(this, 3, 'stock_table')" class="th_updown">Upload Date</th>
            <th onclick="sortTable(this, 4, 'stock_table')" class="th_updown">Type</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>

    </thead>
    <tbody>
        <%
            Iterator it2 = list.iterator();
            while (it2.hasNext()) {
                Map map = (Map) it2.next();
        %>
        <tr>
            <td><% out.write(map.get("image_id").toString()); %></td>
            <td><% out.write(map.get("total_stock").toString()); %></td>
            <td><% out.write(map.get("current_stock").toString()); %></td>
            <td><% out.write(map.get("uploadDate").toString()); %></td>
            <td><% out.write(map.get("type").toString()); %></td>
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
<div id="stock_table_pagination" class="table-pagination">
</div>