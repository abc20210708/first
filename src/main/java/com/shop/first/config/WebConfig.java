package com.shop.first.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.io.IOException;

@Configuration //스프링이 @Configuration 어노테이션이 명시된 클래스를 우선으로 읽는다
//@Configuration 어노테이션과 @Bean 어노테이션을 함께 사용하여야 싱글톤임을 보장
public class WebConfig implements WebMvcConfigurer {

    //@Bean 어노테이션이 붙은 메서드는 메서드 이름이 곧 스프링 빈 이름으로 된다
    @Bean
    public CommonsMultipartResolver multipartResolver() throws IOException {
        CommonsMultipartResolver mr = new CommonsMultipartResolver();
        mr.setMaxInMemorySize(52428800); //파일 업로드 가능한 최대 크기
        mr.setDefaultEncoding("UTF-8");
        mr.setUploadTempDir(new FileSystemResource("C:\\testImg"));
        return mr;
    }

    /*
    컴포넌트 스캔 방법이 더 편리하긴 하지만 직접 스프링 빈을 등록하여 관리하는 장점도 있긴 하다.
    외부 라이브러리 사용 시 @Bean으로 클래스를 등록해줘야 하는 경우 때문에 사용되기도 하고,
    WebConfig 파일에서 한눈에 스프링 빈 객체가 어떤 게 등록되어 있는지 파악하기 쉽다는 장점이 있다.
    또한 해당 방법을 사용함으로써 OCP 원칙을 지킬 수 있다.

    참고 블로그 https://mimah.tistory.com/entry/Spring-%EC%8A%A4%ED%94%84%EB%A7%81-%EB%B9%88%EC%9D%84-%EB%93%B1%EB%A1%9D%ED%95%98%EB%8A%94-%EB%91%90-%EA%B0%80%EC%A7%80-%EB%B0%A9%EB%B2%95
    * */

    @Override
    public void addResourceHandlers(ResourceHandlerRegistry registry) {
        registry.addResourceHandler("/product/list/**")
                .addResourceLocations("file:C:/testImg/");
    }
}//
