package com.account;

import com.db_connect.MysqlDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shoumitro
 */
public class BillingAddress {

    public boolean checkBillingRecord(int user_id) throws SQLException {
        boolean ck = false;
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `billing_addr` where user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            ck = true;
        }

        return ck;
    }

    public int insertBillingAddress(String fullname, String email, String address, String city, String state, int zip, String cardname, String cardnumber, String expmonth, int expyear, int cvv, int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;
        int billing_addr_id = 0, payment_id = 0;

        sql = "SELECT * FROM `billing_addr` where user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (!rs.next()) {
            sql = "INSERT INTO `billing_addr` (`full_name`, `email`, `address`, `city`, `state`, `zip`, `user_id`) VALUES (?, ?, ?, ?, ?, ?, ?); ";
            ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, city);
            ps.setString(5, state);
            ps.setInt(6, zip);
            ps.setInt(7, user_id);
            ps.executeUpdate();

            //System.out.println("user_id : "+user_id);
            sql = "SELECT * FROM `billing_addr` WHERE `user_id` = ?";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                billing_addr_id = rs.getInt("billing_addr_id");
            }
            if (billing_addr_id != 0) {
                sql = "INSERT INTO `credit_card` (`card_name`, `card_number`, `exp_month`, `exp_year`, `cvv`, `billing_addr_id`, `user_id`) VALUES (?, ?, ?, ?, ?, ?, ?);";
                ps = con.prepareStatement(sql);
                ps.setString(1, cardname);
                ps.setString(2, cardnumber);
                ps.setString(3, expmonth);
                ps.setInt(4, expyear);
                ps.setInt(5, cvv);
                ps.setInt(6, billing_addr_id);
                ps.setInt(7, user_id);
                ps.executeUpdate();

                //  insert payment
//                payment_id = insertPayment(billing_addr_id, user_id);
            }
        } else {
            billing_addr_id = 0;

            sql = "UPDATE `billing_addr` SET `full_name` = ?, `email` = ?, `address` = ?, `city` = ?, `state` = ?, `zip` = ? WHERE `billing_addr`.`user_id` = ?;  ";
            ps = con.prepareStatement(sql);
            ps.setString(1, fullname);
            ps.setString(2, email);
            ps.setString(3, address);
            ps.setString(4, city);
            ps.setString(5, state);
            ps.setInt(6, zip);
            ps.setInt(7, user_id);
            ps.executeUpdate();

            sql = "SELECT * FROM `billing_addr` where user_id = ?;";
            ps = con.prepareStatement(sql);
            ps.setInt(1, user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                billing_addr_id = rs.getInt("billing_addr_id");
            }
            if (billing_addr_id != 0) {

                sql = "UPDATE `credit_card` SET `card_name` = ?, `card_number` = ?, `exp_month` = ?, `exp_year` = ?, `cvv` = ? WHERE `credit_card`.`billing_addr_id` = ? and `credit_card`.`user_id` = ? ; ";
                ps = con.prepareStatement(sql);
                ps.setString(1, cardname);
                ps.setString(2, cardnumber);
                ps.setString(3, expmonth);
                ps.setInt(4, expyear);
                ps.setInt(5, cvv);
                ps.setInt(6, billing_addr_id);
                ps.setInt(7, user_id);
                ps.executeUpdate();

                //  insert payment
//                payment_id = insertPayment(billing_addr_id, user_id);
            }
        }
        return billing_addr_id;
