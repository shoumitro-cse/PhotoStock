
function  addImageForm(form_container_id) {
    event.preventDefault();

    // form container div tag
    //var form_container = document.getElementsByClassName("form-container")[0];
    var form_container = document.getElementById(form_container_id);

    // for form tag
    var form = form_container.getElementsByTagName("form")[0];
    var pic_upload_form = form_container.getElementsByTagName("form")[1];

//    var input = form.querySelectorAll(".form-container input, .form-container textarea");
    var input = form.querySelectorAll(".form-container input[type='text'],  .form-container input[type='email'],  .form-container input[type='url'],  .form-container input[type='tel'],  .form-container textarea");


    for (var i = 0; i < input.length; i++) {
        input[i].oninput = function () {
            this.style.borderColor = "#cccccc";
        };
    }

    form["desginer_id"].oninput = function () {
        this.style.borderColor = "#cccccc";
        form["type"].style.borderColor = "#cccccc";
    };

    form["isTaxed"].oninput = function () {
        this.style.borderColor = "#cccccc";
        form["isTaxed"].style.borderColor = "#cccccc";
    };

    form["category_id"].oninput = function () {
        this.style.borderColor = "#cccccc";
        form["category_id"].style.borderColor = "#cccccc";
    };

    function inputValidation() {

        let valid = true;

        for (var i = 0; i < input.length; i++) {
            input[i].style.borderColor = "#cccccc";
            if (input[i].value === "") {
                valid = false;
                input[i].style.borderColor = "red";
            }
        }


        if (form["desginer_id"].value === "all") {
            valid = false;
            form["desginer_id"].style.borderColor = "red";
        } else {
            form["desginer_id"].style.borderColor = "#cccccc";

        }


        if (form["isTaxed"].value === "all") {
            valid = false;
            form["isTaxed"].style.borderColor = "red";
        } else {
            form["isTaxed"].style.borderColor = "#cccccc";
        }


        if (form["category_id"].value === "all") {
            valid = false;
            form["category_id"].style.borderColor = "red";
        } else {
            form["category_id"].style.borderColor = "#cccccc";
        }


        return valid;
    }

    if (inputValidation()) {

        let url = "";

        var image_id = form['image_id'].value;

        // for introduction
        var name = form['name'].value;
        var desginer_id = form["desginer_id"].value;
        var category_id = form["category_id"].value;
        var header = form["header"].value;

        // for pricing
        var unitPrice = form['unitPrice'].value;
        var alternatePrice = form["alternatePrice"].value;
        var saveMoney = form["saveMoney"].value;
        var percentRate = form["percentRate"].value;

        // for stock
        var total_stock = form['total_stock'].value;
        var current_stock = form["current_stock"].value;
        var uploadDate = form["uploadDate"].value;
        var type = form["type"].value;

        // for meta
        var keyword = (form['keyword'].value).toString().trim();
        var isTaxed = form["isTaxed"].value;
        var longDescription = form["longDescription"].value;
        //var largeImage = form["largeImage"].value;

        if (image_id * 1 !== 0) {
            url = "../image/update.jsp?image_id=" + image_id + "&desginer_id=" + desginer_id + "&name=" + name + "&category_id=" + category_id + "&header=" + header +
                    "&unitPrice=" + unitPrice + "&alternatePrice=" + alternatePrice + "&saveMoney=" + saveMoney + "&percentRate=" + percentRate +
                    "&total_stock=" + total_stock + "&current_stock=" + current_stock + "&uploadDate=" + uploadDate + "&type=" + type
                    + "&keyword=" + keyword + "&isTaxed=" + isTaxed + "&longDescription=" + longDescription;

        } else {

            // for add.jsp
            if (form["add_form"]) {
                var add_form = form["add_form"].value;
                url = "../image/insert.jsp?add_form=" + add_form + "&desginer_id=" + desginer_id + "&name=" + name + "&category_id=" + category_id + "&header=" + header +
                        "&unitPrice=" + unitPrice + "&alternatePrice=" + alternatePrice + "&saveMoney=" + saveMoney + "&percentRate=" + percentRate +
                        "&total_stock=" + total_stock + "&current_stock=" + current_stock + "&uploadDate=" + uploadDate + "&type=" + type
                        + "&keyword=" + keyword + "&isTaxed=" + isTaxed + "&longDescription=" + longDescription;

            }

            // for view.jsp
            if (form["view_create"]) {
                var view_create = form["view_create"].value;
                url = "../image/insert.jsp?view_create=" + view_create + "&desginer_id=" + desginer_id + "&name=" + name + "&category_id=" + category_id + "&header=" + header +
                        "&unitPrice=" + unitPrice + "&alternatePrice=" + alternatePrice + "&saveMoney=" + saveMoney + "&percentRate=" + percentRate +
                        "&total_stock=" + total_stock + "&current_stock=" + current_stock + "&uploadDate=" + uploadDate + "&type=" + type
                        + "&keyword=" + keyword + "&isTaxed=" + isTaxed + "&longDescription=" + longDescription;

            }

        }


        console.log(url);
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                pic_upload_form.submit();
            }
        };
        xhttp.open("GET", url, true);
        xhttp.send();

    }

}


function getDesignerType(designer_id) {

    if (designer_id !== "all") {
        console.log(designer_id);
        let xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                let obj = JSON.parse(this.responseText);
                document.getElementById("type").value = obj.desginerType;
            }
        };
        xhttp.open("GET", "get_designer_type.jsp?designer_id=" + designer_id, true);
        xhttp.send();
    } else {
        document.getElementById("type").value = "";

    }
}



function updateImageFormBoxClose() {
    document.getElementsByClassName('update-box')[0].style.display = 'none';
}


