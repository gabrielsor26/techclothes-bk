package com.techclothes.controller;

import com.techclothes.dao.ProductoDAO;
import com.techclothes.dao.CategoriaDAO;
import com.techclothes.model.Producto;
import com.techclothes.model.Categoria;

import java.io.IOException;
import java.sql.SQLException;
import java.nio.file.Paths;
import java.io.File;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

@WebServlet(name = "ProductoController", urlPatterns = {"/ProductoController"})
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50)      // 50MB
public class ProductoController extends HttpServlet {

    private ProductoDAO productoDAO;
    private CategoriaDAO categoriaDAO;

    @Override
    public void init() {
        productoDAO = new ProductoDAO();
        categoriaDAO = new CategoriaDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        handleRequest(request, response);
    }

    private void handleRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        try {
            switch (action == null ? "" : action) {
                case "agregar":
                    agregarProducto(request, response);
                    break;
                case "editar":
                    editarProducto(request, response);
                    break;
                case "eliminar":
                    eliminarProducto(request, response);
                    break;
                case "listar":
                default:
                    listarProductos(request, response);
                    break;
            }
        } catch (SQLException e) {
            throw new ServletException("Error al procesar la solicitud", e);
        }
    }

    private void listarProductos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        request.setAttribute("productos", productoDAO.listarProductos());
        request.setAttribute("categorias", categoriaDAO.listarCategorias());
        request.getRequestDispatcher("views/mantenimiento.jsp").forward(request, response);
    }

    private void agregarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int categoriaId = Integer.parseInt(request.getParameter("categoria"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        Categoria categoria = categoriaDAO.obtenerCategoria(categoriaId);
        String rutaImagen = guardarImagen(request);

        Producto producto = new Producto();
        producto.setNombre(nombre);
        producto.setDescripcion(descripcion);
        producto.setPrecio(precio);
        producto.setCategoria(categoria);  // Asignar la categoría al producto
        producto.setStock(stock);
        producto.setImagenUrl(rutaImagen);

        productoDAO.agregarProducto(producto);
        response.sendRedirect("ProductoController?action=listar&success=true");
    }

    private void editarProducto(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        int id = Integer.parseInt(request.getParameter("id"));
        String nombre = request.getParameter("nombre");
        String descripcion = request.getParameter("descripcion");
        double precio = Double.parseDouble(request.getParameter("precio"));
        int categoriaId = Integer.parseInt(request.getParameter("categoria"));
        int stock = Integer.parseInt(request.getParameter("stock"));

        Producto producto = productoDAO.obtenerProducto(id);
        if (producto != null) {
            Categoria categoria = categoriaDAO.obtenerCategoria(categoriaId);
            producto.setNombre(nombre);
            producto.setDescripcion(descripcion);
            producto.setPrecio(precio);
            producto.setCategoria(categoria);  // Asignar la categoría actualizada
            producto.setStock(stock);

            String rutaImagen = guardarImagen(request);
            if (rutaImagen != null) {
                producto.setImagenUrl(rutaImagen);
            }

            productoDAO.actualizarProducto(producto);
        }

        response.sendRedirect("ProductoController?action=listar&edited=true");
    }

    private void eliminarProducto(HttpServletRequest request, HttpServletResponse response) throws IOException, SQLException {
        // Obtener el parámetro "id"
        String idStr = request.getParameter("id");
        if (idStr == null || idStr.isEmpty()) {
            throw new IllegalArgumentException("El parámetro 'id' es requerido.");
        }

        int id = Integer.parseInt(idStr);  // convertir a entero solo si es válido
        productoDAO.eliminarProducto(id);
        response.sendRedirect("ProductoController?action=listar&deleted=true");
    }

    private String guardarImagen(HttpServletRequest request) throws IOException, ServletException {
        Part filePart = request.getPart("imagen_url");
        if (filePart == null || filePart.getSize() == 0) {
            System.out.println("No se seleccionó ninguna imagen.");
            return null;
        }

        // Obtener el nombre del archivo
        String nombreArchivo = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();

        // Ruta del directorio externo para almacenar las imágenes
        String directorioImagenes = "C:/imagenes";
        File carpetaImagenes = new File(directorioImagenes);

        // Crear la carpeta si no existe
        if (!carpetaImagenes.exists()) {
            carpetaImagenes.mkdirs();
            System.out.println("Directorio creado en: " + carpetaImagenes.getAbsolutePath());
        }

        // Ruta completa para guardar la imagen
        String rutaImagen = carpetaImagenes.getAbsolutePath() + File.separator + nombreArchivo;
        filePart.write(rutaImagen); // Guardar la imagen en el directorio externo

        System.out.println("Imagen guardada en la ruta: " + rutaImagen);

        // Retornar la ruta URL para acceder desde el frontend
        return "/imagenes/" + nombreArchivo;
    }

}
