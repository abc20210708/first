package com.shop.first;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.context.annotation.Bean;
import org.springframework.web.servlet.view.InternalResourceViewResolver;

@SpringBootApplication
@ServletComponentScan //서블릿들을 검색해서 주입할 수 있도록 설정
public class FirstApplication {

	//ViewResolver 설정
	//컨트롤러가 리턴한 경로 문자열을 해석해주는 객체
	@Bean
	public InternalResourceViewResolver viewResolver() {
		InternalResourceViewResolver resolver
				= new InternalResourceViewResolver();
		resolver.setPrefix("/WEB-INF/views/");
		resolver.setSuffix(".jsp");

		return resolver;
	}


	public static void main(String[] args) {
		SpringApplication.run(FirstApplication.class, args);
	}

	//오라클 계정 패스워드 만료
	//참고 블로그  https://daram2-everyday.tistory.com/23

}//



