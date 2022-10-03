program Punto1;
uses
System.SysUtils;
type
Registro = record
        Nombre:String[50];
        Apellido:String[50];
        Numero:Integer;
        Activo:Boolean;
       end;

var
Archivo:File of Registro;
N,P:integer;
S,Nomb,Apell:String;
R:Registro;
Eliminado:Boolean;
Ronda:Boolean;


procedure  Creararchivo();
begin
Assignfile(Archivo,'CRUD.dat');
rewrite(Archivo);
Ronda:=false;
end;

procedure Abrirarchivo();
begin
Reset(Archivo);

end;



Procedure Agregar(Nombre,Apellido:String;Numero:Integer);
var
R:Registro;
begin
R.Nombre := Nombre;
R.Apellido:=Apellido;
R.Numero := Numero;
R.Activo:=True;
Abrirarchivo();
if Filesize(Archivo) = 0 then
  begin
  Seek(Archivo,0);
  Write(Archivo,R);
  end
  else
  begin
  Seek(Archivo,Filesize(Archivo));
  Write(Archivo,R);
  end;
Close(Archivo);
end;

function Buscar(N:integer):String;
var
I,P:integer; //Posición del elemento buscado  // Variable para contar la posicion
R:Registro; // Registro para ir testeando
begin
Abrirarchivo();
I:=0;
while not(eof(Archivo)) do
    begin
    Read(Archivo,R);
    I:=I+1;
    if R.Numero = N then
      S:=R.nombre + Char(10) + Char(13) + R.apellido + Char(10) + Char(13) + inttostr(R.Numero) + Char(10) + Char(13);

    end;

CloseFile(Archivo);
Buscar := S;
end;

Function Mostrar():String;
var
R:Registro;
S:String;
begin
Reset(Archivo);
while not(Eof(Archivo)) do
  begin
  Read(Archivo,R);
  S:=R.nombre + Char(10) + Char(13) + R.apellido + Char(10) + Char(13) + inttostr(R.Numero) + Char(10) + Char(13);
  writeln(S);
  end;
CloseFile(Archivo);
end;





Function Eliminar(N:Integer):Boolean;
var
R:Registro;
AAlt, A:File of Registro;
I:integer;
begin


if not(Ronda) then
  begin
  Assignfile(AAlt,'Archivoalt.dat');
  Rewrite(AAlt);
  end
  else
  begin
    Assignfile(AAlt,'CRUD.dat');
    Rewrite(AAlt);
  end;
Eliminado:=False;
Reset(Archivo);
while not EOF(Archivo) do
        begin
        Read(Archivo,R);
        if R.Numero <> N then
                begin
                Write(AAlt,R);
                end
                else
                begin
                  Eliminado:=True;
                end;
        i:=i+1;
        end;
Close(Archivo);
Close(Aalt);
if not(Ronda) then
begin
Rewrite(Archivo);
Close(Archivo);
Assignfile(Archivo,'Archivoalt.dat');
end
else
begin
rewrite(Archivo);
Close(Archivo);
Assignfile(Archivo,'CRUD.dat');
end;
Ronda:=not(Ronda);
Eliminar := Eliminado;
end;

procedure Modificar(Nomb,Apell:String;Num:Integer);
var
R:Registro;
begin
if Eliminar(Num) then
  begin
  R.Nombre := Nomb;
  R.Apellido := Apell;
  R.Numero := Num;
  Reset(Archivo);
  Write(Archivo,R);
  Close(Archivo);
  end
  else
  begin
  Writeln('No existe el elemento a modificar');
  end;
end;


begin
Creararchivo();
writeln('Ingrese la opción que desea realizar:');
writeln('1- Agregar nuevo cliente');
writeln('2- Modificar un cliente ya existente');
writeln('3- Mostrar un registro');
writeln('4- Mostrar todos los registros');
writeln('5- Eliminar un registro');
writeln('Pulse 0 para salir');
Readln(S);
N:= strtoint(S);
while N <> 0 do
  begin
    case (N) of
    1:
      begin
      writeln('Ingrese el nombre: ');
      readln(Nomb);
      writeln('Ingrese el apellido');
      readln(Apell);
      Writeln('Ingrese el numero');
      readln(P);
      Agregar(Nomb,Apell,P);
      end;
    2:
      begin
      writeln('Ingrese el numero a modificar');
      readln(P);
      writeln('Ingrese el nombre nuevo');
      Readln(Nomb);
      writeln('Ingrese el apellido nuevo');
      readln(Apell);
      Modificar(Nomb,Apell,P);
      end;
    3:
      begin
        Writeln('Ingrese el numero del registro a mostrar');
        readln(P);
        writeln(Buscar(P));
      end;
    4:
      begin
        Mostrar();
      end;
    5:
      begin
        writeln('Ingrese el numero del registro a eliminar');
        readln(P);
        if Eliminar(P) then
          begin
            writeln('Eliminado correctamente');
          end
          else
          begin
            writeln('Registro no existente');
          end;
      end;
      end;
    writeln('Ingrese la opción que desea realizar:');
    writeln('1- Agregar nuevo cliente');
    writeln('2- Modificar un cliente ya existente');
    writeln('3- Mostrar un registro');
    writeln('4- Mostrar todos los registros');
    writeln('5- Eliminar un registro');
    writeln('Pulse 0 para salir');
    Readln(S);
    N:= strtoint(S);
    end;
end.


