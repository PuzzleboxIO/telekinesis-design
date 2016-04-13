
// Puzzlebox Telekinesis
// component: Head
//
// by Puzzlebox Productions 
// http://puzzlebox.io/telekinesis
//
// Copyright Puzzlebox Productions, LLC (2015)

headset_width=20;
crop_y=100;

module import_head_skull() {

	// http://3dprint.nih.gov/discover/3dpx-001564
	// Data Source Computed Tomography (CT)

	translate([-52,175,-430])
	rotate([0,0,10]) {

		// Hollow Skull
		color("grey", 0.60) // Alpha channel floating point in range [0,1]
		import("../models/Number 5 Stroke/SKULL FINAL (4).stl", convexity=5);

		// Filling to encase vessels
// 		color("orange")
// 		import("Models/Number 5 Stroke/Skull filling (3).stl", convexity=5);

		// Vessels in brain
// 		color("yellow")
// 		import("../models/Number 5 Stroke/Stroke Vessels FINAL (1).stl", convexity=5);

	}

}


module import_head_vessels() {

	// http://3dprint.nih.gov/discover/3dpx-001564
	// Data Source Computed Tomography (CT)

	translate([-52,175,-430])
	rotate([0,0,10]) {

		// Hollow Skull
// 		color("grey", 0.60) // Alpha channel floating point in range [0,1]
// 		import("../models/Number 5 Stroke/SKULL FINAL (4).stl", convexity=5);

		// Filling to encase vessels
		color("orange")
		import("../models/Number 5 Stroke/Skull filling (3).stl", convexity=5);

		// Vessels in brain
// 		color("yellow")
// 		import("../models/Number 5 Stroke/Stroke Vessels FINAL (1).stl", convexity=5);

	}

}


module import_head_visible() {

	// http://3dprint.nih.gov/discover/3DPX-000010
	// Male head from Visible Human Project

	// Scale to match skull model
	scale_factor = 0.7;
	scale([scale_factor, scale_factor, scale_factor])
	
	translate([-200,200,160])
	rotate([-90,0,180])
	color("white", 0.60) // Alpha channel floating point in range [0,1]
	import("../models/Visible Male Head_0/head.stl", convexity=5);


}


module crop_head() {
	
// 	headset_width=20;
// 	crop_y=100;
	
// 	difference(){
// 		import_head_vessels();
		
		translate([0,(crop_y/2)+(headset_width/2),20])
			cube([200,crop_y,200], center=true);

		translate([0,-(crop_y/2)-(headset_width/2),20])
			cube([200,crop_y,200], center=true);
			
		translate([0,0,-150])
			cube([200,400,300], center=true);
// 	}
}


module crop_headband(){
	
	difference() {
		difference() {
			import_head_vessels();
			
// 			crop_head();
			
// 			scale([0.8,1.2,0.8])
// 				crop_head();
			
		}
			scale([0.8,1.2,0.8])
				crop_head();
	}
}

import_head_skull();
// import_head_vessels();
// import_head_visible();
// crop_head();
// crop_headband();
