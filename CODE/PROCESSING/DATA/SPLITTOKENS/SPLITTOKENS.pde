size(800,600);

String date = "2020-02-01"; // row.getString("date");
String[] date_parts = splitTokens(date, "-");
float year_time = float(date_parts[0]) + float(date_parts[1])/12.0 + float(date_parts[2])/365.0;
float year_min = 2020 + 2/12.0 + 0/30.0;
float year_max = 2021 + 3/12.0 + 20/30.0;
               // year   month    days
               // your making a "year time" value you can use on the x axis
float x = map(year_time, year_min,year_max, 10,790); // <- map to an area with a 10px border
    // map a value from this range^     to this^
println(year_time, x);

// positivity rate point
float positivity_rate = 1.5;// row.getFloat("positivity rate");
float pos_rate_y = map(positivity_rate, 0, 5.0, 0,600);
fill(255,0,0);
ellipse(x, pos_rate_y, 20,20);

// death rate point
float death_rate = 0.5;// row.getFloat("death rate");
float death_rate_y = map(death_rate, 0, 2.0, 0,600);
fill(0,0,255);
ellipse(x, death_rate_y, 20,20);
