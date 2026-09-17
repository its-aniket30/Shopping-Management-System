package com.shopping.dal;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import com.shopping.model.Product;
import com.shopping.util.ConnectionUtil;

public class ProductDAO {

    //CRUD on product
    //getAll,savePrd,editPrd,deletePrd,searchById

    private Connection con;

    public ProductDAO() {
        con = ConnectionUtil.getDbcon();
        System.out.println("--ProductDAO---\n");
    }

    //select * from product
    public ArrayList<Product> getAllPrds() {
        try {
            System.out.println("\n--getAllPrds---");

            String sql = "select * from product";

            Statement stmt = con.createStatement();
            ResultSet rset = stmt.executeQuery(sql);
            ArrayList<Product> prdList = new ArrayList<Product>();

            while (rset.next()) {
                Product p = new Product();
                p.setId(rset.getInt("id"));
                p.setName(rset.getString("name"));
                p.setPrice(rset.getDouble("price"));
                p.setQty(rset.getInt("qty"));

                prdList.add(p);
            }

            rset.close();
            return prdList;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

    //insert
    public int addNewPrd(Product newPrd) {
        try {
            String sql = "insert into product(name,price,qty) values(?,?,?)";

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, newPrd.getName());
            pstmt.setDouble(2, newPrd.getPrice());
            pstmt.setInt(3, newPrd.getQty());

            int status = pstmt.executeUpdate();
            return status;

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    //update
    public int updatePrd(Product p) {
        try {
            String sql = "update product set name=?,price=?,qty=? where id=?";

            PreparedStatement pstmt = con.prepareStatement(sql);

            pstmt.setString(1, p.getName());
            pstmt.setDouble(2, p.getPrice());
            pstmt.setInt(3, p.getQty());
            pstmt.setInt(4, p.getId());

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    //delete
    public int deletePrd(int id) {
        try {
            String sql = "delete from product where id=?";

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            return pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        return 0;
    }

    //search by id
    public Product searchById(int id) {
        try {
            String sql = "select * from product where id=?";

            PreparedStatement pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, id);

            ResultSet rset = pstmt.executeQuery();

            if (rset.next()) {
                Product p = new Product();
                p.setId(rset.getInt("id"));
                p.setName(rset.getString("name"));
                p.setPrice(rset.getDouble("price"));
                p.setQty(rset.getInt("qty"));

                return p;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }
}