function  updateImageFormBoxOpen(image_id) {

    console.log(image_id);

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("insert_update_box").innerHTML = this.responseText;
        }
    };
    xhttp.open("GET", "update_form.jsp", false);
    xhttp.send();

    document.getElementsByClassName('update-box')[0].style.display = 'block';

    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var obj = JSON.parse(this.responseText);
            if (obj.imageList) {

//                console.log(obj.imageList[0]);
                document.getElementById("image_id").value = obj.imageList[0].image_id;

                document.getElementById("name").value = obj.imageList[0].name;
                document.getElementById("desginer_id").value = obj.imageList[0].desginer_id;
                document.getElementById("category_id").value = obj.imageList[0].category_id;
                document.getElementById("header").value = obj.imageList[0].header;

                document.getElementById("unitPrice").value = obj.imageList[0].unitPrice;
                document.getElementById("alternatePrice").value = obj.imageList[0].alternatePrice;
                document.getElementById("saveMoney").value = obj.imageList[0].saveMoney;
                document.getElementById("percentRate").value = obj.imageList[0].percentRate;

                document.getElementById("total_stock").value = obj.imageList[0].total_stock;
                document.getElementById("current_stock").value = obj.imageList[0].current_stock;
                document.getElementById("uploadDate").value = obj.imageList[0].uploadDate;
                document.getElementById("type").value = obj.imageList[0].type;

                document.getElementById("keyword").value = obj.imageList[0].keyword;
                document.getElementById("isTaxed").value = obj.imageList[0].isTaxed;
                document.getElementById("longDescription").value = obj.imageList[0].longDescription;


            }
        }
    };
    xhttp.open("GET", "get_image.jsp?image_id=" + image_id, true);
    xhttp.send();

}


let id = 0;
function openImageDeleteAlert(image_id) {

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("delete_alert").innerHTML = this.responseText;
            document.getElementById("delete_alert").style.display = "block";
            id = image_id;
        }
    };
    xhttp.open("GET", "delete_box.jsp", true);
    xhttp.send();
}


function deleteImageItem() {
    event.preventDefault();
    window.location.assign("delete.jsp?id=" + id);
}



function viewImageProfile(image_id) {
//    location.search = "profile_card.jsp?desginer_id="+desginer_id;
    window.location = "profile_card.jsp?image_id=" + image_id;
}



function autocompletePrice() {

    if (isNaN(document.getElementById("percentRate").value) || isNaN(document.getElementById("unitPrice").value)) {
        document.getElementById("percentRate").value = "";
        document.getElementById("unitPrice").value = "";
    }

    let percentRate = document.getElementById("percentRate").value;
    let unitPrice = document.getElementById("unitPrice").value;

    if (percentRate !== "" && unitPrice !== "") {
        let saveMoney = (unitPrice * percentRate) / 100;
        let alternatePrice = unitPrice - saveMoney;
        document.getElementById("alternatePrice").value = alternatePrice;
        document.getElementById("saveMoney").value = saveMoney;
    }

}

function stockAutocomplete(total_stock) {
    if (isNaN(total_stock)) {
        document.getElementById("total_stock").value = "";
        document.getElementById("current_stock").value = "";
    } else {
        document.getElementById("current_stock").value = total_stock;
    }
}

function currentStockAutocomplete(current_stock) {
    let total_stock = document.getElementById("total_stock").value;

    if (current_stock > total_stock) {
        document.getElementById("current_stock").value = total_stock;
    } else {
        document.getElementById("current_stock").value = current_stock;
    }

}


function keywordAutocomplete(header_value) {

    let image_name = document.getElementById("name").value;

    header_value = header_value + " " + image_name;

    let arr = header_value.split(" ");

    var unique_arr = arr.reduce(function (a, b) {
        if (a.indexOf(b) < 0)
            a.push(b);
        return a;
    }, []);


    let arr_str = unique_arr.join(", ");

    document.getElementById("keyword").value = arr_str;
    
   descAutoComplete();

}


function descAutoComplete() {
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("3d".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This 3D Model is optimized \n\
                                                  for Adobe Dimension.Use it to get 3D\n\
                                                  effects without being a 3D expert. ";
//        console.log(document.getElementById("type").value.toLocaleUpperCase().indexOf("3d".toLocaleUpperCase()) > -1);
    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("premium".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This premium is optimized \n\
                                                  for PhotoStock.Use it to get 3D\n\
                                                  effects without being a 3D expert. ";    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("template".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This template is optimized \n\
                                                  for PhotoStock.Use it to get 3D Max\n\
                                                  effects without being a 3D expert. ";    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("Corona".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This template is optimized \n\
                                                  for PhotoStock.Use it to get 3D Max\n\
                                                  effects without being a 3D expert. ";    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("Corona".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This template is optimized \n\
                                                  for PhotoStock.Use it to get 3D Max\n\
                                                  effects without being a 3D expert. ";    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("House".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This House image is optimized \n\
                                                  for PhotoStock.Use it to get 3D Max\n\
                                                  effects without being a 3D expert. ";    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("nature".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This nature image is optimized \n\
                                                  for PhotoStock.Use it to get 3D Max\n\
                                                  effects without being a 3D expert. ";    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("food".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This food image is optimized \n\
                                                  for PhotoStock.Use it to get 3D Max\n\
                                                  effects without being a 3D expert. ";    }
    if (document.getElementById("type").value.toLocaleUpperCase().indexOf("animals".toLocaleUpperCase()) > -1) {
        document.getElementById("longDescription").value = "This animals image is optimized \n\
                                                  for PhotoStock.Use it to get 3D Max\n\
                                                  effects without being a 3D expert. ";    }

}