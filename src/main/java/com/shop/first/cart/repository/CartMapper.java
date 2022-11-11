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
    /*
    @Param
    데이터베이스에 다수의 변수를 전달할 때는 전달되는 변수들에 @Param 어노테이션을
    붙여주어 각 변수를 구분할 수 있도록한다. 변수를 한개만 전달할 할때는 상관없지만,
    다수의 변수를 전달할때는 반드시 써주는게 좋다.

    참고 블로그
    https://velog.io/@alicesykim95/Pathvariable-RequestParam-PathParam-Pram
    */

    //@RequestParam
    //참고 블로그 https://m42-orion.tistory.com/114?category=1085496

    //장바구니 수량 수정
    void modifyCart(ModCart cart);

}
