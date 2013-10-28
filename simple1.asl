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

    	--sensemarker(0, 1)
    	--sensemarker(1, 0)

    	sensenmarkers(4)
    }
    function sensenmarkers(i) {
    	times (j, i) {
    		Sense Here Marker(j)
    	}
    }

    function sensemarker(i, j) {
    	anothersensemarker(i, j)
    }
    function anothersensemarker(i, j) {
    	Sense Here Marker(j)
    }

    function movetimes(i) {
    	if (i < 3) {
    		Sense Here Home
    	}
    }