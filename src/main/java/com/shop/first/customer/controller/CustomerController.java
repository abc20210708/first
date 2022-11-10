package com.shop.first.customer.controller;

import com.shop.first.customer.domain.Customer;
import com.shop.first.customer.dto.ModCustomer;
import com.shop.first.customer.service.CustomerService;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.PrintWriter;

@Controller
@Log4j2
@RequestMapping("/customer")
@RequiredArgsConstructor
public class CustomerController {

    private final CustomerService customerService;

    //회원 가입 요청 - (화면)
    @GetMapping("/account")
    public String insert() {
        log.info("회원 가입 요청(화면) - GET ");
        return "customer/account";
    }

    //회원 가입 요청
    @PostMapping("/account")
    public String insert(Customer customer){
        log.info("회원 가입 요청 " + customer);
        customerService.insert(customer);
        return "redirect:/";
    }

    //회원 탈퇴 요청 - (화면)
    @GetMapping("/delete")
    public String delete() {
        return "customer/delete";
    }

    //회원 탈퇴
    @PostMapping("/delete")
    public String delete(String csId, String csPw) {
        log.info("회원 탈퇴 요청 아이디: "+ csId);
        customerService.delete(csId, csPw);
        return  "redirect:/";
    }

    //회원 정보 상세 보기 - (화면)
    @GetMapping("/info")
    public String content(Model model, HttpSession session) {
        log.info("회원 정보 보기(화면) ");

        Customer loginCustomer = (Customer) session.getAttribute("loginCustomer");
        customerService.getCustomer(loginCustomer.getCsId());
        log.info(loginCustomer);

        model.addAttribute("cs", loginCustomer);

        return "customer/info";
    }


    //============= 화면(view)으로 서버 데이터 보내기 ============//
    //서버에서 클라이언트 화면으로 데이터를 보낼 땐 Model 객체를 활용합니다.
    //회원 정보 상세보기
    @PostMapping("/info")
    public String content(Model model, ModCustomer modCustomer) {
        Customer loginCustomer = customerService.getCustomer(modCustomer.getCsId());
        model.addAttribute("cs", loginCustomer);
        log.info(loginCustomer);
        customerService.updateCustomer(modCustomer);
        log.info("회원 정보 변경 :" + modCustomer);
        return "redirect:/customer/info?csId="+loginCustomer.getCsId();
    }

    //요청 파라미터 받기: 클라이언트에서 서버로 전송된 데이터
    // redirect:/customer/info?csId="+loginCustomer.getCsId()
    ///물음표 뒤가 요청 파라미터

    //공지사항 요청 - (화면)
    /*
        @GetMapping("/notice")
    public String notice(Model model) {
        log.info("회원 공지사항 요청(화면) GET ");
        List<Notice> noticeList = customerService.getNotice();
        model.addAttribute("notice", noticeList);
        return "notice/list";
    }
    * */

    //아이디 중복확인 비동기 통신 요청
    @GetMapping("/check")
    @ResponseBody
    public boolean check(String checkId) {
        return customerService.isDuplicate(checkId);
    }


    //회원 로그인 검증
    @PostMapping("/login")
    public String loginCustomer(Customer customer, HttpServletRequest request,
                                HttpServletResponse response) throws Exception {
        HttpSession session = request.getSession();
        log.info("회원 로그인 검증 POST---");
        Customer loginCustomer = customerService.login(customer.getCsId(), customer.getCsPw());

        if (loginCustomer != null) {
            //세션(Session)의 속성
            session.setAttribute("loginCustomer", loginCustomer);
            log.info("로그인 유저: " + loginCustomer);
            return "redirect:/";
        }

        else {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("text/html; charset=UTF-8");

            PrintWriter out = response.getWriter();
            log.info("else!!");
            out.println("<script>alert('아이디 또는 비밀번호가 틀립니다. ');");
            out.println("history.back();");
            out.println("</script>");
            out.flush();
            response.flushBuffer();
            out.close();

        }
        return  null;
    }

    /*
        세션(Session)의 속성

        세션의 속성 설정은 session 객체의 setAttribute() 메소드를 사용한다.
        session.setAttribute("id", "value");
        이때 주의할 사항은 세션의 속성 값은 객체 형태만 올 수 있다는 것이다.

        session 객체는 웹 브라우저와 매핑되므로 해당 웹 브라우저를 닫지 않는 한 같은 창에서
        열려진 페이지는 모두 같은 session 객체를 공유하게 된다.
        따라서 session 객체의 setAttribute() 메소드를 사용해서 세션의 속성을 지정하게 되면
        계속 상태를 유지하는 기능을 사용할 수 있게 된다.

        참고블로그 https://xzio.tistory.com/71
*/

    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            session.invalidate();
        }
        return  "redirect:/";
    }




}//
