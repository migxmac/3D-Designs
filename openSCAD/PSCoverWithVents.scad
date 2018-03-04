/**
*  Powersupply End Cover for non vented power supply
*   Created for use with the power supply provided
*   with a 2017 Tevo Tarantula i3 3D printer where the PS
*   has no vents for air intake except at the terminal 
*   block end. The fan is mounted at the other end and
*   blows air out of the unit.
*  
*  Designed to stand on it's end.
*
*
*
*
**/



// Create variables for the size of the power supply
// include fudge factor for plastic contraction

psHeight = 51;
psWidth = 111;
psDepth = 75; // how 'tall' to make the cover
//switchHeight
//switchWidth

dcOutWidth=17;
dcOutHeight=16;

thickness=3;
/*===============Execute===================*/

// translate([0,(psHeight/2)]) 
cover();

/*===============Modules====================*/

module cover() {
    difference() {
        cube([psWidth + thickness, psHeight + thickness ,psDepth]);
        translate([thickness/2,thickness/2,thickness/2]) cube([psWidth,psHeight,psDepth]);
        dcHole();
    }
}

module dcHole() {
    translate([thickness+1,dcOutWidth+3*thickness, 3*thickness]) { 
        rotate([90,0,-90]) {
            cube([dcOutWidth,dcOutHeight,thickness+2]);
        }
    }
}