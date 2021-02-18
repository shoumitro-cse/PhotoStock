
function adminFormValidation(form_container_id) {
    event.preventDefault();

    let form_container, form, input_list;

    form_container = document.getElementById(form_container_id);
    form = form_container.getElementsByTagName("form")[0];

    let succ_msg = form_container.getElementsByClassName("text-success-msg")[0];

    input_list = form_container.getElementsByTagName("input");

    for (var i = 0; i < input_list.length; i++) {
        input_list[i].oninput = function () {
            this.style.borderColor = "#d3d3d3";
        };
    }

    function inputValidation() {
        let valid = true;
        for (var i = 0; i < input_list.length; i++) {
            input_list[i].style.borderColor = "#d3d3d3";
            if ((input_list[i].value).toString().trim() === "") {
                valid = false;
                input_list[i].style.borderColor = "red";
            }
        }

        return valid;
    }

    if (inputValidation()) {
        succ_msg.style.display = "inline-block";
        form.submit();
    }

}

function formEdit(form_container_id, tab_id, submit_content_id) {
    let tab = document.getElementById(tab_id);
    let form_container = document.getElementById(form_container_id);
    let submit_content = document.getElementById(submit_content_id);
    let input_list = form_container.getElementsByTagName("input");

    if (form_container.getElementsByClassName("pw-group-hide")[0]) {
        let  pw_group_hide = form_container.getElementsByClassName("pw-group-hide")[0];
        pw_group_hide.style.display = "flex";
    }

//    let span_succ_msg = submit_content.getElementsByTagName("span")[0];

    submit_content.style.display = "block";

    for (var i = 0; i < input_list.length; i++) {
        input_list[i].removeAttribute("disabled");
    }

}




//for delete
var id = 0;
function openAdminDeleteAlert(admin_id) {
    event.preventDefault();
    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            document.getElementById("delete_alert").innerHTML = this.responseText;
            document.getElementById("delete_alert").style.display = "block";
            id = admin_id;
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

let category_id = 0;
function openCategoryDeleteAlert(category_id_v) {
    category_id = category_id_v;
    document.getElementById("delete_alert").style.display = "block";
}

function deleteCategoryItem() {
    event.preventDefault();
    window.location.assign("category_delete.jsp?category_id=" + category_id);
}


function openCategoryUpdateForm(category_id) {
    document.getElementById('insert_update_box').style.display = 'block';
    
       let xhttp = new XMLHttpRequest();
       
        xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            var obj = JSON.parse(this.responseText);
            if (obj.categoryList) {

//                console.log(obj.categoryList[0]);
                document.getElementById("category_id").value = obj.categoryList[0].category_id;
                document.getElementById("category_name").value = obj.categoryList[0].name;
            }
        }
    };
    xhttp.open("GET", "get_category.jsp?category_id=" + category_id, true);
    xhttp.send();
    
    
}