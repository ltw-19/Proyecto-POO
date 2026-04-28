document.addEventListener('DOMContentLoaded', function() {
    const aplicarBtn = document.getElementById('aplicarFiltros');
    if (!aplicarBtn) return; // No estamos en catálogo

    const precioSlider = document.getElementById('precioMax');
    const precioMostrar = document.getElementById('precioMostrar');
    const ordenarSelect = document.getElementById('ordenar');
    const contadorSpan = document.getElementById('contadorProductos');

    function filtrarProductos() {
        const categoriasSeleccionadas = Array.from(document.querySelectorAll('.filtro-categoria:checked')).map(cb => cb.value);
        const marcasSeleccionadas = Array.from(document.querySelectorAll('.filtro-marca:checked')).map(cb => cb.value);
        const precioMaximo = parseFloat(precioSlider.value);
        const orden = ordenarSelect.value;

        let productos = Array.from(document.querySelectorAll('#listaProductos .product-card'));
        let visibles = [];

        productos.forEach(producto => {
            const precio = parseFloat(producto.dataset.precio);
            const categoria = producto.dataset.categoria;
            const marca = producto.dataset.marca;

            let cumpleCategoria = (categoriasSeleccionadas.length === 0) || categoriasSeleccionadas.includes(categoria);
            let cumpleMarca = (marcasSeleccionadas.length === 0) || marcasSeleccionadas.includes(marca);
            let cumplePrecio = precio <= precioMaximo;

            if (cumpleCategoria && cumpleMarca && cumplePrecio) {
                producto.style.display = 'flex';
                visibles.push(producto);
            } else {
                producto.style.display = 'none';
            }
        });

        // Ordenar
        if (orden === 'menorPrecio') {
            visibles.sort((a,b) => parseFloat(a.dataset.precio) - parseFloat(b.dataset.precio));
        } else if (orden === 'mayorPrecio') {
            visibles.sort((a,b) => parseFloat(b.dataset.precio) - parseFloat(a.dataset.precio));
        } else {
            visibles.sort((a,b) => a.dataset.nombre.localeCompare(b.dataset.nombre));
        }

        const contenedor = document.getElementById('listaProductos');
        visibles.forEach(prod => contenedor.appendChild(prod));
        contadorSpan.innerText = visibles.length;
    }

    precioSlider.addEventListener('input', function() {
        precioMostrar.innerText = this.value;
        filtrarProductos();
    });
    aplicarBtn.addEventListener('click', filtrarProductos);
    ordenarSelect.addEventListener('change', filtrarProductos);

    document.querySelectorAll('.filtro-categoria, .filtro-marca').forEach(cb => {
        cb.addEventListener('change', filtrarProductos);
    });

    filtrarProductos();
});