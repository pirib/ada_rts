with Microbit.Time;    use type MicroBit.Time.Time_Ms;


package accelerometer is

    type acc_data is range -2 ** 9 .. 2 ** 9 - 1;
    
    -- Max and Min value for determining tilt of the car
    tilt_max_y: constant acc_data := -200; 
    tilt_min_y: constant acc_data := -300; 
    
    procedure Initialize;
    function Initialized return Boolean;

    procedure show_on_display;

    function get_x return acc_data;
    function get_y return acc_data;
    function get_z return acc_data;

    function check_acc (Deadline : MicroBit.Time.Time_Ms) return Integer;

end accelerometer;
