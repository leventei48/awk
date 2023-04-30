#!/usr/bin/awk -f

BEGIN {
    # az X3D fájl fejlécét létrehozzuk
    print "<?xml version=\"1.0\" encoding=\"UTF-8\"?>"
    print "<!DOCTYPE X3D PUBLIC \"ISO//Web3D//DTD X3D 3.3//EN\" \"http://www.web3d.org/specifications/x3d-3.3.dtd\">"
    print "<X3D version='3.3' profile='Full' xmlns:xsd='http://www.w3.org/2001/XMLSchema-instance' xsd:noNamespaceSchemaLocation='http://www.web3d.org/specifications/x3d-3.3.xsd'>"
    print "<Scene>"
}

{
    # feldolgozzuk az input fájl egy sorát
    if ($1 == "light_source") {
        if (NF != 4) {
            print "Hiba: Hibás szintaxis a fényforrás sorban: " $0 > "/dev/stderr"
            exit 1
        }
        # átalakítjuk a povray fényforrást X3D fényforrássá
        split($2, position, "[<>, ]+")
        split($3, color, "[<>, ]+")
        printf("<PointLight location='%f %f %f' color='%f %f %f'/>\n", position[2], position[3], position[4], color[2], color[3], color[4])
    } else if ($1 == "plane") {
        if (NF != 3) {
            print "Hiba: Hibás szintaxis a síklap sorban: " $0 > "/dev/stderr"
            exit 1
        }
        # átalakítjuk a povray síklapot X3D síklappá
        split($2, normal, "[<>, ]+")
        d = $3
        printf("<Plane equation='%f %f %f %f'/>\n", normal[2], normal[3], normal[4], d)
    } else if ($1 == "box") {
        if (NF != 3) {
            print "Hiba: Hibás szintaxis a doboz sorban: " $0 > "/dev/stderr"
            exit 1
        }
        # átalakítjuk a povray dobozt X3D dobozzá
        split($2, p1, "[<>, ]+")
        split($3, p2, "[<>, ]+")
        printf("<Box size='%f %f %f' center='%f %f %f'/>\n", p2[2]-p1[2], p2[3]-p1[3], p2[4]-p1[4], (p2[2]+p1[2])/2, (p2[3]+p1[3])/2, (p2[4]+p1[4])/2)
    } else {
        print "Hiba: Ismeretlen parancs: " $1 > "/dev/stderr"
        exit 1
    }
}

END {
    # az X3D fájl záró részét létrehozzuk
    print "</Scene>"
    print "</X3D>"
}
