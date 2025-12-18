unit Rows;
(*
 * CoffeeLake (C) 2025
 * Practice at 1st half of year. TSU official classes "Programming Pascal" 
 * This file includes material about 
 *   -> arrays
 *   -> 2D arrays
 *   -> functions/procedures
 *   -> rows
 *   -> files
 *)
interface

type 
  MathFunctor = function(x: real):real;
  Number = 0..9;
  Vector = array[Number] of real;
  Matrix = array[Number, Number] of real;

const 
  NUMBER_MAX: Number = 9;
  NUMBER_MIN: Number = 0;
  MAT_E: Matrix      = ((1, 0, 0, 0, 0, 0, 0, 0, 0, 0), 
                        (0, 1, 0, 0, 0, 0, 0, 0, 0, 0), 
                        (0, 0, 1, 0, 0, 0, 0, 0, 0, 0),
                        (0, 0, 0, 1, 0, 0, 0, 0, 0, 0),
                        (0, 0, 0, 0, 1, 0, 0, 0, 0, 0),
                        (0, 0, 0, 0, 0, 1, 0, 0, 0, 0),
                        (0, 0, 0, 0, 0, 0, 1, 0, 0, 0),
                        (0, 0, 0, 0, 0, 0, 0, 1, 0, 0),
                        (0, 0, 0, 0, 0, 0, 0, 0, 1, 0),
                        (0, 0, 0, 0, 0, 0, 0, 0, 0, 1));

function  Sh(x:real): real;
function  Si(x:real): real;
function  Ch(x:real): real;
function  Ci(x:real): real;
function  Sin(x:real): real;
function  Cos(x:real): real;
function  Exp(x:real): real;
procedure ShWrite(x:real; var n: integer; var sum: real);
procedure SiWrite(x:real; var n: integer; var sum: real);
procedure ChWrite(x:real; var n: integer; var sum: real);
procedure CiWrite(x:real; var n: integer; var sum: real);
procedure SinWrite(x:real; var n: integer; var sum: real);
procedure CosWrite(x:real; var n: integer; var sum: real);
procedure ExpWrite(x:real; var n: integer; var sum: real);

function  VecGetMaximum(a: Vector): real;
function  VecGetMinimum(a: Vector): real;
function  VecGetPositionOfMaximum(a: Vector): Number;
function  VecGetPositionOfMinimum(a: Vector): Number;
function  VecGetMiddleSqrt(var a:Vector; nSize: Number): real;
function  VecGetMiddle(var a:Vector; nSize: Number): real;
procedure VecWrite(var a: Vector; nSize: Number);
procedure VecWriteln(var a: Vector; nSize: Number);
procedure VecReadln(var a: Vector; nSize: Number);
procedure VecRead(var a: Vector);
procedure VecInvert(var a: Vector; nSize: Number);
procedure VecSortDesc(var a: Vector; nSize:Number);
procedure VecBubbleDesc(var a:Vector; nSize:Number);
procedure VecBubbleAsc(var a: Vector; nSize: Number);
procedure VecFixedBubbleDesc(var a: Vector; nSize: Number);
procedure VecFixedBubbleAsc(var a: Vector; nSize: Number);

procedure MatRead(n, m: Number; var r: Matrix);
procedure MatWrite(n, m: Number; var r: Matrix);
procedure MatWriteAll(var r:Matrix);
function  MatTryMul(a_n, a_m, b_n, b_m: Number; var a, b, r: Matrix): boolean;
procedure MatMulSqr(n: Number; var a, b, r:Matrix);

procedure DwriteTable(v: Vector; nFrom, nTo: Number; f:MathFunctor; strTitle: string);
procedure FwriteTable(v: Vector; nFrom, nTo: Number; f:MathFunctor; strTitle: string; strPath: string);
procedure DwriteSlice(x0, x9: real; step: real; f:MathFunctor; strTitle: string);
procedure FwriteSlice(x0, x9: real; step: real; f:MathFunctor; strTitle: string; strPath: string);

function  TrySecantEqualsWith(x0, x1, EPS: real; lim: integer; y:function(x:real): real; var fRoots: boolean):real;


procedure __swap(var x, y: real);

implementation

