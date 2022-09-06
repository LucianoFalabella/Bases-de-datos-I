program Tumama;
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







procedure  Creararchivo();
begin
Assignfile(Archivo ,'CRUD.txt');
if not(FileExists(Archivo)) then
        begin
        rewrite(archivo);
        close(archivo);
        end;
end;

procedure Abrirarchivo(A:Boolean);
begin
if A then
begin
Append(Archivo);
end
else
begin
Reset(Archivo);
end;
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
Abrirarchivo(True);
Writeln(R);
Close(Archivo);
end;

function Buscar(N:integer):String;
var
N,I,P:integer; //Posición del elemento buscado  // Variable para contar la posicion
R:Registro; // Registro para ir testeando
begin
Assignfile(Archivo ,'CRUD.txt');
Abrirarchivo(False);
I:=1;
while not(eof(Archivo)) do
    begin
    Readln(Archivo,R);
    if R.Numero = N then
      exit;
    end;
Seek(Archivo,I);
Readln(Archivo,R);
S:=(R.nombre + Char(10) + Char(13) + R.apellido + Char(10) + Char(13) + inttostr(R.Numero) + Char(10) + Char(13);
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
  Readln(Archivo,R);
  S:=(R.nombre + Char(10) + Char(13) + R.apellido + Char(10) + Char(13) + inttostr(R.Numero) + Char(10) + Char(13);
  end;
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
Abrirarchivo(True);
Writeln(R);
Close(Archivo);
end;



procedure Eliminar(N:Integer);
var
R:Registro;
AAlt:File of Registro;
begin
Abrirarchivo(False);
Assignfile(AAlt,'Archivoalt.txt');
Rewrite(AAlt);
Close(AAlt);
while not eof(Archivo) do
        begin
        Readln(Archivo,R);
        if R.Numero <> N then
                begin
                Append(Aalt);
                WriteLn(R);
                Close(Aalt);
                end;
        end;
Close(Archivo);
Erase(Archivo);
Rename(Aalt,'CRUD.txt');
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



      end;
    end;
  end;
end.














end.
