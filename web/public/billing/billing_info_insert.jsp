<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.time.format.DateTimeFormatterBuilder"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.account.Notice"%>
<%@page import="com.account.BillingAddress"%>
<%
    int user_id = 0;
    if (session.getAttribute("user_id") != null) {
        String cart_user_id = session.getAttribute("user_id").toString();
        if (cart_user_id != null) {
            user_id = Integer.parseInt(cart_user_id);
        }
    }

    //Billing Address
    int zip = 0;
    String fullname = request.getParameter("fullname");
    String email = request.getParameter("email");
    String address = request.getParameter("address");
    String city = request.getParameter("city");
    String state = request.getParameter("state");
    if (request.getParameter("zip") != null && request.getParameter("zip") != "") {
        zip = Integer.parseInt(request.getParameter("zip"));
    }

    //for crdit card
    int expyear = 0, cvv = 0;
    String cardname = request.getParameter("cardname");
    String cardnumber = request.getParameter("cardnumber");
    String expmonth = request.getParameter("expmonth");
    if (request.getParameter("expyear") != null && request.getParameter("expyear") != "") {
        expyear = Integer.parseInt(request.getParameter("expyear"));
    }
    if (request.getParameter("cvv") != null && request.getParameter("cvv") != "") {
        cvv = Integer.parseInt(request.getParameter("cvv"));
    }

    String credit_license = request.getParameter("credit_license");

    String type = request.getParameter("type");
    BillingAddress billingAddress = new BillingAddress();

    if (type != null) {
        if (user_id != 0 && type.contentEquals("billing")) {

            //insert billing and credit card address
            billingAddress.insertBillingAddress(fullname, email, address, city, state, zip, cardname, cardnumber, expmonth, expyear, cvv, user_id);

            JSONObject obj = new JSONObject();
            obj.put("billing_true", new Boolean(true));
            out.write(obj.toJSONString());

            System.out.println("******insert billing and credit card address************");
        }
    }

    if (credit_license != null) {
        boolean bool = Boolean.parseBoolean(credit_license.toString().trim());
        if (bool) {

            //for crdit card licence trim
            boolean licenceVarify = billingAddress.creditCardLicenseTrim(cardname, cardnumber, cvv, expmonth, user_id);

            if (licenceVarify) {
                if (type == null || !type.contentEquals("billing")) {

                    if (user_id != 0) {

                        //for payment
                        int payment_id = BillingAddress.insertPayment(user_id);

                        // insert invoice image
                        int invoice_image_id = billingAddress.insertInvoice(user_id);

                        if (payment_id != 0 && invoice_image_id != 0) {
                            int order_id = billingAddress.orderItem(payment_id, invoice_image_id, user_id);
                            if (order_id != 0) {

                                // insert purchase item
                                billingAddress.setPurchaseItem(order_id, user_id);

                                // delete shopping 
                                billingAddress.deteteShoppingRecord(user_id);

                                // insert notice
                                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMM yyyy hh:mm:ss");
                                Notice.insertNotification("Your order request is successfully.", "Order id = " + order_id, LocalDateTime.now().format(formatter), user_id);

                                response.sendRedirect("../purchase_image.jsp?order_id=" + order_id);
                            }
                        }
                    }

                    System.out.println("******insert payment ************");
                }
            }
        }
    }


%>
