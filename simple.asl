--
-- Simple Ant specification in ASL (Ant Scripting Language)
--
-- This ant walks around, randomly altering its direction on obstacles, and 
-- alternates between finding food and retrieving food.
--

function main {
    while {
        if (Sense Here Home) {
            Turn Left
            Turn Left
            Turn Left
        } else {
            if (PickUp) {
                break
            }
        }

        while {
            if (Move) {
                break
            } else {
                if (Flip 2) {
                    Turn Right
                } else {
                    Turn Left
                }
            }
        }
    }

    while {
        if (Sense Here Home) {
            Drop
            break
        } else {
            if (Move) {
                
            } else {
                if (Flip 2) {
                    Turn Right
                } else {
                    Turn Left
                }
            }
        }
    }
}