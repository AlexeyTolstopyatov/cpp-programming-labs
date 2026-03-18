program dichotomy;

uses 
    Math;
    
var
    a, b, e, x, c: real;

function f(x: real): real;
begin
    f := 5 * Cos(x) - Ln(x) - 0.5 * x + 5;
end;

function root(a, b, e: real): real;
begin
    if f(a) * f(b) > 0 then begin
        Writeln('No sign changes at the target range');
        root := 0;
        Exit();
    end;
    
    while (b - a) / 2 > e do begin
        c := (a + b) / 2;
        if Abs(f(c)) <= e then begin
            root := c;
            Exit();
        end;
        if f(a) * f(c) < 0 then begin
            b := c;
        end
        else begin
            a := c;
        end;
    end;
    
    root := (a + b) / 2;
end;

begin
    Write('a, b, Eps: ');
    Readln(a, b, e);
    x := root(a, b, e);
    Writeln(x:6:2);
end.
