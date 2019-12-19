package com.yijiayifeng;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.ServletComponentScan;
import org.springframework.boot.web.support.SpringBootServletInitializer;

/**
 * Hello world!
 *
 */
@MapperScan(basePackages = "com.yijiayifeng.mapper")
@ServletComponentScan
@SpringBootApplication
public class App extends SpringBootServletInitializer
{
    public static void main( String[] args ){
        SpringApplication.run(App.class,args);
    }


    protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
        return builder.sources(App.class);
    }
}
