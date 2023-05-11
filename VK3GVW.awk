#!/usr/bin/awk -f

# Az AWK változók definiálása
BEGIN {
    sphere_count = 0
    box_count = 0
    triangle_count = 0
    # Gömbök, dobozok és háromszögek pontjainak koordinátáit tároló változók definiálása
    sphere_points = ""
    box_points = ""
    triangle_points = ""
    # Egyéb változók definiálása, ha szükséges
}

# Gömbök feldolgozása
/^sphere/ {
    # Az AWK változók frissítése
    sphere_count++
    x[sphere_count] = $2
    y[sphere_count] = $3
    z[sphere_count] = $4
    radius[sphere_count] = $5
    # Az aktuális gömb koordinátáinak kiírása
    print "Gömb", sphere_count, "koordinátái:", x[sphere_count], y[sphere_count], z[sphere_count], "sugara:", radius[sphere_count]
}

# Dobozok feldolgozása
/^box/ {
    # Az AWK változók frissítése
    box_count++
    x1[box_count] = $2
    y1[box_count] = $3
    z1[box_count] = $4
    x2[box_count] = $5
    y2[box_count] = $6
    z2[box_count] = $7
    # Az aktuális doboz koordinátáinak kiírása
    print "Doboz", box_count, "koordinátái:", x1[box_count], y1[box_count], z1[box_count], x2[box_count], y2[box_count], z2[box_count]
}

# Háromszögek feldolgozása
/^triangle/ {
    # Az AWK változók frissítése
    triangle_count++
    triangle_points = triangle_points $2 " " $3 " " $4 " " $5 " " $6 " " $7 " "
    # Az aktuális háromszög koordinátáinak kiírása
    print "Háromszög", triangle_count, "koordinátái:", $2, $3, $4, $5, $6, $7
}

# Az AWK script vége, kiírjuk az eredményeket
END {
    print "A fájlban összesen", sphere_count, "gömb található."
    print "A fájlban összesen", box_count, "doboz található."
    print "A fájlban összesen", triangle_count, "háromszög található."
}