//        return payment_id;
    }

    public static int insertPayment(int user_id) throws SQLException {
        int payment_id = 0;
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        int credit_card_id = 0;
//        sql = "SELECT * FROM `credit_card` where user_id = ? and billing_addr_id = ?;";
        sql = "SELECT * FROM `credit_card` where user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
//        ps.setInt(2, billing_addr_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            credit_card_id = rs.getInt("credit_card_id");
        }

        double amount = 0.0;
        sql = "SELECT * FROM `shopping` where user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            amount = rs.getInt("totalPrice");
        }
        if (credit_card_id != 0 && amount != 0.0) {
            sql = "INSERT INTO `payment` (`amount`, `credit_card_id`, `user_id`) VALUES (?, ?, ?); ";
            ps = con.prepareStatement(sql);
            ps.setDouble(1, amount);
            ps.setInt(2, credit_card_id);
            ps.setInt(3, user_id);
            ps.executeUpdate();

            sql = "SELECT * FROM `payment` order by payment_id desc limit 1;";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                payment_id = rs.getInt("payment_id");
            }

            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMM yyyy hh:mm:ss");
            Notice.insertNotification("Your payable $" + amount + " is successfully.", "Payment id = " + payment_id, LocalDateTime.now().format(formatter), user_id);

        }

        return payment_id;
    }

    public boolean creditCardLicenseTrim(String cardname, String cardnumber, int cvv, String expmonth, int user_id) throws SQLException {

        boolean bool = true;

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;
        sql = "INSERT INTO `credit_card_trim` (`card_name`, `card_number`, `exp_month`, `cvv`, `user_id`) VALUES (?, ?, ?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setString(1, cardname);
        ps.setString(2, cardnumber);
        ps.setString(3, expmonth);
        ps.setInt(4, cvv);
        ps.setInt(5, user_id);
        ps.executeUpdate();

        return bool;
    }

    public List getBillingAddress(int user_id) throws SQLException {
        List list = new ArrayList();
        int billing_addr_id = 0;

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        sql = "SELECT * FROM `billing_addr` where user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("billing_addr_id", rs.getInt("billing_addr_id"));
            map.put("full_name", rs.getString("full_name"));
            map.put("email", rs.getString("email"));
            map.put("address", rs.getString("address"));
            map.put("city", rs.getString("city"));
            map.put("state", rs.getString("state"));
            map.put("zip", rs.getInt("zip"));
            map.put("user_id", rs.getInt("user_id"));

            list.add(map);
        }
        con.close();

        return list;
    }

    public List getCreditCardAddress(int user_id) throws SQLException {
        List list = new ArrayList();
        int billing_addr_id = 0;

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        BillingAddress billingAddress = new BillingAddress();
        List bill_list = billingAddress.getBillingAddress(user_id);
        Iterator it = bill_list.iterator();
        if (it.hasNext()) {
            Map billingMap = (Map) it.next();
//            System.out.println(billingMap.get("billing_addr_id"));

            sql = "SELECT * FROM `credit_card` WHERE `billing_addr_id` = ? AND `user_id` = ? ";
            ps = con.prepareStatement(sql);
            ps.setInt(1, (int) billingMap.get("billing_addr_id"));
            ps.setInt(2, user_id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Map map = new Hashtable<String, String>();
                map.put("credit_card_id", rs.getInt("credit_card_id"));
                map.put("card_name", rs.getString("card_name"));
                map.put("card_number", rs.getString("card_number"));
                map.put("exp_month", rs.getString("exp_month"));
                map.put("exp_year", rs.getInt("exp_year"));
                map.put("cvv", rs.getInt("cvv"));
                map.put("billing_addr_id", rs.getInt("billing_addr_id"));

                list.add(map);
            }
            con.close();
        }

        return list;
    }

    public int insertInvoice(int user_id) throws SQLException {
        //INSERT INTO `invoice_image` (`invoice_image_id`, `item_count`, `totalPrice`, `totalSaveMoney`, `credit_card_id`) VALUES (NULL, '0', '0.00', '0.00', '3100');
//INSERT INTO `invoice_image_history` (`invoice_image_history_id`, `invoice_image_id`, `image_id`, `credit_card_id`) VALUES (NULL, '3300', '1100', '3100');
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        ShoppingCart shoppingCart = new ShoppingCart();
        List list = shoppingCart.getShoppingCartList(user_id);

//        for shopping
        int credit_card_id = 0, invoice_image_id = 0;
        sql = "SELECT * FROM `credit_card` where user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        if (rs.next()) {
            credit_card_id = rs.getInt("credit_card_id");
        }
        double totalPrice = 0.0, totalSaveMoney = 0.0;
        int item_count = 0;
        List shoppingList = (List) list.get(0);
        Iterator iterator = shoppingList.iterator();
        if (iterator.hasNext()) {
            Map map = (Map) iterator.next();
            //System.out.println(map.get("totalPrice"));
            totalPrice = (double) map.get("totalPrice");
            totalSaveMoney = (double) map.get("totalSaveMony");
            item_count = (int) map.get("item_count");

            sql = "INSERT INTO `invoice_image` (`item_count`, `totalPrice`, `totalSaveMoney`, `credit_card_id`, `user_id`) VALUES (?, ?, ?, ?, ?);";
            ps = con.prepareStatement(sql);
            ps.setInt(1, item_count);
            ps.setDouble(2, totalPrice);
            ps.setDouble(3, totalSaveMoney);
            ps.setInt(4, credit_card_id);
            ps.setInt(5, user_id);
            ps.executeUpdate();

            sql = "SELECT * FROM `invoice_image` order by invoice_image_id desc limit 1;";
            ps = con.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                invoice_image_id = rs.getInt("invoice_image_id");
            }

            Notice notice = new Notice();
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("E, dd MMM yyyy hh:mm:ss");
            notice.insertNotification("You have order " + item_count + " item(s) is successfully.", " Payable Total $" + totalPrice + "", LocalDateTime.now().format(formatter), user_id);

        }

