with MicroBit.IOs; use MicroBit.IOs;
with MicroBit.Servos;
with MicroBit.Console;



package body Sensor is

    --  PINS

    sensor_TRIG_pin: constant Pin_Id := 4;  -- sending the sensor
    sensor_ECHO_pin: constant Pin_Id := 3;  -- receiving from the sensor

    -- VARS
    duration_echo_us: travel_time_us; -- Duration of the pulse from ECHO pin measured in MicroSeconds


    function read return travel_time_us is
    begin
    
	duration_echo_us := 0;

	MicroBit.IOs.Set(sensor_TRIG_pin, False);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);

	MicroBit.IOs.Set(sensor_TRIG_pin, True);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);
	MicroBit.IOs.Set(sensor_TRIG_pin, False);

	while true loop

	    if MicroBit.IOs.Set(sensor_ECHO_pin) then

		MicroBit.Time.HAL_Delay.Delay_Microseconds(1);
		if MicroBit.IOs.Set(sensor_ECHO_pin) then
		    duration_echo_us := duration_echo_us + 1;
		end if;

	    end if;

	end loop;
	return duration_echo_us;
	
    end read;

    function read (Deadline : MicroBit.Time.Time_Ms) return Integer is
	start_time : constant MicroBit.Time.Time_Ms := MicroBit.Time.Clock;
    begin

	duration_echo_us := 0;

	MicroBit.IOs.Set(sensor_TRIG_pin, False);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);

	MicroBit.IOs.Set(sensor_TRIG_pin, True);
	MicroBit.Time.HAL_Delay.Delay_Microseconds(10);
	MicroBit.IOs.Set(sensor_TRIG_pin, False);

	while MicroBit.Time.Clock - start_time < Deadline loop

	    if MicroBit.IOs.Set(sensor_ECHO_pin) then

		MicroBit.Time.HAL_Delay.Delay_Microseconds(1);
		
		if MicroBit.IOs.Set(sensor_ECHO_pin) then
		    duration_echo_us := duration_echo_us + 1;
		end if;

	    end if;

	end loop;
	MicroBit.Console.Put_Line("Sensor reading: ");
	MicroBit.Console.Put_Line(travel_time_us'Image(duration_echo_us));
	return Integer(duration_echo_us);
	
    end read;


    function sensor_straight (Deadline :  MicroBit.Time.Time_Ms) return Integer is
    begin
	Microbit.Servos.Go(1,90); -- center angle = 45
	MicroBit.Time.Delay_Ms(500);
  
	return read(Deadline);
    end sensor_straight;
   
   
    function sensor_left (Deadline :  MicroBit.Time.Time_Ms) return Integer is
    begin
	Microbit.Servos.Go(1,180); -- left angle = 90
	MicroBit.Time.Delay_Ms(500);
      
	return read(Deadline);
    end sensor_left;


    function sensor_right (Deadline :  MicroBit.Time.Time_Ms) return Integer is
    begin
	Microbit.Servos.Go(1,0); -- right angle = 0
	MicroBit.Time.Delay_Ms(500);
	
	return read(Deadline);
    end sensor_right;
    
   
end Sensor;
