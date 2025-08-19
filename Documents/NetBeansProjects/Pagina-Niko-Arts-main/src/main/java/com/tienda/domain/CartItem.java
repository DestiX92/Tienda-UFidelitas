package com.tienda.domain;

import java.io.Serializable;
import lombok.Data;

@Data
public class CartItem implements Serializable {
    private Long id;
    private String nombreProducto;
    private int cantidad;
    private Double precioUnitario;

    public Double getSubtotal() {
        return precioUnitario * cantidad;
    }
}
