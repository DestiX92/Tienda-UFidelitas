package com.tienda.service;

import com.tienda.domain.Estuche;
import com.tienda.repository.EstucheRepository;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class EstucheService {

    @Autowired
    private EstucheRepository estucheRepository;

    public List<Estuche> getEstuches() {
        return (List<Estuche>) estucheRepository.findAll();
    }
}
