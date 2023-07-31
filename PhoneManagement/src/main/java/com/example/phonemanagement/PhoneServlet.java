package com.example.phonemanagement;

import java.io.*;
import java.sql.SQLException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet("/")
public class PhoneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private PhoneDao phoneDao;
    public void init() {
        phoneDao = new PhoneDao();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getServletPath();
        try {
            switch (action){
                case "/new":
                    showNewForm(request, response);
                    break;
                case "/insert":
                    insertForm(request,response);
                    break;
                default:
                    listPhone(request, response);
                    break;
            }

        } catch (SQLException ex){
            throw new ServletException(ex);
        }
    }

    private void listPhone(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException, ServletException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        List<Phone> listPhone = phoneDao.getAll();
        request.setAttribute("listPhone", listPhone);
        RequestDispatcher dispatcher = request.getRequestDispatcher("list.jsp");
        dispatcher.forward(request, response);
    }

    private void showNewForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        RequestDispatcher dispatcher = request.getRequestDispatcher("form.jsp");
        dispatcher.forward(request, response);
    }

    private void insertForm(HttpServletRequest request, HttpServletResponse response)
            throws SQLException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String name = request.getParameter("name");
        String brand = request.getParameter("brand");
        int price = Integer.parseInt(request.getParameter("price"));
        String desc = request.getParameter("description");
        Phone newPhone = new Phone(name,brand,price,desc);
        phoneDao.insert(newPhone);
        response.sendRedirect("list");
    }
}