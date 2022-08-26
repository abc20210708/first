package com.shop.first.product.repository;

import com.shop.first.product.domain.Product;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ProductMapper {

    //상품 목록 조회
    List<Product> getArticles();

    //상품 상세 조회
    Product getContent(int prCode);

    //상품 카테고리명 조회
    String getCate(int prCode);

    //상품 검색
    //List<Product> getProduct(String keyword);

    //상품 등록
    boolean insert(Product product);

    //상품 삭제
    boolean delete(int prCode);

}//
