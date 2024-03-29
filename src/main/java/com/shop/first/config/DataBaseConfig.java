package com.shop.first.config;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import javax.sql.DataSource;

@Configuration
@ComponentScan(basePackages = "com.shop.first")
//@ComponentScan("com.package1.component")
//@ComponentScan에는 다양한 설정들이 있다. 먼저 basePackages는 패키지 경로에 대한 설정이다.
// basePackages는 기본 설정 값이다. 즉 다음 두 코드는 같은 역할을 한다. 해당 경로를 포함하는 하위 패키지를 모두 스캔한다.
// 참고 블로그 https://nankisu.tistory.com/4
public class DataBaseConfig {

    //DB 접속정보 설정 (DataSource 설정)
    @Bean
    public DataSource dataSource() {
        //커넥션 풀: 연결객체를 풀에 담아두고 재활용
        HikariConfig config = new HikariConfig();
        config.setJdbcUrl("jdbc:oracle:thin:@localhost:1521:xe");
        config.setDriverClassName("oracle.jdbc.driver.OracleDriver");
        config.setUsername("team_web");
        config.setPassword("0000");

        return  new HikariDataSource(config);
    }

}//

/*
component-scan 이란?

빈으로 등록 될 준비를 마친 클래스들을 스캔하여, 빈으로 등록해주는 것이다.
빈으로 등록 될 준비를 하는 것이 무엇일까?
우리가 @Controller, @Service, @Component, @Repository 어노테이션을 붙인
클래스들이 빈으로 등록 될 준비를 한 것이다.

참고 블로그 https://velog.io/@hyun-jii/%EC%8A%A4%ED%94%84%EB%A7%81-component-scan-%EA%B0%9C%EB%85%90-%EB%B0%8F-%EB%8F%99%EC%9E%91-%EA%B3%BC%EC%A0%95
* */
