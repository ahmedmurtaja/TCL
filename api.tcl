package require sqlite3

set db [sqlite3 open mydatabase.db]

set create_table_sql {
    CREATE TABLE IF NOT EXISTS mytable (
        id INTEGER PRIMARY KEY,
        name TEXT,
        age INTEGER
    )
}
sqlite3 eval $db $create_table_sql

proc insert_data {name age} {
    global db
    set sql "INSERT INTO mytable (name, age) VALUES ('$name', $age)"
    sqlite3 eval $db $sql
}

proc read_data {} {
    global db
    set sql "SELECT * FROM mytable"
    set result [sqlite3 eval $db $sql]

    foreach row $result {
        set id [lindex $row 0]
        set name [lindex $row 1]
        set age [lindex $row 2]
        puts "ID: $id, Name: $name, Age: $age"
    }
}

proc update_data {id new_name new_age} {
    global db
    set sql "UPDATE mytable SET name = '$new_name', age = $new_age WHERE id = $id"
    sqlite3 eval $db $sql
}

proc delete_data {id} {
    global db
    set sql "DELETE FROM mytable WHERE id = $id"
    sqlite3 eval $db $sql
}

insert_data "Ahmed" 30
insert_data "Khaled" 25
insert_data "Ibraheem" 35

puts "Data before update:"
read_data

update_data 2 "UpdatedBob" 26

puts "\nData after update:"
read_data

delete_data 3

puts "\nData after deletion:"
read_data

sqlite3 close $db
