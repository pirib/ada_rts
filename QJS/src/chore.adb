with Ada.Text_IO;
with Ada.Integer_Text_IO;


package body chore is

   function execute (Self : in out chore ; Deadline : Integer) return Integer is
      temp : Integer;
   begin
      temp := self.errand.all(Deadline); -- Actually execute a task

      -- decide if the value recevied is good or bad. 1 for good, -1 for bad
      if self.id = 1 then -- AC

         if temp = 1 then  -- e.g. temp > 65 and temp < -65
            return 1; -- normal behavior value
         else
            return -1; -- non horizontal value
         end if;


      elsif self.id = 2 then -- SS

         if temp = 1 then
            return 1; -- normal behavior value
         else
            return -1; -- non horizontal value
         end if;


      elsif self.id = 3 then -- DF
         return 1;  --task should only return normal behavior value


      elsif self.id = 4 then  -- DS
         return 1;  --task should only return normal behavior value

      else -- do error handling here: either call ERROR_q or restart from NB_q?
         return 0;

      end if;

   end execute;
   -- Run the errand of the chore. AKA execute the task.



end chore;
