package com.shop.first.product.service;

import com.shop.first.product.domain.Product;
import com.shop.first.product.repository.ProductMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class ProductService {

    private final ProductMapper productMapper;

    //상품 목록 중간 처리
    public List<Product> getList() {

        List<Product> articles = productMapper.getArticles();

        return articles;
    }

    //상품 카테고리 조회 중간 처리
    public String getCategory(int prCode) {
        return productMapper.getCate(prCode);
    }

    // 상품 검색 중간 처리
    /*
    public List<Product> getProductList(String keyword) {
        productMapper.getProduct(keyword);
    } */

    //상품 등록 중간 처리
    public void write(Product product) {
        productMapper.insert(product);
    }

    //상세 조회 중간 처리
    public Product get(int prCode) {
        return productMapper.getContent(prCode);
    }

    //상품 삭제 중간 처리
    public void remove(int prCode) {
        productMapper.delete(prCode);
    }

}//
