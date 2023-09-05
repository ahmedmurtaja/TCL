#!/usr/bin/tclsh


set name Jane
puts \$name
puts \\$name



set x "ahmed";
set y "ahmed";

puts " Current Directory : [pwd]"; # [pwd] : Square brackets allow variable substitution
puts {$x}; # {$x} : Curly braces prevent variable substitution


puts {ahmed , khaled "$x"};  # {ahmed , khaled "$x"} : Curly braces prevent variable substitution
puts "Hello World {$x}";

puts [set x "Khaled"]; # Khaled : TCL set command returns the new value of the variable
puts $x; # Khaled
puts $y; # ahmed

puts [set x]; # Khaled

foreach i {1 2 3 4 5} {
    puts $i;
}