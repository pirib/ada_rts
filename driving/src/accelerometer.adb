with MicroBit.Display;         
with MicroBit.Accelerometer;   use MicroBit.Accelerometer;
with MMA8653;                  use MMA8653;


package body accelerometer is

    -- Renaming some of Microbit accelerometer procedures for more modularity
    procedure Initialize renames MicroBit.Accelerometer.Initialize;
    function Initialized return Boolean renames MicroBit.Accelerometer.Initialized;
    
    -- Used by display. Declared up here so doesnt have to redefine them on each procedure call.
    dx : Integer := 2;   
    dy : Integer := 2;

    -- Displays the accelerometer readings on led display 
    procedure show_on_display is
    begin
    
	MicroBit.Display.Clear;
	
	if Data.X <= -190 then
	    dx := 4;
	elsif Data.X > -190 and Data.X < -65 then
	    dx := 3;
	elsif Data.X > -65 and Data.X < 65 then	
	    dx := 2;
	elsif Data.X > 65 and Data.X < 190 then
	    dx := 1;
	elsif Data.X > 190 then
	    dx := 0;
	end if;
	
	if Data.Y <= -190 then
	    dy:= 4;	    
	elsif Data.Y > -190 and Data.Y < -65 then
	    dy:= 3;
	elsif Data.Y > -65 and Data.Y < 65 then	
	    dy:= 2;
	elsif Data.Y > 65 and Data.Y < 190 then
	    dy:= 1;
	elsif Data.Y > 190 then
	    dy:= 0;
	end if;

	MicroBit.Display.Set(dx,dy);

    end show_on_display;

    
    -- Get x y z readings from the accelerometer
    function get_x return acc_data is
    begin
	return acc_data(Data.x);
    end get_x;
    
   
    function get_y return acc_data is
    begin
	return acc_data(Data.y);
    end get_y;


    function get_z return acc_data is
    begin
	return acc_data(Data.z);		
    end get_z;

    -- The function used by AC chore
    function check_acc (Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
    begin
	while MicroBit.Time.Clock - start_time < Deadline loop
	    return Integer(get_y);
	end loop;
	return -350; -- Bad value to indicate that we need to jump to NH
    
    end check_acc;


end accelerometer;






