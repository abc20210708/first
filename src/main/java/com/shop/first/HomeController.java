package com.shop.first;

import com.shop.first.customer.domain.Customer;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequiredArgsConstructor
public class HomeController {

    @GetMapping("/")
    public String home(
            @SessionAttribute(name = "loginCustomer", required = false) Customer loginCustomer,
            HttpServletRequest request, Model model ) {

        if (loginCustomer == null) return "/main/index";

        model.addAttribute("loginCustomer", loginCustomer);
        return "login/customer";
    }
}//
