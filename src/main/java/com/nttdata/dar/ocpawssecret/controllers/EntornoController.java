package com.nttdata.dar.ocpawssecret.controllers;

import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
public class EntornoController {

    static Logger logger = LoggerFactory.getLogger(EntornoController.class);
        
    @RequestMapping("/entorno.action")
    public String index(Model model) {
         
        Map<String,String> env =  System.getenv();
        model.addAttribute("env", env);
        return "entorno";
    }
}
