with Ada.Text_IO;         use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;   use Ada.Float_Text_IO;
with Ada.IO_Exceptions;
with Simulador;            use Simulador;

procedure Main is



   i      : Integer := 1;
   k      : Integer;

   input  : File_Type;
   output : File_Type;
   alarm : File_Type;



   ST2_Opt : Float := 82.0;
   SD1_Opt : Float := 26.5;

   -- Esto podría estar en el ads?
   type Vec is Array (Integer range <>) of Float;
   ST3, ST4, SR1, SD1, Tt : Vec(0..15);
   ST1, ST2, SC1, SC2     : Vec(0..15);

begin

   SC1(0) := 15.0;
   SC2(0) := 450.0;

   ST1(0) := 50.0;
   ST2(0) := 60.0;

   Open(input, In_File, "input.txt");
   Create(output, Out_File, "output.txt");
   Create(alarm, Out_File, "alarm_log.txt");

   Put_Line(output,("k" & ASCII.HT & "ST1" & ASCII.HT &
                    "ST2" & ASCII.HT & "ST3" & ASCII.HT &
                    "ST4" & ASCII.HT & "SC1" & ASCII.HT &
                    "SC2" & ASCII.HT &
                    "SR1" & ASCII.HT & "SD1"));

   Put_Line("Resultados del ejercicio 1: ");
   New_Line;

   Put_Line(output,("k" & ASCII.HT & ASCII.HT & "ST1" & ASCII.HT & ASCII.HT & ASCII.HT &
                    "ST2" & ASCII.HT & ASCII.HT & ASCII.HT & "ST3" & ASCII.HT & ASCII.HT & ASCII.HT &
                    "ST4" & ASCII.HT & ASCII.HT & ASCII.HT & "SC1" & ASCII.HT & ASCII.HT & ASCII.HT &
                    "SC2" & ASCII.HT & ASCII.HT & ASCII.HT & "SR1" & ASCII.HT & ASCII.HT & ASCII.HT & "SD1"));

   while i <= 15 loop
      -- Guardamos valores
      Get(input, k);
      Get(input, SR1(i));
      Get(input, ST4(i));
      Get(input, ST3(i));

      -- Ponemos en marcha las fórmulas
      Tt(i) := calc_Tt(ST1(i-1), ST2(i-1));
      ST2(i) := calc_ST2(SR1(i), ST4(i), ST1(i-1), SC1(0), Tt(i));
      ST1(i) := calc_ST1(ST2(i));
      SD1(i) := calc_SD1(SC2(0), ST2(i-1), ST3(i));

      -- Seguridad en ST2 (temperatura a la salida al campo)

      if (ST2(i) > 93.0) then
         Put_Line(alarm,"Cuidado ST2 tiene una temperatura de: " & ST2(i)'Img & "ºC");
         Put_Line(alarm,"Cuidado ST2 tiene una temperatura de: " & ST2(i)'Img & "ºC");
      end if;

      -- Lineas añadidas al fichero de texto
      Put_Line(output, Integer(k)'Img & ASCII.HT & ST1(i)'Img & ASCII.HT & ST2(i)'Img & ASCII.HT & ST3(i)'Img &
                            ASCII.HT & ST4(i)'Img & ASCII.HT & SC1(0)'Img & ASCII.HT & SC2(0)'Img &
                            ASCII.HT & SR1(i)'Img & ASCII.HT & SD1(i)'Img);

      -- Resultados por pantalla
      Put_Line(Integer(k)'Img & ASCII.HT & ST1(i)'Img & ASCII.HT & ST2(i)'Img & ASCII.HT & ST3(i)'Img &
                ASCII.HT & ST4(i)'Img & ASCII.HT & SC1(0)'Img & ASCII.HT & SC2(0)'Img &
                ASCII.HT & SR1(i)'Img & ASCII.HT & SD1(i)'Img);

      i := i + 1;
   end loop;

   Close(input);
   Close(output);
   Close(alarm);

end Main;

