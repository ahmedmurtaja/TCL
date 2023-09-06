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

# i can use multiple statements in the initialization and increment parts of the for loop   



# break and continue

for {set i 0} {$i < 10} {incr i} {
    if {$i == 5} {
        break;
    }
    puts $i;
}

for {set i 0} {$i < 10} {incr i} {
    if {$i == 5} {
        continue;
    }
    puts $i;
}

# procedure

proc myproc {x y} {
   set x [expr $x+$y];
   puts $x;
    return $x;
}


proc print {x} {
    puts $x;
}

myproc 1 2;

print "Khaled";
print khaled;

# TCL command line arguments

puts "Number of arguments : $argc";


# proc with args

proc myproc2 {x y {z ""} args } {
    if {$z == ""} {
        puts "z is empty";
    } else {
        puts "z is not empty";
    }
    puts "x = $x";
    puts "y = $y";
    puts "z = $z";
    puts "args = $args";
    if {$args == ""} {
        return 1;
    } else {
        puts "Too many arguments";
    }
}

myproc2 1 2 3 4 5 6 7 8 9 10;

# to make args optional we can use the following syntax : {z ""} args

# upvar
# upvar is used to create a local variable that is linked to a variable in the calling scope
# upvar 0 x y : creates a local variable x that is linked to the variable y in the calling scope

set x 1;
proc myproc3 {x} {
    upvar 0 x y;  # y is a local variable that is linked to x in the calling scope
    # its like a pointer to x , changing y will change x
    # call by reference
    puts $x;
    puts $y;
    set y 2;
    puts $x;
    puts $y;
}

myproc3 3;


# Global 
# global is used to access a global variable from within a procedure
# global x : x is a global variable that can be accessed from within the procedure

set x 1;
proc myproc4 {} {
    global x;
    puts $x;
}

myproc4;

# lists in TCL

set x {1 2 3 4 5 6 7 8 9 10};
# lindex list index : returns the element at the specified index
puts $x;
puts [lindex $x 0]; # 1
puts [lindex $x 1]; # 2
puts [lindex $x 2]; # 3
set x "abc fff";
puts $x;
puts [lindex $x 0]; # abc
puts [lindex $x 2]; # empty string


# llength list : returns the length of the list
puts [llength $x]; # 2

# create list with split command

set lst [split "1 2 3 4 5 6 7 8 9 10" " "];
puts $lst;

# split string separator : splits the string into a list of strings using the separator
# if the separator is empty string , the string is split into a list of characters
# if the separator is not specified , the string is split into a list of characters
# if the separator is not found in the string , the string is split into a list of one element
# Usage : split string separator

set x "1 2 3 4 5 6 7 8 9 10";
set lst [split $x];
puts $lst;


puts [split 10-12-2001 "-"]; # 10 12 2001
set day [lindex [split 10-12-2001 "-"] 0];
set month [lindex [split 10-12-2001 "-"] 1];
set year [lindex [split 10-12-2001 "-"] 2];

puts $day;
puts $month;
puts $year;

set lst [list 1 2 3 4 5 6 7 8 9 10];
puts [lindex $lst 0];

# foreach loop
# foreach var list {body}
foreach x {1 2 3 4 5} {
    puts $x;
}

# concat list1 list2 : returns a new list that is the concatenation of list1 and list2
# Usage : concat list1 list2

set lst1 [list 1 2 3 4 5];
set lst2 [list 6 7 8 9 10];
set lst3 [concat $lst1 $lst2];
puts $lst3;

# lappend list ?element1 element2 ...? : appends the elements to the end of the list
# Usage : lappend list ?element1 element2 ...?

set lst [list 1 2 3 4 5];
lappend lst 6 7 8 9 10;

puts $lst;

# linsert list index element : inserts the element at the specified index in the list
# Usage : linsert list index element
# Returns a new list

set lst [list 1 2 3 4 5];
set lst2 [linsert $lst 0 0];

puts $lst2;

# lsearch list pattern : searches for the pattern in the list
# Usage : lsearch list pattern
# Returns the index of the first element that matches the pattern
# Returns -1 if no match is found

set lst [list {ahmed} {khaled} {mohamed} {ali} {ahmed}];
puts [lsearch $lst a*]; # 0
puts [lsearch $lst m*]; # 1

