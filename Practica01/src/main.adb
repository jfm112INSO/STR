with Ada.Text_IO; use Ada.Text_IO;
with Ada.IO_Exceptions;
with sesion01;

procedure Main is

   i : Integer;
   k : Integer;

   input : File_Type;
   output : File_Type;

   ST2_Opt : Float := 82.0;
   SD1_Opt : Float := 26.5;

   --Esto podria estar en el ads?
   type Vec is Array (Integer range <>) of Float;
   ST3, ST4, SR1, SD1, Tt : Vector(1..15);
   ST1, ST2, SC1, SC2 : Vector(0..15);

begin

   SC1(0) := 15.0;
   SC2(0) := 450.0;

   ST1(0) := 50.0;
   ST2(0) := 60.0;

   Open(input, In_File, "obj/input.txt");

   Create(output, Out_File, "obj/output.txt");

   Put_Line(output,("k" & ASCII.HT & "ST1" & ASCII.HT &
              "ST2" & ASCII.HT & "ST3" & ASCII.HT &
              "ST4" & ASCII.HT & "SC1" & ASCII.HT &
              "SC2" & ASCII.HT & "k" & ASCII.HT &
              "SR1" & ASCII.HT & "SD1" & ASCII.HT &));


end Main;
