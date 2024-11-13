<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">

    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>TechClothes - Tu Tienda de Ropa Tecnológica</title>

        <!-- Tailwind CSS CDN -->
        <script src="https://cdn.tailwindcss.com"></script>
        <!-- Material Icons -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script>
            tailwind.config = {
                theme: {
                    extend: {
                        colors: {
                            background: '#FCFBFA',
                            primary: '#1F7BDD',
                            secondary: '#98C8ED',
                            accent: '#8595BF',
                            hoverAccent: '#7396D0',
                        }
                    }
                }
            };
        </script>

        <!-- Glide.js CSS -->
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@glidejs/glide/dist/css/glide.core.min.css">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@glidejs/glide/dist/css/glide.theme.min.css">
    </head>

    <body class="bg-background text-gray-900 font-sans">

        <!-- Header Mejorado -->
        <nav class="bg-primary p-4 shadow-lg">
            <div class="container mx-auto flex justify-between items-center">
                <!-- Logo -->
                <a href="index.jsp" class="text-3xl font-bold text-white">TechClothes</a>

                <!-- Menú de Navegación -->
                <div class="flex items-center space-x-6">
                    <!-- Enlaces de Navegación -->
                    <a href="index.jsp" class="text-white text-lg hover:text-accent transition">Inicio</a>
                    <a href="ProductoController?action=listar&view=catalogo" class="text-white text-lg hover:text-accent transition">Catálogo</a>

                    <!-- Ícono de cuenta (Iniciar Sesión) -->
                    <a href="login.jsp" class="flex items-center text-white text-lg hover:text-accent transition space-x-1">
                        <span class="material-icons text-3xl">account_circle</span>
                        <span>Iniciar Sesión</span>
                    </a>

                    <!-- Ícono del Carrito de Compras con Contador de Artículos -->
                    <a href="carrito.html" class="text-white hover:text-accent transition relative">
                        <span class="material-icons text-3xl">shopping_cart</span>
                        
                    </a>
                </div>
            </div>
        </nav>

        <!-- Hero Section -->
        <section class="relative bg-primary text-white py-20">
            <div class="container mx-auto text-center">
                <h1 class="text-5xl font-extrabold mb-6">Bienvenido a TechClothes</h1>
                <p class="text-xl mb-8">Descubre la ropa perfecta para los amantes de la tecnología y la programación.</p>

                <a href="#"
                   class="inline-flex bg-accent hover:bg-hoverAccent text-white font-medium py-2 px-4 rounded-full shadow-lg transition-transform transform hover:scale-105 hover:shadow-2xl duration-300 items-center justify-center overflow-hidden">
                    <span
                        class="absolute inset-0 border-2 border-transparent rounded-full transition-all duration-300 hover:border-white"></span>
                    <svg xmlns="http://www.w3.org/2000/svg" class="h-5 w-5 mr-1" fill="none" viewBox="0 0 24 24"
                         stroke="currentColor">
                    <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 4v16m8-8H4" />
                    </svg>
                    <span>Explora el Catálogo</span>
                </a>

            </div>
        </section>


        <!-- Carrusel -->
        <section class="py-12">
            <div class="container mx-auto">
                <div class="glide" id="main-carousel">
                    <div class="glide__track" data-glide-el="track">
                        <ul class="glide__slides">
                            <li class="glide__slide">
                                <img src="https://dummyimage.com/1200x400/a6a6bf/ffffff" alt="Promoción 1"
                                     class="w-full h-80 object-cover rounded-lg shadow-md">
                            </li>
                            <li class="glide__slide">
                                <img src="https://dummyimage.com/1200x400/a6a6bf/ffffff" alt="Promoción 2"
                                     class="w-full h-80 object-cover rounded-lg shadow-md">
                            </li>
                            <li class="glide__slide">
                                <img src="https://dummyimage.com/1200x400/a6a6bf/ffffff" alt="Promoción 3"
                                     class="w-full h-80 object-cover rounded-lg shadow-md">
                            </li>
                        </ul>
                    </div>
                    <div class="glide__arrows" data-glide-el="controls">
                        <button class="glide__arrow glide__arrow--left" data-glide-dir="<">❮</button>
                        <button class="glide__arrow glide__arrow--right" data-glide-dir=">">❯</button>
                    </div>
                </div>
            </div>
        </section>

        <!-- Productos Destacados -->
        <section class="py-16">
            <div class="container mx-auto">
                <h2 class="text-4xl font-bold text-primary mb-12 text-center">Productos Destacados</h2>
                <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">

                    <!-- Producto 1 -->
                    <div
                        class="bg-white border rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="https://dummyimage.com/300x300/a6a6bf/ffffff" alt="Producto 1" class="w-full h-64 object-cover">
                        <div class="p-6">
                            <h3 class="text-2xl font-semibold text-primary mb-2">Camiseta de JavaScript</h3>
                            <p class="text-gray-700">S/. 20.00</p>
                            <button
                                class="mt-4 w-full bg-primary hover:bg-hoverAccent text-white py-2 rounded-md font-medium shadow-md transform transition-transform hover:scale-105 hover:shadow-lg duration-300">Añadir
                                al carrito</button>
                        </div>
                    </div>

                    <!-- Producto 2 -->
                    <div
                        class="bg-white border rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="https://dummyimage.com/300x300/a6a6bf/ffffff" alt="Producto 2" class="w-full h-64 object-cover">
                        <div class="p-6">
                            <h3 class="text-2xl font-semibold text-primary mb-2">Camiseta de Python</h3>
                            <p class="text-gray-700">S/. 22.00</p>
                            <button
                                class="mt-4 w-full bg-primary hover:bg-hoverAccent text-white py-2 rounded-md font-medium shadow-md transform transition-transform hover:scale-105 hover:shadow-lg duration-300">Añadir
                                al carrito</button>
                        </div>
                    </div>

                    <!-- Producto 3 -->
                    <div
                        class="bg-white border rounded-lg overflow-hidden shadow-lg hover:shadow-xl transition-shadow duration-300">
                        <img src="https://dummyimage.com/300x300/a6a6bf/ffffff" alt="Producto 3" class="w-full h-64 object-cover">
                        <div class="p-6">
                            <h3 class="text-2xl font-semibold text-primary mb-2">Camiseta de HTML & CSS</h3>
                            <p class="text-gray-700">S/. 18.00</p>
                            <button
                                class="mt-4 w-full bg-primary hover:bg-hoverAccent text-white py-2 rounded-md font-medium shadow-md transform transition-transform hover:scale-105 hover:shadow-lg duration-300">Añadir
                                al carrito</button>
                        </div>
                    </div>

                </div>
            </div>
        </section>

        <!-- Footer -->
        <footer class="bg-accent text-white py-8">
            <div class="container mx-auto text-center">
                <p class="text-lg">&copy; 2024 TechWorld. Todos los derechos reservados.</p>
            </div>
        </footer>

        <!-- Glide.js JavaScript -->
        <script src="https://cdn.jsdelivr.net/npm/@glidejs/glide/dist/glide.min.js"></script>
        <script>
            new Glide('#main-carousel', {
                type: 'carousel',
                autoplay: 2000,
                hoverpause: true,
                perView: 1,
            }).mount();
        </script>

    </body>

</html>

