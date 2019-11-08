pragma Warnings (Off);
pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b__main.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b__main.adb");
pragma Suppress (Overflow_Check);

package body ada_main is

   E079 : Short_Integer; pragma Import (Ada, E079, "cortex_m__nvic_E");
   E051 : Short_Integer; pragma Import (Ada, E051, "mma8653_E");
   E074 : Short_Integer; pragma Import (Ada, E074, "nrf51__events_E");
   E019 : Short_Integer; pragma Import (Ada, E019, "nrf51__gpio_E");
   E093 : Short_Integer; pragma Import (Ada, E093, "nrf51__gpio__tasks_and_events_E");
   E076 : Short_Integer; pragma Import (Ada, E076, "nrf51__interrupts_E");
   E029 : Short_Integer; pragma Import (Ada, E029, "nrf51__rtc_E");
   E032 : Short_Integer; pragma Import (Ada, E032, "nrf51__spi_master_E");
   E059 : Short_Integer; pragma Import (Ada, E059, "nrf51__tasks_E");
   E091 : Short_Integer; pragma Import (Ada, E091, "nrf51__adc_E");
   E057 : Short_Integer; pragma Import (Ada, E057, "nrf51__clock_E");
   E095 : Short_Integer; pragma Import (Ada, E095, "nrf51__ppi_E");
   E036 : Short_Integer; pragma Import (Ada, E036, "nrf51__timers_E");
   E039 : Short_Integer; pragma Import (Ada, E039, "nrf51__twi_E");
   E043 : Short_Integer; pragma Import (Ada, E043, "nrf51__uart_E");
   E007 : Short_Integer; pragma Import (Ada, E007, "nrf51__device_E");
   E099 : Short_Integer; pragma Import (Ada, E099, "microbit__console_E");
   E049 : Short_Integer; pragma Import (Ada, E049, "microbit__i2c_E");
   E047 : Short_Integer; pragma Import (Ada, E047, "microbit__accelerometer_E");
   E089 : Short_Integer; pragma Import (Ada, E089, "microbit__ios_E");
   E105 : Short_Integer; pragma Import (Ada, E105, "microbit__servos_E");
   E055 : Short_Integer; pragma Import (Ada, E055, "microbit__time_E");
   E085 : Short_Integer; pragma Import (Ada, E085, "chore_E");
   E053 : Short_Integer; pragma Import (Ada, E053, "microbit__display_E");
   E004 : Short_Integer; pragma Import (Ada, E004, "accelerometer_E");
   E087 : Short_Integer; pragma Import (Ada, E087, "nav_E");
   E097 : Short_Integer; pragma Import (Ada, E097, "qjs_E");
   E103 : Short_Integer; pragma Import (Ada, E103, "sensor_E");

   Sec_Default_Sized_Stacks : array (1 .. 1) of aliased System.Secondary_Stack.SS_Stack (System.Parameters.Runtime_Default_Sec_Stack_Size);


   procedure adainit is
      Binder_Sec_Stacks_Count : Natural;
      pragma Import (Ada, Binder_Sec_Stacks_Count, "__gnat_binder_ss_count");

      Default_Secondary_Stack_Size : System.Parameters.Size_Type;
      pragma Import (C, Default_Secondary_Stack_Size, "__gnat_default_ss_size");
      Default_Sized_SS_Pool : System.Address;
      pragma Import (Ada, Default_Sized_SS_Pool, "__gnat_default_ss_pool");

   begin
      null;

      ada_main'Elab_Body;
      Default_Secondary_Stack_Size := System.Parameters.Runtime_Default_Sec_Stack_Size;
      Binder_Sec_Stacks_Count := 1;
      Default_Sized_SS_Pool := Sec_Default_Sized_Stacks'Address;


      E079 := E079 + 1;
      E051 := E051 + 1;
      E074 := E074 + 1;
      E019 := E019 + 1;
      E093 := E093 + 1;
      Nrf51.Interrupts'Elab_Body;
      E076 := E076 + 1;
      E029 := E029 + 1;
      E032 := E032 + 1;
      E059 := E059 + 1;
      E091 := E091 + 1;
      E057 := E057 + 1;
      E095 := E095 + 1;
      E036 := E036 + 1;
      E039 := E039 + 1;
      E043 := E043 + 1;
      Nrf51.Device'Elab_Spec;
      E007 := E007 + 1;
      Microbit.Console'Elab_Body;
      E099 := E099 + 1;
      E049 := E049 + 1;
      Microbit.Accelerometer'Elab_Body;
      E047 := E047 + 1;
      Microbit.Ios'Elab_Spec;
      Microbit.Ios'Elab_Body;
      E089 := E089 + 1;
      E105 := E105 + 1;
      Microbit.Time'Elab_Body;
      E055 := E055 + 1;
      E085 := E085 + 1;
      Microbit.Display'Elab_Body;
      E053 := E053 + 1;
      E004 := E004 + 1;
      E087 := E087 + 1;
      E097 := E097 + 1;
      E103 := E103 + 1;
   end adainit;

   procedure Ada_Main_Program;
   pragma Import (Ada, Ada_Main_Program, "_ada_main");

   procedure main is
      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      adainit;
      Ada_Main_Program;
   end;

--  BEGIN Object file/option list
   --   /home/nico/Downloads/Real-Time-Systems/driving/obj/chore.o
   --   /home/nico/Downloads/Real-Time-Systems/driving/obj/accelerometer.o
   --   /home/nico/Downloads/Real-Time-Systems/driving/obj/nav.o
   --   /home/nico/Downloads/Real-Time-Systems/driving/obj/qjs.o
   --   /home/nico/Downloads/Real-Time-Systems/driving/obj/sensor.o
   --   /home/nico/Downloads/Real-Time-Systems/driving/obj/main.o
   --   -L/home/nico/Downloads/Real-Time-Systems/driving/obj/
   --   -L/home/nico/Downloads/Real-Time-Systems/driving/obj/
   --   -L/home/nico/Downloads/Real-Time-Systems/Ada_Drivers_Library/boards/MicroBit/obj/zfp_lib_Debug/
   --   -L/home/nico/opt/GNAT/2019-arm-elf/arm-eabi/lib/gnat/zfp-cortex-m0/adalib/
   --   -static
   --   -lgnat
--  END Object file/option list   

end ada_main;
