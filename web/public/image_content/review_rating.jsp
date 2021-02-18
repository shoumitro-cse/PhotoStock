<div id="my-rating-row" class="my-rating-row">
    <div class="rating-col-7 flex-col-basis-100">
        <div class="ratings-review-content-form">
            <form class="rating-form-control" action="image_content/comment_info.jsp" method="get">
                <div class="form-group">
                    <textarea name="comment_text" class="form-control-textarea"  rows="5" placeholder="Please write your honest opinion and give a rating"></textarea>
                </div>
                <div>
                    <div class="rating">
                        <input type="radio" id="star5" name="rating" value="5" /><label for="star5"></label>
                        <input type="radio" id="star4" name="rating" value="4" /><label for="star4"></label>
                        <input type="radio" id="star3" name="rating" value="3" /><label for="star3"></label>
                        <input type="radio" id="star2" name="rating" value="2" /><label for="star2"></label>
                        <input type="radio" id="star1" name="rating" value="1" /><label for="star1"></label>
                    </div>
                </div>


                <%

                    if (session.getAttribute("login") != null) {
                        if (Boolean.parseBoolean(session.getAttribute("login").toString())) {
                %>
                <button onclick="addUserComment(<% if (m.get("image_id") != null) {
                        out.write(m.get("image_id").toString());
                    } %>)" type="submit" class="btn review-submit-btn" > Submit </button>
                <% } else { %>
                <button onclick="loginForm()" type="submit" class="btn review-submit-btn" > Submit </button>

                <% }
                            } else {%>
                <button onclick="loginForm()" type="submit" class="btn review-submit-btn" > Submit </button>

                <% }%>


            </form>
            <p></p>
        </div>
    </div>
    <div class="rating-col-5 flex-col-basis-100">
        <div class="ratings-review-content-rating">
            <h2 class="pt-2"><% if (m.get("point") != null) {
                    out.write(m.get("point").toString());
                } else {
                    out.write("0.0");
                }  %></h2>
            <div class="media-body">
                <p class="text-secondary"> <% if (m.get("ratings") != null) {
                        out.write(m.get("ratings").toString());
                    } else {
                        out.write("0");
                    } %>  Ratings  and <% if (m.get("reviews") != null) {
                            out.write(m.get("reviews").toString());
                        } else {
                            out.write("0");
                        } %>  Reviews </p>
                <span class="ratings-review-star">
                    <span class="ion-ios-star"></span>
                    <span class="ion-ios-star"></span>
                    <span class="ion-ios-star-half"></span>
                </span>
            </div>
        </div>
        <div class="my-rating-row ">
            <div class="rating-col-4 rt">
                <div>
                    <i class="ion-ios-star"></i>
                    <i class="ion-ios-star ml-1"></i>
                    <i class="ion-ios-star ml-1"></i>
                    <i class="ion-ios-star ml-1"></i>
                    <i class="ion-ios-star ml-1"></i>
                </div>
                <div>
                    <i class="ion-ios-star"></i>
                    <i class="ion-ios-star ml-1"></i>
                    <i class="ion-ios-star ml-1"></i>
                    <i class="ion-ios-star ml-1"></i>
                </div>
                <div>
                    <i class="ion-ios-star"></i>
                    <i class="ion-ios-star ml-1"></i>
                    <i class="ion-ios-star ml-1"></i>
                </div>
                <div>
                    <i class="ion-ios-star"></i>
                    <i class="ion-ios-star ml-1"></i>
                </div>
                <div>
                    <i class="ion-ios-star"></i>
                </div>
            </div>
            <%
                int oneStar_p = 0, twoStar_p = 0, threeStar_p = 0, fourStar_p = 0, fiveStar_p = 0;
                if (m.get("ratings") != null) {

                    int total_rating = Integer.parseInt(m.get("ratings").toString());
                    if (total_rating != 0) {

                        int oneStar = Integer.parseInt(m.get("oneStar").toString());
                        int twoStar = Integer.parseInt(m.get("twoStar").toString());
                        int threeStar = Integer.parseInt(m.get("threeStar").toString());
                        int fourStar = Integer.parseInt(m.get("fourStar").toString());
                        int fiveStar = Integer.parseInt(m.get("fiveStar").toString());

                        int d = 100 / total_rating;

                        oneStar_p = d * oneStar;
                        twoStar_p = d * twoStar;
                        threeStar_p = d * threeStar;
                        fourStar_p = d * fourStar;
                        fiveStar_p = d * fiveStar;
                    }
                }

            %>

            <div class="rating-col-8 ratingChart">
                <div class="my-rating-row">
                    <div class="rating-col-2">[<% if (m.get("fiveStar") != null) {
                            out.write(m.get("fiveStar").toString());
                        } else {
                            out.write("0");
                        } %>]</div>
                    <div class="rating-col-10">
                        <div class="progress">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: <% out.write((fiveStar_p) + "");  %>%" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="my-rating-row">
                    <div class="rating-col-2">[<% if (m.get("fourStar") != null) {
                            out.write(m.get("fourStar").toString());
                        } else {
                            out.write("0");
                        } %>]</div>
                    <div class="rating-col-10">
                        <div class="progress rating-bar mt-2">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: <% out.write((fourStar_p) + "");  %>%" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="my-rating-row">
                    <div class="rating-col-2">[<% if (m.get("threeStar") != null) {
                            out.write(m.get("threeStar").toString());
                        } else {
                            out.write("0");
                        } %>]</div>
                    <div class="rating-col-10">
                        <div class="progress rating-bar mt-2">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: <% out.write((threeStar_p) + "");  %>%" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="my-rating-row">
                    <div class="rating-col-2">[<% if (m.get("twoStar") != null) {
                            out.write(m.get("twoStar").toString());
                        } else {
                            out.write("0");
                        } %>]</div>
                    <div class="rating-col-10">
                        <div class="progress rating-bar mt-2">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: <% out.write((twoStar_p) + "");  %>%" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>
                <div class="my-rating-row">
                    <div class="rating-col-2">[<% if (m.get("oneStar") != null) {
                            out.write(m.get("oneStar").toString());
                        } else {
                            out.write("0");
                        }  %>]</div>
                    <div class="rating-col-10">
                        <div class="progress rating-bar mt-2">
                            <div class="progress-bar bg-warning" role="progressbar" style="width: <% out.write((oneStar_p) + "");%>%" aria-valuemin="0" aria-valuemax="100"></div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </div>

</div>