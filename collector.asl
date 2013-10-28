--Collector ant
--the goal of this ant is to gather food

function main() { 
	
	while(Sense Here Home) { turnMoveCell() }
	while(!Sense Here Home) {explore()}
	while(!Sense Here Home) {exploreWithoutMarking()}
	
	}

function explore() {

	if(noMarkHere()) {Mark 0}
	if(Sense Ahead Food && !Sense Ahead Home && Move) { if(noMarkHere()) {Mark 1}
														collect() } 
	else {	if(Move){	if(noMarkHere()) {Mark 1}
						if(Sense Ahead Food && !Sense Ahead Home && Move) { if(noMarkHere()) {Mark 2}
																			collect() }
						else {	if(Move){	if(noMarkHere()) {Mark 2}
											if(Sense Ahead Food && !Sense Ahead Home && Move) {	if(noMarkHere()) {Mark 0}
																								collect() }
										}
								else {break}
							}
						}
			else {break}
			}
				
}

function exploreWithoutMarking() {

	while(!Sense Here Food && !Sense Here Home){followRoute(3,1,2)}
	if(Sense Here Food){collect()}
}

function collect() {

	PickUp
	turnaround()
	while(!Sense Here Home){goHomeAndMark()}
	while(!Sense Here Home){goHome()}
	Drop
	turnaround()
	break
	
}	

function goHomeAndMark() {

if(Sense Here Marker(0)||Sense Here Marker(3)){ 
							if(Sense Ahead Marker(2)) {	Mark 3
																				moveCell()}
							else{
								Turn Left
								times(a,5){if(!Sense Ahead Marker(2)){Turn Left}}
								if(Sense Ahead Marker(2)) { Mark 3
																					moveCell()}
								else{break}
								}
							}
else {
	if(Sense Here Marker(1)){ 
							if(Sense Ahead Marker(0)||Sense Ahead Marker(3)) {moveCell()}
							else{
							Turn Left
							times(a,5){if(!Sense Ahead Marker(0)&& !Sense Ahead Marker(3)){Turn Left}}
							if(Sense Ahead Marker(0)||Sense Ahead Marker(3)) {moveCell()}
							else{break}
							}
							}
else {
	if(Sense Here Marker(2)){ 
							if(Sense Ahead Marker(1)) { moveCell()}
							else{	
							Turn Left						
							times(a,5){if(!Sense Ahead Marker(1)){Turn Left}}
							if(Sense Ahead Marker(1)) {moveCell()}
							else{break}
							}
							}
	else {
		moveCell()
		break}
	}
	}

}

function goHome() {

if(Sense Here Marker(0)||Sense Here Marker(3)){
							if( Sense Ahead Marker(2)) {moveCell()}
							else {
								Turn Left
								times(a,5){if(!Sense Ahead Marker(2)){Turn Left}}
								moveCell()
								}
							}
else {
	if(Sense Here Marker(1)){  
							if( Sense Ahead Marker(0)||Sense Ahead Marker(3)) {moveCell()}
							else {
								Turn Left
								times(a,5){if(!Sense Ahead Marker(0) && !Sense Ahead Marker(3)){Turn Left}}
								moveCell()
								}
							}
else {
	if(Sense Here Marker(2)){ 
							if( Sense Ahead Marker(1)) {moveCell()}
							else {
								Turn Left
								times(a,5){if(!Sense Ahead Marker(1)){Turn Left}}
								moveCell()
								}
							}
	else {
		moveCell()
		while(noMarkHere()){moveCell()}}
	}
	}
}

function followRoute(a,b,c) {

if(Sense Here Marker(a)){ 
							times(q,6){if(!Sense Ahead Marker(b)){Turn Left}}
							moveCell()
							}
else {
	if(Sense Here Marker(c)){ 
							times(q,6){if(!Sense Ahead Marker(a)){Turn Left}}
							moveCell()
							}
else {
	if(Sense Here Marker(b)){ 
							times(q,6){if(!Sense Ahead Marker(c)){Turn Left}}
							moveCell()
							}
	else {
		moveCell()
		while(noFoodMarkHere()&& !Sense Here Food){moveCell()}}
	}
	}
}

function noMarkHere() {
	!Sense Here Marker(0)&& !Sense Here Marker(1)&& !Sense Here Marker(2)&& !Sense Here Marker(3)
}
function noFoodMarkHere() {
	!Sense Here Marker(3)
}
function moveCell() {

    -- When a move is not possible randomly turn left or right
    -- until a move is possible
    while (!Move) {
        if (Flip 2) {
            Turn Right
        } else {
            Turn Left
        }
    }
}

function turnMoveCell() {

        if (Flip 2) {
            while (!Move) {Turn Right}
        } else {
            while (!Move) {Turn Left}
        }
    
}

function turnaround() {
	Turn Left
	Turn Left
	Turn Left
}