procedure FwriteTable(v: Vector; nFrom, nTo: Number; f:MathFunctor; strTitle: string; strPath: string);
var
  x: real;
  i: Number;
  strX, strY: string;
  hFile: Text;
begin
  Assign(hFile, strPath);
  Rewrite(hFile);
  
  Writeln(strTitle);
  Writeln(hFile, '┌────────────┬──────────────┐');
  Writeln(hFile, '│     x      │     f(x)     │');
  Writeln(hFile, '├────────────┼──────────────┤');
  
  for i := nFrom to nTo do begin
    Str(v[i]:10:5, strX);
    Str(f(v[i]):12:5, strY);
    
    Writeln(hFile, '│ ', Copy(strX, 1, 10):10, ' │ ', Copy(strY, 1, 12):12, ' │');
  end;
  
  Writeln(hFile, '└────────────┴──────────────┘');
end;


procedure DwriteTable(v: Vector; nFrom, nTo: Number; f: MathFunctor; strTitle: string);
var
  x: real;
  i: Number;
  strX, strY: string;
begin
  Writeln(strTitle);
  Writeln('┌────────────┬──────────────┐');
  Writeln('│     x      │     f(x)     │');
  Writeln('├────────────┼──────────────┤');
  
  for i := nFrom to nTo do begin
    Str(v[i]:10:5, strX);
    Str(f(v[i]):12:5, strY);
    
    Writeln('│ ', Copy(strX, 1, 10):10, ' │ ', Copy(strY, 1, 12):12, ' │');
  end;
  
  Writeln('└────────────┴──────────────┘');
end;


procedure DwriteSlice(x0, x9: real; step: real; f: MathFunctor; strTitle: string);
var
  x: real;
  strX, strY: string;
begin
  Writeln(strTitle);
  Writeln('┌────────────┬──────────────┐');
  Writeln('│     x      │     f(x)     │');
  Writeln('├────────────┼──────────────┤');
  
  x := x0;
  
  while x <= x9 do 
  begin
    Str(x:10:5, strX);
    Str(f(x):12:5, strY);
    
    Writeln('│ ', Copy(strX, 1, 10):10, ' │ ', Copy(strY, 1, 12):12, ' │');
    
    x := x + step;
  end;
  
  Writeln('└────────────┴──────────────┘');
end;
procedure FwriteSlice(x0, x9: real; step: real; f:MathFunctor; strTitle: string; strPath: string);
var
  x, y: real;
  sX, sY: string;
  hFile: Text;
begin
  Assign(hFile, strPath);
  Rewrite(hFile);
  
  Writeln(hFile, strTitle);
  Writeln(hFile, '┌────────────┬──────────────┐');
  Writeln(hFile, '│     x      │     f(x)     │');
  Writeln(hFile, '├────────────┼──────────────┤');
  
  x := x0;
  
  while x <= x9 do 
  begin
    Str(x:10:5, sX);
    Str(f(x):12:5, sY);
    
    Writeln(hFile, '│ ', Copy(sX, 1, 10):10, ' │ ', Copy(sY, 1, 12):12, ' │');
    
    x := x + step;
  end;
  
  Writeln(hFile, '└────────────┴──────────────┘');
  
  Close(hFile);
end;

procedure __swap(var x, y: real);
var z: real;
begin
  z := x; 
  x := y; y := z;
end; 

procedure MatWriteAll(var r:Matrix);
begin
  MatWrite(NUMBER_MAX, NUMBER_MAX, r);
end;
procedure MatMulSqr(n: Number; var a, b, r:Matrix);
var 
  i, j, k: Number;
  acc: real;
begin
  for i := 1 to n do begin
    for j := 1 to n do begin
      acc := 0;
      for k := 1 to n do begin
        acc := acc + a[i, k] * b[k, j];
      end;
      r[i, j] := acc;
    end;
  end;
end;


function MatTryMul(a_n, a_m, b_n, b_m: Number; var a, b, r: Matrix): boolean;
var
  i, j, k: Number;
  acc: real;
begin
  if a_m <> b_n then begin
    MatTryMul := false;
    exit;
  end;
  for i := 1 to a_n do begin
    for j := 1 to b_m do begin
      acc := 0;
      for k := 1 to a_n do begin
        acc := acc + a[i, k] * b[k, j];
      end;
      r[i, j] := acc;
    end;
  end; 
  MatTryMul := true;
