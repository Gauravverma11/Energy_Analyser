<%@ page import="java.util.*, energy.Device" %>
<html>
<head>
    <!-- Google font + CSS + Chart.js + Responsive -->
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;600;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="assets/css/style.css">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Energy Dashboard</title>
</head>

<body>

<%
    List<Device> devices = (List<Device>) request.getAttribute("devices");
    List<Double> units = (List<Double>) request.getAttribute("units");
    double totalUnits = (double) request.getAttribute("totalUnits");
    double totalCost = (double) request.getAttribute("totalCost");
%>

<div class="app">

    <div class="header">
        <div>
            <h1>Consumption Dashboard</h1>
            <div class="sub">Track device-wise energy usage and total cost</div>
        </div>
        <div class="actions">
            <a href="index.jsp" class="btn ghost">Add Device</a>
        </div>
    </div>

    <div class="grid">

        <!-- LEFT SIDE -->
        <div>

            <div class="card">
                <div style="display:flex;justify-content:space-between;">
                    <div>
                        <div class="kicker">Total Units</div>
                        <h2><%= totalUnits %> kWh</h2>
                        <div class="text-muted">Estimated Cost: ₹<%= totalCost %></div>
                    </div>
                    <div>
                        <span class="tag">₹7 / unit</span>
                    </div>
                </div>
            </div>

            <div class="card" style="margin-top:16px;">
                <h3>Registered Devices</h3>

                <table class="table">
                    <thead>
                    <tr>
                        <th>Name</th>
                        <th>Watt</th>
                        <th>Hours/Day</th>
                        <th>Days</th>
                        <th>Units</th>
                        <th>Action</th>
                    </tr>
                    </thead>
                    <tbody>

                    <% for (int i = 0; i < devices.size(); i++) {
                        Device d = devices.get(i); %>

                        <tr>
                            <td><%= d.getName() %></td>
                            <td><%= d.getWatt() %></td>
                            <td><%= d.getHoursPerDay() %></td>
                            <td><%= d.getDaysPerMonth() %></td>
                            <td><%= units.get(i) %></td>
                            <td>
                                <a class="btn ghost" href="deleteDevice?id=<%= d.getId() %>">Delete</a>
                            </td>
                        </tr>

                    <% } %>

                    </tbody>
                </table>
            </div>

        </div>

        <!-- RIGHT SIDE: Pie Chart -->
        <div>
            <div class="card chart-wrap">
                <canvas id="pieChart" width="380" height="380"></canvas>
            </div>
        </div>

    </div>
</div>

<script>
// JS Arrays from JSP
var labels = [
<% for (int i=0; i<devices.size(); i++) { %>
    "<%= devices.get(i).getName() %>" <%= (i < devices.size() - 1) ? "," : "" %>
<% } %>
];

var dataValues = [
<% for (int i=0; i<units.size(); i++) { %>
    <%= units.get(i) %> <%= (i < units.size() - 1) ? "," : "" %>
<% } %>
];

var ctx = document.getElementById("pieChart").getContext("2d");

var pieChart = new Chart(ctx, {
    type: "pie",
    data: {
        labels: labels,
        datasets: [{
            data: dataValues,
            backgroundColor: [
                "#2563eb", "#06b6d4", "#ef4444", "#16a34a",
                "#f59e0b", "#8b5cf6", "#ec4899", "#14b8a6"
            ]
        }]
    },
    options: {
        plugins: {
            legend: { position: "bottom" }
        }
    }
});
</script>

</body>
</html>
