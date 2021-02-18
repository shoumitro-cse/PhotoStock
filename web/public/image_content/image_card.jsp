<section class="details-image-section">
    <div class="my-row">
        <div class="my-col-9">
            <div class="details-image-main-info-wrapper">
                <div class="my-row  no-gutters">
                    <div class="details-photo-main-img-wrapper">
                        <img class="look-inside" src="../asset/<% out.write(m.get("largeImage").toString()); %>" alt="" onclick="" />
                    </div>
                    <div class="details-image-main-info">
                        <div class="details-image-main-info-header">
                            <h1> <% out.write(m.get("header").toString()); %> </h1>
                        </div>
                        <div class="details-book-main-info-content">
                            <div class="details-image-info-content-artist flex-margin ">
                                <span class="artist">Desginer: </span>
                                <a class="artist-name" href=""> <% out.write(m.get("desginer_name").toString()); %>  </a>
                            </div>
                            <div class="details-image-info-content-category flex-margin ">
                                <span class="category">Category: </span>
                                <a  class="category-text" href="" class=""> <% out.write(m.get("category_name").toString()); %>  </a>
                            </div>

                            <div class="details-image-info-content-rating flex-margin ">
                                <% if (m.get("ratings") != null && m.get("ratings").toString().equals("1")) { %>
                                <span class="fa fa-star"></span>
                                <%}%>
                                <% if (m.get("ratings") != null && m.get("ratings").toString().equals("2")) { %>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <%}%>
                                <% if (m.get("ratings") != null && m.get("ratings").toString().equals("3")) { %>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <%}%>
                                <% if (m.get("ratings") != null && m.get("ratings").toString().equals("4")) { %>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <%}%>
                                <% if (m.get("ratings") != null && m.get("ratings").toString().equals("5")) { %>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <span class="fa fa-star"></span>
                                <%}%>
                                <span class="rating-text">
                                    <%
                                        if (m.get("ratings") != null) {
                                            out.write(m.get("ratings").toString());
                                        } else {
                                            out.write("0");
                                        }
                                    %> Ratings</span>
                                <a class="rating-text" href="#review"> / 
                                    <%
                                        if (m.get("reviews") != null) {
                                            out.write(m.get("reviews").toString());
                                        } else {
                                            out.write("0");
                                        }
                                    %> Review</a>
                            </div>
                            <div class="details-image-info-content-price">
                                <p class="price-strike-through"><strike class="original-price">$<% out.write(m.get("unitPrice").toString()); %></strike></p>
                                <p>
                                    <span class="sell-price">$<% out.write(m.get("alternatePrice").toString()); %></span>
                                    <span class="price-off">
                                        <span class="">You Save $<% out.write(m.get("saveMoney").toString()); %></span>(<% out.write(m.get("percentRate").toString()); %>%)
                                    </span>
                                </p>
                            </div>
                        </div>
                        <div class="details-btn">
                            <div class="my-row no-gutters">
                                <%

                                    if (session.getAttribute("login") != null) {
                                        if (Boolean.parseBoolean(session.getAttribute("login").toString())) {
                                %>

                                <div class="cart-wish-btn">
                                    <a onclick="addToWishlist(<% out.write(m.get("image_id").toString()); %>)" class="btn details-look-btn">Add To Wishlist</a>
                                    <a href="" class="btn details-cart-btn" onclick="addToCart(<% out.write(m.get("image_id").toString());%>)">
                                        <img src="../asset/images/web_icon/cart-mini.svg" alt="">
                                        <span>Go To Cart</span>
                                    </a>
                                </div>

                                <% } else { %>
                                <div class="cart-wish-btn">
                                    <a onclick="loginForm()" class="btn details-look-btn">Add To Wishlist</a>
                                    <a href="" class="btn details-cart-btn" onclick="loginForm()">
                                        <img src="../asset/images/web_icon/cart-mini.svg" alt="">
                                        <span>Go To Cart</span>
                                    </a>
                                </div>

                                <% } } else { %>
                                <div class="cart-wish-btn">
                                    <a onclick="loginForm()" class="btn details-look-btn">Add To Wishlist</a>
                                    <a href="" class="btn details-cart-btn" onclick="loginForm()">
                                        <img src="../asset/images/web_icon/cart-mini.svg" alt="">
                                        <span>Go To Cart</span>
                                    </a>
                                </div>
                                <% }%>




                            </div>
                        </div>
                        <div class="share-info">
                            <div class="details-book-info-wishlist">
                                <div class="wishlist-dropdown">
                                    <ul>
                                        <li>
                                            <a  style="user-select:none" onclick="" class="">
                                                <span class="fa fa-heart"></span> Add to List
                                            </a>
                                            <ul id="js--save-to-booklist--item">
                                                <!-- Load from ajax -->
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                            <div id="btn-share"class="share-link">
                                <div onclick="f(event)" id="btn-share" class="btn-share">
                                    <span style="font-size: 16px;" class="color-change fa fa-share"></span>
                                    <span style="user-select:none" >Share This Photo</span>
                                    <ul id="dropdown-menu">
                                        <li>
                                            <a href="" class="facebook" >
                                                <span class="fa fa-facebook"></span>
                                                <span class="link-text" >Facebook</span>
                                            </a>                                                    
                                        </li>
                                        <li>
                                            <a href="" class="twitter">
                                                <span class="fa fa-twitter"></span>
                                                <span class="link-text" >Twitter</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="linkedin">
                                                <span class="fa fa-linkedin"></span>
                                                <span class="link-text" >Linkedin</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="instagram" >
                                                <span class="fa fa-instagram"></span>
                                                <span class="link-text" >Instagram</span>
                                            </a>
                                        </li>
                                        <li>
                                            <a href="" class="pinterest">
                                                <span class="fa fa-pinterest"></span>
                                                <span class="link-text" >Pinterest</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
        <!--payment method-->
        <div class="payment-sidebar-info my-col-3">
            <div class="payment-info">
                <div class="payment-item">
                    <img src="../asset/images/web_icon/cod_small.svg" alt="icon" width="25px" height="25px">
                    <span class="text-capitalize">Online delivery</span>
                </div>
                <div class="payment-item">
                    <img src="../asset/images/web_icon/happy_return.svg" alt="icon" width="22px" height="22px">
                    <span class="text-capitalize ">Successfully image return</span>
                </div>
                <div class="payment-item">
                    <img src="../asset/images/web_icon/deliver-.webp" alt="icon" width="22px" height="22px">
                    <span class="text-capitalize ">Delivery Charge $0</span>
                </div>
                <div class="payment-item">
                    <img src="../asset/images/web_icon/wallet.svg" alt="icon" width="22px" height="22px">
                    <span class="text-capitalize ">Purchase & Earn</span>
                </div>
            </div>
        </div>
    </div>
</section>