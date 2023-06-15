/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model.DAO;

import model.DTO.UserDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import utils.DBHelper;

/**
 *
 * @author ADMIN
 */
public class UserDao {

    public UserDto getPassword(String username, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT [username], [password]"
                        + " FROM [User]"
                        + " WHERE [username] = ? AND [password] = ?";
                stm = conn.prepareStatement(sql);
                stm.setString(1, username);
                stm.setString(2, password);
                rs = stm.executeQuery();
                if (rs.next()) {
                    dto = new UserDto("", username, password, "","");
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }
     public boolean resetPassword(String password, String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2.Write SQL
                String sql = "UPDATE [User] "
                        + "SET [password] = ? "
                        + "WHERE [email] = ?";
                //3.Tạo Statement obj
                stm = conn.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, email);
                //4.Execute Statement to get result
                int effectRow = stm.executeUpdate();
                //5. Process result
                if (effectRow > 0) {
                    result = true;
                }
            }//end connection haas existed
        } catch (Exception e) {
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
            return result;
        }

    }


    public boolean updatePassword(String password, String username) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        boolean result = false;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                //2.Write SQL
                String sql = "UPDATE [User] "
                        + "SET [password] = ? "
                        + "WHERE [username] = ?";
                //3.Tạo Statement obj
                stm = conn.prepareStatement(sql);
                stm.setString(1, password);
                stm.setString(2, username);
                //4.Execute Statement to get result
                int effectRow = stm.executeUpdate();
                //5. Process result
                if (effectRow > 0) {
                    result = true;
                }
            }//end connection haas existed
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
            return result;
        }

    }
    public UserDto login(String username, String password) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT *"
                        + " FROM [User]"
                        + " WHERE [username] = ? and [password]= ?";
                stm = conn.prepareStatement(sql);
        stm.setString(1, username);
         stm.setString(2, password);
                rs = stm.executeQuery();
           if (rs.next()) {
               String roleName = rs.getString("roleName");
                    dto = new UserDto("", username, password, roleName,"");
        }
    }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }
  public UserDto getUsernamePasword(String email) throws SQLException {
        Connection conn = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        UserDto dto = null;
        try {
            conn = DBHelper.makeConnection();
            if (conn != null) {
                String sql = "SELECT [username] [password]"
                        + " FROM [User]"
                        + " WHERE [email] = ? ";
                stm = conn.prepareStatement(sql);
        stm.setString(1, email);
       
                rs = stm.executeQuery();
           if (rs.next()) {
                    dto = new UserDto("", "", "", "",email);
        }
    }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (conn != null) {
                conn.close();
            }
        }
        return dto;
    }
   

}
