package com.shop.first;

import com.shop.first.customer.domain.Customer;
import com.shop.first.product.domain.Product;
import com.shop.first.product.service.ProductService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.SessionAttribute;

import java.util.List;

@Controller
@RequiredArgsConstructor
public class HomeController {

    private final ProductService productService;

    @GetMapping("/")
    public String home( // 참고 블로그 https://innovation123.tistory.com/57
            @SessionAttribute(name = "loginCustomer",
                    required = false) Customer loginCustomer,
           Model model) {

        // https://itjy2.tistory.com/111
        List<Product> productList = productService.getList();
        model.addAttribute("articles", productList);

        model.addAttribute("loginCustomer", loginCustomer);
        return "/main/index";

    }
}//
/* @SessionAttribute
스프링에서 제공하는 HttpSession의 로그인 여부 조회 기능을
편리하게 사용할 수 있게 해주는 Annotation
* */
