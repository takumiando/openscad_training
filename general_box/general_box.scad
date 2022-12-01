module general_box(width,depth,height) {
    $fn=360;

    module stud(height, r) {
        difference() {
            union() {
                cylinder(height,r*0.8,r*0.8);
                cylinder(height-1,r,r);
            }
            cylinder(height+1,1,1);
        }
    }

    module box(width, depth, height) {
        difference() {
            cube([width,depth,height-1]);
            translate([1,1,2])
                cube([width-2,depth-2,height]);
        }

        difference() {
            translate([1,1,0])
                cube([width-2,depth-2,height]);
            translate([2,2,2])
                cube([width-4,depth-4,height]);
        }
    }

    union() {
        box(width, depth, height);
        translate([5,5,0])
            stud(height,2);
        translate([5,depth-5,0])
            stud(height,2);
        translate([width-5,5,0])
            stud(height,2);
        translate([width-5,depth-5,0])
            stud(height,2);
    }
}

general_box(50,50,15);
