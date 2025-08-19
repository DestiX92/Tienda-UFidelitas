package com.tienda.controller;

// Make sure this import matches the actual package and class name of EstucheService
import com.tienda.service.EstucheService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CaseController {

    @Autowired
    private EstucheService estucheService;

    @GetMapping("/cases")
    public String listarEstuches(Model model) {
        model.addAttribute("estuches", estucheService.getEstuches());
        return "cases"; 
    }
}