end;
procedure MatRead(n, m: Number; var r: Matrix);
var 
  i, j: Number;
  v: real;
begin
  Writeln('Заполните таблицу размера ', n, '*', m);
  for i := 1 to n do begin
    for j := 1 to m do begin
      Write(' [', i, ';', j, ']=');
      Read(v);
      r[i, j] := v;
    end;
    Writeln;
  end;
end;

procedure MatWrite(n, m: Number; var r: Matrix);
var
  i, j: Number;
begin
  Writeln('Вывод таблицы размера ',n, '*', m);
  for i := 1 to n do begin
    for j := 1 to m do begin
      Write(' [', i, ';', j, ']=',r[i, j]);
    end;
    Writeln;
  end;
end;

procedure VecFixedBubbleDesc(var a: Vector; nSize: Number);
var
  j, i: Number;
  sorting : boolean;
begin
  while sorting do begin
    sorting := false;
    for i := 1 to nSize - 1 do begin
      if a[i] < a[i + 1] then begin
        sorting := true;
        __swap(a[i+1], a[i]);
      end
    end;
  end;
end;

procedure VecFixedBubbleAsc(var a: Vector; nSize: Number);
var
  j, i: Number;
  sorting : boolean;
begin
  while sorting do begin
    sorting := false;
    for i := 1 to nSize - 1 do begin
      if a[i] > a[i + 1] then begin
        sorting := true;
        __swap(a[i+1], a[i]);
      end
    end;
  end;
end;


procedure VecBubbleDesc(var a: Vector; nSize: Number);
var
  max: real; 
  j, i: Number;
begin
  for j := 1 to nSize do begin
    for i := 1 to nSize - 1 do begin
      if a[i] < a[i + 1] then
        __swap(a[i+1], a[i]);
    end;
  end;
end;

procedure VecBubbleAsc(var a: Vector; nSize: Number);
var
  max: real; 
  j, i: Number;
begin
  for j := 1 to nSize do begin
    for i := 1 to nSize - 1 do begin
      if a[i] > a[i + 1] then
        __swap(a[i+1], a[i]);
    end;
  end;
end;


procedure VecSortDesc(var a: Vector; nSize:Number);
var 
  i, j: Number;
  rMax: real;
begin
  for j := 1 to nSize - 1 do begin
    rMax := a[j];
    for i := j + 1 to nSize do begin
      if a[i] > rMax then begin
        rMax := a[i]; __swap(a[j], a[i]);
      end;
    end;
  end;
end;

procedure VecInvert(var a: Vector; nSize: Number);
var 
  i: Number;
  r: real;
begin
  for i := NUMBER_MIN to nSize do
  begin
    r := a[i];
    a[i] := a[nSize- i];
    a[nSize - i] := r;
  end;
end;

function VecGetPositionOfMaximum(a: Vector): Number;
var
  i: integer;
  rMax: real;
  iPos: integer;
begin
  rMax := a[1]; iPos := 0;
  for i := 2 to NUMBER_MAX do 
    if a[i] > rMax then begin 
      rMax := a[i];
      iPos := i;
    end;
  VecGetPositionOfMaximum := iPos;
end;

function VecGetMaximum(a: Vector): real;
var 
  i: integer;
  rMax: real;
begin
  rMax := a[1];
  for i := 2 to NUMBER_MAX do if a[i] > rMax then rMax := a[i];
  
  VecGetMaximum := rMax;
end;

function VecGetMiddle(var a:Vector; nSize: Number): real;
var 
  i: Number;
  s: real;
begin
  s := 0; 
  for i := NUMBER_MIN to nSize do
  begin
    s := s + a[i];
  end;

  VecGetMiddle := s / nSize;
end;

function VecGetMiddleSqrt(var a:Vector; nSize: Number): real;
var
  i: Number;
  s: real;        // Сумма членов ряда
  sDsp: real;     // Сумма дисперсий 
  midMark: real;  // Средняя оценка
begin
  midMark := VecGetMiddle(a, nSize);
  s := 0;
  for i := NUMBER_MIN to nSize do
  begin
    s := s + Sqr(a[i] - midMark);
  end; 
  VecGetMiddleSqrt := Sqrt(s) / nSize;