# lsort list ?-decreasing? ?-integer? ?-real? ?-index index? ?-command command? : sorts the list
# Usage : lsort list ?-decreasing? ?-integer? ?-real? ?-index index? ?-command command?
# Returns a new sorted list

set lst [list 1 2 3 4 5 6 7 8 9 10];
puts [lsort $lst]; # 1 10 2 3 4 5 6 7 8 9 
puts [lsort -integer $lst]; # 1 2 3 4 5 6 7 8 9 10
puts [lsort -decreasing -integer $lst]; # 10 9 8 7 6 5 4 3 2 1
puts [lsort -decreasing -integer -index 0 $lst]; # 10 9 8 7 6 5 4 3 2 1

# lreverse list : reverses the list
# Usage : lreverse list
# Returns a new reversed list

set lst [list 1 2 3 4 5 6 7 8 9 10];
puts [lreverse $lst]; # 10 9 8 7 6 5 4 3 2 1

# lrange list first last : returns a new list that contains the elements from first to last

set lst [list 1 2 3 4 5 6 7 8 9 10];
puts [lrange $lst 0 5]; # 1 2 3 4 5 6+
puts [lrange $lst 0 end]; # 1 2 3 4 5 6 7 8 9 10
puts [lrange $lst 0 0]; # 1

# string operations

# string length string : returns the length of the string
# Usage : string length string

set str "Khaled";
puts [string length $str]; # 6

# string index string index : returns the character at the specified index
# Usage : string index string index

set str "Khaled";
puts [string index $str 0]; # K
puts [string index $str 1]; # h
puts [string index $str 2]; # a
puts [string index $str 3]; # l
puts [string index $str 4]; # e
puts [string index $str 5]; # d

# string compare string1 string2 : compares two strings
# Usage : string compare string1 string2
# Returns 0 if the strings are equal
# Returns 1 if string1 is greater than string2
# Returns -1 if string1 is less than string2

set str1 "Khaled";
set str2 "Khaled";
puts [string compare $str1 $str2]; # 0

set str1 "Khaled";
set str2 "Khaled2";

puts [string compare $str1 $str2]; # -1

# string range string first last : returns a substring from first to last
# Usage : string range string first last

set str "Khaled";
puts [string range $str 0 2]; # Kha

# string first string1 string2 : returns the index of the first occurrence of string1 in string2

set str "Khaled Ahemd Kamal Khaled";

puts [string first "Khaled" $str]; # 0

# string last string1 string2 : returns the index of the last occurrence of string1 in string2

set str "Khaled Ahemd Kamal Khaled";

puts [string last "Khaled" $str]; # 19

# string tolower string : converts the string to lowercase

# string wordend string index : returns the index of the end of the word at the specified index

set str "Khaled Ahemd Kamal Khaled";

puts [string wordend $str 7];

# string wordstart string index : returns the index of the start of the word at the specified index

set str "Khaled Ahemd Kamal Khaled";

puts [string wordstart $str 14]; 

# string trim string ?chars? : removes the leading and trailing characters from the string
# Usage : string trim string ?chars?

set str "     Khaled     ";

puts [string trim $str]; # Khaled

# string trimleft string ?chars? : removes the leading characters from the string
# Usage : string trimleft string ?chars?

set str "     Khaled     ";

puts [string trimleft $str]; # Khaled

# string trimright string ?chars? : removes the trailing characters from the string
# Usage : string trimright string ?chars?

# string tolower string : converts the string to lowercase

set str "Khaled";

puts [string tolower $str]; # khaled
puts [string toupper $str]; # KHALED


# string format format ?arg arg ...? : returns a formatted string
# Usage : string format format ?arg arg ...?

set str [ format "%s %s %s" "Khaled" "Ahmed" "Kamal"];

puts $str; # Khaled Ahmed Kamal

# spacing and indentation using format

set str [ format "%-10s %-10s %-10s" "Khaled" "Ahmed" "Kamal"];

puts $str; # Khaled     Ahmed      Kamal

# table using format

set str [ format "%-10s %-10s %-10s" "Name" "Age" "Address"];

puts $str; # Name       Age        Address

# - : left justify
# + : right justify
# 0 : pad with zeros
# # : use alternate format
# space : pad with spaces

# %d : integer
# %f : float
# %s : string
# %c : character
# %o : octal
# %x : hexadecimal
# %e : exponential
# %g : general
# %p : pointer
# %u : unsigned integer

# string is integer string : returns 1 if the string is an integer