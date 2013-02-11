/**
* Svm_check.js
*    
* recognize performed exercise from given quaternion data, using calculated weights 
* and biases. Returns string with a name of the exercise 
* author: Aleksandra Nowak nola4@op.pl                                                                         
*
*/
/**
* Weight and bias values
*
* weights and biases for upper limb positions
* WPOS(position number) - weights
* BPOS(position number) - bias
*/
var WPOS10 = [0.218352213310456,1.48793093175625,-7.06406735278946,-4.19404920675286,0.169353848429231,1.90541469132908,-7.01720416842369,-4.32146539691378,0.210520629959273,2.34016934769887,-6.94608680668189,-4.40202768515432,0.320800709109018,2.70913580455625,-6.94025777521926,-4.43036106687903,0.407808385594383,2.93786817234207,-6.97154099011116,-4.64632072842264,0.629228983198341,3.03718824515879,-6.99803321772758,-4.41063786445829];
var BPOS10 = -0.307946347222057;
var WPOS11 = [-2.66276401799602,-3.73102531510293,3.10580146141763,-0.273521449492882,-2.64720381040872,-3.74707029683199,3.09095622931591,-0.300558534044868,-2.62904445127460,-3.77529982321436,3.05807404041666,-0.327078438996429,-2.62333139149231,-3.79943845466789,3.01445475527646,-0.337702513062471,-2.59637147775055,-3.81398305864014,2.94714921419406,0.0221145665148517,-2.61677674392716,-3.81521917409467,2.87344066581876,-0.314212060855174];
var BPOS11 = -0.470911309492670;


/** 
* weights and biases for lower limb positions
* WPOS(position number) - weights
* BPOS(position number) - bias
*/
var WPOS00 = [0.520704179790006,1.98340278971708,0.0505178602439742,0.578926878791378,-1.64815243566699,-0.478881644991143,-2.52124852323577,-1.10145178742084,1.74111009918487,-3.59882765893521,1.20876190902243,0.347222194672557];
var BPOS00 = -0.198309139889363;
var WPOS01 = [1.58196953033124,-2.48456831583316,2.45269420880207,1.98106987590908,-9.17000208384575,-8.05320351228644,-4.93758732169862,-1.44736819514034,3.01240030531792,-0.377128173409025,-2.97641379233606,2.34185399565898];
var BPOS01 = -0.080093186499259;


