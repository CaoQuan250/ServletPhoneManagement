package com.example.phonemanagement;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PhoneDao {
    private String jdbcURL = "jdbc:sqlserver://localhost:1433;databaseName=JavaServlet;encrypt=true;trustServerCertificate=true;";
    private String jdbcProductname = "sa";
    private String jdbcPassword = "123";

    private static final String INSERT = "INSERT INTO Phone" + "  VALUES " +
            " (?, ?, ?, ?);";
    private static final String SELECT_ALL = "select * from Phone";

    public PhoneDao(){}
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            connection = DriverManager.getConnection(jdbcURL, jdbcProductname, jdbcPassword);
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public void insert(Phone phone) throws SQLException {
        try (Connection connection = getConnection(); PreparedStatement preparedStatement = connection.prepareStatement(INSERT)) {
            preparedStatement.setString(1, phone.getName());
            preparedStatement.setString(2, phone.getBrand());
            preparedStatement.setInt(3, phone.getPrice());
            preparedStatement.setString(4, phone.getDescription());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }


    public List<Phone> getAll() {
        List <Phone> products = new ArrayList<>();
        try (Connection connection = getConnection()){
            PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL);
            System.out.println(preparedStatement);
            ResultSet rs = preparedStatement.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String brand = rs.getString("brand");
                int price = Integer.parseInt(rs.getString("price"));
                String desc = rs.getString("description");
                products.add(new Phone(id, name, brand, price,desc));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }
}
