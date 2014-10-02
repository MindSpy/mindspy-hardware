
angle = 2*pi/8;
mr = [
      [cos(angle), -sin(angle)],
      [sin(angle),  cos(angle)]
     ];
r = mr;
i = [8, 0];


for (i = [
[0, 8],
[-5.65685424,  5.65685424],
[-8.00000000,  0.00000000],
[-5.65685422, -5.65685422],
[ 0.00000000, -8.00000000],
[ 5.65685420, -5.65685420],
[ 8.00000000,  0.00000000],
[ 5.65685418,  5.65685418]
]) {
translate(v=[i[0],i[1],0])
translate(v=[0,0,3.5]) {
cylinder(h = 7, r = 0.8, center = true, $fn = 100) ;
translate(v=[0,0,3.5]) {
	sphere(r = 0.5, center = true, $fn = 100);
}
}
}
translate(v=[0,0,0.5]) {
#cylinder(h=1, r=9.5, center=true, $fn = 100);
}