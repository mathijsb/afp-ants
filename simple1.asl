    function main() {
    	--if ((Flip 2 || Flip 3) && (Flip 4 || Flip 6)) {
        	--Sense Here Home
    	--}

    	--times (i, 4) {
    	--	if (i==4) {
    	--	    Sense Here Home
    	--	}
    	--}

    	--if (Sense Here Marker(3)) {
    	--	Move
    	--} else if (Sense Here Marker(2)) {
    	--	Move
    	--} else {
    	--	Move
    	--}

    	-- movetimes(3)

    	--while(!(Sense Here Marker(0) && Sense Here Marker(1)) || !(Sense Here Marker(2) || Sense Here Marker(3))) {
    	--	Move
    	--}

    	sensemarker(0)
    	sensemarker(1)
    }

    function sensemarker(i) {
    	Sense Here Marker(i)
    }

    function movetimes(i) {
    	if (i < 3) {
    		Sense Here Home
    	}
    }