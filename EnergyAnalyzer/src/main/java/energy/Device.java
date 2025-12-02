package energy;

public class Device {
    private int id;
    private String name;
    private int watt;
    private double hoursPerDay;
    private int daysPerMonth;

    public Device(int id, String name, int watt, double hoursPerDay, int daysPerMonth) {
        this.id = id;
        this.name = name;
        this.watt = watt;
        this.hoursPerDay = hoursPerDay;
        this.daysPerMonth = daysPerMonth;
    }

    public int getId() { return id; }
    public String getName() { return name; }
    public int getWatt() { return watt; }
    public double getHoursPerDay() { return hoursPerDay; }
    public int getDaysPerMonth() { return daysPerMonth; }
}
