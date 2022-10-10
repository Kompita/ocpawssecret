package com.nttdata.dar.ocpawssecret.controllers;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class IndexController {
    
    static Logger logger = LoggerFactory.getLogger(IndexController.class);

    @RequestMapping("/index.action")
    public String index() {
        return "index";
    }
}
