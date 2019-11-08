-- TODO servo has no deadline in SL, SR, SS
-- TODO sensor deadline measurement issue

-- PACKAGES

-- Microbit


-- EXTERNAL PACKAGES
with Nav;
with Sensor;
with Accelerometer;

-- SCHEDULING
with Chore;
with QJS;

procedure Main is

    -- Initializing tasks

    AC : constant chore.chore := (task_name => "acceller" ,
				  id => 1,
				  deadline => <>,
				  errand => accelerometer.check_acc'Access
				 );

    SS : constant chore.chore := (task_name => "sensorst" ,
				  id => 2,
				  deadline => <>,
				  errand => sensor.sensor_straight'Access
				 );

    DF : constant chore.chore := (task_name => "forward " ,
				  id => 3,
				  deadline => <>,
				  errand => nav.drive_forward'Access
				 );

    DS : constant chore.chore := (task_name => "stopstop" ,
				  id => 4,
				  deadline => <>,
				  errand => nav.stop'Access
				 );

    TL : constant chore.chore := (task_name => "turnleft" ,
				  id => 5,
				  deadline => 500,
				  errand => nav.turn_left'Access
				 );

    TR : constant chore.chore := (task_name => "turnrigh" ,
				  id => 6,
				  deadline => <>,
				  errand => nav.turn_right'Access
				 );

    TA : constant chore.chore := (task_name => "turnarou" ,
				  id => 7,
				  deadline => 1000,
				  errand => nav.turn_around'Access
				 );

    SL : constant chore.chore := (task_name => "sensleft" ,
				  id => 8,
				  deadline => <>,
				  errand => sensor.sensor_left'Access
				 );

    SR : constant chore.chore := (task_name => "sensrigh" ,
				  id => 9,
				  deadline => <>,
				  errand => sensor.sensor_right'Access
				 );


    Schedule : QJS.schedule := (major_queue => (AC, SS, DF, DS, AC, DS, SL, SR, TA, TL, TR) );

begin

    Accelerometer.Initialize;


    LOOP
	Schedule.run;
    END LOOP;

end Main;


