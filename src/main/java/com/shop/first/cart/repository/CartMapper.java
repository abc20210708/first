package com.shop.first.cart.repository;

import com.shop.first.cart.domain.Cart;
import com.shop.first.cart.dto.ModCart;
import com.shop.first.product.domain.Product;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

@Mapper
public interface CartMapper {

    //장바구니 추가
    void insert(Cart cart);

    //장바구니 목록
    List<Cart> listCart(String csId);

    //장바구니 조회
    Cart selectCart(@Param("csId") String csId, @Param("cartCode")int cartCode);

    //상품 목록
    Product listProduct(int proCode);

    //장바구니 삭제
    void delete(int cartCode);


    //장바구니 금액 합계
    int sumTotal(String csId);

    //장바구니 동일한 상품 확인
    int countCart(@Param("csId") String csId, @Param("prCode") int prCode);

    //장바구니 수량 수정
    void modifyCart(ModCart cart);

}
