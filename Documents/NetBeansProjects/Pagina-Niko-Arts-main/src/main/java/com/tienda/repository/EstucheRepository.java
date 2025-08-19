package com.tienda.repository;

import com.tienda.domain.Estuche;
import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface EstucheRepository extends CrudRepository<Estuche, Long> {
}
