
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
            #translate([(halfWidth-(topFilletD/2)), (halfHigh-(topFilletD/2))]){
                circle(d=topFilletD);
            }
            //left top fillet
            translate([-(halfWidth-(topFilletD/2)), (halfHigh-(topFilletD/2))]){
                circle(d=topFilletD);
            }
        }
    }
}
module bait(high, width, lengh) {
    hull(){
        section(high, width, topRound=7/8);
        translate([0,1,lengh/4]){
            section(18,18, topRound=7/8);
        }
        translate([0,5,lengh*7/16]){
            section(10,10, topRound=7/8);
        }
        translate([0,8,lengh/2]) {
            sphere(2);
        }
    }
}
bait(20,20,75);
echo(version=version());
