package com.account;

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
public class Order {

    public List getAllInvoiceOrderItem(int user_id) throws SQLException {

        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs3, rs4;
        String sql;

        List list = new ArrayList();

        sql = "SELECT * FROM `order_item` where user_id = ? order by order_id desc";
        ps = con.prepareStatement(sql);
        ps.setInt(1, user_id);
        rs = ps.executeQuery();

        while (rs.next()) {
            List invoiceItemList = new ArrayList();
            int invoice_image_id = 0, order_id = 0;
            invoice_image_id = rs.getInt("invoice_image_id");
            order_id = rs.getInt("order_id");
            if (invoice_image_id != 0) {
                sql = "SELECT * FROM `invoice_image` where user_id = ? and invoice_image_id = ?";
                ps = con.prepareStatement(sql);
                ps.setInt(1, user_id);
                ps.setInt(2, invoice_image_id);
                rs2 = ps.executeQuery();
                while (rs2.next()) {
                    List invoiceimageList = new ArrayList();
                    Map invoiceMap = new Hashtable<String, String>();
                    invoice_image_id = rs2.getInt("invoice_image_id");
                    int item_count = rs2.getInt("item_count");
                    double totalPrice = rs2.getDouble("totalPrice");
                    double totalSaveMoney = rs2.getDouble("totalSaveMoney");
                    invoiceMap.put("item_count", item_count);
                    invoiceMap.put("totalPrice", totalPrice);
                    invoiceMap.put("totalSaveMoney", totalSaveMoney);
                    invoiceMap.put("order_id", order_id);

                    sql = "SELECT * FROM `invoice_image_history` where invoice_image_id = ?";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1, invoice_image_id);
                    rs3 = ps.executeQuery();
                    while (rs3.next()) {
//                        System.out.println(rs3.getInt("image_id"));
                        sql = "SELECT * FROM `image` where image_id = " + rs3.getInt("image_id");
                        ps = con.prepareStatement(sql);
                        rs4 = ps.executeQuery();
                        while (rs4.next()) {
                            Map map = new Hashtable<String, String>();
                            map.put("name", rs4.getString("name"));
                            map.put("uploadDate", rs4.getString("uploadDate"));
                            map.put("header", rs4.getString("header"));
                            map.put("category_id", rs4.getString("category_id"));
                            map.put("type", rs4.getString("type"));
                            map.put("unitPrice", rs4.getDouble("unitPrice"));
                            map.put("alternatePrice", rs4.getDouble("alternatePrice"));
                            map.put("saveMoney", rs4.getDouble("saveMoney"));
                            map.put("percentRate", rs4.getString("percentRate"));
//                            map.put("shortDescription", rs4.getString("shortDescription"));
//                            map.put("longDescription", rs4.getString("longDescription"));
                            map.put("largeImage", rs4.getString("largeImage"));
                            map.put("image_id", rs4.getInt("image_id"));
                            map.put("desginer_id", rs4.getInt("desginer_id"));

                            invoiceimageList.add(map);
//                            System.out.println(map.get("name"));
                        }
                    }
                    invoiceMap.put("imageList", invoiceimageList);
                    invoiceItemList.add(invoiceMap);
                }
                list.add(invoiceItemList);
            }
        }
        return list;
    }

    public List getPurchaseImage(int user_id, int order_id) throws SQLException {
        List list = new ArrayList();

        Connection con = MysqlDBConnection.getConnection();
        PreparedStatement ps;
        ResultSet rs, rs2, rs3, rs4;
        String sql;

        sql = "SELECT * FROM `purchase_item` WHERE `order_id` = ? AND `user_id` = ? ";
        ps = con.prepareStatement(sql);
        ps.setInt(1, order_id);
        ps.setInt(2, user_id);
        rs = ps.executeQuery();

        while (rs.next()) {
            int image_id = rs.getInt("image_id");

            sql = "SELECT * FROM `image` where image_id = " + image_id;
            ps = con.prepareStatement(sql);
            rs4 = ps.executeQuery();
            while (rs4.next()) {
                Map map = new Hashtable<String, String>();
                map.put("name", rs4.getString("name"));
                map.put("uploadDate", rs4.getString("uploadDate"));
                map.put("header", rs4.getString("header"));
                map.put("category_id", rs4.getString("category_id"));
                map.put("type", rs4.getString("type"));
                map.put("unitPrice", rs4.getDouble("unitPrice"));
                map.put("alternatePrice", rs4.getDouble("alternatePrice"));
                map.put("saveMoney", rs4.getDouble("saveMoney"));
                map.put("percentRate", rs4.getString("percentRate"));
                map.put("largeImage", rs4.getString("largeImage"));
                map.put("image_id", rs4.getInt("image_id"));
                map.put("desginer_id", rs4.getInt("desginer_id"));
                
                list.add(map);
            }

        }

        return list;
    }

    public static void main(String[] args) throws SQLException {
        Order order = new Order();
        
       List list = order.getPurchaseImage(103, 3533);
       Iterator it = list.iterator();
        while (it.hasNext()) {
           Map map = (Map) it.next();
           
            System.out.println(map.get("image_id"));
            System.out.println(map.get("header"));
            System.out.println("##############");
            
        }
        
        
        
//        List orderList = order.getAllInvoiceOrderItem(101);
//        System.out.println("list size : " + orderList.size());
//
//        for (int i = 0; i < orderList.size(); i++) {
//            List li = (List) orderList.get(i);
//            Iterator it = li.iterator();
//            while (it.hasNext()) {
//                Map map = (Map) it.next();
//                System.out.println(map.get("item_count"));
//                System.out.println(map.get("totalPrice"));
//
//                List imageList = (List) map.get("imageList");
//                Iterator it2 = imageList.iterator();
//                while (it2.hasNext()) {
//                    Map imageMap = (Map) it2.next();
//                    System.out.println("****");
//                    System.out.println(imageMap.get("image_id"));
//                    System.out.println(imageMap.get("name"));
//                    System.out.println("****");
//
//                }
//                System.out.println("");
//                System.out.println("");
//                System.out.println("");
//            }
//        }

    }
}
