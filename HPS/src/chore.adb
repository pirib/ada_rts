with Ada.Text_IO;
with Ada.Integer_Text_IO;


package body chore is

    procedure run (Self : in out chore) is
    begin
	self.errand.all;
    end run;
    -- Run the errand of the chore. AKA execute the task.

end chore;
