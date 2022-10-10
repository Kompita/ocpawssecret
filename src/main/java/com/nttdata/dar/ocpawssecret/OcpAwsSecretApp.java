package com.nttdata.dar.ocpawssecret;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;


@ComponentScan
@SpringBootApplication(exclude = { DataSourceAutoConfiguration.class })
public class OcpAwsSecretApp extends WebSecurityConfigurerAdapter {

    @Override
    protected void configure(HttpSecurity security) throws Exception {
//        security.authorizeRequests()
//                .anyRequest()
//                .authenticated()
//              .and()
//                .httpBasic();
        security.csrf().disable();
    }

    @Autowired
    public void configureGlobal(AuthenticationManagerBuilder auth) 
            throws Exception 
    {
        auth.inMemoryAuthentication()
            .withUser("ocp")
            .password("{noop}aws2022==")
            .roles("USER");
    }
    
    public static void main(String[] args) {
        SpringApplication.run(OcpAwsSecretApp.class, args);
    }
}
