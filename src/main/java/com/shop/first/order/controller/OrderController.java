package com.shop.first.order.controller;

import com.shop.first.customer.domain.Customer;
import com.shop.first.order.domain.Order;
import com.shop.first.order.service.OrderService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

@Controller
@RequestMapping("/order")
@Log4j2
@RequiredArgsConstructor
public class OrderController {


    private final OrderService orderService;

    //주문하기
    @PostMapping("/add")
    public String insert(Order order, HttpSession session,
                         HttpServletRequest request, HttpServletResponse response)  throws IOException, ServletException {

        log.info("주문 생성" + order);
        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");

        order.setCsId(loginCustomer.getCsId());
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        int cartCode = Integer.parseInt(request.getParameter("cartCode"));
        log.info(cartCode);

        orderService.insert(order);

        return "redirect:/order/list";
    }


    // 주문 내역
    @GetMapping("/list")
    public String list(HttpSession session, Model model) {
        log.info("주문 내역 Controller!(화면)");

        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        //주문내역 정보
        List<Order> orderListList = orderService.list(loginCustomer.getCsId());

        model.addAttribute("ord", orderListList);

        return "order/order_list";
    }

}//
