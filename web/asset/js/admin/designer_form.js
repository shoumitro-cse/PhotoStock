
function formSubmit(form_container_id) {
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

    function inputValidation() {
        let valid = true;
        for (var i = 0; i < input.length; i++) {
            input[i].style.borderColor = "#cccccc";
            if (input[i].value === "") {
                valid = false;
                input[i].style.borderColor = "red";
//                console.log(input[i]);
            }
        }
        return valid;
    }

    if (inputValidation()) {     
        var url = "";
        var view_create = "";
        var desginer_id = form['desginer_id'].value;
        var first_name = form["first_name"].value;
        var surname = form["surname"].value;
        var type = form["type"].value;
        var phone = form["phone"].value;
        var msg = form["msg"].value;
        var email = form["email"].value;
        var facebook = form["facebook"].value;
        var linkedin = form["linkedin"].value;

        if (desginer_id * 1 !== 0) {
            url = "update.jsp?desginer_id=" + desginer_id + "&first_name=" + first_name + "&surname=" + surname + "&type=" + type + "&phone=" + phone + "&msg=" + msg + "&email=" + email + "&facebook=" + facebook + "&linkedin=" + linkedin;

        } else {
            
            // remove update box
            if (document.getElementById("insert_update_box")) {
                document.getElementById("insert_update_box").innerHTML = "";
            }

            if (form["view_create"]) {
                view_create = form["view_create"].value;
                url = "insert.jsp?view_create=" + view_create + "&first_name=" + first_name + "&surname=" + surname + "&type=" + type + "&phone=" + phone + "&msg=" + msg + "&email=" + email + "&facebook=" + facebook + "&linkedin=" + linkedin;
            } else if (form["add_form"])  {
                add_form = form["add_form"].value;
                url = "insert.jsp?add_form=" + add_form + "&first_name=" + first_name + "&surname=" + surname + "&type=" + type + "&phone=" + phone + "&msg=" + msg + "&email=" + email + "&facebook=" + facebook + "&linkedin=" + linkedin;
            } else {
                url = "insert.jsp?first_name=" + first_name + "&surname=" + surname + "&type=" + type + "&phone=" + phone + "&msg=" + msg + "&email=" + email + "&facebook=" + facebook + "&linkedin=" + linkedin;
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

//for update
function updateFormBoxOpen(designer_id) {
//    location.search = "?id=1000";

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
            if (obj.desginerList) {

                //console.log(obj.desginerList[0]);
                document.getElementById("desginer_id").value = obj.desginerList[0].desginer_id;
                document.getElementById("first_name").value = obj.desginerList[0].first_name;
                document.getElementById("surname").value = obj.desginerList[0].surname;
                document.getElementById("type").value = obj.desginerList[0].type;
                document.getElementById("phone").value = obj.desginerList[0].phone;
                document.getElementById("msg").value = obj.desginerList[0].msg;
                document.getElementById("email").value = obj.desginerList[0].email;
                document.getElementById("facebook").value = obj.desginerList[0].facebook;
                document.getElementById("linkedin").value = obj.desginerList[0].linkedin;
//                document.getElementById("picture_url").value = obj.desginerList[0].picture_url;

            }
        }
    };
    xhttp.open("GET", "get_designer.jsp?designer_id=" + designer_id, true);
    xhttp.send();

}


function updateFormBoxClose() {
    document.getElementsByClassName('update-box')[0].style.display = 'none';
}

function viewDesignerProfile(desginer_id) {
//    location.search = "profile_card.jsp?desginer_id="+desginer_id;
    window.location = "profile_card.jsp?desginer_id=" + desginer_id;
}



//for delete
var id = 0;
function openDeleteAlert(designer_id) {

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("delete_alert").innerHTML = this.responseText;
            document.getElementById("delete_alert").style.display = "block";
            id = designer_id;
        }
    };
    xhttp.open("GET", "delete_box.jsp", true);
    xhttp.send();
}

function deleteItem() {
    event.preventDefault();
//    window.location = "delete.jsp?id=" + id;
    window.location.assign("delete.jsp?id=" + id);
}