package energy;



import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;

@jakarta.servlet.annotation.WebServlet("/addDevice")
public class AddDeviceServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        String name = req.getParameter("name");
        int watt = Integer.parseInt(req.getParameter("watt"));
        double hours = Double.parseDouble(req.getParameter("hours"));
        int days = Integer.parseInt(req.getParameter("days"));

        try (Connection con = DBUtil.getConnection()) {

            String sql = "INSERT INTO devices(name, watt, hours_per_day, days_per_month) VALUES (?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, name);
            ps.setInt(2, watt);
            ps.setDouble(3, hours);
            ps.setInt(4, days);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }

        res.sendRedirect("dashboard");
    }
}
