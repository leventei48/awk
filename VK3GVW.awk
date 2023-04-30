#!/usr/bin/awk -f

BEGIN {
  # X3D fájl fejléce
  printf("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n")
  printf("<!DOCTYPE X3D PUBLIC \"ISO//Web3D//DTD X3D 3.2//EN\" \"http://www.web3d.org/specifications/x3d-3.2.dtd\">\n")
  printf("<X3D version=\"3.2\" profile=\"Interchange\">\n")
  printf("<Scene>\n")

  # Háttér színe
  printf("<Background skyColor=\"0.2 0.2 0.2\" />\n")

  # Fényforrások
  printf("<PointLight location=\"0 20 -30\" color=\"1 1 1\" />\n")
  printf("<PointLight location=\"0 -20 -30\" color=\"1 1 1\" />\n")
}

# Objektumok
/sphere/ {
  # Gömb
  printf("<Sphere>\n")
  printf("  <Transform translation=\"%s\" />\n", $2)
  printf("  <Appearance>\n")
  printf("    <Material diffuseColor=\"%s\" />\n", $5)
  printf("  </Appearance>\n")
  printf("</Sphere>\n")
}

/plane/ {
  # Sík
  printf("<Shape>\n")
  printf("  <Transform rotation=\"1 0 0 -1.5708\" translation=\"%s\" />\n", $2)
  printf("  <Appearance>\n")
  printf("    <Material diffuseColor=\"%s\" />\n", $5)
  printf("  </Appearance>\n")
  printf("  <IndexedFaceSet solid=\"false\">\n")
  printf("    <Coordinate point=\"-10 -10 0 10 -10 0 -10 10 0 10 10 0\" />\n")
  printf("    <IndexedFaceSet normalPerVertex=\"false\">\n")
  printf("      <CoordinateIndex>0 1 3 2 -1</CoordinateIndex>\n")
  printf("    </IndexedFaceSet>\n")
  printf("  </IndexedFaceSet>\n")
  printf("</Shape>\n")
}

/box/ {
  # Téglatest
  printf("<Box>\n")
  printf("  <Transform translation=\"%s\" />\n", $2)
  printf("  <Appearance>\n")
  printf("    <Material diffuseColor=\"%s\" />\n", $5)
  printf("  </Appearance>\n")
  printf("</Box>\n")
}

END {
  # Kamera
  printf("<Viewpoint position=\"0 0 -10\" orientation=\"0 0 1 0\" />\n")
  
  # X3D fájl lezárása
  printf("</Scene>\n")
  printf("</X3D>\n")
}
