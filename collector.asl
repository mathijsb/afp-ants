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
	
	while(!Sense Here Food && !Sense Here Marker(3) && !Sense Here Home){moveCell()}
	if(Sense Here Food){collect()}
	else { 	if(Sense Here Marker(3)){followRoute(0,1,2)}
		}
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

if(Sense Here Marker(0)){ 
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
							if(Sense Ahead Marker(0)) { Mark 3
														moveCell()}
							else{
							Turn Left
							times(a,5){if(!Sense Ahead Marker(0)&& !Sense Ahead Marker(3)){Turn Left}}
							if(Sense Ahead Marker(0)) { Mark 3
														moveCell()}
							else{break}
							}
							}
else {
	if(Sense Here Marker(2)){ 
							if(Sense Ahead Marker(1)) { Mark 3
														moveCell()}
							else{	
							Turn Left						
							times(a,5){if(!Sense Ahead Marker(1)){Turn Left}}
							if(Sense Ahead Marker(1)) { Mark 3
														moveCell()}
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

if(Sense Here Marker(0)||Sense Here Marker(3)){senseALRH(2)}
else { if(Sense Here Marker(1)){  
							if( Sense Ahead Marker(0)||Sense Ahead Marker(3)) {moveCell()}
							else {
								Turn Left
								times(a,5){if(!Sense Ahead Marker(0) && !Sense Ahead Marker(3)){Turn Left}}
								moveCell()
								}
							}
	else { 
		if(Sense Here Marker(2)){senseALR(1)}
	
		else {
				moveCell()
				while(noMarkHere()){moveCell()}
			}
	}
}
}



function senseALR(i) {

	if(Sense Ahead Marker(i)) {moveCell()}
	else {
		if(Sense LeftAhead Marker(i)){	Turn Left
										moveCell()}
		else{
			if(Sense RightAhead Marker(i)){ Turn Right
											moveCell()}
			else{
				turnaround()
				if( Sense Ahead Marker(i)) {moveCell()}
				else {
					if(Sense LeftAhead Marker(i)){	Turn Left
													moveCell()}
					else {
						if(Sense RightAhead Marker(i)){	Turn Right
														moveCell()}
						else{ 	turnaround()
								moveCell()}
						}
					}
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

function followRoute(a,b,c) {

if(Sense Here Marker(3)){
	if(Sense Here Marker(a)){ 
							senseALR(b)
							}
	else {
	if(Sense Here Marker(c)){ 
							senseALR(a)
							}
	else {
	if(Sense Here Marker(b)){ 
							senseALR(c)
							}
	else {
	if(Sense Here Food){collect()}
	
	else {
		lookAroundForFood()
	}
	}
	}
	}
	}
else{ lookAroundForFood()}
}

function lookAroundForFood() {

	if(Sense Ahead Food) {moveCell()
						  collect()}
	else {
		if(Sense LeftAhead Food){	
									Turn Left
										moveCell()
										collect()}
		else{
			if(Sense RightAhead Food){ Turn Right
											moveCell()
											collect()}
			else{
				turnaround()
				if( Sense Ahead Food) {moveCell()
										collect()}
				else {
					if(Sense LeftAhead Food){	Turn Left
													moveCell()
													collect()}
					else {
						if(Sense RightAhead Food){	Turn Right
														moveCell()
														collect()}
						else{ 	destroyPath() }
						}
					}
				}
			}
		}

}

function destroyPath() {
	
	while(!Sense Here Home){	senseALRH(3)
								Unmark 3}
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