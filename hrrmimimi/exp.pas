program eex;
{$mode objfpc}{$H+}

uses
  SysUtils;

function GetAbs(r: real): real;
begin
  if r < 0 then begin
    r := -r;
  end;

  GetAbs := r;
end;
//
// Test #1
// x := -50
// S: 1.93E-022
// err: -2.94E+028
// 
// Test #2
// x := -50
// S: 1.9287498479639164E-022
// err: -7.1188882445363778E-014
//
// @param x: f(x) = e^x
// @param err: Difference between current function result 
//             and Standatd math [Exp(x): real] function result.
function GetExp(x: real; var err: real): real;
var
  // Elements of exponential row:
  // S(x) = 1 + x/1 + x^2/2! + ... + x^n/n! + ...
  //
  // S0 is an acc of sum (holds sum of previous iterations)
  // S become a following reminder what goes into sum 
  //
  // This process works untill the differences between S and S0
  // still exists. (float values still differs between) 
  S, S0:  real;
  a:      real;
  absX:   real;
  // Iterator instance
  i:      cardinal;
  // Immutable initial <x> value
  init:   real;
const
  // It might be little bit more than absolute zero. 
  EPS = 1E-16;
begin
  init := x;
  absX := GetAbs(x);
  
  S := 1.0;   // define the x^0/0!
  a := 1.0;   // a_i = x^i / i!
  i := 0;

  repeat
    Inc(i);
    a := a * absX / i;   // a_i = a_{i-1} * x / i
    S := S + a;
  until Abs(a) <= EPS * Abs(S);

  // If initial arg was negative --> e^x = 1/e^|x| 
  if init < 0 then
    S := 1.0 / S;

  // Compute relative error value in %
  if init = 0 then
    err := 0.0
  else
    err := (S - Exp(init)) / Exp(init) * 100;

  Result := S;
end;


// 
// For a first time, the real typed values
// will be ok, I suppose. But real is a was smart type
// which was a f48 (48-bit float) type under the elder x86 platforms.
// 
// FreePascal under Win32 uses 64-bit floatings instead of 48-bit.
// That's why I was organized stack like this.
// The Explicit 64-bit floating point is a Double datatype. 
var
  x, S: real;
  err:  real;
  explicit: double; // <-- here it is
begin
  Write('x := ');
  ReadLn(x);

  S := GetExp(x, err);
  //WriteLn('S1: ', S);
  WriteLn('err=', err:10);
end.