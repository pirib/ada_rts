with Ada.Text_IO;


package body external_package is

    procedure print_sensor is
    begin

	Ada.Text_IO.Put_Line("SENSOR READING");
	
    end print_sensor;
   
    
    procedure print_accelerometer is
    begin

	Ada.Text_IO.Put_Line("ACCELEROMETER READING");
    
    end print_accelerometer;


    procedure print_nav is
    begin

	Ada.Text_IO.Put_Line("DRIVING");
    
    end print_nav;
    
    procedure ignore is
    begin
	null;
    end ignore;

end external_package;
