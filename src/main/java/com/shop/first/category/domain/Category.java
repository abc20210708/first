package com.shop.first.category.domain;

import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

import java.sql.ResultSet;
import java.sql.SQLException;

@Getter @Setter @ToString
@NoArgsConstructor
public class Category {

    private int cateCode;
    private String categoryName;
    private int cateCodeRef; //상위 카테고리

    public Category(int cateCode, String categoryName,
                    int cateCodeRef) {
        this.cateCode = cateCode;
        this.categoryName = categoryName;
        this.cateCodeRef = cateCodeRef;
    }

    public Category(ResultSet rs) throws SQLException {
        this.cateCode = rs.getInt("cate_code");
        this.categoryName = rs.getString("cate_name");
        this.cateCodeRef = rs.getInt("cate_code_ref");
    }
}
