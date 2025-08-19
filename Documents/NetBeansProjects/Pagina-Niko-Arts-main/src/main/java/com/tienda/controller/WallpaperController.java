package com.tienda.controller;

import com.tienda.service.WallpaperService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WallpaperController {

    @Autowired
    private WallpaperService wallpaperService;

    @GetMapping("/wallpapers")
    public String listarWallpapers(Model model) {
        model.addAttribute("wallpapers", wallpaperService.getWallpapers());
        return "wallpapers"; // Carga la vista wallpapers.html
    }
}
