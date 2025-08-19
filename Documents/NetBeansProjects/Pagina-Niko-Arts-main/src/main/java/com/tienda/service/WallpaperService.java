package com.tienda.service;

import com.tienda.domain.Wallpaper;
import com.tienda.repository.WallpaperRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class WallpaperService {

    @Autowired
    private WallpaperRepository wallpaperRepository;

    public List<Wallpaper> getWallpapers() {
        return (List<Wallpaper>) wallpaperRepository.findAll();
    }
}
