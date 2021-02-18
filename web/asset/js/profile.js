//For Personal Information Change 
(function () {
    let p_info_submit_btn = document.getElementById("p_info_submit_btn");
    p_info_submit_btn.style.display = "none";

    let p_userInfoChangeMsg = document.getElementById("userInfoChangeMsg");
    p_userInfoChangeMsg.style.display = "none";

    let p_info_edit = document.getElementById("p_info_edit");
    let p_info_form_input = document.querySelectorAll("#p_form_info input");
    for (var i = 0; i < p_info_form_input.length; i++) {
        p_info_form_input[i].setAttribute("disabled", "true");
    }
    p_info_edit.onclick = function () {
        for (var i = 0; i < p_info_form_input.length; i++) {
            p_info_form_input[i].removeAttribute("disabled");
        }
        p_info_submit_btn.style.display = "initial";
    };


    let user_fullname = document.getElementById("user_fullname");
    let user_fullname_group = document.getElementById("user_fullname_group");
    let user_fullname_input = document.getElementById("user_fullname_input");
    user_fullname_group.style.display = "none";
    user_fullname_input.onfocus = function () {
        user_fullname.parentNode.removeChild(user_fullname);
        user_fullname_group.style.display = "flex";
    };

    p_info_submit_btn.onclick = function () {
        event.preventDefault();
//        let conf = confirm("Are you sure change??");
//        if (conf && inputValidation()) {
        if (inputValidation() && genderValid()) {
            document.getElementById("p_form_info").submit();
            p_userInfoChangeMsg.style.display = "initial";
        }
    };

    function inputValidation() {
        valid = true;
        for (var i = 0; i < p_info_form_input.length; i++) {
            if (p_info_form_input[i].value === "") {
                p_info_form_input[i].style.boxShadow = "red 0px 0px 1px 1px";
                valid = false;
            }
        }
        return valid;
    }

//console.log("valid : "+genderValid());
    function genderValid() {
        let valid = true;
        let gender = document.querySelectorAll("#p_form_info input[name='gender']");
        if (gender !== null && gender[0] != undefined && gender[1] != undefined) {
            if (!gender[0].checked && !gender[1].checked) {
                valid = false;
                p_userInfoChangeMsg.style.display = "initial";
                p_userInfoChangeMsg.style.color = "red";
                p_userInfoChangeMsg.innerHTML = "Gender is empty.";
//                console.log(gender);
            }
        }
        return valid;
    }


    let dateField = document.getElementById("date_field");
    if (dateField !== null) {
        dateField.onfocus = function () {
            dateField.setAttribute("type", "date");
        };
    }




})();

// User Contact Information Change
(function () {
    let c_userInfoChangeMsg = document.getElementById("c_userInfoChangeMsg");
    c_userInfoChangeMsg.style.display = "none";

    let c_info_submit_btn = document.getElementById("c_info_submit_btn");
    c_info_submit_btn.style.display = "none";

    let c_info_edit = document.getElementById("c_info_edit");
    let c_info_form_input = document.querySelectorAll("#c_form_info input");
    for (var i = 0; i < c_info_form_input.length; i++) {
        c_info_form_input[i].setAttribute("disabled", "true");
    }
    c_info_edit.onclick = function () {
        for (var i = 0; i < c_info_form_input.length; i++) {
            c_info_form_input[i].removeAttribute("disabled");
        }
        c_info_submit_btn.style.display = "initial";
    };

    c_info_submit_btn.onclick = function () {
        event.preventDefault();
//        let conf = confirm("Are you sure change??");
//        if (conf && inputValidation()) {
        if (inputValidation()) {
            document.getElementById("c_form_info").submit();
            c_userInfoChangeMsg.style.display = "initial";
        }
    };
    function inputValidation() {
        valid = true;
        for (var i = 0; i < c_info_form_input.length; i++) {
            if (c_info_form_input[i].value === "") {
                c_info_form_input[i].style.boxShadow = "red 0px 0px 1px 1px";
                valid = false;
            }
        }
        return valid;
    }
})();

