with Microbit.Time; use type MicroBit.Time.Time_Ms;


package Sensor is

    type travel_time_us is new Integer;
    travel_time_stop : travel_time_us := 15; 

    function read return travel_time_us; 
    function read ( Deadline : MicroBit.Time.Time_Ms) return Integer;
    
    function sensor_straight (Deadline : MicroBit.Time.Time_Ms) return Integer;
    function sensor_left (Deadline : MicroBit.Time.Time_Ms) return Integer;
    function sensor_right (Deadline : MicroBit.Time.Time_Ms) return Integer;
    
end Sensor;
