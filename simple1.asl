    function main() {
    	--if ((Flip 2 || Flip 3) && (Flip 4 || Flip 6)) {
        	--Sense Here Home
    	--}

    	--times (i, 4) {
    	--	if (i==4) {
    	--	    Sense Here Home
    	--	}
    	--}

    	if (Sense Here Marker(3)) {
    		Move
    	} else if (Sense Here Marker(2)) {
    		Move
    	} else {
    		Move
    	}

    	-- movetimes(3)
    }

    function movetimes(i) {
    	if (i < 3) {
    		Sense Here Home
    	}
    }