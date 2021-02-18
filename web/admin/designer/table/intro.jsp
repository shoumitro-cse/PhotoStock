<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Designer"%>
<%@page import="java.util.List"%>

<table id="desginer_table" class="table">
    <caption>
        <span class="caption-searchbox">
            <input id="desginer_list_search_box" onkeyup="tableSearchBox('desginer_list_search_box', 'desginer_table')" type="search" name="desginer_list_search_box" placeholder="Search..." />
        </span>
        <span class="caption-text">Designer List</span>
        <span class="caption-select-box">
            Show  <select class="select_box" id="table_select_box" name="item" onchange="pagination(this, 1, 'table_select_box', 'desginer_table', 'table_pagination')">
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
            <th onclick="sortTable(this, 0, 'desginer_table')" class="th_down">ID</th>
            <th onclick="sortTable(this, 1, 'desginer_table')" class="th_updown">Fullname</th>
            <th onclick="sortTable(this, 2, 'desginer_table')" class="th_updown">Type</th>
            <th onclick="sortTable(this, 3, 'desginer_table')" class="th_updown">Message</th>
            <th onclick="sortTable(this, 4, 'desginer_table')" class="th_updown">Phone</th>
            <th style="text-align: center;cursor: initial;">Actions</th>
        </tr>
    </thead>
    <tbody>

        <%
            List list = Designer.getDesignerList();
            Iterator it = list.iterator();
            while (it.hasNext()) {
                Map map = (Map) it.next();
                // System.out.println(map.get("facebook"));
        %>

        <tr>
            <td><% out.write(map.get("desginer_id").toString()); %></td>
            <td><% out.write(map.get("fullname").toString()); %></td>
            <td><% out.write(map.get("type").toString()); %></td>
            <td><% out.write(map.get("msg").toString()); %></td>
            <td><% out.write(map.get("phone").toString()); %></td>
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
<div id="table_pagination" class="table-pagination">
    <!--<ul class="pg">-->
    <!--<li><a class="previous" href="">Previous</a></li>-->
    <!--   <li><a class="p-active " href="">1</a></li>
            <li><a href="">2</a></li>-->
    <!--<li><a class="next" href="">Next</a></li>-->
    <!--</ul>-->
</div>