// https://en.wikibooks.org/wiki/OpenSCAD_User_Manual/MCAD#MCAD/involute_gears.scad

use <MCAD/involute_gears.scad>

base = false;
gears = false;
module gear_thing() {
    union() {
    linear_extrude(4) gear(bore_diameter=2.1,number_of_teeth=30, circular_pitch=100 , flat=true);

     translate([0,0,-4]) linear_extrude(4) gear(bore_diameter=2.1,number_of_teeth=60, circular_pitch=100, flat=true);
    }
}


// distance between gears (diameter) 
// number_of_teeth * circular_pitch / 180;

small_gear_diam = (30 * 100) / 180;
large_gear_diam = (60 * 100) / 180;
jmp_distance = large_gear_diam-(small_gear_diam/2);

/*
pitch_apex1 = outside_pitch_radius2 * sin (axis_angle) +
		(outside_pitch_radius2 * cos (axis_angle) + outside_pitch_radius1) / tan (axis_angle);


cone_distance = sqrt (pow (pitch_apex1, 2) + pow (outside_pitch_radius1, 2));
*/


if (gears) {
translate([0,0,8]) gear_thing();

translate([jmp_distance,0,12]) rotate([0,0,10])  gear_thing();
translate([jmp_distance*2,0,16]) rotate([0,0,10])  gear_thing();
}





if (base) {

    difference() {
    
     // the bases
    union() {
     translate([-10,-jmp_distance/2,0])  cube([jmp_distance * 3,jmp_distance,4]);
     translate([jmp_distance,0,0])   cylinder(h=8, r=small_gear_diam/3);
     translate([jmp_distance*2,0,0])   cylinder(h=12, r=small_gear_diam/3);
    }

    // the holes
    union() {
             translate([0,0,-1]) cylinder(h=20, d=2);
     translate([jmp_distance,0,-1]) cylinder(h=20, d=2);
        translate([jmp_distance*2,0,-1]) cylinder(h=20, d=2);
    }
    }
    
}     
