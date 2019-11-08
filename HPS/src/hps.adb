with Ada.Text_IO;
with Ada.Integer_Text_IO;
with external_package;

package body HPS is

    procedure run (Self : in out schedule) is
	highest_priority_task_id : Integer := 0;
	highest_priorty_task_priority: Integer := 0;
    begin

	-- Find the task with the highest priority
	FOR I in queue_length LOOP
	    if self.execution_queue(I).priority > highest_priorty_task_priority
	    then
		highest_priority_task_id := self.execution_queue(I).id;
		highest_priorty_task_priority := self.execution_queue(I).priority;
	    end if;
	END LOOP;

	-- Execute the task with highest priority
	FOR I in queue_length LOOP
	    if self.execution_queue(I).id = highest_priority_task_id
	    then
		self.execution_queue(I).run;
		self.execution_queue(I).priority := 0;
	    end if;
	END LOOP;

	-- Reassign priorities - everyone gets a one plus priority
	FOR I in queue_length LOOP
	    self.execution_queue(I).priority := self.execution_queue(I).priority + 1;
	END LOOP;

    end run;

end HPS;
