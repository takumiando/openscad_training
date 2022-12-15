module test_cube(width, depth, height) {
    difference() {
        cube([width, depth, height]);
        translate([width/2, depth/2, 0]) {
            if (width > depth) {
                cylinder(height+1, depth/4, depth/4, $fn=120);
            } else {
                cylinder(height+1, width/4, width/4, $fn=120);
            }
        }
    }
}

translate([0, 0, 0])
    rotate([0, 0, 0])
        test_cube(20, 20, 20);

translate([40, 0, 0])
    rotate([0, -45, 0])
        test_cube(20, 20, 20);

translate([80, 10, 0])
    rotate([45, -45, 0])
        test_cube(20, 20, 20);

translate([10, 40, 10])
    sphere(10, $fn=360);

translate([40, 40, 0])
    difference() {
        cylinder(20, 10, 10, $fn=6);
        cylinder(30, 5, 5, $fn=120);
    }

translate([80, 40, 0])
    cylinder(20, 10, 0, $fn=360);