end;

function VecGetMinimum(a: Vector): real;
var 
  i: integer;
  rMin: real;
begin
  rMin := a[1];
  for i := 2 to NUMBER_MAX do if a[i] < rMin then rMin := a[i];
  
  VecGetMinimum := rMin;
end;

function VecGetPositionOfMinimum(a: Vector): Number;
var
  i: integer;
  rMin: real;
  iPos: Number;
begin
  rMin := a[1]; iPos := 0;
  for i := 2 to NUMBER_MAX do 
    if a[i] < rMin then begin 
      rMin := a[i];
      iPos := i;
    end;
  VecGetPositionOfMinimum := iPos;
end;

procedure VecReadln(var a: Vector; nSize: Number);
var 
  i: Number;
  rA: real;
begin
  for i := 1 to nSize do 
  begin
    Write('[', i, '] = ');
    Readln(rA);
    a[i] := rA;
  end;
end;

procedure VecRead(var a: Vector);
var 
  i: Number;
  rA: real;
begin
  for i := 1 to NUMBER_MAX do 
  begin
    Write('[', i, ']=');
    Read(rA);
    a[i] := rA;
    Write('  ');
  end;
end;

procedure VecWriteln(var a: Vector; nSize: Number);
var 
  i: Number;
begin
  for i := 1 to nSize do
    Writeln('[', i, ']=', a[i]:2:2);
end;

procedure VecWrite(var a: Vector; nSize: Number);
var i: Number;
begin
  for i := 1 to nSize do
    Write(' ', a[i]:2:2);
end;

function Sh(x: real): real;
var
  term, sum, xx: real;
  n: integer;
begin
  if x = 0 then
  begin
    sh := 0;
    exit; 
  end;
  
  term := x;
  sum := term;
  n := 1;
  xx := x * x;
  
  while abs(term) > 1e-10 do
  begin
    term := term * xx / ((2 * n) * (2 * n + 1));
    sum := sum + term;
    n += 1;
  end;
  
  Sh := sum;
end;

function Ch(x: real): real;
var
  term, sum, xx: real;
  n: integer;
const 
  eps: real = 1E-10;
begin
  if x = 0 then
  begin
    ch := 1;
    exit;
  end;
  
  term := 1.0;
  sum := term;
  n := 1;
  xx := x * x;
  
  while abs(term) > eps do
  begin
    term := term * xx / ((2 * n - 1) * (2 * n));
    sum := sum + term;
    n += 1;
  end;
  
  Ch := sum;
end;

function Si(x: real): real;
var
  term, sum, xx: real;
  n: integer;
const 
  eps: real = 1E-10;
begin
  if x = 0 then
  begin
    si := 0;
    exit;
  end;
  
  term := x;
  sum := term;
  n := 1;
  xx := x * x;
  
  while abs(term) > 1e-10 do
  begin
    term := -term * xx * (2 * n - 1) / ((2 * n + 1) * (2 * n + 1) * 2 * n);
    sum := sum + term;
    n += 1;
  end;
  
  Si := sum;
end;

function Ci(x: real): real;
const 
  gamma = 0.57721566490153286060;
var
  term, sum, xx: real;
  n: integer;
begin
  if x <= 0 then
  begin
    ci := 0;
    exit;
  end;
  
  if x = 0 then
  begin
    ci := -1; // -inf???
    exit;
  end;
  
  term := -xx / 4;
  sum := term;
  n := 2;
  xx := x * x;
  
  while abs(term) > 1e-10 do
  begin
    term := -term * xx * (2 * n - 2) / ((2 * n) * (2 * n) * (2 * n - 1));
    sum := sum + term;
    n += 1;
  end;
  
  Ci := gamma + ln(x) + sum;
end;

function Cos(x: real): real;
var
  a, r, s: real;
  i: shortint;
begin
  s := 0; i := 0; a := x; r := x * x;
  while Abs(a) > 10E-10 do
  begin
    s := s + a; i := i + 1; a := (-a * r) / (2 * i);
  end;
  Cos := s;
end;

function Sin(x: real): real;
var
  a, r, s: real;
  i: shortint;
begin
  s := 0; i := 0; a := x; r := x * x;
  while Abs(a) > 10E-10 do
  begin
    s := s + a; i := i + 1; a := (-a * r) / (2 * i * (2 * i + 1));
  end;
  Sin := s;
