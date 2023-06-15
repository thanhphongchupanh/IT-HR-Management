/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
public class DispatchServlet extends HttpServlet {

    private static final String STAFF_LIST = "StaffListController";
    private static final String CHANGE_PASSWORD_CONTROLLER = "ChangePasswordController";
    private static final String STAFF_DETAIL_CONTROLLER = "StaffDetailController";
    private static final String LOGIN_CONTROLLER = "LoginServlet";
    private static final String LOGOUT_CONTROLLER = "LogoutServlet";
    private static final String FORGOT_CONTROLLER = "forgotPassowrdServlet";
    private static final String NewPass_CONTROLLER = "newPasswordServlet";
    private static final String FIND_STAFF_DETAIL_CONTROLLER = "FindStaffDetailServlet";
    private static final String UPDATE_STAFF_DETAIL_CONTROLLER = "UpdateStaffDetailServlet";
    private static final String DELETE_STAFF_DETAIL_CONTROLLER = "DeleteStaffDetailServlet";
    private static final String CREATE_DAY_LEAVE_CONTROLLER = "CreateDayLeaveServlet";
    private static final String ACCOUNT_LIST = "AccountListServlet";
    private static final String ACCOUNT_DETAIL = "AccountDetailServlet";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String button = request.getParameter("btnAction");
        String url = STAFF_LIST;
        try {
            switch (button) {
                case "Display":
                    break;
                case "Login":
                    url = LOGIN_CONTROLLER;
                    break;
                case "Logout":
                    url = LOGOUT_CONTROLLER;
                    break;
                case "Update":
                    url = CHANGE_PASSWORD_CONTROLLER;
                    break;
                case "staffDetail":
                    url = STAFF_DETAIL_CONTROLLER;
                    break;
//                case "AccountList":
//                    url = ACCOUNT_LIST_PAGE;
//                    break;
                case "forgot":
                    url = FORGOT_CONTROLLER;
                    break;
                case "newPassword":
                    url = NewPass_CONTROLLER;
                    break;
                case "Edit_StaffDetail":
                    url = FIND_STAFF_DETAIL_CONTROLLER;
                    break;
                case "Delete_StaffDetail":
                    url = DELETE_STAFF_DETAIL_CONTROLLER;
                    break;
                case "Save":
                    url = UPDATE_STAFF_DETAIL_CONTROLLER;
                    break;
                case "Create":
                    url = CREATE_DAY_LEAVE_CONTROLLER;
                    break;
                case "ShowAccountList":
                    url = ACCOUNT_LIST;
                    break;
                case "AccDetail":
                    url = ACCOUNT_DETAIL;
                    break;
            }
        } catch (Exception e) {
        } finally {
            RequestDispatcher rd = request.getRequestDispatcher(url);
            rd.forward(request, response);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}