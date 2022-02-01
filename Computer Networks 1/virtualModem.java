package Diktya1;
import java.util.ArrayList;
import java.util.Scanner;
import java.io.*;
import java.io.IOException;
import ithakimodem.Modem;



public class virtualModem{
	
	//boolean to exit app
	boolean exit;
	
	//Ithaki stats
	public static String echoRequestCode = "E3804\r" ; 
	public static String imageRequestCode = "M3265\r"; 
	public static String imageErrorRequestCode = "G6831\r"; 
	public static String gpsRequestCode = "P9455"; 
	public static String ackResultCode = "Q0991\r"; 
	public static String nackResultCode = "R0575\r"; 
	
	
	// echo request
	public void echo() throws IOException {
		
		int counterP = 0, k = 0, counterLoop = 0;
		long startTimeLoop = System.currentTimeMillis();
		long endTimeLoop = 0;
		long deltaTimeLoop = 0;
		long start, end, delta = 0;
		
		ArrayList<Long> samples = new ArrayList<Long>();
		
		Modem modem = new Modem();
		modem.setSpeed(80000);
		modem.setTimeout(3000);
		modem.write("atd2310ithaki\r".getBytes());
		
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				System.out.print((char)k);
			}catch (Exception x) {
				System.out.println(x);
				break;
			}
		}
		
		while((deltaTimeLoop/1000) < 360) {
			modem.write(echoRequestCode.getBytes());
			start = System.currentTimeMillis();
			end = 0;
			delta = 0;
			for(;;){
				try{
					k = modem.read();
					if((char)k == 'P'){
						counterP++;
					}
					if(counterP == 3){
						end = System.currentTimeMillis();
						delta = end - start;
						counterP = 0;
					}
					if(k == -1) 
						break;
					System.out.print((char)k);
				}catch (Exception x) {
					System.out.println(x);
					break;
				}
			}
			System.out.print("\r\n");
			System.out.print(delta+ "\r\n");
			samples.add(delta);
			endTimeLoop = System.currentTimeMillis();
			deltaTimeLoop = endTimeLoop - startTimeLoop;
			System.out.println("Time elapsed: " + deltaTimeLoop + "\r\n");
			counterLoop++;
		}
		System.out.println("Saving...");
		File filename;
		filename = new File("session2_echo.txt");
		if(!filename.exists()) 
			filename.createNewFile();
		FileWriter fw = new FileWriter(filename);
		BufferedWriter bw = null;
		bw = new BufferedWriter(fw);
		for(int i = 0 ; i < counterLoop ; i++) {
			bw.write("" + samples.get(i));
			bw.newLine();
		}
		if(bw != null) 
			bw.close();
		modem.close();
	}
	
		
		
	//image request
	public void image(){
		
		int counter = 0, k;
		ArrayList<Integer> test = new ArrayList<Integer>();
		
		Modem modem = new Modem();
		modem.setSpeed(80000);
		modem.setTimeout(3000);
		modem.write("atd2310ithaki\r".getBytes());
		
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				System.out.print((char)k);
			}catch (Exception x) {
				break;
			}
		}
		String cam = "CAM=FIX";
		modem.write((imageRequestCode + cam).getBytes());
		
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				test.add(k);
				counter++;
			}catch (Exception x) {
				System.out.println(x);
				break;
			}
		}
		String fileName = ("session2_image_" + "_" + cam + ".jpeg");
		try{
			FileOutputStream output = new FileOutputStream(fileName);
			for(int i = 0 ; i < counter ; i++){
				output.write(test.get(i));
			}
			output.close();
		}
		catch(IOException x){
			System.out.println(x);
		}
		System.out.print("Image saved\n");
		modem.close();
	}

	
	//image error request
	public void imageError() {
		
		int counter = 0, k;
		ArrayList<Integer> test = new ArrayList<Integer>();
		
		Modem modem = new Modem();
		modem.setSpeed(80000);
		modem.setTimeout(3000);
		modem.write("atd2310ithaki\r".getBytes());
		
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				System.out.print((char)k);
			}catch (Exception x) {
				break;
			}
		}
		String cam = "CAM=PTZ";
		modem.write((imageErrorRequestCode + cam).getBytes());
		
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				test.add(k);
				counter++;
			}catch (Exception x) {
				break;
			}
		}
		String fileName = ("session2_image_Error_" + "_" + cam + ".jpeg");
		try{
			FileOutputStream output = new FileOutputStream(fileName);
			for(int i = 0 ; i < counter ; i++){
				output.write(test.get(i));
			}
			output.close();
		}
		catch(IOException x){
			System.out.println(x);
		}
		System.out.print("Image saved\n");
		modem.close();
		
	}
	
	//gps request
	public void gps() throws IOException {
		int k;
		int counter= 0;
		String testString = "";
		int countChars = 0, countSamples = 0,hours, minutes, seconds, time;
		String timeString = "", widthString = "", heightString = "";
		
		Modem modem = new Modem();
		modem.setSpeed(80000);
		modem.setTimeout(3000);
		modem.write("atd2310ithaki\r".getBytes());
		
		ArrayList<String> testStrings = new ArrayList<String>();
		ArrayList<String> timeStrings = new ArrayList<String>();
		ArrayList<String> widthStrings = new ArrayList<String>();
		ArrayList<String> heightStrings = new ArrayList<String>();
		ArrayList<Integer> timer = new ArrayList<Integer>();
		ArrayList<String> widths = new ArrayList<String>();
		ArrayList<String> heights = new ArrayList<String>();
		ArrayList<Integer> test = new ArrayList<Integer>();
		
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				System.out.print((char)k);
			}catch (Exception x) {
				System.out.println(x);
				break;
			}
		}
		
		modem.write((gpsRequestCode+"R=1000199"+"\r").getBytes());
		for(;;){
			try{
				k = modem.read();
				testString += (char)k;
				if((testString.indexOf("GPGGA") > 0) && (testString.indexOf("\r\n") > 0)){
					testStrings.add(testString);
					timeStrings.add(timeString);
					widthStrings.add(widthString);
					heightStrings.add(heightString);
					testString = "";
					timeString = "";
					widthString = "";
					heightString = "";
					countChars = 0;
					countSamples++;
					
				}else if((testString.indexOf("GPGGA") < 0) && (testString.indexOf("\r\n") > 0)){
					testString = "";
					
				}else if((testString.indexOf("GPGGA") > 0) && (testString.indexOf("\r\n") < 0)){
					countChars++;
					if(countChars > 2 && countChars < 9){
						timeString += (char)k;
					}
					if(countChars > 13 && countChars < 23){
						widthString += (char)k;
					}
					if(countChars > 25 && countChars < 36){
						heightString += (char)k;
					}
				}
				if(k==-1) 
					break;
			}catch (Exception x) {
				System.out.println(x);
				break;
			}
		}
		
		File filename;
		filename = new File("session2_gps.txt");
		if(!filename.exists()) 
			filename.createNewFile();
		FileWriter fw = new FileWriter(filename);
		BufferedWriter bw = null;
		bw = new BufferedWriter(fw);
		for(int i = 0 ; i < testStrings.size() ; i++) {
			bw.write("" + testStrings.get(i));
			bw.newLine();
		}
		if(bw != null) 
			bw.close();
		
		
		for(int i = 0 ; i < countSamples ; i++){
		//Start time
			time = Integer.parseInt(timeStrings.get(i));
			hours = time / 10000;
			minutes = time / 100;
			minutes = minutes % 100;
			seconds = time % 100;
			time = seconds + (minutes*60) + (hours*3600);
			timer.add(time);
		
		//start width
			String width = widthStrings.get(i);
			String[] demo = new String [2];
			demo = width.split("\\.");
			int intPart2;
			String width1;
			intPart2 = Integer.parseInt(demo[1]);
			intPart2 = (intPart2 * 60)/10000;
			width1 = demo[0] + Integer.toString(intPart2);
			widths.add(width1);
		
		//start height
			String height = heightStrings.get(i);
			String[] demo2 = new String [2];
			demo2 = height.split("\\.");
			int intPart22, intPart12;
			String height1;
			intPart22 = Integer.parseInt(demo2[1]);
			intPart22 = (intPart22 * 60)/10000;
			intPart12 = Integer.parseInt(demo2[0]);
			height1 = Integer.toString(intPart12) + Integer.toString(intPart22);
			heights.add(height1);
	
		}
		
		int start = timer.get(0);
		int counters = 1;
		int[] points = new int [5];
		points[0] = 0;
		String[] heightsArray = new String [5];
		String[] widthsArray = new String [5];
		heightsArray[0] = heights.get(0);
		widthsArray[0] = widths.get(0);
		
		for(int i = 1; i < countSamples; i++){
			if((timer.get(i) - start >= 20) && (counters < 5)){
				points[counters] = i;
				start = timer.get(i);
				heightsArray[counters] = heights.get(i);
				widthsArray[counters] = widths.get(i);
				counters++;
			}
		}
		
		String gpsCode = gpsRequestCode;
		for (int i = 0 ; i < 4 ; i++){
		gpsCode += "T="+heightsArray[i] + widthsArray[i];
		}
		gpsCode += "\r\n";
		System.out.print(gpsCode);
		modem.write((gpsCode).getBytes());
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				test.add(k);
				counter++;
			}catch (Exception x) {
				System.out.println(x);
				break;
			}
		}
		
		String fileName = ("session2_GPS" + ".jpeg");
		try{
			FileOutputStream output = new FileOutputStream(fileName);
			for(int i = 0 ; i < counter; i++){
				output.write(test.get(i));
			}
			output.close();
		}
		catch(IOException x){
			System.out.println(x);
		}
		System.out.print("Image saved\n");
		modem.close();
	}
	
	

	
	//ackNack request
	public void ackNack() throws IOException {
		
		int[] stringCode = new int[16];
		int[] intCode = new int[3];
		int nextLoop = 1, flag = 0, counterNack = 0, counterStringCode, counterIntCode, k, temp, counterLoop = 0;
		int distanceCorrect, intCodeNumericValue = 0, counterWrong, counterTimes;
		long startTimeLoop, endTimeLoop, deltaTimeLoop, start, end, delta;
		float bern, L = 0, prob;
		String stringBer = "";
		
		ArrayList<Integer> checkCorrect = new ArrayList<Integer>();
		ArrayList<Long> samples = new ArrayList<Long>();
		ArrayList<Integer> stringCodeList = new ArrayList<Integer>();
		ArrayList<Integer> repeatTimes = new ArrayList<Integer>();
		ArrayList<String> saves = new ArrayList<String>();
		
		Modem modem = new Modem();
		modem.setSpeed(80000);
		modem.setTimeout(3000);
		modem.write("atd2310ithaki\r".getBytes());
		
		for(;;){
			try{
				k = modem.read();
				if(k==-1) 
					break;
				System.out.print((char)k);
			}catch (Exception x) {
				System.out.println(x);
				break;
			}
		}
		
		
		
		startTimeLoop = System.currentTimeMillis();
		endTimeLoop = 0;
		deltaTimeLoop = 0;
		
		while(((deltaTimeLoop/1000.0) < 360) || (nextLoop == -1)){
			if(nextLoop == 1){
				modem.write(ackResultCode.getBytes());			
			}else if(nextLoop == -1){
				modem.write(nackResultCode.getBytes());
				counterNack++;
			}
			start = System.currentTimeMillis();
			end = 0;
			delta = 0;
			counterStringCode = 0;
			counterIntCode = 0;
			flag = 0;
			for(;;){
				try{
					k = modem.read();
					stringBer += (char)k;
					if((flag == 1) && (counterStringCode < 16)){
						stringCode[counterStringCode] = k;
						counterStringCode++;
					}
					if((flag == 2) && (counterIntCode < 3)){
						intCode[counterIntCode] = k;
						counterIntCode++;
					}
					if((char)k == '<'){
						flag = 1;
					}else if(((char)k == ' ') && (flag == 1)){
						flag = 2;
					}else if(((char)k == 'P') && (flag == 2)){
						flag = 3;
					}else if(((char)k == 'P') && (flag == 3)){
						end = System.currentTimeMillis();
						delta = end - start;
						L = stringBer.getBytes("utf8").length;
						stringBer = "";
					}
					if(k==-1) 
						break;
					System.out.print((char)k);
				}catch (Exception x) {
					break;
				}
			}
			for(int i = 0; i < 16; i++){
				stringCodeList.add(stringCode[i]);
			}
			temp = 0;
			for(int i = 0; i < 16; i++){
				temp = temp^stringCode[i];
			}
			intCodeNumericValue = 0;
			for(int i = 0; i < 3; i++){
				intCodeNumericValue += ((int)Math.pow(10,2-i))*Character.getNumericValue(intCode[i]);
			}
			if(temp == intCodeNumericValue){
				nextLoop = 1;//ACK
				checkCorrect.add(1);
			}else{
				nextLoop = -1;//NACK
				checkCorrect.add(0);
			}
			System.out.print("\r\n");
			System.out.print(delta + "\r\n");
			samples.add(delta);
			endTimeLoop = System.currentTimeMillis();
			deltaTimeLoop = endTimeLoop - startTimeLoop;
		
			counterLoop++;
		}
		//BER start
		prob = (float)(counterLoop - counterNack)/counterLoop;
		bern = (float)(1.0 - Math.pow(prob,1.0/L));
		System.out.print("Ber: " + bern);
		System.out.print("\r\n");
		
		//Probability Of Success Start
		distanceCorrect = 0;
		counterWrong = 0;
		int maxRepeat = 1;
		for(int i = 0 ; i < counterLoop; i++){
			if(checkCorrect.get(i) == 1){
				distanceCorrect = 1 + counterWrong;
				counterWrong = 0;
				repeatTimes.add(distanceCorrect);
				if(maxRepeat < distanceCorrect){
					maxRepeat = distanceCorrect;
				}
			}else if(checkCorrect.get(i) == 0){
				counterWrong++;
			}
		}
		counterTimes = 0;
		for(int i = 1 ; i <= maxRepeat; i++){
			for(int j = 0; j < repeatTimes.size();j++){
				if(repeatTimes.get(j) == i){
					counterTimes++;
				}
			}
			System.out.print("Send " + i + " time(s) " + counterTimes + "packets.\r\n");
			saves.add(""+ i + " " + counterTimes + " BERN: " + bern);
			counterTimes = 0;
		}
		
		File filename;
		filename = new File("session2_ackNack.txt");
		if(!filename.exists()) 
			filename.createNewFile();
		FileWriter fw = new FileWriter(filename);
		BufferedWriter bw = null;
		bw = new BufferedWriter(fw);
		for(int i = 0 ; i < counterLoop ; i++) {
			bw.write("" + samples.get(i));
			bw.newLine();
		}
		if(bw != null) 
			bw.close();
		modem.close();
		
		File filename1;
		filename1 = new File("session2_ackNack_prob.txt");
		if(!filename1.exists()) 
			filename1.createNewFile();
		FileWriter fw1 = new FileWriter(filename1);
		BufferedWriter bw1 = null;
		bw1 = new BufferedWriter(fw1);
		for(int i = 0 ; i < saves.size() ; i++) {
			bw1.write("" + saves.get(i));
			bw1.newLine();
		}
		if(bw1 != null) 
			bw1.close();
		
		modem.close();
	}
	
	//app menu
	public void printHeader() {
		System.out.println("+---------------------------------+");
		System.out.println("             Ithaki                ");
		System.out.println("           application             ");
		System.out.println("+---------------------------------+");
	}
		
	public void printMenu() {
		System.out.println("\nPlease make a selection: ");
		System.out.println("1. Echo");
		System.out.println("2. Image");
		System.out.println("3. Image Error");
		System.out.println("4. GPS");
		System.out.println("5. Ack/Nack");
		System.out.println("0. Exit");
	}
	
	public int getInput() {
		Scanner kb = new Scanner(System.in);
		int choice = -1;
		while(choice < 0 || choice > 6) {
			try {
				System.out.print("\nEnter your choice: ");
				choice = Integer.parseInt(kb.nextLine());
			}
			catch(NumberFormatException e) {
				System.out.println("Invalid selection. Please try again. ");
			}
		}
	
		return choice;
	}
	
	public void performAction(int choice) throws IOException {
		switch(choice) {
			case 0:
				exit = true;
				System.out.println("Exiting... ");
				break;
			case 1:
				echo();
				break;
			case 2:
				image();
				break;
			case 3:
				imageError();
				break;
			case 4:
				gps();
				break;
			case 5:
				ackNack();
				break;
			default:
				System.out.println("An unknown error has occured. ");
		}
	}
	
	public void runMenu() throws IOException {
		printHeader();
		while(!exit) {
			printMenu();
			int choice = getInput();
			performAction(choice);
		}
	}
	
	//main
	public static void main(String[] args) throws IOException{
		virtualModem menu = new virtualModem();
		menu.runMenu();
		
	}
		
}