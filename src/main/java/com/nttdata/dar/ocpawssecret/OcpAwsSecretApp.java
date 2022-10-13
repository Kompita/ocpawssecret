package com.nttdata.dar.ocpawssecret;


import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@ComponentScan
@SpringBootApplication
public class OcpAwsSecretApp {

   
    public static void main(String[] args) {
        SpringApplication.run(OcpAwsSecretApp.class, args);
    }
}


