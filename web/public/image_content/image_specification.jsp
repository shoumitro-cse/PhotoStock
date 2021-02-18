<div class="details-image-additional-info">
    <div class="details-image-additional-info-header">
        <h1>Image Specification &amp; Summary</h1>
    </div>
    <div class="details-image-additional-info-content">
        <ul>
            <li>
                <!--class="tab-active"-->
                <a id="tab-active-link" onclick="tabShow(event, this, 'specfication')" class="tab-active" href="">Specification </a>
            </li>
            <li>
                <a onclick="tabShow(event, this, 'artist')" class="" href=""> Designer</a>
            </li>
        </ul>
        <script>
            function tabShow(event, ele, pane_id) {
                event.preventDefault();
                document.getElementById("tab-active-link").className = "";
//                console.log(document.getElementById("tab-active-link"));

                var link = document.getElementsByClassName("tab-active");
                for (var i = 0; i < link.length; i++) {
                    link[i].className = link[i].className.replace(" tab-active", "");
                }
                var tab = document.getElementsByClassName("tab-pane");
                for (var i = 0; i < tab.length; i++) {
                    tab[i].className = tab[i].className.replace(" show", "");
                }
                ele.className += " tab-active";
//                console.log(pane_id);
                document.getElementById(pane_id).className += " show";
            }
//            document.getElementById("tab-active-link").click();
        </script>
        <div class="tab-content">

            <!--tab content for specification-->
            <div id="specfication" class="tab-pane show" >
                <table class="table">
                    <tbody>
                        <tr>
                            <td>Title</td>
                            <td style="text-transform: capitalize"><% out.write(m.get("name").toString());%></td>
                        </tr>
                        <tr>
                            <td>Designer</td>
                            <td class="artist-link">
                                <a href="">
                                    <% out.write(m.get("desginer_name").toString());%> 
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Image upload date</td>
                            <td class="image-link">
                                <a href="">
                                    this image is uploaded in <% out.write(m.get("uploadDate").toString());%>
                                </a>
                            </td>
                        </tr>
                        <tr>
                            <td>Description</td>
                            <td>
                                <% out.write(m.get("longDescription").toString());%>
                            </td>
                        </tr>
                        <tr>
                            <td>Price</td>
                            <td class="price">$<% out.write(m.get("alternatePrice").toString());%></td>
                        </tr>
                        <tr>
                            <td>Original Price </td>
                            <td class="original-price"><strike>$<% out.write(m.get("unitPrice").toString());%></strike></td>
                    </tr>
                    <tr>
                        <td>Rating</td>
                        <td>
                            <%
                                if (m.get("ratings") != null) {
                                    out.write(m.get("ratings").toString());
                                } else {
                                    out.write("0");
                                }
                            %>
                        </td>
                    </tr>
                    </tbody>
                </table>
            </div>
            <!--tab content for Artist-->
            <div id="artist" class="tab-pane">
                <div class="artist-content">
                    <div class="my-row no-gutters">
                        <div class="artist-img">
                            <img  class="img-circle" src="../asset/<% out.write(m.get("desginer_picture_url").toString());%>" alt="">
                        </div>
                        <div class="artist_descr">
                            <p class="artist-name-content">
                                <a href=""><% out.write(m.get("desginer_name").toString());%><em> (<% out.write(m.get("desginer_type").toString());%> Designer)</em></a>
                            </p>
                            <div class="artist-description-wrapper">
                                <div class="artist-description">
                                    <% out.write(m.get("desginer_msg").toString());%>
                                </div>
                                <div class="read-more-overlay-wrapper">
                                    <span>Contact:</span>
                                    <address>
                                        Phone : <% out.write(m.get("phone").toString());%><br/>
                                        Email : <% out.write(m.get("email").toString());%><br/>
                                        LinkedIn : <% out.write(m.get("linkedin").toString());%><br/>
                                        Facebook : <% out.write(m.get("facebook").toString());%><br/>
                                    </address>
                                </div>
                            </div>
                            <div class="artist-description-read-more">
                                <span class="read-more">Read More</span>
                            </div>
                            <div class="read-more-detail">
                                <!--read-more-detail-->
                            </div>
                        </div>
                    </div>
                </div>
            </div>


        </div>
    </div>
</div>