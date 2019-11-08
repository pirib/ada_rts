with MicroBit.Console;

package body QJS is

    procedure run (Self : in out schedule) is

	-- Minor Queue's IDs
	NB_q : constant Integer := 0;  -- Normal Behaviour
	NH_q : constant Integer := 1;  -- Not Horizontal
	SC_q : constant Integer := 2;  -- Sensor Collision
	TL_q : constant Integer := 3; -- Turn right
	TR_q : constant Integer := 4; -- Turn left

	current_queue_id : Integer := NB_q;  -- NB 1-3, NH 4-5, SC 6-7

	Answer : Integer;
	current_task_id : Integer;

    begin

	LOOP

	    --  Normal Behaviour
	    if current_queue_id = NB_q then

		NB :
		FOR I in 1..3 LOOP  -- (AC, SS, DF)

		    current_task_id := self.major_queue(I).id;

		    MicroBit.Console.Put_Line(Self.major_queue(I).task_name);
		    MicroBit.Console.Put_Line(Integer'Image (current_task_id));

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );

		    MicroBit.Console.New_Line;

		    if current_task_id = 1 and answer = -1 then -- If the value from AC is bad
			current_queue_id := NH_q;

		    elsif current_task_id = 2 and answer = -1 then -- If the value from SS is bad
			current_queue_id := SC_q;

		    elsif answer = 0 then
			current_queue_id := NB_q;

		    end if;

		    exit NB when current_queue_id /= NB_q;

		END LOOP NB;


		--  Not Horizontal Queue
	    elsif current_queue_id = NH_q then -- NH

		NH :
		FOR I in 4..5 LOOP  -- (DS, AC)

		    current_task_id := self.major_queue(I).id;

		    MicroBit.Console.Put_Line(Self.major_queue(I).task_name);
		    MicroBit.Console.Put_Line(Integer'Image (current_task_id));

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );

		    MicroBit.Console.New_Line;

		    if current_task_id = 1 and answer = 1 then -- If the value from AC is good
			current_queue_id := NB_q;
		    elsif answer = 0 then
			current_queue_id := NB_q;
		    end if;

		    exit NH when current_queue_id /= NH_q;

		END LOOP NH;


		-- Sensor check Queue
	    elsif current_queue_id = SC_q then

		SC :
		FOR I in 6..9 LOOP  -- (DS, SL, SR , TA)

		    current_task_id := self.major_queue(I).id;

		    MicroBit.Console.Put_Line(Self.major_queue(I).task_name);
		    MicroBit.Console.Put_Line(Integer'Image (current_task_id));

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );

		    MicroBit.Console.New_Line;

		    if current_task_id = 8 and answer = 1 then -- If the value from SL is good
			current_queue_id := TL_q;
		    elsif current_task_id = 9 and answer = 1 then
			current_queue_id := TR_q;
		    elsif current_task_id = 7 then
			current_queue_id := NB_q;
		    elsif answer = 0 then
			current_queue_id := NB_q;
		    end if;

		    exit SC when current_queue_id /= SC_q;

		END LOOP SC;



		-- Turn left
	    elsif current_queue_id = TL_q then

		TL :
		FOR I in 10..10 LOOP

		    current_task_id := self.major_queue(I).id;

		    MicroBit.Console.Put_Line(Self.major_queue(I).task_name);
		    MicroBit.Console.Put_Line(Integer'Image (current_task_id));

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );

		    MicroBit.Console.New_Line;

		    if Answer = 1 then -- If the value from SS is good
			current_queue_id := NB_q;
		    else
			current_queue_id := NB_q;
		    end if;

		    exit TL when current_queue_id /= TL_q;

		END LOOP TL;


		-- Turn right
	    elsif current_queue_id = TR_q then

		TR :
		FOR I in 11..11 LOOP  -- (DS, SS)  -- Need to add AC

		    current_task_id := self.major_queue(I).id;

		    MicroBit.Console.Put_Line(Self.major_queue(I).task_name);
		    MicroBit.Console.Put_Line(Integer'Image (current_task_id));

		    Answer := self.major_queue(I).execute( self.major_queue(I).deadline );

		    MicroBit.Console.New_Line;

		    if Answer = 1 then -- If the value from SS is good
			current_queue_id := NB_q;
		    else
			current_queue_id := NB_q;
		    end if;

		    exit TR when current_queue_id /= TR_q;

		END LOOP TR;

	    end if;

	END LOOP;


    end run;


end QJS;
