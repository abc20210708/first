package com.shop.first.customer.service;

import com.shop.first.customer.domain.Customer;
import com.shop.first.customer.dto.ModCustomer;
import com.shop.first.customer.repository.CustomerMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

@Service
@Log4j2
@RequiredArgsConstructor
public class CustomerService {

    private final CustomerMapper customerMapper;

    //회원가입 중간처리
    public boolean insert(Customer customer) {

        BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
        String encodedPw = encoder.encode(customer.getCsPw());
        customer.setCsPw(encodedPw);

        log.info("회원가입 : " + customer);
        return customerMapper.createCustomer(customer);
    }

    //회원탈퇴 중간처리
    public boolean delete(String csId, String csPw) {
        log.info("탈퇴 요청 ID: " + csId);
        return customerMapper.delCustomer(csId, csPw);
    }

    //회원수정 중간처리
    public boolean updateCustomer(ModCustomer customer) {
        customerMapper.updateCustomer(customer);
        return true;
    }

    //회원정보 중간처리
    public Customer getCustomer(String csId) {
        return customerMapper.getCustomer(csId);
    }

    //공지사항 중간처리
    /*
    public List<Notice> getNotice() {
        List<Notice> noticeList = customerMapper.getNotice();

        return noticeList;
    } */

    //아이디 중복확인 중간처리
    public boolean isDuplicate(String checkId) {
        return customerMapper.isDuplicate(checkId) == 1;
    }

    //회원 로그인 중간처리
    public Customer login(String csId, String csPw) throws Exception {
        Customer findCustomer = customerMapper.getCustomer(csId);
        log.info("회원 로그인 service---");

        if (findCustomer != null) {
            String dbPw = findCustomer.getCsPw();
            BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
            if (encoder.matches(csPw,dbPw)) {
                return findCustomer;
            }
        }
        return null;
    }

    /* BCryptPasswordEncoder란?

    스프링 시큐리티(Spring Seurity) 프레임워크에서 제공하는 클래스 중 하나로 비밀번호를
    암호화하는 데 사용할 수 있는 메서드를 가진 클래스입니다.

    참고블로그 https://kimvampa.tistory.com/129
    */

}//
