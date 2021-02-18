<%@page import="com.admin.Image"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>

<%
    List list = Image.getAllImage();
    int size = list.size();
%>
<table id="fullTable_list" class="table">
    <caption style="text-align: left;text-decoration: none">
        <span class="caption-searchbox">
            <input id="fullTable_search_box" onkeyup="tableSearchBox('fullTable_search_box', 'fullTable_list')" type="search" placeholder="Search..." />
        </span>
        <span style="margin-left: 9%" class="caption-text">Full Table (<% out.write(size+""); %>)</span>
        <span style="float: none; margin-left: 14%; text-decoration: none;" class="caption-select-box">
            Show  <select  class="select_box" id="fullTable_option_box" onchange="pagination(this, 1, 'fullTable_option_box', 'fullTable_list', 'fullTable_pagination')">
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
            <th onclick="sortTable(this, 0, 'fullTable_list')" class="th_down">ID</th>
            <th onclick="sortTable(this, 1, 'fullTable_list')" class="th_updown">Name</th>
            <th onclick="sortTable(this, 2, 'stock_table')" class="th_updown">Designer Name</th>
            <th onclick="sortTable(this, 3, 'fullTable_list')" class="th_updown">Category</th>
            <th onclick="sortTable(this, 4, 'fullTable_list')" class="th_updown">Header Text</th>

            <th onclick="sortTable(this, 5, 'stock_table')" class="th_updown">Total Stock</th>
            <th onclick="sortTable(this, 6, 'stock_table')" class="th_updown">Current Stock</th>
            <th onclick="sortTable(this, 7, 'stock_table')" class="th_updown">Upload Date</th>
            <th onclick="sortTable(this, 8, 'fullTable_list')" class="th_updown">Type</th>

            <th onclick="sortTable(this, 9, 'fullTable_list')" class="th_updown">Unit Price</th>
            <th onclick="sortTable(this, 10, 'fullTable_list')" class="th_updown">Alternate Price </th>
            <th onclick="sortTable(this, 11, 'fullTable_list')" class="th_updown">Save Money</th>
            <th onclick="sortTable(this, 12, 'fullTable_list')" class="th_updown">Percent Rate</th>

            <th onclick="sortTable(this, 13, 'fullTable_list')" class="th_updown">Keyword</th>
            <th onclick="sortTable(this, 14, 'fullTable_list')" class="th_updown">isTaxed</th>
            <th onclick="sortTable(this, 15, 'fullTable_list')" class="th_updown">Description</th>
            <th onclick="sortTable(this, 16, 'fullTable_list')" class="th_updown">Image url</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <%

            Iterator it5 = list.iterator();
            while (it5.hasNext()) {
                Map map = (Map) it5.next();
        %>
        <tr>
            <td><% out.write(map.get("image_id").toString()); %></td>

            <td><% out.write(map.get("name").toString()); %></td>
            <td><% out.write(map.get("fullname").toString()); %></td>
            <td><% out.write(map.get("category_name").toString()); %></td>
            <td><% out.write(map.get("header").toString()); %></td>

            <td><% out.write(map.get("total_stock").toString()); %></td>
            <td><% out.write(map.get("current_stock").toString()); %></td>
            <td><% out.write(map.get("uploadDate").toString()); %></td>
            <td><% out.write(map.get("type").toString()); %></td>

            <td><% out.write(map.get("unitPrice").toString()); %></td>
            <td><% out.write(map.get("alternatePrice").toString()); %></td>
            <td><% out.write(map.get("saveMoney").toString()); %>.</td>
            <td><% out.write(map.get("percentRate").toString()); %></td>

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
<div id="fullTable_pagination" class="table-pagination">
</div>