//        for shopping cart
        List shoppingCartList = (List) list.get(1);
        Iterator iterator2 = shoppingCartList.iterator();
        while (iterator2.hasNext()) {
            Map map = (Map) iterator2.next();
            if (invoice_image_id != 0) {
                sql = "INSERT INTO `invoice_image_history` (`quantity`,`invoice_image_id`, `image_id`) VALUES (?, ?, ?);";
                ps = con.prepareStatement(sql);
                ps.setInt(1, (int) map.get("quantity"));
                ps.setInt(2, invoice_image_id);
                ps.setInt(3, (int) map.get("image_id"));
                ps.executeUpdate();
            }
        }
        return invoice_image_id;
    }

    public void deteteShoppingRecord(int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2;
        String sql;

        sql = "select * FROM  `shopping_cart`  WHERE user_id = ?;";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();
        while (rs.next()) {
//            int total_stock = 0;
            int current_stock = 0;
            int quantity = rs.getInt("quantity");
            int image_id = rs.getInt("image_id");

            sql = "SELECT * FROM `image` where image_id = " + image_id;
            ps = con.prepareStatement(sql);
            rs2 = ps.executeQuery();
            if (rs2.next()) {
//                total_stock = rs2.getInt("total_stock");
                current_stock = rs2.getInt("current_stock");
            }
            
            if(current_stock != 0) {
                current_stock = current_stock - quantity;
                
                sql = "UPDATE `image` SET `current_stock` = ? WHERE `image`.`image_id` = ?;";
                ps = con.prepareStatement(sql);
                ps.setInt(1, current_stock);
                ps.setInt(2, image_id);
                ps.executeUpdate();
            }
            
        }

        sql = "DELETE FROM  `shopping_cart`  WHERE user_id = ?; ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        ps.executeUpdate();

        sql = "DELETE FROM  `shopping`  WHERE user_id = ?; ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        ps.executeUpdate();
    }

    public int orderItem(int payment_id, int invoice_image_id, int user_id) throws SQLException {
        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;
        int order_id = 0;

        sql = "INSERT INTO `order_item` (`user_id`,`invoice_image_id`, `payment_id`) VALUES (?, ?, ?);";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        ps.setInt(2, invoice_image_id);
        ps.setInt(3, payment_id);
        ps.executeUpdate();

        sql = "SELECT * FROM `order_item` order by order_id desc limit 1;";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        if (rs.next()) {
            order_id = rs.getInt("order_id");
        }

        return order_id;
    }

    public void setPurchaseItem(int order_id, int user_id) throws SQLException {

        Connection con;
        con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs;
        String sql;

        ShoppingCart shoppingCart = new ShoppingCart();
        List list = shoppingCart.getShoppingCartList(user_id);

        List shoppingCartList = (List) list.get(1);
        Iterator iterator2 = shoppingCartList.iterator();
        while (iterator2.hasNext()) {
            Map map = (Map) iterator2.next();
            if (order_id != 0) {
                sql = "INSERT INTO `purchase_item` (`order_id`, `image_id`, `user_id`) VALUES (?, ?, ?); ";
                ps = con.prepareStatement(sql);
                ps.setInt(1, order_id);
                ps.setInt(2, (int) map.get("image_id"));
                ps.setInt(3, user_id);
                ps.executeUpdate();
            }
        }
    }

    public static void main(String[] args) throws SQLException {
        BillingAddress b = new BillingAddress();
//        b.deteteShoppingRecord(101);

//        b.setPurchaseItem(3528, 103);
//        b.getCreditCardAddress(103);
        BillingAddress billingAddress = new BillingAddress();
        List bill_list = billingAddress.getCreditCardAddress(103);
        Iterator it = bill_list.iterator();
        if (it.hasNext()) {
            Map billingMap = (Map) it.next();
            System.out.println(billingMap.get("billing_addr_id"));
        }

        System.out.println("*******************");

        BillingAddress creditCardAddress = new BillingAddress();
        List creditInfo_list = creditCardAddress.getCreditCardAddress(103);
        Iterator creditInfo_listIt = creditInfo_list.iterator();
        if (creditInfo_listIt.hasNext()) {
            Map billingMap = (Map) creditInfo_listIt.next();
            System.out.println(billingMap.get("billing_addr_id"));
            System.out.println(billingMap.get("exp_month"));
        }
    }

}
