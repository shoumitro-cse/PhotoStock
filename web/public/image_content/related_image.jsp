
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.admin.Image"%>

<div id="vs-related">
    <div id="group-similar" class="group">
        <h1>
            <span class="fa fa-camera"></span>
            <strong>Similar Images</strong>
        </h1>
        <div class="gallery large">
            <ul>
                <%
                    List relatedImageList = Image.getRelatedImage(get_image_id, 8, true);
                    int relatedImageCount = relatedImageList.size();

                    Iterator relatedImageList_it = (Iterator) relatedImageList.iterator();
                    while (relatedImageList_it.hasNext()) {
                        Map map = (Map) relatedImageList_it.next();
                %>
                <li class="reveal">
                    <a href="javascript:void(0)" title="">
                        <img src="../asset/<% out.write(map.get("largeImage").toString()); %>">
                        <span onclick="imageBye(<% out.write(map.get("image_id").toString()); %>)" class="buy-cart"> Buy </span>
                        <span class="add-cart">
                            <span onclick="addToCart(<% out.write(map.get("image_id").toString()); %>)" style="color: dodgerblue" class="fa fa-shopping-cart"></span>
                            <span onclick="openPreView('<%out.write(map.get("name").toString());%>', '<%out.write(map.get("desginer_name").toString());%>', '<%out.write(map.get("largeImage").toString());%>')" style="color: black" class="fa fa-eye"></span>
                            <span onclick="addToWishlist(<% out.write(map.get("image_id").toString()); %>)" style="color: red" class="fa fa-heart"></span>
                        </span>
                        <!--<span class="add-cart"><span class="fa fa-shopping-cart"></span><span class="fa fa-download"></span><span class="fa fa-heart"></span></span>-->
                    </a>
                </li>
                <%  }  %>
                <!--<em  >Preview</em>-->

            </ul>
        </div>
        <div class="gallery small more">
            <ul>
                <%
                    if(relatedImageCount > 7) {
                    
                    String image_type = "";
                    List relatedImageList2 = Image.getRelatedImage(get_image_id, 6, false);
 
                    Iterator relatedImageList_it2 = (Iterator) relatedImageList2.iterator();
                    while (relatedImageList_it2.hasNext()) {
                        Map map = (Map) relatedImageList_it2.next();
                        image_type = map.get("type").toString().trim();
                %>
                <li>
                    <a href="gallery.jsp?select_box=<% out.write(map.get("type").toString()); %>&body_search_box=<% out.write(map.get("name").toString().trim().substring(0, 2)); %>" title="">
                        <img src="../asset/<% out.write(map.get("largeImage").toString()); %>">
                    </a>
                </li>
                <%  }%>

                <li class="more">
                    <div>
                        <a href="gallery.jsp?select_box=<% out.write(image_type); %>&body_search_box=">
                            <span class="lrg">More Images....</span>
                        </a>
                    </div>
                </li>
                <%  } %>
            </ul>
        </div>
    </div>

    <div class="artist-image">

    </div>

</div>