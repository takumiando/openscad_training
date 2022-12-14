$fn=120;

module rounded_cube(r, width, depth, height) {
    hull() {
        translate([r, r, r])
            sphere(r);
        translate([width-r, r, r])
            sphere(r);
        translate([r, depth-r, r])
            sphere(r);
        translate([width-r, depth-r, r])
            sphere(r);

        translate([r, r, height-r])
            cylinder(r, r, r);
        translate([width-r, r, height-r])
            cylinder(r, r, r);
        translate([r, depth-r, height-r])
            cylinder(r, r, r);
        translate([width-r, depth-r, height-r])
            cylinder(r, r, r);

        /*
        translate([r, r, height-r])
            sphere(r);
        translate([width-r, r, height-r])
            sphere(r);
        translate([r, depth-r, height-r])
            sphere(r);
        translate([width-r, depth-r, height-r])
            sphere(r);
        */
    }

}

module magnet_base(r, width, depth, height) {
    $fn=120;
    difference() {
        hull() {
            translate([r, r, 0])
                cylinder(height, r, r);
            translate([width-r, r, 0])
                cylinder(height, r, r);
            translate([r, depth-r, 0])
                cylinder(height, r, r);
            translate([width-r, depth-r, 0])
                cylinder(height, r, r);
        }
    }
}

module top(r, thickness, width, depth, height) {
    difference() {
        union() {
            difference() {
                rounded_cube(r, width, depth, height);
                translate([thickness/2, thickness/2, thickness/2])
                    rounded_cube(r, width-thickness, depth-thickness, height);
            }

            difference() {
                translate([thickness/2, thickness/2, thickness/2])
                    rounded_cube(r, width-thickness, depth-thickness, height-thickness);
                translate([thickness, thickness, thickness])
                    rounded_cube(r, width-thickness*2, depth-thickness*2, height);
            }

            translate([thickness/2, thickness/2, 0])
                rounded_cube(r, 10, 10, height-thickness/2);
            translate([width-10-thickness/2, depth-10-thickness/2, 0])
                rounded_cube(r, 10, 10, height-thickness/2);
        }

        translate([(thickness+10)/2, (thickness+10)/2, height-thickness/2-2.5])
            cylinder(3, 3, 3, $fn=120);

        translate([width-(thickness+10)/2, depth-(thickness+10)/2, height-thickness/2-2.5])
            cylinder(3, 3, 3, $fn=120);

        translate([(width-15)/2, 0, (height-1)/2])
            rotate([-90, 0, 0])
                translate([0, -2, 0])
                    rounded_cube(1, 15, 2, 1);

        translate([(width-15)/2, depth-2, (height-1)/2])
            rotate([90, 0, 0])
                translate([0, 0, -2])
                    rounded_cube(1, 15, 2, 1);
    }
}

module bottom(r, thickness, width, depth, height) {
    difference() {
        union() {
            difference() {
                rounded_cube(r, width, depth, height);
                translate([thickness/2, thickness/2, thickness/2])
                    rounded_cube(r, width-thickness, depth-thickness, height);
            }

            difference() {
                translate([thickness/2, thickness/2, thickness/2])
                    rounded_cube(r, width-thickness, depth-thickness, height);
                translate([thickness, thickness, thickness])
                    rounded_cube(r, width-thickness*2, depth-thickness*2, height);
            }

            translate([thickness/2, thickness/2, 0])
                rounded_cube(r, 10, 10, height+thickness/2);
            translate([width-10-thickness/2, depth-10-thickness/2, 0])
                rounded_cube(r, 10, 10, height+thickness/2);
        }

        translate([(thickness+10)/2, (thickness+10)/2, height+thickness/2-2.5])
            cylinder(3, 3, 3);

        translate([width-(thickness+10)/2, depth-(thickness+10)/2, height+thickness/2-2.5])
            cylinder(3, 3, 3);
    }
}

difference() {
    top(2, 3, 50, 50, 8);
    translate([41, 5, 0])
        linear_extrude(height=0.5)
            mirror([1, 0, 0])
                import("logo.svg");
}

translate([60, 0, 0])
    bottom(2, 3, 50, 50, 17);
