-- TODO write description comments inside the packages under the declarations
-- TODO Make better named types for the record chore
-- TODO Make a procedure printing out all information about a chore / Suraphel
-- TODO Turn the range of the chore_queue into a variable / Suraphel
-- TODO explore linked lists as replacement for the array used to host the HPS queue
-- TODO Explore an emergency exit construct for HPS https://stackoverflow.com/questions/23176305/ada-83only-how-to-end-an-entire-program-which-has-multiple-procedures/23178220#23178220
-- TODO Explore a possibility of using enums to replace id&task_name in chores

with Ada.Text_IO;
with Ada.Integer_Text_IO;

-- Scheduling
with Chore;
with HPS;  -- Highest Poop Sack

-- Functional packages
with external_package;


procedure Main is

    -- Initializing tasks

    sensor : chore.chore := (task_name => "sensor  " ,
			     id => 1,
			     start_time => <>,
			     period => 300,
			     priority => 2,
			     execution_time => 100,
			     errand => external_package.print_sensor'Access
			    );

    acc : chore.chore := (task_name => "acceller" ,
			  id => 2,
			  start_time => <>,
			  period => 300,
			  priority => 3,
			  execution_time => 100,
			  errand => external_package.print_accelerometer'Access
			 );

    nav : chore.chore := (task_name => "navigati" ,
			  id => 3,
			  start_time => <>,
			  period => 300,
			  priority => 1,
			  execution_time => 100,
			  errand => external_package.print_nav'Access
			 );



    -- This is the queue of HPS
    ss : HPS.schedule := (execution_queue => (sensor, nav, acc),
			  counter_sensor => <>,
			  counter_accelerometer => <>,
			  counter_navigation => <>
			 );


begin

    -- Looping just once. When running on native ADA, for
    FOR I in 1 .. 7 LOOP
	Ada.Integer_Text_IO.Put(I);
	Ada.Text_IO.Put(" ");
	ss.run;
    END LOOP;

end Main;




