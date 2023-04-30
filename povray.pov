camera {
location <0, 2, -3>
look_at <0, 0, 0>
}

light_source {
<0, 2, -3>
color rgb<1, 1, 1>
}

plane {
<0, 1, 0>, 0
texture {
pigment { color rgb<0.8, 0.8, 0.8> }
}
}

box {
<-0.5, 0, -0.5>, <0.5, 1, 0.5>
texture {
pigment { color rgb<0.4, 0.4, 0.8> }
}
}