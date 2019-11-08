with Microbit.Time;    use type MicroBit.Time.Time_Ms;


package Nav is

    procedure stop;
    procedure drive_forward;

    function drive_forward (Deadline : MicroBit.Time.Time_Ms) return Integer;
    function drive_backward (Deadline : MicroBit.Time.Time_Ms) return Integer;
    function turn_left (Deadline : MicroBit.Time.Time_Ms) return Integer;
    function turn_right (Deadline : MicroBit.Time.Time_Ms) return Integer;
    function stop (Deadline : MicroBit.Time.Time_Ms) return Integer;
    function turn_around ( Deadline : MicroBit.Time.Time_Ms) return Integer;

end Nav;
