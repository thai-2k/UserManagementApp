package com.example.controller;

import com.example.entity.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserServlet {
    private String jdbcUrl =  "jdbc:mysql://localhost:3306/t1808a1";
    private String jdbcUsername =  "root";
    private String jdbcPassword =  "";

    protected Connection connection = null;
    protected PreparedStatement preparedStatement = null;

    protected static final String INSERT_USERS_SQL = "INSERT INTO users"+"(name,email,country) "+" VALUES(?,?,?)";
    protected static final String SELECT_USER_BY_ID = "SELECT id,name,email,country FROMM users where id=?";
    protected static final String SELECT_ALL_USERS = "SELECT * FROM users";
    protected static final String DELETE_USER_ID = "DELETE FROM users where id=?";
    protected static final String UPDATE_USERS_SQL = "UPDATE users SET name =?, email =?,country =?"+"WHERE id =?";


    protected Connection getConnection() throws ClassNotFoundException, SQLException {
        Class.forName("com.mysql.jdbc.Driver");
        connection = DriverManager.getConnection(jdbcUrl,jdbcUsername,jdbcPassword);
        return connection;
    }

    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        UserServlet userDao = new UserServlet();
        if (userDao.selectAllUsers() != null){
            System.out.println("success");
        }
    }
    public void insertUser(User user) throws SQLException {
        preparedStatement = connection.prepareStatement(INSERT_USERS_SQL);
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(3,user.getCountry());
        preparedStatement.executeUpdate();
    }
    public User selectUser(int id) throws SQLException, ClassNotFoundException {
        User user = null;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_USER_BY_ID);
        preparedStatement.setInt(1,id);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()){
            String name = rs.getString("name");
            String email = rs.getString("email");
            String country = rs.getString("country");
            user = new User(name,email,country);
        }
        return user;
    }
    public boolean deleteUser(int id) throws SQLException, ClassNotFoundException {
        boolean rowDeleted;
        Connection connection = getConnection();
        PreparedStatement statement = connection.prepareStatement(DELETE_USER_ID);
        statement.setInt(1,id);
        rowDeleted = statement.executeUpdate() > 0;
        return rowDeleted;
    }
    public List<User> selectAllUsers() throws SQLException, ClassNotFoundException {
        List<User> userList = new ArrayList<>();
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
        ResultSet rs = preparedStatement.executeQuery();
        while (rs.next()){
            int id = rs.getInt("id");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String country = rs.getString("country");
            userList.add(new User(id,name,email,country));
        }
        return userList;
    }

    public boolean updateUser(User user) throws SQLException, ClassNotFoundException {
        boolean rowUpdated;
        Connection connection = getConnection();
        PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USERS_SQL);
        preparedStatement.setString(1,user.getName());
        preparedStatement.setString(2,user.getEmail());
        preparedStatement.setString(1,user.getCountry());
        preparedStatement.setInt(1,user.getId());
        rowUpdated = preparedStatement.executeUpdate() >0;
        return rowUpdated;
    }

}
