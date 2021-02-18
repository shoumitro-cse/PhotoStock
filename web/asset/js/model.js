var currentTab = 0; // Current tab is set to be the first tab (0)

//signupForm();
function signupForm() {
    //document.getElementById('regForm').style.animation = 'zoom_in 1.5s';
    currentTab = 0;
    document.getElementById("nextBtn").value = "Next";
    document.getElementById("check-box-control").checked = false;
    document.getElementById('id01').style.display = 'block';

    document.getElementById("login-form").style.display = 'none';
    document.getElementById("short-signin").style.display = 'none';
    document.getElementById("forgot-pw").style.display = 'none';
    document.getElementById("singup_label").style.display = 'none';

    document.getElementById("short-signup").style.display = "block";
    document.getElementsByClassName("tab")[0].style.display = 'block';
    document.getElementById("circle-indicator").style.display = "block";
    document.getElementById("signin_label").style.display = 'block';

}
function closeModel() {
    //document.getElementById('regForm').style.animation = 'zoom_out 1.5s';
    document.getElementById('id01').style.display = 'none';
}

showTab(currentTab); // Display the crurrent tab
function showTab(n) {
    // This function will display the specified tab of the form...
    var x = document.getElementsByClassName("tab");
    x[n].style.display = "block";
    //... and fix the Previous/Next buttons:
    if (n == 0) {
        document.getElementById("prevBtn").style.display = "none";
    } else {
        document.getElementById("prevBtn").style.display = "inline";
    }
    if (n == (x.length - 1)) {
        document.getElementById("nextBtn").value = "Submit";
    } else {
        document.getElementById("nextBtn").value = "Next";
    }
    //... and run a function that will display the correct step indicator:
    fixStepIndicator(n)
}

function nextPrev(n) {

    var x = document.getElementsByClassName("tab");
    if (n == 1 && !validateForm()) {
        return false;
    }
    document.getElementById("singup_invalid_user").style.display = "none";

    x[currentTab].style.display = "none";
    currentTab = currentTab + n;
    if (currentTab >= x.length) {
        document.getElementById("regForm").submit();
        return false;
    }
    showTab(currentTab);
}

function validateForm() {
    var x, y, i, valid = true;
    x = document.getElementsByClassName("tab");
    y = x[currentTab].getElementsByTagName("input");

    for (i = 0; i < y.length; i++) {
        if (y[i].value === "") {
            y[i].className += " invalid";
            valid = false;
        }
    }

//    event.preventDefault();

    var pw, r_pw, email;
    pw = document.getElementById("sign_up_pw").value;
    r_pw = document.getElementById("sign_up_r_pw").value;

    email = document.getElementById("sign_up_email").value;
    //console.log(email);

    let xhttp = new XMLHttpRequest();
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            //console.log(this.responseText);
            var obj = JSON.parse(this.responseText);
            if (obj.email_exist_true) {
                document.getElementById("singup_invalid_user").innerHTML = "Email already exists. ";
                document.getElementById("singup_invalid_user").style.display = "block";
                valid = false;
            }
        }
    };
    xhttp.open("GET", "user_account/email_ck.jsp?email=" + email, false);
    xhttp.send();


    if (pw.length < 7) {
        document.getElementById("singup_invalid_user").innerHTML = "Password length must be greater than seven. ";
        document.getElementById("singup_invalid_user").style.display = "block";
        valid = false;
    }
    if (pw !== r_pw) {
        document.getElementById("singup_invalid_user").innerHTML = "Password are not match.";
        document.getElementById("singup_invalid_user").style.display = "block";
        valid = false;
    }
    if (valid) {
        document.getElementsByClassName("step")[currentTab].className += " finish";
    }
    return valid;
}

function fixStepIndicator(n) {
    // This function removes the "active" class of all steps...
    var i, x = document.getElementsByClassName("step");
    for (i = 0; i < x.length; i++) {
        x[i].className = x[i].className.replace(" active", "");
    }
    //... and adds the "active" class on the current step:
    x[n].className += " active";
}
//for input
function removeInvalidClass(elemnt) {
    elemnt.className = elemnt.className.replace(' invalid', '');

}
function shortSignup(check) {
    if (!check) {
        document.getElementById("nextBtn").style.display = "none";
        document.getElementById("short-signup").style.display = "block";
    } else {
        document.getElementById("short-signup").style.display = "none";
        document.getElementById("nextBtn").style.display = "block";
    }
}
function submitValidation(e) {
    if (!validateForm()) {
        e.preventDefault();
    }
}

window.onload = function () {
    document.getElementById("check-box-control").checked = false;
};

//for login
//loginForm();
function loginForm() {
    event.preventDefault();
    document.getElementById('id01').style.display = 'block';

    document.getElementById("short-signup").style.display = "none";
    var tab = document.getElementsByClassName("tab");
    document.getElementById("circle-indicator").style.display = "none";
    for (var i = 0; i < tab.length; i++) {
        tab[i].style.display = "none";
    }
    document.getElementById("signin_label").style.display = 'none';
    document.getElementById("prevBtn").style.display = 'none';
    document.getElementById("nextBtn").style.display = 'none';
    document.getElementById("singup_invalid_user").style.display = "none";

    document.getElementById("login-form").style.display = 'block';
    document.getElementById("short-signin").style.display = 'block';
    document.getElementById("forgot-pw").style.display = 'block';
    document.getElementById("singup_label").style.display = 'block';
//    console.log("hello");
}
function validateLogin() {
    // This function deals with validation of the form fields
    var x, y, i, valid = true;
    x = document.getElementById("login-form");
    y = x.getElementsByTagName("input");
    // A loop that checks every input field in the current tab:
    for (i = 0; i < y.length; i++) {
        // If a field is empty...
        if (y[i].value == "") {
            // add an "invalid" class to the field:
            y[i].className += " invalid";
            // and set the current valid status to false
            valid = false;
        }
    }
    return valid; // return the valid status
}
function  submitValidateLoginForm(e) {
    if (!validateLogin()) {
        e.preventDefault();
    }
    e.preventDefault();
    checkAccount();
}
function checkAccount() {
    var login_email, login_password;
    login_email = document.querySelector("input[name=login_email]").value;
    login_password = document.querySelector("input[name=login_password]").value;
//    console.log(login_email);
//    console.log(login_password);
    var file = "user_account/login.jsp?login_email=" + login_email.toString().trim() + "&" + "login_password=" + login_password.toString().trim();
    var ck = CallAjaxFile(file);
}


//CallAjaxFile();
function CallAjaxFile(file) {
    var xhttp, rs;
    if (window.XMLHttpRequest) {
        xhttp = new XMLHttpRequest();
    } else {
        xhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    xhttp.onreadystatechange = function () {
        if (this.readyState === 4 && this.status === 200) {
            rs = JSON.parse(this.responseText);
//            console.log(rs);
            if (rs.login_user_id) {
                console.log("true_v");
//                 document.getElementById("short-signin").submit();
                document.getElementById("login_invalid_user").style.display = "none";
//                localStorage.setItem("login_user_id", rs.login_user_id);
//                sessionStorage.setItem("login_user_id", rs.login_user_id);
//                window.location = "";
//                console.log(sessionStorage);
                window.location.reload();
            } else {
                console.log("false_v");
                document.getElementById("login_invalid_user").style.display = "block";
            }
        }
    };
    console.log(file);
//    file2 = "user_account/login.jsp?login_email=shoumitro26@gmail.com&login_password=shoumitro26@gmail.com";
    xhttp.open("GET", file, true);
    xhttp.send();
}