/**
* weights and biases for upper limb exercises
* WEX(exercise number) - weights
* BEX(exercise number) - bias
*/
var WEX10 = [-0.0322367615238914,0.0483080461554725,0.00794460704191625,0.0614960950613531,-0.00869670839132262,0.0327279255289784,0.00219228406520081,0.0374353959804918,0.00903486369460705,0.0108422961476440,0.00622143930936009,0.0132731484951216,0.0181358569893414,-0.00559570547698694,0.0110670360913609,-0.0109745779231548,0.0216885252298748,-0.0198117082783649,0.0132207742165897,-0.0370375271948279,0.0239910998220127,-0.0289349373544688,0.00782616981796451,-0.0623432477699457];
var BEX10 = -1.000076544503324;
var WEX11 = [1.03467173765033,-16.8313716504093,-6.19531940686716,1.33536172260236,3.56248547999422,-9.23488030143439,-4.88176122626019,-0.105805181667186,2.50751488152114,-6.40290964660521,-1.82835110049766,-0.686421106841852,2.20875446680418,-1.48203159996099,1.17926730723965,-1.69996577382234,3.02192845507549,4.09463671070066,4.49608240684395,-1.83317917187143,2.07706055907411,12.8551312518559,6.22991980807532,-2.12231528639747];
var BEX11 = 1.472521950936242;
var WEX12 = [11.8935910762714,-1.25127305738662,14.8428755935397,7.20515877927872,0.882971871528802,1.84011267406650,10.8995539942305,0.298115594656366,-5.35561792065132,5.59845208652232,-0.852403883831300,-1.50173410078821,-9.00444778948358,5.80092042602929,-8.52861276074845,-1.34786784324447,13.0422819268329,-8.11160531364735,-2.53147544410069,2.90014003554569,-8.60407153254554,-1.27734579301799,-14.1376856557149,-7.09913706749100];
var BEX12 = 0.023627875359343;
var WEX13 = [0.0175280049057312,0.0559203037903126,0.0394640327070657,0.0172093109142958,0.0145794466486143,0.0335694584216315,0.0270688218867491,0.00443364913076375,0.00663099581988182,0.00882621532609786,0.0186758322214032,0.00142986196847986,-0.00115215440403723,-0.0151012520850565,0.000823798983343838,-0.00501494860333765,-0.00994952912085130,-0.0394068176084941,-0.0180533190903126,-0.00849267900545880,-0.0193931333756328,-0.0642292180931737,-0.0394898633675490,-0.0128058152523964];
var BEX13 = 1.000080596697955;
var WEX14 = [0.0219137094121237,0.116085377487194,0.0226155797437661,-0.0655417778465979,-0.0178092798059577,0.00724377315793545,-0.0304341653048210,0.0466641809163026,0.000453268952300287,-0.00376876329746950,-0.0185383503908329,0.0272387755391982,0.00910005771061886,-0.0109821937287455,-0.0142313929442904,0.00411130260977974,0.00621481446077601,-0.0183365090309672,-0.0150811104516082,-0.0105594402088966,-0.00346852788040467,-0.0242756198412734,-0.0194237619055361,-0.0216418005187678];
var BEX14 = 1.000089125650869;
var WEX15 = [0.0136316073207600,0.00248392275417001,0.0329749817868900,0.0353782946216700,0.0226624659089400,0.0169336716377400,0.0419870713462200,0.0167224728013200,0.0230661507433500,0.0167856860714400,0.0419121785639700,0.0167745075111900,0.0236284763715000,0.0165986472108600,0.0416354626502100,0.0167416232583600,0.0241418958580800,0.0165327077529900,0.0415058161131900,0.0165642958166400,0.0246646010496600,0.0165844572250500,0.0415276460913600,0.0162500356547100];
var BEX15 = 1.000000229903400;
var WEX16 = [0.00345281407050226,0.0495599462940794,0.0374382544661677,0.00394402223188037,0.00142882960492793,0.0270082732929198,0.0252474061390093,-0.0100915998964514,-0.00174044031378083,-0.000425220084830352,0.0141481572981610,-0.0178521898961545,-0.00602988804167278,-0.0236243678304272,-0.00275666880839343,-0.0281237934672930,-0.00587800722607474,-0.0454118944135288,-0.0198335572132483,-0.0408206852239502,-0.00776451959660599,-0.0662734863368187,-0.0390246910700213,-0.0559144396200816];
var BEX16 = 1.000102384188934;
var WEX17 = [0.000798783310049650,-0.00478151674019873,0.00437864428999127,-0.00460082744281409,0.00308691954542512,0.00735282110026240,0.000624418671768462,-0.00268341456675375,0.00523339909002982,0.0113897318761913,0.000142931338409757,-0.00261768073879909,0.00702793454630550,0.0125122963565674,5.93693061979594e-05,-0.00309138668117692,0.00771414568895203,0.0107568025351429,0.00171044970746073,-0.00272586103162259,0.00822207123741470,0.0103506043136561,0.00337313434281489,-0.00405486375247133];
var BEX17 = 1.000165567829889;
var WEX18 = [-0.0182139461618749,0.0569089578059374,0.0201661258579303,0.0153664972472840,-0.0143074548599537,0.0329515670640335,0.0144094365580152,0.0107369580713683,-0.00319775330187704,0.0168591243714552,0.00313396842317770,0.00654263911546971,0.00746754886162442,0.00389692302119696,-0.0109518974198751,-0.000230444563618704,0.0172748756083999,-0.0106683259578300,-0.0270729382999202,-0.00359578592030604,0.0298176695523890,-0.0249013679904321,-0.0408857903283206,-0.00386227912356524];
var BEX18 = -0;


