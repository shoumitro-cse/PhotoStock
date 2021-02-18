
function inCart(ele) {
    //console.log(ele.parentNode.attributes["image-id"].value);
    let image_id = ele.parentNode.attributes["image-id"].value;
    let cart_quantity = document.getElementById("cart_quantity");
    let cart_count = cart_quantity.innerHTML * 1;
    if (cart_count < 0) {
        cart_count = 0;
    }
    cart_quantity.innerHTML = cart_count + 1;
    ele.outerHTML = "<button onclick='outCart(this)' class='in_cart_btn' type='button'><em>In </em>Cart</button>";

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            //console.log(this.responseText);
            //window.location = "";
        }
    };
    xhttp.open("GET", "order_section/cart_in.jsp?cart_image_id=" + image_id, true);
    xhttp.send();
//                                xhttp.open("GET", "/PhotoStock/public/user_account/email_ck.jsp?email=" + email, false);
}

function outCart(ele) {
    let image_id = ele.parentNode.attributes["image-id"].value;
    let cart_quantity = document.getElementById("cart_quantity");
    let cart_count = cart_quantity.innerHTML * 1;
    if (cart_count < 0) {
        cart_count = 0;
    }
    cart_quantity.innerHTML = cart_count - 1;
    ele.outerHTML = "<button onclick='inCart(this)' class='cart_btn' type='button'><em>Add to </em>Cart</button>";
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            //console.log(this.responseText);
            // window.location = "";
        }
    };
    xhttp.open("GET", "order_section/cart_out.jsp?cart_image_id=" + image_id, true);
    xhttp.send();
}

onBodyLoad();
function onBodyLoad() {
    //console.log("Window load");
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var ar = JSON.parse(this.responseText);
            //console.log(this.responseText);
            var len = ar.imageListId.length;
            for (var j = 0; j < len; j++) {
                //console.log(ar.imageListId[j]);
                //console.log(document.querySelector("[image-id='"+ar.imageListId[j]+"']"));
                let ele = document.querySelector("[image-id='" + ar.imageListId[j] + "']");
                if (ele) {
                    ele.innerHTML = "<button onclick='outCart(this)' class='in_cart_btn' type='button'><em>In </em>Cart</button>";
                }
            }
        }
    };
    xhttp.open("GET", "order_section/active_cart.jsp", true);
    xhttp.send();

}

function insertWishlist(ele) {
    let image_id = ele.parentNode.attributes["wish-image-id"].value;
    let cart_quantity = document.getElementById("wishlist_count");
    let cart_count = cart_quantity.innerHTML * 1;
    if (cart_count < 0) {
        cart_count = 0;
    }
    cart_quantity.innerHTML = cart_count + 1;
    ele.outerHTML = "<button  class='in-wishcart' onclick='exitWishlist(this)'  type='button'><em>In</em> wishlist</button>";
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            //console.log(this.responseText);
            // window.location = "";
        }
    };
    xhttp.open("GET", "order_section/wishlist_cart.jsp?wishlist=insert&cart_image_id=" + image_id, true);
    xhttp.send();
}
function exitWishlist(ele) {
    let image_id = ele.parentNode.attributes["wish-image-id"].value;
    let cart_quantity = document.getElementById("wishlist_count");
    let cart_count = cart_quantity.innerHTML * 1;
    cart_count -= 1
    if (cart_count < 0) {
        cart_count = 0;
    }
    cart_quantity.innerHTML = cart_count;
    ele.outerHTML = "<button class='wishcart' onclick='insertWishlist(this)'  type='button'><em>Wishlist</em> </button>";
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            //console.log(this.responseText);
            // window.location = "";
        }
    };
    xhttp.open("GET", "order_section/wishlist_cart.jsp?wishlist=exit&cart_image_id=" + image_id, true);
    xhttp.send();
}

activeWish();
function  activeWish() {
    let xhttp2 = new XMLHttpRequest();
    xhttp2.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var ar = JSON.parse(this.responseText);
            //console.log(ar.imageListId);
            var len = ar.imageListId.length;
            for (var j = 0; j < len; j++) {
                let ele = document.querySelector("[wish-image-id='" + ar.imageListId[j] + "']");
                //console.log(ele);
                ele.innerHTML = "<button class='in-wishcart' onclick='exitWishlist(this)'  type='button'><em>In</em> wishlist</button>";
            }
        }
    };
    xhttp2.open("GET", "order_section/wishlist_cart.jsp?wishlist=active", true);
    xhttp2.send();
}



