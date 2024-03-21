package Simulador is

   --Constantes

   b: constant float := 0.15;
   Leq: constant float := 15.0;
   H: constant float := 4;
   c: constant float := 9.0*2.0*6.0*10000.0;
   Cp: constant float := 4190.0;
   p: constant float := 975.0;

   function calc_ST1 (ST2:Float) return Float;
   function calc_ST2 (SR1, ST4, ST1, SC1, Tt:Float) return Float;

   function calc_Tt (ST1, ST2:Float) return Float;
   function calc_SD1 (SC2, ST2, ST3:Float) return Float;

   function calc_SC1 (SR1, ST4, ST1, SC1, Tt:Float) return Float;
   function calc_SC2 (SD1, ST2, ST3:Float) return Float;

end Simulador;
