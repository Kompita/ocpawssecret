package com.nttdata.dar.ocpawssecret.controllers;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class DbController {
    
    static Logger logger = LoggerFactory.getLogger(DbController.class);

    @RequestMapping("/db.action")
    public String index(Model model) {
        model.addAttribute("env",System.getenv());
        return "db";
    }
    
    @RequestMapping(value = "/db_consultar.action",method = RequestMethod.POST)
    public String consultar(Model model, 
            @RequestParam(name = "url") String url,
            @RequestParam(name = "usuario") String usuario,
            @RequestParam(name = "password") String password,
            @RequestParam(name = "query") String query
            ) throws SQLException, ClassNotFoundException {
        
        model.addAttribute("accion", "resultados");
        Class.forName("org.postgresql.Driver");
        Connection conn = DriverManager.getConnection(url, usuario, password);
        PreparedStatement stmt = conn.prepareStatement(query);
        ResultSet rs = stmt.executeQuery();
        if(rs.next()){
            model.addAttribute("resultado",rs.getObject(1));
        }else{
            model.addAttribute("resultado","Sin resultados");
        }
   
       
        return "db";
    }
    

}
