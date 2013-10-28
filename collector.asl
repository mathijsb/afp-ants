--Collector ant
--the goal of this ant is to gather food

function main() { 
	
	while(Sense Here Home) { moveCell() }
	explore()
	}

function explore() {

	if(noMarkHere()) {Mark 0}
	if(Sense Ahead Food && !Sense Ahead Home) { collect() } 
	else {	if(Move){	if(noMarkHere()) {Mark 1}
						if(Sense Ahead Food && !Sense Ahead Home) {collect() }
						else {	if(Move){	if(noMarkHere()) {Mark 2}
											if(Sense Ahead Food && !Sense Ahead Home) {collect() }
										}
								else {exploreWithoutMarking()}
							}
						}
			else {exploreWithoutMarking()}
			}
				
}

function exploreWithoutMarking() {

	while(!Sense Here Food && !Sense Here Home){moveCell()}
	if(Sense Here Food){collect()}
}

function collect() {

	Move
	PickUp
	turnaround()
	moveCell()
	while(!Sense Here Home){goHome()}
	Drop
	turnaround()
	
}	

function goHome() {

if(Sense Here Marker(0)){ 
							times(a,6){if(!Sense Ahead Marker(2)){Turn Left}}
							moveCell()
							}
else {
	if(Sense Here Marker(1)){ 
							times(a,6){if(!Sense Ahead Marker(0)){Turn Left}}
							moveCell()
							}
else {
	if(Sense Here Marker(2)){ 
							times(a,6){if(!Sense Ahead Marker(1)){Turn Left}}
							moveCell()
							}
	else {
		while(noMarkHere()){moveCell()}}
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

function turnaround() {
	Turn Left
	Turn Left
	Turn Left
}