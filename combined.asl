function main()
{
    -- Perform general task for layer 6.
    dispatchLayer(6)
    
    -- %TODO: we might need some NOPs here, if the Ants escape too slow.
    times(i, 3) { Nop }
    
    -- Perform general task for layer 5.
    dispatchLayer(5)
    
    -- %TODO: we might need some NOPs here, if the Ants escape too slow.
    times(i, 3) { Nop }

    -- Perform general task for layer 4, except for the corners and their
    -- clockwise neighbours, which have a special purpose. %TODO: no longer general tasks for 4.
    orientOuter()
    if (!Sense Ahead Friend)
    {
        Turn Left
        if (Sense LeftAhead Friend)
        {
            Nop
            if (Sense LeftAhead Marker(5))
            {
                --
                -- Back right defender
                --
                -- --> -->
                -- -->
                -- ==> -->
                --
                ensureMove()
                while(!Sense Ahead Marker(5)) {}
                defendBackR()
            }
            else
            {
                -- Gather collected food as a special case.
                ensureMove()
                ensureMove()
                gatherCollectedFood()
            }
        }
        else
        {
            --
            -- Front right defender
            --
            -- --> -->
            -- -->
            -- --> ==>
            --
            Mark 5
            Nop
            Unmark 5
            ensureMove()
            Turn Right
            ensureMove()
            Turn Left
            Mark 5
            Unmark 5
            defendFrontR()
        }
    }
    times(i, 10) { Nop } -- %TODO: how many times? 10 is at least enough
    
    -- Initialize layer 3 for fully defensive purposes.
    orientOuter()
    if (!Sense Ahead Friend)
    {
        Turn Left
        if (Sense LeftAhead Friend)
        {
            Turn Right
            times(i, 3) { ensureMove() }
            defendFrontL()
        }
        else
        {
            ensureMove()
            Mark 3
            ensureMove()
            Mark 4
            defendCenter()
        }
    }
    times(i, 10) { Nop } -- %TODO: optimize (decrease while it still functions, 3 should be enough)
    
    orientOuter()
    if (!Sense Ahead Friend)
    {
        times(i, 3) { ensureMove() }
        defendBackL()
    }
    
    -- Hurray! I am the only Ant left (being the center one in the ant hill).
    -- I might need some help escaping the fortress, though.
    -- %TODO: let this poor, poor Ant do something useful.

    gatherCollectedFood()
}

function gatherCollectedFood()
{
    times(i, 30) { Nop }
    while(true)
    {
        pickupCollectedFood()
        saveCollectedFood()
    }
}

function pickupCollectedFood()
{
    while (Sense Here Marker(4) || !PickUp)
    {
        if (Sense Ahead Home && !Sense Ahead Friend && !Sense Ahead Marker(4))
        {
            if (!Move)
            {
                Turn Right
            }
        }
        else
        {
            Turn Right
        }
        if (Flip 10)
        {
            Turn Right
        }
    }
}

function saveCollectedFood()
{
    while (!Sense Here Marker(4))
    {
        if (Sense Here Marker(3))
        {
            while(!Sense Ahead Marker(4))
            {
                Turn Left
            }
        }
        if (Sense Ahead Home && !Sense Ahead Friend)
        {
            if (!Move)
            {
                Turn Right
            }
        }
        else
        {
            if (Flip 2)
            {
                Turn Right
            }
            else
            {
                Turn Left
            }
        }
        if (Flip 10)
        {
            Turn Right
        }
    }
    Drop
}

-- %TODO: implement for all non-defensive Ants
--
-- Non-returning function for each Ant, given its layer.
-- Any path in this function _MUST_ guarantee to be non-returning. If unsure,
-- add an appropriate call to 'terminate()', or use 'while(true)' constructions.
--
function layerTask(n)
{
    while(true)
    {
        mainExplore()
    }
}

--
-- Sends out a layer of Ants from the ant hill by orienting them and assigning
-- their layer task.
--
function dispatchLayer(n)
{
    orientOuter()
    if (!Sense Ahead Friend)
    {
        layerTask(n)
    }
}

--
-- Continuously tries to Move, and only returns when that succeeds.
--
function ensureMove()
{
    while(!Move) {}
}

function defendFrontL()
{
    ensureMove()
    Turn Right
    while(true)
    {
        while(!Sense RightAhead Marker(5)) {}
        Turn Left
        ensureMove()
        turnAround()
        ensureMove()
        times(i, 2) { Turn Left }
    }
}

function defendBackL()
{
    ensureMove()
    while(true)
    {
        ensureMove()
        turnAround()
        while(Sense LeftAhead Marker(5)) {}
        ensureMove()
        turnAround()
    }
}

function defendCenter()
{
    ensureMove()
    defendCenterKillEnemy()
    times(i, 2) { defendCenterFeedEnemy() }
    while(true)
    {
        defendCenterKillEnemy()
    }
}

function defendCenterKillEnemy()
{
    while (!Sense Ahead Foe)
    {
        if (!Flip 15)
        {
            if (Sense Ahead Food)
            {
                if (Move)
                {
                    PickUp
                    turnAround()
                    ensureMove()
                    Drop
                    turnAround()
                }
            }
        }
        else
        {
            turnAround()
            if (Sense Ahead Food)
            {
                if (Move)
                {
                    PickUp
                    turnAround()
                    ensureMove()
                    Drop
                }
                else
                {
                    turnAround()
                }
            }
            else
            {
                turnAround()
            }        
        }
    }
    while (Sense Ahead Foe)
    {
        Mark 5
    }
    Unmark 5
}

function defendCenterFeedEnemy()
{
    while (!Sense Ahead Foe)
    {
        if (Flip 15)
        {
            turnAround()
            if (Sense Ahead Food)
            {
                if (Move)
                {
                    PickUp
                    turnAround()
                    ensureMove()
                    Drop
                }
                else
                {
                    turnAround()
                }
            }
            else
            {
                turnAround()
            }
        }
    }
    while (Sense Ahead Foe) {}
}

function defendFrontR()
{
    ensureMove()
    Turn Left
    while(true)
    {
        while(!Sense LeftAhead Marker(5)) {}
        Turn Right
        ensureMove()
        turnAround()
        ensureMove()
        times(i, 2) { Turn Right }
    }
}

function defendBackR()
{
    ensureMove()
    while(true)
    {
        ensureMove()
        turnAround()
        while(Sense RightAhead Marker(5)) {}
        ensureMove()
        turnAround()
    }
}

function turnAround()
{
    times(i, 3)
    {
        Turn Left
    }
}

--
-- Assuming a perfect hexagonal Ant base, orients the outer layer of Ants to
-- face outwards. After orientation, all outer layer Ants are oriented in such
-- a way that they cannot be turned Right without seeing another Ant.
--
-- All inner Ants remain in their original orientation.
--
-- Outer layer Ants can afterwards be selected by '!Sense Ahead Friend'.
--
-- This function has the same number of steps for any Ant.
--
function orientOuter() {
    -- Stabilize environment
    Nop
    
    -- Turn each Ant such that it does not face outwards.
    if (!Sense Ahead Friend) {
        times(i, 3) { Turn Left }
    } else {
        times(i, 3) { Nop }
    }
    
    -- Turn each outer Ant just outwards.
    times(i, 6)
    {
        if (Sense Ahead Friend) {
            Turn Left
        } else {
            Nop
        }
    }    
}

--Collector ant
--the goal of this ant is to gather food

function mainExplore() { 
	
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
