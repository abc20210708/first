package com.shop.first.customer.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter @Setter @ToString //lombok 라이브러리가 제공하는 기능
@NoArgsConstructor //파라미터가 없는 생성자를 생성
public class Customer {

    private String csId;
    private String csPw;
    private String csName;
    private String csGender;
    private String csPhone;
    private String postCode;
    private String roadAddr; //도로명주소
    private String lotNumAddr; //지번주소
    private String extraAddr; //상세주소
    private String csBirth;

    public Customer(String csId, String csPw, String csName,
                    String csGender, String csPhone, String postCode,
                    String roadAddr, String lotNumAddr,
                    String extraAddr, String csBirth) {
        this.csId = csId;
        this.csPw = csPw;
        this.csName = csName;
        this.csGender = csGender;
        this.csPhone = csPhone;
        this.postCode = postCode;
        this.roadAddr = roadAddr;
        this.lotNumAddr = lotNumAddr;
        this.extraAddr = extraAddr;
        this.csBirth = csBirth;
    }

    public Customer(ResultSet rs) throws SQLException {
        this.csId = rs.getString("customer_id");
        this.csPw = rs.getString("customer_pw");
        this.csName = rs.getString("customer_name");
        this.csGender = rs.getString("customer_gender");
        this.csPhone = rs.getString("customer_phone");
        this.postCode = rs.getString("customer_post_code");
        this.roadAddr = rs.getString("customer_road_addr");
        this.lotNumAddr = rs.getString("customer_lot_num_addr");
        this.extraAddr = rs.getString("customer_extra_addr");
        this.csBirth = rs.getString("customer_birth");
    }

}//