// Profile picture Change 
(function () {
    let picture_edit = document.getElementById("picture_edit");

    let picture_ChangeMsg = document.getElementById("picture_ChangeMsg");
    picture_ChangeMsg.style.display = "none";

    let picture_edit_submit_btn = document.getElementById("picture_edit_submit_btn");
    picture_edit_submit_btn.style.display = "none";

    let profile_photo = document.getElementById("profile_photo");
    profile_photo.setAttribute("disabled", "true");

    picture_edit.onclick = function () {
        picture_edit_submit_btn.style.display = "initial";
        profile_photo.removeAttribute("disabled");
    };

    picture_edit_submit_btn.onclick = function () {
        event.preventDefault();
        if (inputValidation()) {
            document.getElementById("change-profile-image").submit();
            picture_ChangeMsg.style.display = "initial";
        }
    };
    function inputValidation() {
        valid = true;
        if (profile_photo.value === "") {
            profile_photo.style.boxShadow = "red 0px 0px 1px 1px";
            valid = false;
        }
        return valid;
    }

})();

// Email address Change 
(function () {
    let email_edit = document.getElementById("email_edit");

    let e_ChangeMsg = document.getElementById("e_ChangeMsg");
    e_ChangeMsg.style.display = "none";

    let email_submit_btn = document.getElementById("email_submit_btn");
    email_submit_btn.style.display = "none";

    let email_input = document.getElementById("email_input");
    email_input.setAttribute("disabled", "true");

    email_edit.onclick = function () {
        email_submit_btn.style.display = "initial";
        email_input.removeAttribute("disabled");
    };

    email_submit_btn.onclick = function () {
        event.preventDefault();
        if (inputValidation() && email_check()) {
            document.getElementById("email_form").submit();
            e_ChangeMsg.style.display = "initial";
        }
    };
    function inputValidation() {
        valid = true;
        if (email_input.value === "") {
            email_input.style.boxShadow = "red 0px 0px 1px 1px";
            valid = false;
        }
        return valid;
    }

//    email_check();
    function email_check() {
        let valid = true;
        let email_input_value = email_input.value;
        xhttp = new XMLHttpRequest();
        xhttp.onreadystatechange = function () {
            if (this.readyState === 4 && this.status === 200) {
                var obj = JSON.parse(this.responseText);
                if (obj.email_exist_true) {
                    valid = false;
                    e_ChangeMsg.style.display = "initial";
                    e_ChangeMsg.style.color = "red";
                    e_ChangeMsg.innerHTML = "Email already exists";
                }
            }
        };
        xhttp.open("GET", "user_account/email_ck.jsp?email=" + email_input_value, false);
        xhttp.send();
        return valid;
    }

})();

// Password Change 
(function () {
    let pw_edit = document.getElementById("pw_edit");

    let PwChangeMsg = document.getElementById("PwChangeMsg");
    PwChangeMsg.style.display = "none";

    let pw_submit_btn = document.getElementById("pw_submit_btn");
    pw_submit_btn.style.display = "none";

    let new_pw = document.getElementById("new_pw");
    new_pw.style.display = "none";


    let pw_info_form_input = document.querySelectorAll("#pw_edit_form input");
    for (var i = 0; i < pw_info_form_input.length; i++) {
        pw_info_form_input[i].setAttribute("disabled", "true");
    }
    pw_edit.onclick = function () {
        pw_submit_btn.style.display = "initial";
        new_pw.style.display = "flex";
        for (var i = 0; i < pw_info_form_input.length; i++) {
            pw_info_form_input[i].removeAttribute("disabled");
        }
    };
    pw_submit_btn.onclick = function () {
        event.preventDefault();
        if (inputValidation()) {
            document.getElementById("pw_edit_form").submit();
            PwChangeMsg.style.display = "initial";
        }
    };
    function inputValidation() {
        valid = true;
        for (var i = 0; i < pw_info_form_input.length; i++) {
            if (pw_info_form_input[i].value === "") {
                pw_info_form_input[i].style.boxShadow = "red 0px 0px 1px 1px";
                valid = false;
            }
        }

        let new_pw_input = document.getElementById("new_pw_input").value;
        let confirm_pw_input = document.getElementById("confirm_pw_input").value;
        if (new_pw_input.length < 7) {
            valid = false;
            PwChangeMsg.style.display = "initial";
            PwChangeMsg.innerHTML = "Password less than seven.";
            PwChangeMsg.style.color = "red";
        }
        if (new_pw_input !== confirm_pw_input) {
            valid = false;
            PwChangeMsg.style.display = "initial";
            PwChangeMsg.innerHTML = "Password doesn't match.";
            PwChangeMsg.style.color = "red";
        }

        return valid;
    }

})();
