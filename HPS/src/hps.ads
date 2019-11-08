with chore; use chore;


package HPS is

    type queue_length is range 1..3;
   
    type chore_queue is array (queue_length) of chore.chore;
   
   
    type schedule is tagged record
     
	execution_queue : chore_queue;
	
	counter_sensor : Integer := 0;
	counter_accelerometer : Integer  := 0;
	counter_navigation : Integer  := 0;
     
    end record;

    procedure run (Self : in out schedule);
    

end HPS;
