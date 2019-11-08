with chore; use chore;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with external_package;


package HPS is

   
    type chore_queue is array (1..11) of chore.chore;
   
    type schedule is tagged record
     
	major_queue : chore_queue;
     
    end record;


    procedure run (Self : in out schedule);


end HPS;
