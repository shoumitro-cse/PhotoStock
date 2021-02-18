package com.admin;

import com.db_connect.MysqlDBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

/**
 *
 * @author shoumitro
 */
public class OrderInfo {

    public static List getAllOrder() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `order_item`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("order_id", rs.getInt("order_id"));
            map.put("user_id", rs.getInt("user_id"));
            map.put("invoice_image_id", rs.getInt("invoice_image_id"));
            map.put("payment_id", rs.getInt("payment_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("order_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println(map.get("invoice_image_id"));
//            System.out.println(map.get("payment_id"));
//            System.out.println("-----------");
//        }
        return list;
    }
    public static List getAllPurchaseItem() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `purchase_item`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("purchase_item_id", rs.getInt("purchase_item_id"));
            map.put("order_id", rs.getInt("order_id"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("purchase_item_id"));
//            System.out.println(map.get("order_id"));
//            System.out.println(map.get("image_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        return list;
    }
    
    
    public static List getShopping() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `shopping`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("shopping_id", rs.getInt("shopping_id"));
            map.put("item_count", rs.getInt("item_count"));
            map.put("totalPrice", rs.getInt("totalPrice"));
            map.put("totalSaveMony", rs.getInt("totalSaveMony"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

        Iterator it = (Iterator) list.iterator();
        while (it.hasNext()) {
            Map map = (Map) it.next();
            System.out.println(map.get("shopping_id"));
            System.out.println(map.get("item_count"));
            System.out.println(map.get("totalPrice"));
            System.out.println(map.get("totalSaveMony"));
            System.out.println(map.get("user_id"));
            System.out.println("-----------");
        }
        return list;
    }
    
    
    
    public static List getShoppingCart() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `shopping_cart`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("cart_id", rs.getInt("cart_id"));
            map.put("quantity", rs.getInt("quantity"));
            map.put("shopping_id", rs.getInt("shopping_id"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("cart_id"));
//            System.out.println(map.get("quantity"));
//            System.out.println(map.get("shopping_id"));
//            System.out.println(map.get("image_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        return list;
    }
    
    
    
    public static List getWishList() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `wishlist`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("wishlist_id", rs.getInt("wishlist_id"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("wishlist_id"));
//            System.out.println(map.get("image_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    public static List getAllPayment() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `payment`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("payment_id", rs.getInt("payment_id"));
            map.put("amount", rs.getDouble("amount"));
            map.put("credit_card_id", rs.getInt("credit_card_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("payment_id"));
//            System.out.println(map.get("amount"));
//            System.out.println(map.get("credit_card_id"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    public static List getAllBillingAddress() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `billing_addr`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("billing_addr_id", rs.getInt("billing_addr_id"));
            map.put("fullname", rs.getString("full_name"));
            map.put("email", rs.getString("email"));
            map.put("address", rs.getString("address"));
            map.put("city", rs.getString("city"));
            map.put("state", rs.getString("state"));
            map.put("zip", rs.getInt("zip"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("billing_addr_id"));
//            System.out.println(map.get("fullname"));
//            System.out.println(map.get("address"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    public static List getAllCreditCardAddress() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `credit_card`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("credit_card_id", rs.getInt("credit_card_id"));
            
            map.put("card_name", rs.getString("card_name"));
            map.put("card_number", rs.getString("card_number"));
            map.put("exp_month", rs.getString("exp_month"));
            
            map.put("exp_year", rs.getInt("exp_year"));
            map.put("cvv", rs.getInt("cvv"));
            map.put("billing_addr_id", rs.getInt("billing_addr_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("credit_card_id"));
//            System.out.println(map.get("card_name"));
//            System.out.println(map.get("exp_month"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    public static List getAllCreditCardVerifyTrim() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `credit_card_trim`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("credit_card_trim_id", rs.getInt("credit_card_trim_id"));
            
            map.put("card_name", rs.getString("card_name"));
            map.put("card_number", rs.getString("card_number"));
            map.put("exp_month", rs.getString("exp_month"));
            
            map.put("cvv", rs.getInt("cvv"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("credit_card_trim_id"));
//            System.out.println(map.get("card_name"));
//            System.out.println(map.get("exp_month"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    
    
    public static List getAllNotice() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `notice`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("notice_id", rs.getInt("notice_id"));
            
            map.put("large_msg", rs.getString("large_msg"));
            map.put("small_msg", rs.getString("small_msg"));
            map.put("notice_date", rs.getString("notice_date"));
            
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("notice_id"));
//            System.out.println(map.get("large_msg"));
//            System.out.println(map.get("notice_date"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    public static List getAllInvoice() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `invoice_image`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("invoice_image_id", rs.getInt("invoice_image_id"));
            map.put("item_count", rs.getInt("item_count"));
            
            map.put("totalPrice", rs.getDouble("totalPrice"));
            map.put("totalSaveMoney", rs.getDouble("totalSaveMoney"));
            
            map.put("credit_card_id", rs.getInt("credit_card_id"));
            map.put("user_id", rs.getInt("user_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("invoice_image_id"));
//            System.out.println(map.get("item_count"));
//            System.out.println(map.get("totalPrice"));
//            System.out.println(map.get("user_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    
    public static List getAllInvoiceHistory() throws SQLException {
        List list;
        list = new ArrayList();

        Connection con;
        PreparedStatement ps;
        ResultSet rs;
        con = MysqlDBConnection.getConnection();

        String sql = "SELECT * FROM `invoice_image_history`";
        ps = con.prepareStatement(sql);
        rs = ps.executeQuery();
        while (rs.next()) {
            Map map = new Hashtable<String, String>();
            map.put("invoice_image_history_id", rs.getInt("invoice_image_history_id"));
            map.put("quantity", rs.getInt("quantity"));
            map.put("image_id", rs.getInt("image_id"));
            map.put("invoice_image_id", rs.getInt("invoice_image_id"));
            list.add(map);
        }

//        Iterator it = (Iterator) list.iterator();
//        while (it.hasNext()) {
//            Map map = (Map) it.next();
//            System.out.println(map.get("invoice_image_history_id"));
//            System.out.println(map.get("quantity"));
//            System.out.println(map.get("image_id"));
//            System.out.println(map.get("invoice_image_id"));
//            System.out.println("-----------");
//        }
        
        return list;
    }
    
    
    
    
    public static void main(String[] args) throws SQLException {
//        OrderInfo.getAllOrder();
//        OrderInfo.getAllPurchaseItem();
//        OrderInfo.getShoppingCart();
        OrderInfo.getShopping();
//        OrderInfo.getWishList();
//        OrderInfo.getAllPayment();
//        OrderInfo.getAllBillingAddress();
//        OrderInfo.getAllCreditCardAddress();
//        OrderInfo.getAllCreditCardVerifyTrim();
//        OrderInfo.getAllNotice();
//        OrderInfo.getAllInvoice();
//        OrderInfo.getAllInvoiceHistory();
    }

}
