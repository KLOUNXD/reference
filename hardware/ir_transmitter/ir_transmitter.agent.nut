/*
Copyright (C) 2013 electric imp, inc.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software 
and associated documentation files (the "Software"), to deal in the Software without restriction, 
including without limitation the rights to use, copy, modify, merge, publish, distribute, 
sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is 
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial 
portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, 
INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE 
AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, 
DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, 
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
*/

/* 
 * Tom Buttner
 * tom@electricimp.com
 */

 server.log("Agent Running at "+http.agenturl());

 codes <- {
	SAMSUNG_AA59_00600A = {
		START_TIME_HIGH 	= 4500,
		START_TIME_LOW 		= 4500,
		PULSE_TIME			= 600,
		TIME_LOW_1			= 1700,
		TIME_LOW_0			= 600,
		CARRIER				= 38000,
		PAUSE_BETWEEN_SENDS = 0.05,
		pwr					= "111000001110000001000000101111111",
		src 				= "111000001110000010000000011111111",
		one					= "111000001110000000100000110111111",
		two 				= "111000001110000010100000010111111",
		three 				= "111000001110000001100000100111111",
		four 				= "111000001110000000010000111011111",
		five 				= "111000001110000010010000011011111",
		six 				= "111000001110000001010000101011111",
		seven  				= "111000001110000000110000110011111",
		eight 				= "111000001110000010110000010011111",
		nine 				= "111000001110000001110000100011111",
		minus 				= "111000001110000011000100001110111",
		zero				= "111000001110000010001000011101111",
		pre_ch				= "111000001110000011001000001101111",
		vol_up				= "111000001110000011100000000111111",
		mute 				= "111000001110000011110000000011111",
		ch_up				= "111000001110000001001000101101111",
		vol_dn				= "111000001110000011010000001011111",
		ch_list				= "111000001110000011010110001010011",
		ch_dn 				= "111000001110000000001000111101111",
		media_p				= "111000001110000000110001110011101",
		menu				= "111000001110000001011000101001111",
		sleep				= "111000001110000011000000001111111",
		tools				= "111000001110000011010010001011011",
		up					= "111000001110000000000110111110011",
		info				= "111000001110000011111000000001111",
		left				= "111000001110000010100110010110011",
		enter				= "111000001110000000010110111010011",
		right				= "111000001110000001000110101110011",
		back				= "111000001110000000011010111001011",
		down				= "111000001110000010000110011110011",
		exit 				= "111000001110000010110100010010111",
		A					= "111000001110000000110110110010011",
		B					= "111000001110000000101000110101111",
		C					= "111000001110000010101000010101111",
		D					= "111000001110000001101000100101111",
		p_size				= "111000001110000001111100100000111",
		mts					= "111000001110000000000000111111111",
		cc					= "111000001110000010100100010110111",
		stop				= "111000001110000001100010100111011",
		rew					= "111000001110000010100010010111011",
		play				= "111000001110000011100010000111011",
		pause				= "111000001110000001010010101011011",
		ff					= "111000001110000000010010111011011"
	},

	SANYO_4VPIS4U = {
		START_TIME_HIGH 	= 3300,
		START_TIME_LOW		= 1700,
		PULSE_TIME 			= 420,
		TIME_LOW_1			= 1200,
		TIME_LOW_0			= 420,
		CARRIER				= 38000,
		PAUSE_BETWEEN_SENDS = 0.05,
		on 					= "1000000100000000000101000000000010111011001000001000011000001011111000100000001100000110000010001001000001000000000000000100000000000000000000000001001101",
		off 				= "1000000100000000000101000000000010111011010000001000011000001011111000000000001100000110000010001001000001000000000000000100000000000000000000000100001101",
		one_hour			= "1000000100000000000101000000000010111011001001001000011000001011111000100100110010000110000010001001110001000000000000000100000000000000000000000010111101",
		set_temp_60			= "1000000100000000000101000000000010111011000000001000110000001011111000100000000000000110001010001001000001000000000000000100000000000000000000000011101101",
		set_temp_62			= "1000000100000000000101000000000010111011000000001010110000001011111000100000001100000110001110001001000001000000000000000100000000000000000000000000011101",
		set_temp_64			= "1000000100000000000101000000000010111011000000001001110000001011111000100000001100000110001110001001000001000000000000000100000000000000000000000010011101",
		set_temp_66			= "1000000100000000000101000000000010111011000000001011110000001011110000100000000100000110010110001001000001000000000000000100000000000000000000000110011101",
		set_temp_68 		= "1000000100000000000101000000000010010011000000001000001000001011111000100000001100000110010110001001000001000000000000000100000000000000000000000011001101",
		set_temp_70			= "1000000100000000000101000000000010111011000000001010001000001011111000100000001100000110010010001001000001000000000000000100000000000000000000000001001101",
		set_temp_72			= "1000000100000000000101000000000010111011000000001001001000001011111000100000001100000110001010001001000001000000000000000100000000000000000000000111001101",
		set_temp_74			= "1000000100000000000101000000000010111011000000001011001000001011111000100000001100000110001010001001000001000000000000000100000000000000000000000100101101",
		set_temp_76			= "1000000100000000000101000000000010111011000000001010101000001011111000100000001100000110011010001001000001000000000000000100000000000000000000000011101101",
		set_temp_78			= "1000000100000000000101000000000010111011000000001011101000001011111000100000001100000110011010001001000000000000000000000100000000000000000000000010011101",
		set_temp_82 		= "1000000100000000000101000000000010101011000000001000011000001011111000100000001100000110011010001001000001000000000000000100000000000000000000000101001101",
		cancel 				= "1000000100000000000101000000000010111011000000001000110000001011100000100000000000000110011110001001000000000000000000000100000000000000000000000111101101",
	},

	UNKNOWN = {

	}
}

http.onrequest(function(request, res) {
    server.log("Agent got new HTTP Request");
    // we need to set headers and respond to empty requests as they are usually preflight checks
    res.header("Access-Control-Allow-Origin", "*");
    res.header("Access-Control-Allow-Headers","Origin, X-Requested-With, Content-Type, Accept");
    res.header("Access-Control-Allow-Methods", "POST, GET, OPTIONS");

    if (request.path == "/sendcode") {
    	local code = request.body;
    	server.log(format("Agent Requested to send code, length "+code.len()));
    	res.send(200, "OK\n");
    	device.send("send_code",code);
    } else if (request.path == "/settiming") {
    	
    	local targetdevice = request.body;
    	
    	if (targetdevice in codes) {
    		server.log("Instructing Device to set timing for "+targetdevice);
    		device.send("set_timing", codes[targetdevice]);
       		res.send(200, "OK\n");
    	} else {
    		res.send(204, "No codes known for device "+targetdevice);
    	}
    	
    } else {
        // send a generic response to prevent browser hang
        res.send(200, "OK\n");
    }
});