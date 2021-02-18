

<div id="payment_model" class="payment-model">
    <form id="payment-form" class="payment-form" action="billing/billing_info_insert.jsp" method="get">
        <div class="payment-container">
            <div id="payment-content" class="payment-content">
                <span onclick="document.getElementById('payment_model').style.display = 'none'" style="float: right;margin-top: 10px;cursor: pointer;" class="fa fa-close"></span>
                <div class="head-img-content">
                    <img src="../asset/images/web_icon/ps_small.png" width="60px" height="60px" />
                    <h1>PhotoStock</h1>
                </div>
                <div class="payment-head-content">
                    <div class="circle-content"> 
                        <div class="d-circle">
                            <span  class=" fa fa-user" ></span>
                        </div>
                        <div class="circle-text">Support</div>  
                    </div>
                    <div class="circle-content"> 
                        <div class="d-circle " >
                            <span  class=" fa fa-bolt" ></span>
                        </div>
                        <div class="circle-text">FAQ</div>  
                    </div>
                    <div class="circle-content"> 
                        <div class="d-circle" >
                            <span  class=" fa fa-asterisk" ></span>
                        </div>
                        <div class="circle-text">Offers</div>  
                    </div>
                    <div class="circle-content"> 
                        <div class="d-circle" >
                            <span  class=" fa fa-sign-in" ></span>
                        </div>
                        <div class="circle-text">Login</div>  
                    </div>

                </div>
                <div class="payment-icon-content">
                    <span class="fa fa-cc-visa" style="color:navy;"></span>
                    <span class="fa fa-cc-amex" style="color:blue;"></span>
                    <span class="fa fa-cc-mastercard" style="color:red;"></span>
                    <span class="fa fa-cc-discover" style="color:orange;"></span>
                </div>
                <div class="payment-body-content">
                    <input type="text" name="cardnumber" placeholder="Enter Card Number" />
                    <div class="input-group">
                        <input type="text" id="cvv" name="cvv" placeholder="CVV">
                        <input type="text" id="expmonth" name="expmonth" placeholder="MM/YY">
                    </div>
                    <input type="text" name="cardname" placeholder="Card Holder Name" />
                    <input type="hidden" name="credit_license" value="true"  />
                </div>
                <div class="payment-privacy-content">
                    <p><input id="payment-form-submit-btn" type="submit" value="Confirm" /> </p>
                </div>
                <div class="payment-footer-content">
                    <p>Pay <% out.write(totalPrice+""); %> Dollar USA</p>
                </div>

            </div>
            <div id="loader"></div>

        </div>

    </form>
</div>
