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
											else{ 	if(Move){}
													else {break}
													
												}
										}
								else {break}
							}
						}
			else {break}
			}
				
}

function exploreWithoutMarking() {
	
	while(!Sense Here Food && !Sense Here Home){moveCell()}
	if(Sense Here Food){collect()}
}

function collect() {

	PickUp
	turnaround()
	while(!Sense Here Home){goHome()}
	Drop
	turnaround()
	break
	
}	

function goHome() {

if(Sense Here Marker(0)){senseALRH(2)}
else { if(Sense Here Marker(1)){ senseALRH(0)
							}
	else { 
		if(Sense Here Marker(2)){senseALRH(1)}
	
		else {
				moveCell()
				while(noMarkHere()){moveCell()}
			}
	}
}
}

function senseALRH(i) {

	if(Sense Ahead Marker(i)||Sense Ahead Home) {moveCell()}
	else {
		if(Sense LeftAhead Marker(i)||Sense Ahead Home){Turn Left
														moveCell()}
		else{
			if(Sense RightAhead Marker(i)||Sense Ahead Home){	Turn Right
																moveCell()}
			else{
				turnaround()
				if( Sense Ahead Marker(i)||Sense Ahead Home) {moveCell()}
				else {
					if(Sense LeftAhead Marker(i)||Sense Ahead Home){Turn Left
																	moveCell()}
					else {
						if(Sense RightAhead Marker(i)||Sense Ahead Home){	Turn Right
																			moveCell()}
						else{ 	turnaround()
								moveCell()}
						}
					}
				}
			}
		}

}


function noMarkHere() {
	!Sense Here Marker(0)&& !Sense Here Marker(1)&& !Sense Here Marker(2)
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