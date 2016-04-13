
// Puzzlebox Telekinesis
// component: CZ (Feet)
//
// by Puzzlebox Productions 
// http://puzzlebox.io/telekinesis
//
// Copyright Puzzlebox Productions, LLC (2016)


include <../Configuration.scad>


// ##################################################################

module pcb() {
	
	color("darkgreen", 0.8)
		cube([pcb_length, pcb_width, pcb_height], center=true);
	
	translate([0,
	           (-pcb_width/2) + (pcb_header_pins_width/2),
	           pcb_head_pins_height])
	color("darkgrey", 0.8)
		cube([pcb_header_pins_length, pcb_header_pins_width, pcb_head_pins_height], center=true);
	
	
}

// ##################################################################

pcb();