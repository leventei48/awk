#!/usr/bin/awk -f

BEGIN {
    print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
    print "<!DOCTYPE X3D PUBLIC \"ISO//Web3D//DTD X3D 3.2//EN\" \"http://www.web3d.org/specifications/x3d-3.2.dtd\">"
    print "<X3D version=\"3.2\" profile=\"Full\">"
    print "<Scene>"
    sphere_count = 0
    box_count = 0
    triangle_count = 0
}

/^sphere/ {
    if (NF < 5) {
        print "Hiba: hiányzó paraméter a", sphere_count+1, ". gömbnél."
        exit 1
    }
    sphere_count++
    x[sphere_count] = $2
    y[sphere_count] = $3
    z[sphere_count] = $4
    radius[sphere_count] = $5
    print "<Transform translation='"$2" "$3" "$4"'>"
    print "<Shape>"
    print "<Sphere radius='"$5"' />"
    print "</Shape>"
    print "</Transform>"
}

/^box/ {
    if (NF < 7) {
        print "Hiba: hiányzó paraméter a", box_count+1, ". doboznál."
        exit 1
    }
    box_count++
    x1[box_count] = $2
    y1[box_count] = $3
    z1[box_count] = $4
    x2[box_count] = $5
    y2[box_count] = $6
    z2[box_count] = $7
    print "<Transform translation='"$2" "$3" "$4"'>"
    print "<Shape>"
    print "<Box size='"$5-$2" "$6-$3" "$7-$4"'/>"
    print "</Shape>"
    print "</Transform>"
}

/^triangle/ {
    if (NF < 10) {
        print "Hiba: hiányzó paraméter a", triangle_count+1, ". háromszögnél."
        exit 1
    }
    triangle_count++
    triangle_points = triangle_points $2 " " $3 " " $4 " " $5 " " $6 " " $7 " " $8 " " $9 " " $10 " "
    print "<Shape>"
    print "<IndexedTriangleSet coordIndex='"triangle_coord_index"'>"
    print "<Coordinate point='"$2" "$3" "$4" "$5" "$6" "$7" "$8" "$9" "$10"'/>"
    print "</IndexedTriangleSet>"
    print "</Shape>"
}

END {
    print "</Scene>"
    print "</X3D>"
}
