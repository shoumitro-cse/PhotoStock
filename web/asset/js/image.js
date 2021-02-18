
function addToCart(image_id) {
    event.preventDefault();
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            location.reload();
        }
    };
    xhttp.open("GET", "order_section/cart_in.jsp?cart_image_id=" + image_id, true);
    xhttp.send();
}
function addToWishlist(image_id) {
    event.preventDefault();
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            //console.log(this.responseText);
            location.reload();
        }
    };
    xhttp.open("GET", "order_section/wishlist_cart.jsp?wishlist=insert&cart_image_id=" + image_id, true);
    xhttp.send();
}

function imageBye(image_id) {
    window.location = "image.jsp?id="+image_id;
}

function f(e) {
    var m = document.getElementById("dropdown-menu");
//                                                console.log(e);
    if (m.style.display === "block") {
        m.style.display = "none";
    } else {
        m.style.display = "block";
    }
}

function addUserComment(image_id) {
    event.preventDefault();
    let rating = "";
    if (document.querySelector(".rating input:checked")) {
        rating = document.querySelector(".rating input:checked").value;
    }
    let comment_text = document.querySelector("textarea[name='comment_text']").value;
//    console.log(rating);
//    console.log(comment_text);

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.querySelector("textarea[name='comment_text']").value = "";
            if (document.querySelector(".rating input:checked")) {
                document.querySelector(".rating input:checked").checked = false;
            }
            location.reload();
        }
    };
    xhttp.open("GET", "image_content/comment_info.jsp?type=insert&rating=" + rating + "&comment_text=" + comment_text + "&image_id=" + image_id, true);
    xhttp.send();

}


function addLike(comment_id) {
    event.preventDefault();

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            location.reload();
        }
    };
    xhttp.open("GET", "image_content/comment_info.jsp?type=like&comment_id=" + comment_id, true);
    xhttp.send();

}

function addDisLike(comment_id) {
    event.preventDefault();
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            location.reload();
        }
    };
    xhttp.open("GET", "image_content/comment_info.jsp?type=dislike&comment_id=" + comment_id, true);
    xhttp.send();
}