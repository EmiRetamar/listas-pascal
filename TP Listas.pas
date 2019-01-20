program TPListas;

  type
      lista= ^reg;
      pasajeros= record
                 nom: string[20];
                 ape: string[20];
                 lugar_destino: string[20];
             end;
      reg= record
           info: pasajeros;
           sig: lista;
       end;


  procedure leerDatos(var pas: pasajeros);
    begin
    writeln('Ingrese el nombre del pasajero: ');
    readln(pas.nom);
    if( pas.nom <> 'zzz') then begin
      writeln('Ingrese el apellido del pasajero: ');
      readln(pas.ape);
      writeln('Ingrese el lugar de destino. Paris, Madrid, Londres: ');
      readln(pas.lugar_destino);
      while(pas.lugar_destino <> 'Paris') and (pas.lugar_destino <> 'Madrid') and (pas.lugar_destino <> 'Londres') do begin
        writeln('El lugar ingresado es incorrecto, Ingrese el lugar de destino. Paris, Madrid, Londres:');
        readln(pas.lugar_destino);
      end;
    end;
  end;


  procedure AgregarDatos(var L: lista; pas: pasajeros);
    var nue: lista; act: lista; ant: lista; 
    begin
    new(nue);
    nue^.info.nom:= pas.nom;
    nue^.info.ape:= pas.ape;
    nue^.info.lugar_destino:= pas.lugar_destino;
    if (L = nil) then
      L:= nue
    else begin
      act:= L;
      while(act <> nil) do begin
        ant:= act;
        act:= act^.sig;
      end;
      ant^.sig:= nue;
    end;
  end;


    procedure imprimir(L: lista);
      var
      nue: lista;
      begin
      nue:= L;
      while (nue<> nil) do begin
        writeln('El nombre de el pasajero es:', nue^.info.nom);
        writeln('El apellido del pasajero es:', nue^.info.ape);
        writeln('El lugar de destino es:', nue^.info.lugar_destino);
        nue:=nue^.sig
      end;
  end;


  procedure AgregarDatosOrd(var L2: lista; pas:pasajeros);
    var nue:lista; act:lista; ant: lista;
    begin
    new(nue);
    nue^.info.nom:= pas.nom;
    nue^.info.ape:= pas.ape;
    nue^.info.lugar_destino:= pas.lugar_destino;
    act:= L2;
    ant:= L2;
      while(act <> nil) and (act^.info.ape < nue^.info.ape) do begin
        ant:=act;
        act:=act^.sig;
      end;
      if(ant = act) then
        L2:=nue
      else
        ant^.sig:= nue;
    nue^.sig:= act;
  end;


  procedure imprimirOrd(L2: lista);
    var nue: lista;
    begin
    nue:= L2;
    while(nue <> nil) do begin
      writeln(nue^.info.ape);
      writeln(nue^.info.nom);
      writeln(nue^.info.lugar_destino);
      nue:= nue^.sig;
    end;
  end;


  procedure PasajerosDestino(L2: Lista; i: string[20]);
  var
  cant:integer;
  nue:lista;
  begin
  cant:=0;
  nue:= L2;
  while (nue<>nil) do begin
    if(nue^.info.lugar_destino = i) then
      cant:=cant+1;
    nue:=nue^.sig;
  end;
  writeln('La cantidad de pasajeros que viajan a: ', i, ' es de: ',cant);
  end;


  procedure leerLugar(var lugDes: string[20]);
    begin
    writeln('Ingrese el lugar de destino. Paris, Madrid, Londres:');
    readln(lugDes);
    while(lugDes <> 'Paris') and (lugDes <> 'Madrid') and (lugDes <> 'Londres') do begin
      writeln('El destino es incorrecto. Ingrese el lugar de destino. Paris, Madrid, Londres:');
      readln(lugDes);
    end;
  end;


{Programa principal}
  var
  L: lista; pas: pasajeros; L2: lista; lugDes: string[20];
  begin
  L:= nil;
  L2:= nil;
  leerDatos(pas);
  while(pas.nom <> 'zzz') do begin
     AgregarDatos(L, pas);
     leerDatos(pas);
  end;
  imprimir(L);
  leerDatos(pas);
  while(pas.nom <> 'zzz') do begin
    AgregarDatosOrd(L2, pas);
    leerDatos(pas);
  end;
  imprimirOrd(L2);
  leerLugar(lugDes);
  PasajerosDestino(L2, lugDes);
readln;
end.