end;

function Exp(x: real): real;
var
  a, s: real;
  i: integer;
const 
  eps: real = 10E-10;
begin
  // a_i = a_{i - 1}*x/i
  a := 1; s := 0; i := 1;
  while Abs(a) > eps do
  begin
    s := s + a; i := i+1; a := a * x / i;
  end;

  Exp := s;
end;

procedure ExpWrite(x: real; var n: integer; var sum: real);
var
  a: real;
const 
  eps: real = 10E-10;
begin
  a := 1; sum:= 0; n := 1;
  while Abs(a) > eps do
  begin
    sum := sum + a; n := n+1; a := a * x / n;
  end;
end;

procedure SinWrite(x: real; var n: integer; var sum: real);
var
  term, xx: real;
begin
  if x = 0 then
  begin
    exit; 
  end;
  
  term := x;
  sum := term;
  n := 1;
  xx := x * x;
  
  while abs(term) > 1e-10 do
  begin
    term := term * xx / ((2 * n) * (2 * n + 1));
    sum := sum + term;
    n += 1;
  end;
end;

procedure CosWrite(x: real; var n: integer; var sum: real);
var
  a, r, s: real;
  i: shortint;
begin
  s := 0; i := 0; a := x; r := x * x;
  while Abs(a) > 10E-10 do
  begin
    s := s + a; i := i + 1; a := (-a * r) / (2 * i);
  end;
  sum := s;
end;

procedure CiWrite(x: real; var n: integer; var sum: real);
const 
  gamma = 0.57721566490153286060;
var
  term, xx: real;
begin
  if x <= 0 then
  begin
    exit;
  end;
  
  if x = 0 then
  begin
    exit;
  end;
  
  term := -xx / 4;
  sum := term;
  n := 2;
  xx := x * x;
  
  while abs(term) > 1e-10 do
  begin
    term := -term * xx * (2 * n - 2) / ((2 * n) * (2 * n) * (2 * n - 1));
    sum := sum + term;
    n += 1;
  end;
  
  sum := gamma + ln(x) + sum;
end;

procedure SiWrite(x: real; var n: integer; var sum: real);
var
  term, xx: real;
const 
  eps: real = 1E-10;
begin
  if x = 0 then
  begin
    exit;
  end;
  
  term := x;
  sum := term;
  n := 1;
  xx := x * x;
  
  while abs(term) > 1e-10 do
  begin
    term := -term * xx * (2 * n - 1) / ((2 * n + 1) * (2 * n + 1) * 2 * n);
    sum := sum + term;
    n += 1;
  end;
end;

procedure ChWrite(x: real; var n: integer; var sum: real);
var
  term, xx: real;
const 
  eps: real = 1E-10;
begin
  if x = 0 then
  begin
    exit;
  end;
  
  term := 1.0;
  sum := term;
  n := 1;
  xx := x * x;
  
  while abs(term) > eps do
  begin
    term := term * xx / ((2 * n - 1) * (2 * n));
    sum := sum + term;
    n += 1;
  end;
end;

procedure ShWrite(x: real; var n: integer; var sum: real);
var
  term, xx: real;
begin
  if x = 0 then
  begin
    exit; 
  end;
  
  term := x;
  sum := term;
  n := 1;
  xx := x * x;
  
  while abs(term) > 1e-10 do
  begin
    term := term * xx / ((2 * n) * (2 * n + 1));
    sum := sum + term;
    n += 1;
  end;
end;

function TrySecantEqualsWith(x0, x1, EPS: real; lim: integer; y:function(x:real): real; var fRoots: boolean):real;
var
  a, y0, y1: real;
  i: integer;
begin
  y0 := y(x0);
  i := 1;
  repeat
    y1 := y(x1);
    a := y1 * (x1 - x0) / (y1 - y0);
    x0 := x1;
    y0 := y1;
    x1 := x1 - a;
    i := i + 1;
    if i = lim then
    begin
      TrySecantEqualsWith := -0.0;
      fRoots := false;
      exit;
    end
  until (Abs(a) < EPS) and (a <> 0);
  
  fRoots := true;
  TrySecantEqualsWith := x1;
end;

begin

end.