
package com.sc403.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.ui.Model;

@Controller

public class NosotrosController {
    
     @GetMapping("/nosotros")
    public String listado(Model model) {
        
        return "nosotros";
    }
    
    
    
    
    
    }


