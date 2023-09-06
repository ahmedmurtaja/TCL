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


puts "----------------------------------";

# if statement

if {$x ==1} { # the condition in curly braces , if body must be opened in the same line
    puts "x is equal to 1";
    } else { # else must be in the same line as the closing brace of the if body
        puts "x is not equal to 1";
    }
if $x==1 { 
    puts "WE CAN OMIT THE CURLY BRACES $x";
}

puts [set x "Khaled"]; # Khaled : TCL set command returns the new value of the variable
puts $x; # Khaled
puts $y; # ahmed
set x 1;
set y x;
if "$$y == 1" {
    puts "Khaled Ya Khaled";
}

# while loop

set x 1;
while {$x < 10} {
    puts $x;
    set x [expr $x+1]; # equivalent to incr x
}

puts [set x]; # Khaled

for {set index 0} { $index < 5 } { incr index } {
    puts "55";
}

# for loop
# for {initialization} {condition} {increment} {body}
for {set i 0} {$i < 10} {incr i} {
    puts $i;
}

# foreach loop
# foreach var list {body}
foreach x {1 2 3 4 5} {
    puts $x;
}