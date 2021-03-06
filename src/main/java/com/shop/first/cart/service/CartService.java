package com.shop.first.cart.service;

import com.shop.first.cart.domain.Cart;
import com.shop.first.cart.dto.ModCart;
import com.shop.first.cart.repository.CartMapper;
import com.shop.first.product.domain.Product;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@Log4j2
@RequiredArgsConstructor
public class CartService {

    private final CartMapper cartMapper;

    //장바구니 추가
    public void insert(Cart cart) {
        cartMapper.insert(cart);
        log.info("장바구니 추가 "+ cart);
    }

    //장바구니 목록
    public List<Cart> listCart(String csId) {
        log.info("장바구니 목록 요청 서비스!" + csId);
        return cartMapper.listCart(csId);
    }

    //장바구니 상품 목록
    public Product listProduct(int prCode) {
        log.info("CartService 상품 목록 요청 서비스!" + prCode);
        return cartMapper.listProduct(prCode);
    }

    //장바구니 삭제
    public void delete(int cardCode) {
        cartMapper.delete(cardCode);
    }

    //장바구니 조회
    public Cart selectCart(String csId, int cartCode) {
       return cartMapper.selectCart(csId, cartCode);
    }



    //장바구니 금액 합계
    public int sumTotal(String csId) {
        return cartMapper.sumTotal(csId);
    }

    //장바구니 동일한 상품 레코드 확인
    public int countCart(String csId, int prCode){
        log.info("장바구니 상품 레코드 확인 Service =====>"+ cartMapper.countCart(csId, prCode));
        return cartMapper.countCart(csId, prCode);
    }

    //장바구니 수량 수정
    public void modifyCart(ModCart cart) {
        cartMapper.modifyCart(cart);
    }

}//
