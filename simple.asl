--
-- Simple Ant specification in ASL (Ant Scripting Language)
--
-- This ant walks around, randomly altering its direction on obstacles, and 
-- alternates between finding food and retrieving food.
--

function main {

    -- Iterate while navigating to the food.
    while {
        if (Sense Here Home) {
            Turn Left
            Turn Left
            Turn Left
        } else if (PickUp) {
            break
        }

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

    -- Iterate while navigating home.
    while (!Sense Here Home) {

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

    Drop
}