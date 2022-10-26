package com.shop.first.cart.controller;

import com.shop.first.cart.domain.Cart;
import com.shop.first.cart.dto.ModCart;
import com.shop.first.cart.service.CartService;
import com.shop.first.customer.domain.Customer;
import com.shop.first.product.domain.Product;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

@Controller
@RequestMapping("/cart")  //요청을 처리할 컨트롤러가 있다면 @RequestMapping을 통해
                            //해당 메서드에 접근
@Log4j2
@RequiredArgsConstructor
public class CartController {

    private final CartService cartService;

    //장바구니 추가
    @PostMapping("/add") //클라이언트에 데이터를 전송하기위해 response 객체를 사용
    public String insert(Cart cart, HttpSession session, HttpServletResponse response)
        throws IOException, ServletException {

        log.info("장바구니 insert! " +session.getAttribute("loginCustomer"));

        //세션 : 사용자의 정보가 서버에 저장된다.
        // 서버 접속시 세션 ID를 발급 받아서 일정시간동안 유지된다

        //세션에 저장된 데이터 가져오기
        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        int count = cartService.countCart(loginCustomer.getCsId(), cart.getPrCode());

        log.info("(cart):" +cart);
        log.info("로그 확인하기 1: "+ loginCustomer.getCsId());
        log.info("로그 확인하기 2: "+ cart.getPrCode());

        //장바구니에 기존 상품이 있는지 검사
        log.info("count =============> "+ count);
        if (count == 0)  {
            log.info("장바구니 상품 레코드 확인 Controller");
            cart.setCsId(loginCustomer.getCsId());
            cartService.insert(cart);
            log.info(cart);
        }
        else {
            response.setCharacterEncoding("UTF-8");
            //이때 contentType을 먼저 하지 않으면, 한글이 깨질 수 있음
            response.setContentType("text/html; charset=UTF-8");

            PrintWriter out = response.getWriter();

            out.println("<script>alert('이미 장바구니에 있는 상품입니다 :) ');");
            out.println("history.back()"); //이전 페이지
            out.println("</script>");
            out.flush();
            response.flushBuffer(); //버퍼에 있는 내용을 클라이언트에 전송
            out.close();
            return null;
        }

        return "redirect:/cart/list";

    }

    //장바구니 목록
    @GetMapping("/list")
    public String list(HttpSession session, Model model, HttpServletResponse response) {

        log.info("장바구니 목록 Controller! (화면)");

        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");

        //장바구니 정보
        List<Cart> cartList = cartService.listCart(loginCustomer.getCsId());



        log.info(cartList);
        model.addAttribute("cart",cartList);

        List<Product> productList = new ArrayList<>();

        //상품정보
        for (Cart cart: cartList) {
            Product product = cartService.listProduct(cart.getPrCode());
            productList.add(product);
            model.addAttribute("product",productList);
        }
        return "cart/my_basket_page";
    }

    //장바구니 삭제
    @GetMapping("/delete")
    public String delete(int cartCode) {
        log.info("장바구니 삭제: " + cartCode);
        cartService.delete(cartCode);
        return "redirect:/cart/list";
    }

    //장바구니 선택 삭제
    @PostMapping("/checkDelete")
    public String checkDelete(HttpServletRequest request) {
        log.info("==장바구니 선택 삭제==");
        String[] ajaxMsg = request.getParameterValues("valueArr");
        for (String s : ajaxMsg) {
            log.info("s:" +s);
            cartService.delete(Integer.parseInt(s));
        }
        log.info("장바구니 선택 삭제 ");
        return "redirect:/cart/list";
    }

    //장바구니 수량 변경
    @PostMapping("/modify")
    public String modify(ModCart cart) {
        log.info("장바구니 수량변경: " + cart.getCartAmount());
        cartService.modifyCart(cart);
        return "redirect:/cart/list";
    }


}//
