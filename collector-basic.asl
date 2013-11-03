--Collector ant
--the goal of this ant is to gather food

function main() { 
	
	--Leave the anthill
	while(Sense Here Home) { turnMoveCell() }
	
	--Explore the world, while marking the way home
	while(!Sense Here Food) {explore()}
	
	--Explore further by random walking, until food or home is found
	while(!Sense Here Food && !Sense Here Home){moveCell()}
	
	--We have have arrived either back where we started from, or at food
	--If we found food, we collect, else we end, and start over again
	if(Sense Here Food){collect()}
	
	}

function explore() {

	--Place markers in the order 0,1,2.
	--Have we arrived at food? Then we stop
	--Can't we move forward? Then we stop 

	if(noMarkHere()) {Mark 0}
	if(Move) { 	
		if(noMarkHere()) {Mark 1}
		if(Sense Here Food) {break}
		if(Move) {  if(noMarkHere()) {Mark 2}
			if(Sense Here Food) {break}
			if(Move){ }
			else {break}
			}
		else {break}
		}
	else {break}
				
}

function collect() {

	--We have arrived at food
	--All we do here is pick it up
	PickUp
	
	--Turn around and search for our anthill with goHome()
	turnaround()
	while(!Sense Here Home){goHome()}
	
	--Drop the food, and get ready to explore again
	Drop
	turnaround()
	
}	

function goHome() {

--We sense what marker the ant stands on, if any.
--If we found a marker, we look around for the previous one, as this will lead us home

if(Sense Here Marker(0)){tryMoveToMarker(2)}
else { if(Sense Here Marker(1)){ tryMoveToMarker(0)}
	else { 
		if(Sense Here Marker(2)){ tryMoveToMarker(1)}
		else {	moveCell()
				--If the ant does not stand on a marker, it walks until it does.
				while(noMarkHere()){moveCell()}
			}
		}
	}
}

function tryMoveToMarker(i) {

	--this function senses around for a marker and moves to it.
	
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