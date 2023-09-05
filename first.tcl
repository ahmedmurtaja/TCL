#!/usr/bin/tclsh


set name Jane
puts \$name
puts \\$name

puts "----------------------------------";
puts [expr 1+2]
set x 1;
set y 2;
puts "----------------------------------";
puts " this is \$x + \$y  [expr $x+$y]" 
puts "----------------------------------";
puts "this is \"\$x+\$y\" [expr "$x+$y"]" 
puts "----------------------------------";

set x "ahmed";
set y "ahmed";

puts " Current Directory : [pwd]"; # [pwd] : Square brackets allow variable substitution
puts "----------------------------------";
puts {$x}; # {$x} : Curly braces prevent variable substitution

puts "Curly braces prevent variable substitution {$x} but \ndouble quotes allow it in nested braces";
puts "----------------------------------";


puts {ahmed , khaled "$x"};  # {ahmed , khaled "$x"} : Curly braces prevent variable substitution
puts "Hello World {$x}";

set a "ONE";

switch $a {
    "ONE" {puts "ONE"; puts "Other statement"; set x 1; puts $x}
    "TWO" {puts "TWO"}
    "THREE" {puts "THREE"}
    default {puts "default"}
}


puts [set x "Khaled"]; # Khaled : TCL set command returns the new value of the variable
puts $x; # Khaled
puts $y; # ahmed

puts [set x]; # Khaled

foreach i {1 2 3 4 5} {
    puts $i;
}