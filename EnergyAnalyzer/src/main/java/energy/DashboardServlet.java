package energy;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.*;

@jakarta.servlet.annotation.WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    private static final double RATE = 7.0;

    protected void doGet(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        List<Device> list = new ArrayList<>();
        List<Double> units = new ArrayList<>();

        double totalUnits = 0, totalCost = 0;

        try (Connection con = DBUtil.getConnection()) {

            PreparedStatement ps = con.prepareStatement("SELECT * FROM devices");
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                Device d = new Device(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getInt("watt"),
                        rs.getDouble("hours_per_day"),
                        rs.getInt("days_per_month")
                );

                list.add(d);

                double u = (d.getWatt() * d.getHoursPerDay() * d.getDaysPerMonth()) / 1000.0;
                units.add(u);

                totalUnits += u;
                totalCost += u * RATE;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        req.setAttribute("devices", list);
        req.setAttribute("units", units);
        req.setAttribute("totalUnits", totalUnits);
        req.setAttribute("totalCost", totalCost);

        req.getRequestDispatcher("dashboard.jsp").forward(req, res);
    }
}
