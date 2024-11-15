<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="es" data-theme="light">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TechClothes - Mantenimiento de Productos</title>

        <!-- Tailwind CSS y daisyUI CDN -->
        <script src="https://cdn.tailwindcss.com"></script>
        <link href="https://cdn.jsdelivr.net/npm/daisyui@4.12.14/dist/full.min.css" rel="stylesheet" type="text/css" />
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            background: '#F1F5F9',
                            primary: '#1E3A8A', // Azul oscuro
                            primaryLight: '#3B82F6', // Azul claro
                            secondary: '#64748B', // Gris azulado para fondos de perfil
                            accent: '#93C5FD', // Azul claro para hover
                            hoverAccent: '#2563EB',
                        }
                    }
                },
                daisyui: {
                    themes: ["light"], // Asegura el uso del modo claro
                }
            };
        </script>
        <!-- SweetAlert2 CDN -->
        <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
        <script src="https://code.jquery.com/jquery-3.7.1.slim.js" integrity="sha256-UgvvN8vBkgO0luPSUl2s8TIlOSYRoGFAX4jlCIm9Adc=" crossorigin="anonymous"></script>

    </head>

    <body class="theme-light bg-background text-gray-900 font-sans">

        <header class="bg-primary p-4 shadow-lg">
            <div class="container mx-auto flex justify-between items-center">
                <a href="index.jsp" class="text-3xl font-bold text-white">TechClothes</a>
                <div class="hidden md:flex space-x-4">
                    <a href="cuenta.html" class="text-white text-lg mx-3 hover:text-secondary">Mi cuenta</a>
                </div>
                <!-- Menú de hamburguesa para móviles -->
                <button id="menuBtn" class="text-lg md:hidden material-icons text-white">menu</button>
            </div>
        </header>
 


        <!-- Contenedor principal con barra lateral y contenido -->
        <div class="flex h-screen overflow-hidden">

            <!-- Barra de navegación lateral -->
            <aside
                class="bg-primary text-white w-64 space-y-6 px-4 py-8 absolute inset-y-0 left-0 transform -translate-x-full md:relative md:translate-x-0 transition-transform duration-200 ease-in-out z-50"
                id="sidebar">
                <div class="text-center">
                    <img src="https://avatar.iran.liara.run/public/48  " alt="Admin Avatar" class="w-20 h-20 mx-auto rounded-full mb-2 shadow-lg">
                    <h2 class="text-lg font-semibold">Admin TechClothes</h2>
                    <p class="text-sm text-primaryLight">admin@techclothes.com</p>
                </div>

                <!-- Navegación lateral -->
                <nav class="flex-1 mt-4">
                    <ul class="space-y-2">
                        <li>
                            <a href="#"  class="flex items-center space-x-3 px-4 py-2 hover:bg-hoverAccent rounded-lg transition">
                                <span class="material-icons">dashboard</span>
                                <span>Dashboard</span>
                            </a>
                        </li>
                        <li>
                            <a href="ProductoController?action=listar&view=mantenimiento" class="flex items-center space-x-3 px-4 py-2 hover:bg-hoverAccent rounded-lg transition">
                                <span class="material-icons">inventory_2</span>
                                <span>Productos</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center space-x-3 px-4 py-2 hover:bg-hoverAccent rounded-lg transition">
                                <span class="material-icons">group</span>
                                <span>Usuarios</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center space-x-3 px-4 py-2 hover:bg-hoverAccent rounded-lg transition">
                                <span class="material-icons">shopping_cart</span>
                                <span>Pedidos</span>
                            </a>
                        </li>
                        <li>
                            <a href="#"  class="flex items-center space-x-3 px-4 py-2 hover:bg-hoverAccent rounded-lg transition">
                                <span class="material-icons">assessment</span>
                                <span>Reportes</span>
                            </a>
                        </li>
                        <li>
                            <a href="#" class="flex items-center space-x-3 px-4 py-2 hover:bg-hoverAccent rounded-lg transition">
                                <span class="material-icons">settings</span>
                                <span>Configuración</span>
                            </a>
                        </li>
                    </ul>
                </nav>

                <div class="px-4">
                    <button class="btn bg-accent text-primary w-full">Cerrar Sesión</button>
                </div>
            </aside>

            <!-- Contenido principal -->
            <div class="flex-1 flex flex-col">
                <main class="flex-1 p-8 overflow-auto">

                    <section id="mantenimiento" class="py-2">
                        <div class="container mx-auto">
                            <h2 class="text-4xl font-bold text-primary mb-8 text-center">Mantenimiento de Productos</h2>
                            <!-- Formulario de Producto -->
                            <div class="bg-white p-8 rounded-lg shadow-md mb-12">
                                <h3 class="text-2xl font-semibold mb-4">Agregar Producto</h3>
                                <form id="productForm" action="ProductoController?action=agregar" method="post" enctype="multipart/form-data">
                                    <div class="mb-4">
                                        <label for="nombre" class="block text-gray-700 font-medium mb-2">Nombre del Producto</label>
                                        <input type="text" name="nombre" class="input input-bordered w-full bg-white text-black" placeholder="Ej. Camiseta de JavaScript" required>
                                    </div>

                                    <div class="mb-4">
                                        <label for="descripcion" class="block text-gray-700 font-medium mb-2">Descripción</label>
                                        <textarea name="descripcion" class="textarea textarea-bordered w-full bg-white text-black" placeholder="Descripción del producto" rows="2" required minlength="10"></textarea>
                                    </div>

                                    <div class="mb-4">
                                        <label for="precio" class="block text-gray-700 font-medium mb-2">Precio</label>
                                        <input type="number" name="precio" class="input input-bordered w-full bg-white text-black" placeholder="Ej. 20.00" required min="1">
                                    </div>

                                    <div class="mb-4">
                                        <label for="categoria" class="block text-gray-700 font-medium mb-2">Categoría</label>
                                        <select name="categoria" class="select select-bordered w-full bg-white text-black" required>
                                            <option value="">Seleccione una categoría</option>
                                            <c:forEach var="categoria" items="${categorias}">
                                                <option value="${categoria.id}">${categoria.nombre}</option>
                                            </c:forEach>
                                        </select>
                                    </div>

                                    <div class="mb-4">
                                        <label for="stock" class="block text-gray-700 font-medium mb-2">Stock</label>
                                        <input type="number" name="stock" class="input input-bordered w-full bg-white text-black" placeholder="Ej. 100" required min="1">
                                    </div>

                                    <div class="mb-4">
                                        <label for="imagen_url" class="block text-gray-700 font-medium mb-2">Subir Imagen</label>
                                        <input type="file" name="imagen_url" class="file-input file-input-bordered file-input-primary w-full" accept="image/*" required>
                                    </div>

                                    <button type="submit" class="btn btn-lg btn-primary w-full mb-2" onclick="return validarFormulario()">Guardar Producto</button>
                                </form>
                            </div>

                            <!-- Lista de Productos -->
                            <div>
                                <h3 class="text-2xl font-semibold mb-4">Lista de Productos</h3>
                                <div class="overflow-x-auto">
                                    <table class="table w-full">
                                        <thead>
                                            <tr>
                                                <th>#</th>
                                                <th>Imagen</th>
                                                <th>Nombre</th>
                                                <th>Descripción</th>
                                                <th>Precio</th>
                                                <th>Categoría</th>
                                                <th>Stock</th>
                                                <th>Acciones</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="producto" items="${productos}">
                                                <tr class="hover:bg-gray-100">
                                                    <th>${producto.id}</th>
                                                    <td><img src="${producto.imagenUrl}" alt="Imagen de ${producto.nombre}" class="w-20 h-20 object-cover rounded-md"></td>
                                                    <td>${producto.nombre}</td>
                                                    <td>${producto.descripcion}</td>
                                                    <td>S/. ${producto.precio}</td>
                                                    <td>${producto.categoria.nombre}</td>
                                                    <td>${producto.stock}</td>
                                                    <td>
                                                        <button onclick="abrirModalEditar(${producto.id}, '${producto.nombre}', '${producto.descripcion}', ${producto.precio}, ${producto.stock}, ${producto.categoria.id}, '${producto.imagenUrl}')" class="btn btn-sm btn-secondary">Editar</button>
                                                        <button onclick="eliminarProducto(${producto.id}, '${producto.nombre}')" class="btn btn-sm btn-error">Eliminar</button>

                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </section>

                </main>
            </div>
        </div>


        <!-- Modal de Edición -->
        <input type="checkbox" id="editModal" class="modal-toggle">
        <div class="modal">
            <div class="modal-box">
                <h3 class="font-bold text-lg mb-4 text-primary">Editar Producto</h3>
                <form id="editForm" action="ProductoController?action=editar" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="id" id="editId"> <!-- Campo oculto para el ID del producto -->

                    <div class="mb-4">
                        <label for="editNombre" class="block text-primary font-medium mb-2">Nombre del Producto</label>
                        <input type="text" name="nombre" id="editNombre" class="input input-bordered w-full bg-white text-black" required>
                    </div>

                    <div class="mb-4">
                        <label for="editDescripcion" class="block text-primary font-medium mb-2">Descripción</label>
                        <textarea name="descripcion" id="editDescripcion" class="textarea textarea-bordered w-full bg-white text-black" required></textarea>
                    </div>

                    <div class="mb-4">
                        <label for="editPrecio" class="block text-primary font-medium mb-2">Precio</label>
                        <input type="number" name="precio" id="editPrecio" class="input input-bordered w-full bg-white text-black" required>
                    </div>

                    <div class="mb-4">
                        <label for="editStock" class="block text-primary font-medium mb-2">Stock</label>
                        <input type="number" name="stock" id="editStock" class="input input-bordered w-full bg-white text-black" required>
                    </div>

                    <div class="mb-4">
                        <label for="editCategoria" class="block text-primary font-medium mb-2">Categoría</label>
                        <select name="categoria" id="editCategoria" class="select select-bordered w-full bg-white text-black" required>
                            <option value="">Seleccione una categoría</option>
                            <c:forEach var="categoria" items="${categorias}">
                                <option value="${categoria.id}" ${producto.categoria.id == categoria.id ? 'selected' : ''}>${categoria.nombre}</option>
                            </c:forEach>
                        </select>
                    </div>

                    <div class="mb-4">
                        <label for="editImagen" class="block text-primary font-medium mb-2">Actualizar Imagen</label>
                        <input type="file" name="imagen_url" id="editImagen" class="file-input file-input-bordered file-input-primary w-full">
                        <p class="text-xs text-gray-500 mt-1">Selecciona una imagen solo si deseas cambiar la existente.</p>
                    </div>

                    <div class="modal-action">
                        <label for="editModal" class="btn bg-gray-400 text-white hover:bg-gray-500">Cancelar</label>
                        <button type="button" onclick="guardarCambios()" class="btn bg-primary text-white hover:bg-hoverAccent">Guardar Cambios</button>
                    </div>
                </form>
            </div>
        </div>

        <!-- JavaScript para el menú de hamburguesa -->
        <script>
            $(document).ready(function () {
                // Menú de hamburguesa
                $("#menuBtn").click(function () {
                    $("#sidebar").toggleClass("-translate-x-full");
                });

                // Mostrar alertas según los parámetros en la URL
                const urlParams = new URLSearchParams(window.location.search);
                if (urlParams.get("success") === "true") {
                    Swal.fire({
                        title: "Producto agregado",
                        text: "El producto ha sido agregado exitosamente.",
                        icon: "success",
                        confirmButtonColor: "#1F7BDD"
                    });
                } else if (urlParams.get("deleted") === "true") {
                    Swal.fire({
                        title: "Producto eliminado",
                        text: "El producto ha sido eliminado exitosamente.",
                        icon: "success",
                        confirmButtonColor: "#1F7BDD"
                    });
                } else if (urlParams.get("edited") === "true") {
                    Swal.fire({
                        title: "Producto actualizado",
                        text: "El producto ha sido editado exitosamente.",
                        icon: "success",
                        confirmButtonColor: "#1F7BDD"
                    });
                }
            });

            // Abrir modal de edición
            function abrirModalEditar(id, nombre, descripcion, precio, stock, categoriaId, imagenUrl) {
                $('#editId').val(id);
                $('#editNombre').val(nombre);
                $('#editDescripcion').val(descripcion);
                $('#editPrecio').val(precio);
                $('#editStock').val(stock);
                $('#editCategoria').val(categoriaId);
                $('#editImagen').data('currentImage', imagenUrl);

                $('#editModal').prop('checked', true); // Abrir el modal
            }

            // SweetAlert2 para confirmar el guardado de un nuevo producto
            function guardarProducto() {
                Swal.fire({
                    title: '¿Guardar nuevo producto?',
                    text: 'El producto será guardado con los datos ingresados.',
                    icon: 'question',
                    showCancelButton: true,
                    confirmButtonText: 'Guardar',
                    cancelButtonText: 'Cancelar',
                    confirmButtonColor: '#1F7BDD'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#productForm').submit();
                        Swal.fire('Guardado', 'El producto ha sido agregado exitosamente.', 'success');
                    }
                });
            }

            // Confirmación de SweetAlert2 antes de guardar los cambios de edición
            function guardarCambios() {
                Swal.fire({
                    title: '¿Guardar los cambios?',
                    text: 'Los cambios se guardarán en el producto.',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonText: 'Sí, guardar',
                    cancelButtonText: 'Cancelar',
                    confirmButtonColor: '#1F7BDD'
                }).then((result) => {
                    if (result.isConfirmed) {
                        $('#editForm').submit();
                    }
                });
            }

            // Confirmación de eliminación de producto con SweetAlert2
            function eliminarProducto(idProducto, nombreProducto) {
                if (!idProducto || !nombreProducto) {
                    console.error("Datos no válidos:", idProducto, nombreProducto);
                    alert("No se puede eliminar el producto porque los datos son inválidos.");
                    return;
                }

                Swal.fire({
                    title: '¿Estás seguro?',
                    text: 'Eliminarás el producto "' + nombreProducto + '". Esta acción no se puede deshacer.',
                    icon: 'warning',
                    showCancelButton: true,
                    confirmButtonColor: '#d33',
                    cancelButtonColor: '#8595BF',
                    confirmButtonText: 'Sí, eliminar',
                    cancelButtonText: 'Cancelar'
                }).then((result) => {
                    if (result.isConfirmed) {
                        const url = 'ProductoController?action=eliminar&id=' + idProducto;
                        window.location.href = url + '&deleted=true';
                    }
                });
            }

            // Validación del formulario
            function validarFormulario() {
                const nombre = $("input[name='nombre']").val().trim();
                const descripcion = $("textarea[name='descripcion']").val().trim();
                const precio = $("input[name='precio']").val();
                const categoria = $("select[name='categoria']").val();
                const stock = $("input[name='stock']").val();
                const imagen = $("input[name='imagen_url']").val();

                if (!nombre || nombre.length < 3) {
                    Swal.fire("Error", "El nombre del producto debe tener al menos 3 caracteres.", "error");
                    return false;
                }

                if (!descripcion || descripcion.length < 5) {
                    Swal.fire("Error", "La descripción debe tener al menos 5 caracteres.", "error");
                    return false;
                }

                if (!precio || precio <= 0) {
                    Swal.fire("Error", "El precio debe ser un valor positivo.", "error");
                    return false;
                }

                if (!categoria) {
                    Swal.fire("Error", "Por favor, seleccione una categoría.", "error");
                    return false;
                }

                if (!stock || stock <= 0) {
                    Swal.fire("Error", "El stock debe ser un valor positivo.", "error");
                    return false;
                }

                if (!imagen) {
                    Swal.fire("Error", "Debe subir una imagen del producto.", "error");
                    return false;
                }

                return true;
            }

            // Mensaje de SweetAlert2 para limpiar el formulario de agregado de productos
            function limpiarFormulario() {
                Swal.fire({
                    title: 'Formulario limpio',
                    text: 'Los campos del formulario han sido borrados.',
                    icon: 'info',
                    confirmButtonText: 'OK',
                    confirmButtonColor: '#1F7BDD'
                }).then(() => {
                    $('#productForm')[0].reset();
                });
            }
        </script>


    </body>

</html>
