package Sesion01 is

    type Sensor_Data is record
        SR1 : Float; -- Sensor de radiación
        ST4 : Float; -- Temperatura ambiente
        ST3 : Float; -- Temperatura del agua de mar
    end record;

    type Plant_State is record
        ST1 : Float; -- Temperatura de entrada al campo
        ST2 : Float; -- Temperatura de salida del campo
        SC1 : Float; -- Caudal de entrada al campo
        SC2 : Float; -- Caudal de entrada al módulo
        SD1 : Float; -- Nivel de producción de destilado
    end record;

    -- Función para leer datos del archivo input.txt
    procedure Leer_Datos(Datos : in out Sensor_Data);

    -- Función para simular la planta y calcular las señales de control
    procedure Simular_Planta(Datos : in Sensor_Data;
                              Estado_Planta : in out Plant_State;
                              Iteracion : Integer);

    -- Función para ejecutar métodos de seguridad y almacenamiento de datos
    procedure Ejecutar_Metodos_Seguridad_Y_Almacenamiento(Estado_Planta : in Plant_State;
                                                           Iteracion : Integer);

    -- Procedimiento para visualización por pantalla
    procedure Mostrar_Pantalla(Estado_Planta : in Plant_State;
                               Iteracion : Integer);

    -- Procedimiento para escribir datos en archivo data.txt
    procedure Escribir_Archivo(Estado_Planta : in Plant_State;
                               Iteracion : Integer);

end Sesion01;
