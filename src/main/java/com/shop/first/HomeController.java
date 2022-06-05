package com.shop.first;

import com.shop.first.customer.domain.Customer;
import com.shop.first.product.domain.Product;
import com.shop.first.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final ProductService productService;

    @GetMapping("/")
    public String home(
            @SessionAttribute(name = "loginCustomer", required = false) Customer loginCustomer,
            HttpServletRequest request, Model model ) {

        List<Product> productList = productService.getList();
        model.addAttribute("articles", productList);

        if (loginCustomer == null) return "/main/index";

        model.addAttribute("loginCustomer", loginCustomer);
        //return "login/customer";
        return "/main/index";


    }
}//