/** 
* weights and biases for lower limb exercises 
* WEX(exercise number) - weights
* BEX(exercise number) - bias
*/
var WEX00 = [0.708205284639509,-19.0138501450970,14.5999205070021,0.402408524577128,-4.30299387587173,1.00631867382016,-3.83022041120533,-5.14913578689789,4.44128505211265,4.53203234919351,2.24685173059426,2.29287985351918];
var BEX00 = 0.485795160572842;
var WEX01 = [-1.67184110170501,0.913426278432120,-4.80275097646117,-1.86853252108823,0.0824339903709985,-7.42780103989050,-0.856110701944239,-7.61487200588230,-0.102818819818066,2.18367828973063,0.978461630992119,5.76894008571421];
var BEX01 = 0.262860065919135;
var WEX02 = [-1.77703823665350,3.62535933994191,2.13774562473551,-0.405912802629496,-6.28624865280797,7.57682128084184,11.2030681771882,13.9959619743388,-8.98435318370676,8.89380371909138,-1.53675139064170,0.474767084156419];
var BEX02 = -0.082344878496968;
var WEX03 = [0,0,0,0,0,0,0,0,0,0,0,0];
var BEX03 = 0;
var WEX04 = [0,0,0,0,0,0,0,0,0,0,0,0];
var BEX04 = 0;
/**
* end of weights and biases
*/

/**
* weights and biases storage 
*
* common arrays of all weights and biases (to make usage simpler)
* positions weights and biases 
*/
var POSITION_W = [[WPOS00,WPOS01], [WPOS10,WPOS11]];
var POSITION_B = [[BPOS00,BPOS01], [BPOS10,BPOS11]];

/**
* exercises weights and biases
*/
var EXERCISE_W = [[[WEX00,WEX01,WEX02],[WEX03],[WEX04]], [[WEX10,WEX11,WEX12],[WEX13,WEX14,WEX15],[WEX16,WEX17,WEX18]]];
var EXERCISE_B = [[[BEX00,BEX01,BEX02],[BEX03],[BEX04]], [[BEX10,BEX11,BEX12],[BEX13,BEX14,BEX15],[BEX16,BEX17,BEX18]]];

/**
* EX_NAMES usage:
* EX_NAMES[0]	-	lower parts exercises
* EX_NAMES[0][0]	-	lower part exercises starting from position 0
* EX_NAMES[0][1]	-	lower part exercises exercises starting from position 1 (and so on..)
* EX_NAMES[1]	-	upper parts exercises
* EX_NAMES[1][0]	-	upper part exercises starting from position 0
* EX_NAMES[1][1]	-	upper part exercises starting from position 1 (and so on..)
* EX_NAMES[1][1][3]	-	fourth upper part exercise starting from position 1 ("Shoulder flexion")
*/
var EX_NAMES = [[["Ankle Flexion", "Hip abduction/adduction", "Hip flexion", "Knee flexion"], ["Hip External Rotation"], ["Hip extension"]], [["Elbow flexion", "Shoulder abduction", "Shoulder extention", "Shoulder flexion"], ["Arm external rotation", "Arm internal rotation", "Shoulder pronation", "Shoulder supination"], ["Wrist flexion", "Wrist extension", "Wrist ulnar deviation", "Wrist radial deviation"]]];
/**
* end of weights and biases storage
*/




// store determined initial position
var position_g;

// store determined exercise
var exercise_g;




/**
* FUNCTIONS
*/

/**
* this function checks initial position of patient
* Variables
* startQ	 -	array of quaternion values from sensors
* upper	-	0 if values comes from lower limb sensors, 1 if values comes from upper limb sensors
*/
function svm_init(startQ, upper){
	/**
	* if values come from upper limb sensors they come in 2D array form, they need to be combined 
	* into one array of quaternion values from each of 6 sensors 
	* [quaternion_from_sensor1, quaternion_from_sensor2, ..] ([q0,q1,q2,q3,q4,q5..q23])
	*/
	if(upper>0){
		startQ = extractQuaternionUpper(startQ);
	}else{
		startQ = extractQuaternionLower(startQ);
	}

	// determine starting position for exercise from given quaternion data
	position_g = checkPosition(startQ, upper);	
}



/**
* this function checks performed exercise                                                                            
* Variables
* latestQ	-	array of quaternion data from sensors incoming as exercise is performed by patient
* upper	-	0 if lower limb exrcise, 1 if upper limb exercise
*/
function svm_update(latestQ, upper){
	/**
	* if values come from upper limb sensors they come in 2D array form, they need to be combined 
	* into one array of quaternion values from each of 6 sensors 
	* [quaternion_from_sensor1, quaternion_from_sensor2, ..] ([q0,q1,q2,q3,q4,q5..q23])
	*/
	if(upper>0){
		startQ = extractQuaternionUpper(startQ);
	}else{
		startQ = extractQuaternionLower(startQ);
	}

	/**
	* predict exercise
	* position_g	-	position determined in svm_init from initial quaternion data
	*/
	exercise_g = checkExercise(position_g, latestQ, upper); 	
	return exercise_g;
}

