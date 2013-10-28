--
-- Simple Ant specification in ASL (Ant Scripting Language)
--
-- This ant walks around, randomly altering its direction on obstacles, and 
-- alternates between finding food and retrieving food.
--

function main() {

    -- Iterate while navigating to the food.
    while (true) {
        if (Sense Here Home) {
            times(i, 3) {
                Turn Left
            }
        } else if (PickUp) {
            break
        }

        -- When a move is not possible randomly turn left or right
        -- until a move is possible
        while (!Move) {
            moveCell()
        }
    }

    -- Iterate while navigating home.
    while (!Sense Here Home) {
        moveCell()
    }

    Drop
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