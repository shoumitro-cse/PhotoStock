<%@page import="com.admin.Image"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%
    List list = Image.getAllImage();
    int size = list.size();
%>
<table id="pricing_table" class="table">
    <caption>
        <span class="caption-searchbox">
            <input id="pricing_search_box" onkeyup="tableSearchBox('pricing_search_box', 'pricing_table')" type="search" placeholder="Search..." />
        </span>
        <span class="caption-text">Pricing (<% out.write(size+""); %>)</span>
        <span class="caption-select-box">
            Show  <select class="select_box" id="pricing_option_box" onchange="pagination(this, 1, 'pricing_option_box', 'pricing_table', 'pricing_table_pagination')">
                <option value="5">5</option>
                <option selected="true" value="10">10</option>
                <option value="20">20</option>
                <option value="30">30</option>
                <option value="40">40</option>
                <option value="60">60</option>
                <option value="all">all</option>
            </select> entities
        </span>
    </caption>
    ,<thead>
        <tr>
            <th onclick="sortTable(this, 0, 'pricing_table')" class="th_down">ID</th>
            <th onclick="sortTable(this, 1, 'pricing_table')" class="th_updown">Unit Price</th>
            <th onclick="sortTable(this, 2, 'pricing_table')" class="th_updown">Alternate Price </th>
            <th onclick="sortTable(this, 3, 'pricing_table')" class="th_updown">Save Money</th>
            <th onclick="sortTable(this, 4, 'pricing_table')" class="th_updown">Percent Rate</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>
    </thead>
    <tbody>
        <%

            Iterator it3 = list.iterator();
            while (it3.hasNext()) {
                Map map = (Map) it3.next();
        %>
        <tr>
            <td><% out.write(map.get("image_id").toString()); %></td>
            <td><% out.write(map.get("unitPrice").toString()); %></td>
            <td><% out.write(map.get("alternatePrice").toString()); %></td>
            <td><% out.write(map.get("saveMoney").toString()); %>.</td>
            <td><% out.write(map.get("percentRate").toString()); %></td>
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
<div id="pricing_table_pagination" class="table-pagination">
</div>