include <MCAD/regular_shapes.scad>
$fn=128;

module section(high, width, topRound=1/2, bottomRound=3/4){
    halfHigh=high/2;
    halfWidth=width/2;
    topFilletD=width*topRound;
    bottomFilletD=width*bottomRound;
    linear_extrude(1){
        hull(){
            //bottom fillet
            translate([0, -(halfHigh-(bottomFilletD/2))]){
                circle(d=bottomFilletD);
            }
            //right top fillet
            translate([(halfWidth-(topFilletD/2)), (halfHigh-(topFilletD/2))]){
                circle(d=topFilletD);
            }
            //left top fillet
            translate([-(halfWidth-(topFilletD/2)), (halfHigh-(topFilletD/2))]){
                circle(d=topFilletD);
            }
        }
    }
}
module tail(high, width, lengh) {
    coef=0;
    mirror([0,0,1])
    translate([0,0,-lengh])
    hull(){
        for (i = [0:3:lengh]) {
            coef=sqrt(i/lengh);
            echo("tail coef=", coef);
            translate([0,0,i]){
                section(high*coef,width*coef, topRound=7/8);
            }
        }
    }
}
module head(high, width, lengh) {
    coef=0;
    sphereD = min(high, width, lengh)/2;   
    sphereR = sphereD/2;
    translate([0,0,-lengh])
    hull(){
        translate([0,0,sphereR]){
            sphere(sphereR);
        }
        for (i = [0:3:lengh]) {
            coef=sqrt(sqrt(i/lengh));
            echo("head coef=", coef);
            if(i >= sphereD) {
                translate([0,0,i]){
                    section(high*coef,width*coef, topRound=7/8);
                }
            }
        }
    }
}
module groove(d, r, angle){
    rotate([0,90,0])
    translate([0, -r, 0])
    difference() {
        cutAngle=(180-angle)/2;
        rotate_extrude(){
            translate([r, 0, 0])
            circle(d=d);
        }
        rotate([90,0,cutAngle]) {
            linear_extrude(height=r*4){
                square(r*4, true);
            }
        }
        rotate([90,0,-cutAngle]) {
            linear_extrude(height=r*4){
                square(r*4, true);
            }
        }
    }
}

module bait(){
    difference(){
        hull(){
            head(17,15,35);
            tail(17,15,35);
        }
        translate([0,4,0])
        groove(2, 100, 25);
    }
}

projection(cut = true){
    translate([0,0,$t*10])
    rotate([0,90,0])
    bait();
}    
echo(time=$t);
