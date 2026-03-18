// Ken Tompson krutoj chel
program norm;
var
    x: array[1..10] of real;
    n: integer;
    i: integer;
    
function norm1(): real; 
var
    i: integer; // iterator
    a: real; // accumulator
begin
    // iterate over the filled vector coordinates 
    a := 0;
    for i := 1 to n do begin
        a := a + Abs(x[i]);
    end;
    // return accumulator
    norm1 := a;
end;


begin
    // initialized memory usage.
    n := 10;
    for i := 1 to n do begin
        read(x[i]);
    end;
    // call & out 1st vector norm
    WriteLn(norm1:6:2);
end.