/**
* determine in which one of neutral position was patient at the beginning of the exercise
*/
function checkPosition(data, upper){
	var position=0;
	/**
	* performs svm check for first two of neutral positions, 
	* when both results are negative assumes that it was third neutral position
	*/
	for (var i = 0; i < 2; i++){
		if (svmCheck(data, POSITION_W[upper][i], POSITION_B[upper][i])){
			position = i;
		}else{
			// assume it was third neutral position
			position = 2;
		}
	}
	return position;
}


/**
* check position or exercise using weights and bias
* xs	-	array of data
* wPos	-	array of weights
* bPos	-	bias value
*/
function svmCheck(xs, wPos, bPos){
	var res = 0;

	// sum given data values multiplied by corresponding weight values
	for (var i = 0; i < wPos.length; i++){
		res = res + xs[i]* wPos[i] - bPos;
	}

	/**
	* when obtained sum is greater than 0 assume that other position/exercise was performed 
	* (every time check between 2 positions/exercises, assume that second of 2 was performed)
	*/
	if (res>0)
		return false;
	else
		// first from 2 positions/exercises was performed
		return true;
}


/**
* check exercise using weights and bias
* position	-	result of earlier position check
* data	-	incoming array of quaternion data
* upper	-	0 if lower limb exercise was performed, 1 if upper limb exercise was performed
*/
function checkExercise(position, data, upper){
	var exercise;

	for (var i = 0; i < (EXERCISE_W[upper][position].length - 1); i++){
		/**
		* performs check on given data with weights and bias according to determined earlier position
		* if result of check is true assigns sting with name of performed exercise
		*/
		if (svmCheck(data, EXERCISE_W[upper][position][i], EXERCISE_B[upper][position][i])){
			exercise = EX_NAMES[upper][position][i];
			i = EXERCISE_W[upper][position].length;
		}	
	}

	/**
	* in case of negative results assign name of last exercise in set
	* it removes need for checking if last one of possible exercises was performed
	*/
	if (typeof exercise === "undefined"){
		exercise = EX_NAMES[upper][position][(EX_NAMES[upper][position].length-1)];
	}
	return exercise;
}




/**
* IMPORTANT
* it might be easier if it was done before passing data to Svm_lower since 
* this requires different ways of passing data for upper limb exercises and 
* for lower limb ones
*/

/**
* extract quaternion data from incoming data and form contistent array 
* out of it in the form: 
* [quaternion_from_sensor1, quaternion_from_sensor2 .. quaternion_from_sensor7]	([q0,q1,q2,q3,q4,q5,...q23])
* input1	-	2D array of the form 
* [timestamp, device_number, q0,q1,q2,q3..
*  timestamp, device_number, q0,q1,q2,q3..
*  timestamp, device_number, q0,q1,q2,q3..
*  ...
*  timestamp, device_number, q0,q1,q2,q3..]
*/
function extractQuaternionUpper(input1){
	var res = [];

	// find first rows for each of device numbers 1-7 (ignore data from device 0)
	for (var i = 1; i < 7; i++){

		//check all rows looking for device number
		for (var j = 0; j < input1.length); j++){

			// if device number corresponds to device not found before extract quaternion data
			if (input1[j][1] == i){	

				// extract quaternion data
				res[4*(i-1)] = input1[j][2];
				res[4*(i-1)+1] = input1[j][3];
				res[4*(i-1)+2] = input1[j][4];
				res[4*(i-1)+3] = input1[j][5];
				
				// terminate this loop in order to look for next device number
				j = input1.length;
			}
		}
	}
	return res;
}

/**
* extract quaternion from data coming from lower limb sensors to the form: 
* [q0_from_device46, q1_from_device46, q2_from_device46, q3_from_device46, q0_from_device47, .. q3_from_device48] 
* /

/**
* !!!!!!!!!! THERE IS BIG PROBLEM HERE !!!!!!!!!!!
* incoming data containg strings which are not quoted like 'Time', 'raw', when I put it into html file 
* it didn't won't to work until I added quotation marks to those
*/
function extractQuaternionLower(input1){
	var res = [input1[46], input1[47], input1[48], input1[49], input1[29],  input1[30], input1[31], input1[32], input1[12], input1[13], input1[14], input1[15]];
	return res;
}

