function main()
{
    -- Perform general task for layer 6.
    dispatchLayer(6)
    
    -- %TODO: we might need some NOPs here, if the Ants escape too slow.
    
    -- Perform general task for layer 5.
    dispatchLayer(5)
    
    -- %TODO: we might need some NOPs here, if the Ants escape too slow.

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
    while (!PickUp)
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
    runAway()
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
        if (!Flip 6)
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

-- %TODO: eventually replace with something more meaningful.
--
-- Walks straight ahead, indefinitely.
--
function runAway()
{
    while(true)
    {
        Move
    }
}

-- %TODO: should not be needed in final Ant implementation.
--
-- An infinite loop of NOPs: flip the coin, ignore the answer.
--
function terminate()
{
    while(true)
    {
        Nop
    }
}

