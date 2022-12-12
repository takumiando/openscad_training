module punched_hole_mesh(r, pitch, fn, gap, width, depth, height) {
    difference() {
        cube([width, depth, height]);
        for (x = [gap+r : pitch : width-gap-r/2]) {
            for (y = [gap+r : pitch*sqrt(3) : depth-gap-r/2]) {
                translate([x, y, -1])
                    rotate([0, 0, 90])
                        cylinder(height+2, r, r, $fn=fn);
            }
        }
        for (x = [gap+r+pitch/2 : pitch : width-gap-r/2]) {
            for (y = [gap+r+pitch/2*sqrt(3) : pitch*sqrt(3) : depth-gap-r/2]) {
                translate([x, y, -1])
                    rotate([0, 0, 90])
                        cylinder(height+2, r, r, $fn=fn);
            }
        }
    }
}

punched_hole_mesh(1, 3, 60, 2, 50, 50, 1);