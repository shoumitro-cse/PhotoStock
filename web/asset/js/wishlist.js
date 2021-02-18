function deleteCartItem(image_id) {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            location.reload();
        }
    };
    xhttp.open("GET", "order_section/wishlist_cart.jsp?wishlist=exit&cart_image_id=" + image_id, true);
    xhttp.send();
}
function  moveToCart(image_id) {
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            location.reload();
        }
    };
    xhttp.open("GET", "order_section/cart_in.jsp?cart_image_id=" + image_id, true);
//        xhttp.open("GET", "order_section/wishlist_cart.jsp?wishlist=moveTocart&cart_image_id=" + image_id, true);
    xhttp.send();
}