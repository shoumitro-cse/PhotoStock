<div id="notification-menu">
    <span onclick="this.parentNode.style.display = 'none'" class="fa fa-close nt-colse"></span>
    <div class="notice-main-content">
        <h1 class="notice-title">Notifications</h1>
        <div class="notice-media active-notice">
            <img src="../asset/images/adobe/a2.jpeg" />
            <div class="notice-media-body">
                <p class="notice-media-body-title">
                    <strong>New</strong> 
                    <span class="text-muted">
                        You'll get points when the order is shipped..<br>( Order id = 214430887221 )
                    </span>
                    <a href="order.jsp" class="link">Click Here</a>
                </p>
                <p class="notice-media-body-subtitle">4 days ago</p>
            </div>
        </div>
        <div class="notice-media">
            <img src="../asset/images/adobe/a4.jpeg" />
            <div class="notice-media-body">
                <p class="notice-media-body-title">
                    <strong>New</strong> 
                    <span class="text-muted">
                        You'll get points when the order is shipped..<br>( Order id = 214430887221 )
                    </span>
                    <a href="order.jsp" class="link">Click Here</a>
                </p>
                <p class="notice-media-body-subtitle">4 days ago</p>
            </div>
        </div>
        <div class="notice-media">
            <img src="../asset/images/adobe/a5.jpeg" />
            <div class="notice-media-body">
                <p class="notice-media-body-title">
                    <strong>New</strong> 
                    <span class="text-muted">
                        You'll get points when the order is shipped..<br>( Order id = 214430887221 )
                    </span>
                    <a href="order.jsp" class="link">Click Here</a>
                </p>
                <p class="notice-media-body-subtitle">4 days ago</p>
            </div>
        </div>
        <div class="notice-media-button">
            <a href="notice.jsp">View All</a>
        </div>
    </div>
</div>
<script>
    function showNotification(x) {
        //x.classList.toggle("change");
        var mt = document.getElementById("notification-menu");
        if (mt.style.display == "block") {
            mt.style.display = "none";
        } else {
            mt.style.display = "block";
        }
    }
</script>