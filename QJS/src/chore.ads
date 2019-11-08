package chore is

    type function_pointer is access function  (Deadline : Integer)  return Integer;
    -- chore_procedure is now a pointer to a procedure


    type chore is tagged record

	task_name:        String(1..8) := "taskname";
	id:               Integer := 0;
	deadline:         Integer := 0;

	-- this is the procedure under scrutiny
	errand: function_pointer;

    end record;

    function execute (Self : in out chore ; Deadline : Integer) return Integer;

end chore;
