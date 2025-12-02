<body>
  <div class="app">
    <div class="header">
      <div>
        <h1>Household Energy Analyzer</h1>
        <div class="sub">Add devices and track monthly consumption</div>
      </div>
      <div class="actions">
        <a class="btn ghost" href="dashboard">View Dashboard</a>
      </div>
    </div>

    <div class="card">
      <form action="addDevice" method="post" class="form">
        <div>
          <div class="label">Device Name</div>
          <input class="input" type="text" name="name" required>
        </div>

        <div class="row">
          <div class="col">
            <div class="label">Watt (e.g. 1500)</div>
            <input class="input" type="number" name="watt" required>
          </div>
          <div class="col">
            <div class="label">Hours per day</div>
            <input class="input" step="0.1" type="number" name="hours" required>
          </div>
        </div>

        <div class="row">
          <div class="col">
            <div class="label">Days/month</div>
            <input class="input" type="number" name="days" value="30" required>
          </div>
          <div class="col" style="display:flex;align-items:flex-end;justify-content:flex-end;">
            <button class="btn" type="submit">Add Device</button>
          </div>
        </div>
      </form>
    </div>
  </div>
</body>
