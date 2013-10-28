function main()
{
    -- Perform general task for layer 6.
    dispatchLayer(6)
    
    -- %TODO: we might need some NOPs here, if the Ants escape too slow.
    
    -- Perform general task for layer 5.
    dispatchLayer(5)
    
    -- %TODO: we might need some NOPs here, if the Ants escape too slow.

    -- Perform general task for layer 4, except for the corners and their
    -- clockwise neighbours, which have a special purpose.
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
            -- Not a corner, fulfill general task.
            Turn Right
            layerTask(4)
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
            times(i, 2) { ensureMove() }
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

    terminate()
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
    while(true)
    {
        while (Sense Ahead Foe)
        {
            Mark 5
        }
        Unmark 5
    }
}

function defendFrontR()
{
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

