package com.tienda.repository;

import com.tienda.domain.Wallpaper;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WallpaperRepository extends CrudRepository<Wallpaper, Long> {
}
