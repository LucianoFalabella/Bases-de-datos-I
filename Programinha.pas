program Tumama;
type
Registro = record
        Nombre:String[50];
        Apellido:String[50];
        Numero:Integer;
        Activo:Boolean;
       end;
Arch = File of Registro;
var
Archivo:Arch;
begin
end.


procedure  Creararchivo();
begin
Assignfile(Archivo ,"CRUD.txt");
if not(Fileexist(archivo)) then
        begin
        rewrite(archivo);
        close(archivo);
        end;
end;

Function Mostrar():String;
var
R:Registro;
S:String;
begin
Assignfile(Archivo ,"CRUD.txt");
while not(Eof(Archivo) do
  begin
  R:=Readln(Archivo);
  S:=(R.nombre + Char(10) + Char(13) + R.apellido + Char(10) + Char(13) + inttostr(R.Numero) + Char(10) + Char(13)
  end;
end;


function Agregar(Nombre,Apellido:String;Numero:Integer);
var
R:Registro;
begin
Assignfile(Archivo ,"CRUD.txt");
R.Nombre := Nombre;
R.Apellido:=Apellido;
R.Numero := Numero;
R.Activo:=True;
Abrirarchivo();
Writeln(R);
Close(Archivo);
end;

procedure Eliminar(N:Integer);
var
R:Registro;
AAlt:File of Registro;
begin
Abrirarchivo(False);
Assignfile(AAlt,"Archivoalt.txt");
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
Rename(Aalt,"CRUD.txt");
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

end.
