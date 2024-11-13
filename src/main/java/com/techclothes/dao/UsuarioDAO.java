package com.techclothes.dao;

import com.techclothes.model.Usuario;
import com.techclothes.util.Conexion;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UsuarioDAO {

    private Connection connection;

    public UsuarioDAO() {
        this.connection = Conexion.getInstance().getConexion();
    }

    // Método para autenticar un usuario
    public Usuario autenticarUsuario(String email, String contraseña) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE email = ? AND contraseña = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            statement.setString(2, contraseña);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("email"));
                usuario.setContraseña(rs.getString("contraseña"));
                usuario.setDireccionEnvio(rs.getString("direccion_envio"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setRolId(rs.getInt("rol_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    // Método para crear un nuevo usuario
    public boolean agregarUsuario(Usuario usuario) {
        String sql = "INSERT INTO usuarios (nombre, email, contraseña, direccion_envio, telefono, rol_id) VALUES (?, ?, ?, ?, ?, ?)";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getEmail());
            statement.setString(3, usuario.getContraseña());
            statement.setString(4, usuario.getDireccionEnvio());
            statement.setString(5, usuario.getTelefono());
            statement.setInt(6, usuario.getRolId());

            int filasInsertadas = statement.executeUpdate();
            return filasInsertadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para obtener un usuario por su ID
    public Usuario obtenerUsuarioPorId(int id) {
        Usuario usuario = null;
        String sql = "SELECT * FROM usuarios WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            ResultSet rs = statement.executeQuery();

            if (rs.next()) {
                usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("email"));
                usuario.setContraseña(rs.getString("contraseña"));
                usuario.setDireccionEnvio(rs.getString("direccion_envio"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setRolId(rs.getInt("rol_id"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuario;
    }

    // Método para obtener todos los usuarios
    public List<Usuario> listarUsuarios() {
        List<Usuario> usuarios = new ArrayList<>();
        String sql = "SELECT * FROM usuarios";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            ResultSet rs = statement.executeQuery();

            while (rs.next()) {
                Usuario usuario = new Usuario();
                usuario.setId(rs.getInt("id"));
                usuario.setNombre(rs.getString("nombre"));
                usuario.setEmail(rs.getString("email"));
                usuario.setContraseña(rs.getString("contraseña"));
                usuario.setDireccionEnvio(rs.getString("direccion_envio"));
                usuario.setTelefono(rs.getString("telefono"));
                usuario.setRolId(rs.getInt("rol_id"));
                usuarios.add(usuario);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return usuarios;
    }

    // Método para actualizar un usuario
    public boolean actualizarUsuario(Usuario usuario) {
        String sql = "UPDATE usuarios SET nombre = ?, email = ?, contraseña = ?, direccion_envio = ?, telefono = ?, rol_id = ? WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, usuario.getNombre());
            statement.setString(2, usuario.getEmail());
            statement.setString(3, usuario.getContraseña());
            statement.setString(4, usuario.getDireccionEnvio());
            statement.setString(5, usuario.getTelefono());
            statement.setInt(6, usuario.getRolId());
            statement.setInt(7, usuario.getId());

            int filasActualizadas = statement.executeUpdate();
            return filasActualizadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Método para eliminar un usuario
    public boolean eliminarUsuario(int id) {
        String sql = "DELETE FROM usuarios WHERE id = ?";

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            int filasEliminadas = statement.executeUpdate();
            return filasEliminadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
