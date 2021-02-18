(function () {
    let billing_submit_btn = document.getElementById("billing_submit_btn");
    let shopping_billing_form = document.getElementById("shopping_billing_form");


    billing_submit_btn.onclick = function () {
        event.preventDefault();
        if (inputValidation()) {
            // shopping_billing_form.submit();

            //for billing
            let fullname = document.querySelector("#shopping_billing_form input[name='fullname']").value;
            let email = document.querySelector("#shopping_billing_form input[name='email']").value;
            let address = document.querySelector("#shopping_billing_form input[name='address']").value;
            let city = document.querySelector("#shopping_billing_form input[name='city']").value;
            let state = document.querySelector("#shopping_billing_form input[name='state']").value;
            let zip = document.querySelector("#shopping_billing_form input[name='zip']").value;

            // for cridit
            let cardname = document.querySelector("#shopping_billing_form input[name='cardname']").value;
            let cardnumber = document.querySelector("#shopping_billing_form input[name='cardnumber']").value;
            let expmonth = document.querySelector("#shopping_billing_form input[name='expmonth']").value;
            let expyear = document.querySelector("#shopping_billing_form input[name='expyear']").value;
            let cvv = document.querySelector("#shopping_billing_form input[name='cvv']").value;
          
            
            console.log(fullname);
            console.log(email);
            console.log(address);
            console.log(city);
            console.log(state);
            console.log(zip);
            
            console.log(cardname);
            console.log(cardnumber);
            console.log(expmonth);
            console.log(expyear);
            console.log(cvv);
            
            let url = "billing/billing_info_insert.jsp?type=billing"+"&fullname="+fullname+"&email="+email
                    +"&address="+address+"&city="+city+"&state="+state+"&zip="+zip
                    +"&cardname="+cardname+"&cardnumber="+cardnumber+"&expmonth="+expmonth
                    +"&expyear="+expyear+"&cvv="+cvv;
            console.log(url);
            

            let xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if (this.readyState === 4 && this.status === 200) {
                    var obj = JSON.parse(this.responseText);
                    if (obj.billing_true) {
                      document.getElementById('payment_model').style.display = 'block';
                    }
                }
            };
            xhttp.open("GET", url, true);
            xhttp.send();
        }
    };

    let input_field = document.querySelectorAll("#shopping_billing_form input");
//    console.log(input_field);
    function inputValidation() {
        let valid = true;
        for (var i = 0; i < input_field.length; i++) {
            input_field[i].style.borderColor = "#cccccc";
            if (input_field[i].value === "") {
                valid = false;
                input_field[i].style.borderColor = "red";
            }
        }
        return valid;
    }

})();

(function () {
    let payment_form_submit_btn = document.getElementById("payment-form-submit-btn");
    let payment_form = document.getElementById("payment-form");


    payment_form_submit_btn.onclick = function () {
        event.preventDefault();
        if (inputValidation()) {
            payment_form.submit();
        }
    };

    let input_field = document.querySelectorAll("#payment-form input");
//    console.log(input_field);
    function inputValidation() {
        let valid = true;
        for (var i = 0; i < input_field.length; i++) {
            input_field[i].style.borderColor = "#cccccc";
            if (input_field[i].value === "") {
                valid = false;
                input_field[i].style.borderColor = "red";
            }
        }
        return valid;
    }

})();

