package com.shop.first.order.domain;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter @Setter @ToString
public class Order {

    private int orderCode;
    private String csId;
    private String csName;
    private String csPhone;
    private String postCode;
    private String roadAddr; //도로명주소
    private String lotNumAddr; //지번주소
    private String extraAddr; //상세주소
    private int cartCode;
    private int orderAmount;
    private String prColor; // 색상
    private String prSize;  // 크기
    private String prName;  // 상품명
    private int orderTotalPrice;
    private String orderDate; //주문한 날짜
    private int deliPrice; // 배송료

    private static int seqOrder;

    public Order() {
        this.orderCode = ++seqOrder;
    }

    public Order(int orderCode, String csId, String csName, String csPhone,
                 String postCode, String roadAddr, String lotNumAddr,
                 String extraAddr, int cartCode, int orderAmount,
                 String prColor, String prSize, String prName, int orderTotalPrice,
                 String orderDate, int deliPrice) {
        this.orderCode = orderCode;
        this.csId = csId;
        this.csName = csName;
        this.csPhone = csPhone;
        this.postCode = postCode;
        this.roadAddr = roadAddr;
        this.lotNumAddr = lotNumAddr;
        this.extraAddr = extraAddr;
        this.cartCode = cartCode;
        this.orderAmount = orderAmount;
        this.prName = prName;
        this.prColor = prColor;
        this.prSize = prSize;
        this.orderTotalPrice = orderTotalPrice;
        this.orderDate = orderDate;
        this.deliPrice = deliPrice;
    }

    public Order(ResultSet rs) throws SQLException {
        this.orderCode = rs.getInt("order_code");
        this.csId = rs.getString("customer_id");
        this.csName = rs.getString("customer_name");
        this.csPhone = rs.getString("customer_phone");
        this.postCode = rs.getString("customer_post_code");
        this.roadAddr = rs.getString("customer_road_addr");
        this.lotNumAddr = rs.getString("customer_lot_num_addr");
        this.extraAddr = rs.getString("customer_extra_addr");
        this.cartCode = rs.getInt("cart_code");
        this.prName = rs.getString("product_name");
        this.prColor = rs.getString("product_color");
        this.prSize = rs.getString("product_size");
        this.orderTotalPrice = rs.getInt("order_total_price");
        this.orderAmount = rs.getInt("order_amount");
        this.orderDate = rs.getString("order_date");
        this.deliPrice = rs.getInt("order_deli_price");
    }
}//
