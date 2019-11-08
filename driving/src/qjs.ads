with chore; use chore;


package QJS is

    type chore_queue is array (1..11) of chore.chore;
   
    type schedule is tagged record
	major_queue : chore_queue;
    end record;

    procedure run (Self : in out schedule);

end QJS;
