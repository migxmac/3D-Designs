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

psHeight = 51; // actual 50mm
psWidth = 111; // actual 110mm
psDepth = 75; // how 'tall' to make the cover
switchHeight = 47.5; // actual 47.2mm
switchWidth = 27; // actual 26.7mm
switchDepth = 30; // actual 30.5mm (22mm excluding connection tabs)
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
    translate([psWidth + 1.5*thickness, psHeight+thickness,0]) {
        rotate([90, 0, -90 ]) {
            acSwitchSupport();
        }
    }
}

module dcHole() {
    translate([thickness+1,dcOutWidth+3*thickness, 3*thickness]) { 
        rotate([90,0,-90]) {
            cube([dcOutWidth,dcOutHeight,thickness+2]);
        }
    }
}

module acSwitchSupport() {
    difference() {
        cube([switchHeight+2*thickness, switchWidth+2*thickness, switchDepth ]);
        translate([thickness, thickness, 0]) cube([switchHeight, switchWidth, switchDepth]);
    }
}