
// Puzzlebox Telekinesis
// component: C3 (Right Hand)
//
// by Puzzlebox Productions 
// http://puzzlebox.io/telekinesis
//
// Copyright Puzzlebox Productions, LLC (2016)


include <../Configuration.scad>
use <../electrode/Electrode.scad>
// use <../jumper_case/Jumper_Case.scad>


// ##################################################################

module import_electrode_mount() {
	
// 	translate([0,0,-lead_wire_fri_clip_height/2-mount_height/2]) {
	translate([0,0,-lead_wire_fri_clip_height/2]) {
		
// 		lead_wire_fri_clip();
		
		difference(){
		
		electrode_mount();
// 		import_electrode_mount_crop();
		
// 		electrode_fri();
		electrode_fri_exterior(frame_scale_fri);
		}
		
	}
	
}


// ##################################################################

module import_electrode_mount_crop() {
	
// 	translate([0,0,-lead_wire_fri_clip_height/2-mount_height/2]) {
	translate([0,0,-lead_wire_fri_clip_height/2]) {
		
		electrode_mount();
		
		electrode_fri_exterior(frame_scale_fri);
		
	}
	
}


// ##################################################################

module electrodes_c3() {
	
	// Center
	import_electrode_mount();
	
	// Top
	translate([0, head_small_distance_c3_to_c1, 0])
	rotate([0,0,90])
		import_electrode_mount();
	
	// Right
	translate([head_small_distance_c3_to_cp3, 0, 0])
		import_electrode_mount();
	
	// Bottom
	translate([0, -head_small_distance_c3_to_c5, 0])
		rotate([0,0,-90])
		import_electrode_mount();
	
	// Left
	translate([-head_small_distance_c3_to_fc3, 0, 0])
		import_electrode_mount();
	
}


// ##################################################################

module frame_c3(){
	
	electrodes_c3();
	
	// Top
	difference() {
		translate([0,head_small_distance_c3_to_c1/2,frame_height/2])
			cube(([frame_width_vertical,head_small_distance_c3_to_c1,frame_height]),center=true);
		
// 		import_electrode_mount_crop();
		
		electrode_fri_exterior(frame_scale_fri);
		
		translate([0,head_small_distance_c3_to_c1,0])
			electrode_fri_exterior(frame_scale_fri);
	}
	
	// Right
	difference() {
		translate([head_small_distance_c3_to_cp3/2,0,frame_height/2])
			cube(([head_small_distance_c3_to_cp3,frame_width_horizontal,frame_height]),center=true);
		
		electrode_fri_exterior(frame_scale_fri);
		
		translate([head_small_distance_c3_to_cp3,0,0])
			electrode_fri_exterior(frame_scale_fri);
	}
	
	// Bottom
	difference() {
		translate([0,-head_small_distance_c3_to_c5/2,frame_height/2])
			cube(([frame_width_vertical,head_small_distance_c3_to_c5,frame_height]),center=true);
		
		electrode_fri_exterior(frame_scale_fri);
		
		translate([0,-head_small_distance_c3_to_c5,0])
			electrode_fri_exterior(frame_scale_fri);
	}
	
	// Left
	difference() {
		translate([-head_small_distance_c3_to_fc3/2,0,frame_height/2])
			cube(([head_small_distance_c3_to_fc3,frame_width_horizontal,frame_height]),center=true);
		
		electrode_fri_exterior(frame_scale_fri);
		
		translate([-head_small_distance_c3_to_fc3,0,0])
			electrode_fri_exterior(frame_scale_fri);
	}
	
	
	// ORB
	if (c3_render_orb_frame)
	difference(){
		translate([head_small_distance_c3_to_cp3/2,0,4.25])
			rotate([0,0,90])
			import_orb_device_stp_case();
		
		translate([0,0,-10])
			cube([100,100,20], center=true);
	}
	
}


// ##################################################################


// import_electrode_mount();
// electrodes_c3();
frame_c3();