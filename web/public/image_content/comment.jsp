<div class="ratings-review-content-review">
    <!--comment 1-->
    <%
        Iterator it2 = (Iterator) commentList.iterator();
        while (it2.hasNext()) {
            Map map2 = (Map) it2.next(); %>

    <div class="my-rating-row margin-top-bottom-20">
        <div class="rating-col-2 content-review-user-info flex-col-basis-100-1">
            <img src="../asset/<% out.write(map2.get("user_picture_url").toString()); %>" alt="user image">
            <span>  <% out.write(map2.get("user_name").toString()); %> </span>
            <span id="comment-date-text">  <% out.write(map2.get("commentDate").toString()); %>  </span>
            <% if (map2.get("rating").toString().equals("1")) { %>
            <span>
                <span class="ion-ios-star"></span>
            </span>
            <%}%>
            <% if (map2.get("rating").toString().equals("2")) { %>
            <span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
            </span>
            <%}%>
            <% if (map2.get("rating").toString().equals("3")) { %>
            <span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
            </span>
            <%}%>
            <% if (map2.get("rating").toString().equals("4")) { %>
            <span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
            </span>
            <%}%>
            <% if (map2.get("rating").toString().equals("5")) { %>
            <span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
                <span class="ion-ios-star"></span>
            </span>
            <%}%>
        </div>
        <div class="rating-col-10 content-review-user-comment flex-col-basis-100-1">
            <div class="user-review-container">
                <div class="user-review-container-description">
                    <% out.write(map2.get("longDescription").toString()); %> 
                </div>
                <div class="read-more-overlay-container">
                    <div class="read-more-overlay">
                        <!--more-->
                    </div>
                </div>
            </div>
            <div class="user-review-read-more">
                <p class="js-read-more">Read More</p>
            </div>
            <div class="helpful-review">
                <p id="helpful-review-id">
                    <span> <% out.write(map2.get("like_count").toString()); %> </span> like
                    <span> <% out.write(map2.get("dislike_count").toString()); %> </span> dislike
                    people found this review helpful. Was this review helpful to you?
                </p>
            </div>



            <%

                if (session.getAttribute("login") != null) {
                    if (Boolean.parseBoolean(session.getAttribute("login").toString())) {
            %>

            <div class="review-action">
                <a onclick="addLike(<% out.write(map2.get("comment_id").toString()); %>)" href="#"  data-value="1">
                    <img  src="../asset/images/web_icon/ionicons_like.svg">
                </a>
                <a onclick="addDisLike(<% out.write(map2.get("comment_id").toString()); %>)"  href="#"  data-value="0">
                    <img  src="../asset/images/web_icon/ionicons_dislike.svg">
                </a>
            </div>


            <% } else { %>

            <div class="review-action">
                <a onclick="loginForm()" href="#"  data-value="1">
                    <img  src="../asset/images/web_icon/ionicons_like.svg">
                </a>
                <a onclick="loginForm()"  href="#"  data-value="0">
                    <img  src="../asset/images/web_icon/ionicons_dislike.svg">
                </a>
            </div>


            <% }
            } else {%>

            <div class="review-action">
                <a onclick="loginForm()" href="#"  data-value="1">
                    <img  src="../asset/images/web_icon/ionicons_like.svg">
                </a>
                <a onclick="loginForm()"  href="#"  data-value="0">
                    <img  src="../asset/images/web_icon/ionicons_dislike.svg">
                </a>
            </div>


            <% }%>


        </div>
    </div>
    <%}%>


</div>