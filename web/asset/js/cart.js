function quantityInput(ele, image_id) {
    let q_value = ele.value;
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            //console.log(this.responseText);
            //location.reload();
        }
    };
//    xhttp.open("GET", "order_section/quantity_in_out.jsp?quantity_type=q_input&quantity_value=" + q_value + "&quantity_image_id=" + image_id, true);
//    xhttp.send();
}
function quantityPlus(ele, image_id, current_stock) {

//    let current_stock = document.getElementById("current_stock").innerHTML*1;

    let q_input = ele.nextElementSibling;
    let q_value = q_input.value * 1;

    if (current_stock > q_value && current_stock !== 0) {

        q_value += 1;
        if (q_value < 1) {
            q_value = 1;
        }
        ele.nextElementSibling.value = q_value;

        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                //console.log(this.responseText);
                location.reload();
            }
        };
        xhttp.open("GET", "order_section/quantity_in_out.jsp?quantity_type=q_plus&quantity_value=" + q_value + "&quantity_image_id=" + image_id, false);
        xhttp.send();
    }

}
function quantityMinus(ele, image_id, current_stock) {
    let q_input = ele.previousElementSibling;
    let q_value = q_input.value * 1;

    if (current_stock !== 0 && q_value != 1) {
        q_value -= 1;
        if (q_value < 1) {
            q_value = 1;
        }
        ele.previousElementSibling.value = q_value;
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                //console.log(this.responseText);
                location.reload();
            }
        };
        xhttp.open("GET", "order_section/quantity_in_out.jsp?quantity_type=q_minus&quantity_value=" + q_value + "&quantity_image_id=" + image_id, false);
        xhttp.send();
    }
}
function moveToWishList(image_id) {
    event.preventDefault();
    console.log("moveToWishList");
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

function deleteCartImage(image_id) {
    event.preventDefault();
    // console.log(image_id);

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            location.reload();
        }
    };
    xhttp.open("GET", "order_section/cart_out.jsp?cart_image_id=" + image_id, true);
    xhttp.send();
}