// Példa POV-Ray fájl ASCII kódolásban

// Háttér színe
background { color rgb <0.2, 0.2, 0.2> }

// Fényforrások
light_source { <0, 20, -30> color rgb <1, 1, 1> }
light_source { <0, -20, -30> color rgb <1, 1, 1> }

// Objektumok
sphere { <0, 0, 0>, 2 texture { pigment { color rgb <1, 0, 0> } } }
plane { <0, 1, 0>, 0 texture { pigment { color rgb <0, 0.5, 0> } } }
box { <3, 3, 3>, <-3, -3, -3> texture { pigment { color rgb <0, 0, 1> } } }

// Kamera pozíciója és nézeti iránya
camera {
  location <0, 0, -10>
  look_at <0, 0, 0>
}
