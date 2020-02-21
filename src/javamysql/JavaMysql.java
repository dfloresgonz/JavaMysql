package javamysql;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class JavaMysql {

    public static void main(String[] args) {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost/tienda?user=root&password=mysqladmin";
            Connection connect = DriverManager.getConnection(url);
            Statement statement = connect.createStatement();
            String query = "SELECT * FROM producto";
            ResultSet resultSet = statement.executeQuery(query);
            String format = "|%1$-3d|%2$-17s|%3$-5d\n";
            while(resultSet.next()) {
                int idProd = resultSet.getInt("id_producto");
                String descProd = resultSet.getString("desc_producto");
                int precio = resultSet.getInt("precio");
                System.out.format(format, idProd, descProd, precio);
            }
            Scanner scan = new Scanner(System.in);
            System.out.println("¿Qué deseas hacer: INSERTAR / BORRAR / CONSULTAR / ACTUALIZAR ?");
            String accion = scan.nextLine();
            if(accion.equals("INSERTAR")) {
                scan = new Scanner(System.in);
                System.out.println("Ingresa el id_producto");
                String idProd = scan.nextLine();
                
                scan = new Scanner(System.in);
                System.out.println("Ingresa el desc_producto");
                String descProd = scan.nextLine();
                
                scan = new Scanner(System.in);
                System.out.println("Ingresa el precio");
                int precio = scan.nextInt();
                query = "{call insertar_producto(?, ?)}";
                CallableStatement stmt = connect.prepareCall(query);
                stmt.setString(1, descProd);
                stmt.setInt(2, precio);
                stmt.execute();
//                query = "INSERT INTO producto VALUES (?, ?, ?)";
//                PreparedStatement ps = connect.prepareStatement(query);
//                ps.setInt(1, Integer.parseInt(idProd));
//                ps.setString(2, descProd);
//                ps.setInt(3, Integer.parseInt(precio));
//                ps.executeUpdate();
            } else if (accion.equals("BORRAR")) {
                scan = new Scanner(System.in);
                System.out.println("Ingresa el id_producto");
                String idProd = scan.nextLine();
                
                query = "DELETE FROM producto WHERE id_producto = ?";
                PreparedStatement ps = connect.prepareStatement(query);
                ps.setInt(1, Integer.parseInt(idProd));
                ps.executeUpdate();
            } else if (accion.equals("ACTUALIZAR")) {
                scan = new Scanner(System.in);
                System.out.println("Ingresa el id_producto");
                String idProd = scan.nextLine();
                
                scan = new Scanner(System.in);
                System.out.println("Ingresa el desc_producto");
                String descProd = scan.nextLine();
                
                scan = new Scanner(System.in);
                System.out.println("Ingresa el precio");
                String precio = scan.nextLine();
                
                query = "UPDATE producto SET desc_producto = ?, precio = ? WHERE id_producto = ?";
                PreparedStatement ps = connect.prepareStatement(query);
                ps.setString(1, descProd);
                ps.setInt(2, Integer.parseInt(precio));
                ps.setInt(3, Integer.parseInt(idProd));
                ps.executeUpdate();
            }
            resultSet.close();
            statement.close();
            connect.close();
        } catch (Exception e) {
            System.err.println(e);
        }
    }
}