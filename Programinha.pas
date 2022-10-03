program Tumama;
uses
System.SysUtils;
const
Nom_Archivo = 'CRUD.txt';
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


procedure  Creararchivo();
begin
AssignFile(Archivo ,'CRUD.dat');
if not(Fileexists('CRUD.dat')) then
        begin
        rewrite(archivo);
        close(archivo);
        end;
end;

procedure Abrirarchivo();
begin
Reset(Archivo);
end;



Procedure Agregar(Nombre,Apellido:String;Numero:Integer);
var
R:Registro;
begin
Assignfile(Archivo ,'CRUD.txt');
R.Nombre := Nombre;
R.Apellido:=Apellido;
R.Numero := Numero;
R.Activo:=True;
Abrirarchivo();
Write(Archivo,R);
Close(Archivo);
end;

function Buscar(N:integer):String;
var
I,P:integer; //Posición del elemento buscado  // Variable para contar la posicion
R:Registro; // Registro para ir testeando
begin
Assignfile(Archivo ,'CRUD.txt');
Abrirarchivo();
I:=1;
while not(eof(Archivo)) do
    begin
    Read(Archivo,R);
    if R.Numero = N then
      exit;
    end;
Seek(Archivo,I);
Read(Archivo,R);
S:=R.nombre + Char(10) + Char(13) + R.apellido + Char(10) + Char(13) + inttostr(R.Numero) + Char(10) + Char(13);
Buscar := S;
end;

Function Mostrar():String;
var
R:Registro;
S:String;
begin
Assignfile(Archivo ,'CRUD.txt');
while not(Eof(Archivo)) do
  begin
  Read(Archivo,R);
  S:=R.nombre + Char(10) + Char(13) + R.apellido + Char(10) + Char(13) + inttostr(R.Numero) + Char(10) + Char(13);
  end;
end;





procedure Eliminar(N:Integer);
var
R:Registro;
AAlt:File of Registro;
begin
Abrirarchivo();
Assignfile(AAlt,'Archivoalt.txt');
Rewrite(AAlt);
Close(AAlt);
while not eof(Archivo) do
        begin
        Read(Archivo,R);
        if R.Numero <> N then
                begin
                Reset(AAlt);
                Write(AAlt,R);
                Close(Aalt);
                end;
        end;
Close(Archivo);
Erase(Archivo);
Rename(AAlt,'CRUD.txt');
end;


begin
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
    end;
  end;
end.


