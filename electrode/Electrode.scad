
// Puzzlebox Telekinesis
// component: Electrode
//
// by Puzzlebox Productions 
// http://puzzlebox.io/telekinesis
//
// Copyright Puzzlebox Productions, LLC (2015)


include <../Configuration.scad>


// ##################################################################

module snap_electrode_cognionics_female() {
	
	color("silver", 0.8) {
		translate([0,0,snap_electrode_cognionics_female_inner_height/2])
			cylinder(h=snap_electrode_cognionics_female_inner_height, d=snap_electrode_cognionics_female_inner_diameter, center=true, $fn=300);
		
		translate([0,0,snap_electrode_cognionics_female_outer_height/2])
			cylinder(h=snap_electrode_cognionics_female_outer_height, d=snap_electrode_cognionics_female_outer_diameter, center=true, $fn=300);
	}
	
}


// ##################################################################

module electrode_fri() {
	
	color("darkgrey", 0.9) {
// 	translate([0,0,electrode_fri_height/2])
		difference(){
			electrode_fri_exterior();
// 			cylinder(h=electrode_fri_height, d1=electrode_fri_diameter, d2=electrode_fri_mount_diameter, center=true, $fn=300);
// 			cylinder(h=electrode_fri_height+0.01, d=electrode_screw_diameter, center=true, $fn=300);
			cylinder(h=electrode_fri_height+0.01, d1=electrode_fri_skin_inner, d2=electrode_screw_diameter,  center=true, $fn=300);
// 			electrode_fri_crop();
		}
	}
}


// 

module electrode_fri_exterior(scale_fri=1.0) {
	
	scale(scale_fri, scale_fri, scale_fri)
		cylinder(h=electrode_fri_height, d1=electrode_fri_diameter, d2=electrode_fri_mount_diameter, center=true, $fn=300);
	
}

// ##################################################################

module lead_wire_fri_clip(clip_height=lead_wire_fri_clip_height) {
	
	clip = [[-lead_wire_fri_clip_length/2,0], // left
	        [0,-electrode_fri_mount_diameter], // bottom
	        [lead_wire_fri_clip_length/2,0], // right
	        [0,electrode_fri_mount_diameter] // top
	];
	
	color("gold", 1.0)
	difference() {
// 	linear_extrude(height = fanwidth, center = true, convexity = 10, twist = -fanrot, slices = 20, scale = 1.0)
		linear_extrude(height = clip_height, center = true)
			polygon(clip);
		
// 	electrode_fri();
// 		cylinder(h=electrode_fri_height, d1=electrode_fri_diameter, d2=electrode_fri_mount_diameter, center=true, $fn=300);
		electrode_fri_exterior();
		
	}
}


// ##################################################################

module electrode_mount() {
	
	
	mount_dimensions = [[-mount_length/2,0], // left
	        [0,-mount_width], // bottom
	        [mount_length/2,0], // right
	        [0,mount_width] // top
	];
	
	
	color("red", 0.75)
	
	
	difference(){
		
// 	translate([0,0,lead_wire_fri_clip_height])
		translate([0,0,lead_wire_fri_clip_height/2])
		translate([0,0,mount_height/2])
		
		difference(){
			
			linear_extrude(height = mount_height, center = true)
				polygon(mount_dimensions);
			
			cylinder(h=electrode_fri_height+0.01, d=electrode_screw_diameter, center=true, $fn=300);
			
		}
		
		
// 		electrode_fri();
			cylinder(h=electrode_fri_height, d1=electrode_fri_diameter, d2=electrode_fri_mount_diameter, center=true, $fn=300);
		
	}
	
}


// ##################################################################

translate([0,0,-lead_wire_fri_clip_height/2]) {
	// snap_electrode_cognionics_female();
	lead_wire_fri_clip();
	electrode_mount();
	electrode_fri();
}

