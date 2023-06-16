/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONObject;
import utils.DBHelper;

/**
 *
 * @author quanb
 */
@WebServlet(name = "RetrieveBonusServlet", urlPatterns = {"/RetrieveBonusServlet"})
public class RetrieveBonusServlet extends HttpServlet {

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
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            // Retrieve the application_id parameter from the request
            int application_id = Integer.parseInt(request.getParameter("application_id"));

            // Retrieve the late time details from the database
            int bonusDay = 0;
            int bonusMoney= 0;
            float totalMoney = 0;

            Connection conn = null;
            PreparedStatement stm = null;
            ResultSet rs = null;

            try {
                conn = DBHelper.makeConnection();
                if (conn != null) {
                    String sql = "SELECT Application.overtime_day, contract.overtime_day_bonus, (Application.overtime_day * contract.overtime_day_bonus) AS total_money "
                            + "FROM employee \n"
                            + "LEFT JOIN contract ON contract.employee_contractId = employee.employee_contractId  \n"
                            + "LEFT JOIN salary ON employee.employee_id = salary.employee_id \n"
                            + "INNER JOIN Application ON Application.application_id = salary.application_id \n"
                            + "WHERE salary.application_id = ?";
                    stm = conn.prepareStatement(sql);
                    stm.setInt(1, application_id);
                    rs = stm.executeQuery();

                    if (rs.next()) {
                        bonusDay = rs.getInt("overtime_day");
                        bonusMoney = rs.getInt("overtime_day_bonus");
                        totalMoney = rs.getFloat("total_money");
                    }
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                try {
                    if (rs != null) {
                        rs.close();
                    }
                    if (stm != null) {
                        stm.close();
                    }
                    if (conn != null) {
                        conn.close();
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }

            // Create a JSON object with the late time details
            JSONObject jsonData3 = new JSONObject();
            jsonData3.put("bonusDay", bonusDay);
            jsonData3.put("bonusMoney", bonusMoney);
            jsonData3.put("totalMoney", totalMoney);

            // Convert the JSONObject to a JSON string
            String jsonString3 = jsonData3.toString();

            // Set the content type of the response to JSON
            response.setContentType("application/json");
            PrintWriter out = response.getWriter();

            // Write the JSON string to the response
            out.print(jsonString3);
            out.flush();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(RetrieveLateTimeServlet.class.getName()).log(Level.SEVERE, null, ex);
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
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
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
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(RetrieveAbsentTimeServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
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
