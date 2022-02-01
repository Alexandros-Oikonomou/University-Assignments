
import java.net.DatagramSocket;
import java.net.DatagramPacket;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Scanner;
import java.io.*;
import java.io.IOException;
import javax.sound.sampled.*;



public class userApplication{
	
	//boolean to exit app
	boolean exit;
	
	//Ithaki stats
	public static int clientListeningPort = 48005; 
	public static int serverListeningPort = 38005; 
	public static String echoRequestCode = "E2961" ; 
	public static String imageRequestCode = "M0975"; 
	public static String audioRequestCode = "A5843"; 
	public static String ithakiCopterCode = "Q0100"; 
	public static String vehicleRequestCode = "V5821"; 
	
	static byte[] hostIP = {(byte)155,(byte)207,18,(byte)208}; 
	
	
	// echo request
	public void echo() throws IOException {
		DatagramSocket sSend = new DatagramSocket();
		DatagramSocket sReceive = new DatagramSocket(clientListeningPort);
		
		
		byte[] txbuffer1 = "E0000".getBytes();
		byte[] txbuffer2 = echoRequestCode.getBytes();
		InetAddress hostAddress = InetAddress.getByAddress(hostIP);
		
		DatagramPacket p1Send = new DatagramPacket(txbuffer1,txbuffer1.length,hostAddress,serverListeningPort);
		DatagramPacket p2Send = new DatagramPacket(txbuffer2,txbuffer2.length,hostAddress,serverListeningPort);
		
		
		byte[] rxbuffer = new byte[2048];
		DatagramPacket pReceive = new DatagramPacket(rxbuffer,rxbuffer.length);
		
		//echo no delay
		float counter1 = 0;
		long startNoDelay = 0;
		long start1 = 0, end1 = 0; 
		float sum1 = 0;
		ArrayList<Long> samples1 = new ArrayList<Long>();
		ArrayList<Float> counters1 = new ArrayList<Float>();
		ArrayList<Float> sums1 = new ArrayList<Float>();
		
		startNoDelay = System.currentTimeMillis();
		sReceive.setSoTimeout(3600);
		
		while((System.currentTimeMillis() - startNoDelay) < 360 * 1000){

			sSend.send(p1Send);
			start1 = System.currentTimeMillis();
			try {
			sReceive.receive(pReceive);
			}catch (IOException x) {
				System.out.println(x.getMessage());
			}
			System.out.println(new String(rxbuffer,0,rxbuffer.length));
			end1 = System.currentTimeMillis();
			System.out.println("Time elapsed: " + (end1 - start1) + "\r\n");
			samples1.add(end1 - start1);
		}
		
		for (int i = 0; i < samples1.size(); i++){
			int j = i;
			while ((sum1 / 1000 < 8) && (j < samples1.size())){
				sum1 += samples1.get(j);
				counter1++;
				j++;
			}
			counter1 = counter1/8;
			counters1.add(counter1);
			sums1.add(sum1);
			counter1 = 0;
			sum1 = 0;
		}
		
		File noDelayTimes = new File("session2_noDelayTimes2.txt");
        if (!noDelayTimes.exists())
        	noDelayTimes.createNewFile();
        FileWriter fw = new FileWriter(noDelayTimes);
        BufferedWriter bw = null;
        bw = new BufferedWriter(fw);
		
		for(int i = 0 ; i < samples1.size() ; i++) {
			bw.write("" + samples1.get(i));
			bw.newLine();
		}
		if(bw != null) 
			bw.close();
		
		File noDelaySums;
		noDelaySums = new File("session2_noDelaySums2.txt");
		if(!noDelaySums.exists()) 
			noDelaySums.createNewFile();
		FileWriter fw2 = new FileWriter(noDelaySums);
		BufferedWriter bw2 = null;
		bw2 = new BufferedWriter(fw2);
		for(int i = 0 ; i < samples1.size() ; i++) {
			bw2.write("" + counters1.get(i));
			bw2.newLine();
		}
		if(bw2 != null) 
			bw2.close();
		
		
		// echo delay
		float counter2 = 0;
		long startDelay = 0;
		long start2 = 0, end2 = 0; 
		float sum2 = 0;
		ArrayList<Long> samples2 = new ArrayList<Long>();
		ArrayList<Float> counters2 = new ArrayList<Float>();
		ArrayList<Float> sums2 = new ArrayList<Float>();
		
		startDelay = System.currentTimeMillis();
		
		while((System.currentTimeMillis() - startDelay) < 360 * 1000){

			sSend.send(p2Send);
			start2 = System.currentTimeMillis();
			try {
				sReceive.receive(pReceive);
				}catch (IOException x) {
					System.out.println(x.getMessage());
				}
			System.out.println(new String(rxbuffer,0,rxbuffer.length));
			end2 = System.currentTimeMillis();
			System.out.println("Time elapsed: " + (end2 - start2) + "\r\n");
			samples2.add(end2 - start2);
		}
		
		for (int i = 0; i < samples2.size(); i++){
			int k = i;
			while ((sum2 / 1000 < 8) && (k < samples2.size())){
				sum2 += samples2.get(k);
				counter2++;
				k++;
			}
			counter2 = counter2/8;
			counters2.add(counter2);
			sums2.add(sum2);
			counter2 = 0;
			sum2 = 0;
		}
		
		File DelayTimes = new File("session2_DelayTimes2.txt");
        if (!DelayTimes.exists())
        	DelayTimes.createNewFile();
        FileWriter fw3 = new FileWriter(DelayTimes);
        BufferedWriter bw3 = null;
        bw3 = new BufferedWriter(fw3);
		
		for(int i = 0 ; i < samples2.size() ; i++) {
			bw3.write("" + samples2.get(i));
			bw3.newLine();
		}
		if(bw3 != null) 
			bw3.close();
		
		File DelaySums;
		DelaySums = new File("session2_DelaySums2.txt");
		if(!DelaySums.exists()) 
			DelaySums.createNewFile();
		FileWriter fw4 = new FileWriter(DelaySums);
		BufferedWriter bw4 = null;
		bw4 = new BufferedWriter(fw4);
		for(int i = 0 ; i < samples2.size() ; i++) {
			bw4.write("" + counters2.get(i));
			bw4.newLine();
		}
		if(bw4 != null) 
			bw4.close();
		
		sSend.close();
		sReceive.close();
	
	}
	


	
	//image request
	public void image() throws IOException {
		InetAddress hostAddress = InetAddress.getByAddress(hostIP);
		
		DatagramSocket sSend = new DatagramSocket();
		DatagramSocket sReceive = new DatagramSocket(clientListeningPort);
	
		byte[] rxbuffer = new byte[2048];
		DatagramPacket pReceive = new DatagramPacket(rxbuffer,rxbuffer.length);
		
		String fileName = null;
		
		String cam = null;
		for (int i = 0; i < 2; i++) {
			if (i==0)
				cam = "CAM1";
			if (i==1) {
				imageRequestCode += "CAM=PTZ"; 
				cam = "CAM2";
			}
			byte[] txbuffer = imageRequestCode.getBytes();
			DatagramPacket pSend = new DatagramPacket(txbuffer,txbuffer.length,hostAddress,serverListeningPort);
			
			sReceive.setSoTimeout(3600);
			sSend.send(pSend);
		
			fileName = ("session2_image_" + imageRequestCode + "_" + cam + ".jpeg");
			
			for(;;){
				try{
					FileOutputStream output = new FileOutputStream(fileName);
					sReceive.receive(pReceive);
					if (rxbuffer == null) 
						break;
					for(int j = 0 ; j < 128 ; j++){
						output.write(rxbuffer[j]);
					}
					output.close();
				}catch (IOException x) {
					System.out.println(x);
					break;
				}
			}
			System.out.print("Image saved\n");
		}
		
		sSend.close();
		sReceive.close();
	}

	
	//sound DPCM request
	public void soundDPCM() throws IOException, LineUnavailableException {
		
		String option = null;
		for (int i = 0; i < 2; i++) {
			if (i==0) {
				option = "F999";
				System.out.println("Audio clip starting...");
			}
			if (i==1) {
				option = "T999";
				System.out.println("Frequency generator starting...");
			}
			InetAddress hostAddress = InetAddress.getByAddress(hostIP);
		
			DatagramSocket sSend = new DatagramSocket();
			DatagramSocket sReceive = new DatagramSocket(clientListeningPort);
		
			byte[] txbuffer = (audioRequestCode + option).getBytes();
			DatagramPacket pSend = new DatagramPacket(txbuffer,txbuffer.length,hostAddress,serverListeningPort);

			sReceive.setSoTimeout(2000);

			byte[] rxbuffer = new byte[128];
			DatagramPacket pReceive = new DatagramPacket(rxbuffer,rxbuffer.length);
		
			int rx;
			int pNum = 999, mask1 = 15, mask2 = 240, beta = 3;
			int nibble1 = 0, nibble2 = 0, diff1 = 0, diff2 = 0, test1 = 0, test2 = 0, counter = 0;
		
			ArrayList<Integer> diffs = new ArrayList<Integer>();
			ArrayList<Integer> tests = new ArrayList<Integer>();
		
			sSend.send(pSend);
			byte[] song = new byte[256*pNum];
			
			for(int k = 1; k < pNum; k++){
				try{
					sReceive.receive(pReceive);
					for (int j = 0; j < 128; j++){
						rx = rxbuffer[j];
						nibble1 = rx & mask1; //00001111
						nibble2 = (rx & mask2)>>4; //11110000
						diff1 = nibble1 - 8;
						diffs.add(diff1);
						diff1 = diff1*beta;
						diff2 = nibble2 - 8;
						diffs.add(diff2);
						diff2 = diff2*beta;
						test1 = test2 + diff1;
						tests.add(test1);
						test2 = test1 + diff2;
						tests.add(test2);
						song[counter] = (byte) test1;
						song[counter + 1] = (byte) test2;
						counter += 2;
					}
				}catch (Exception x){
					System.out.println(x);
				}
			}
			
			if (i==0) {
				System.out.println("Audio clip received... ");
			}
			if (i==1) {
				System.out.println("Frequencies received... ");
			}
			
			AudioFormat DPCM = new AudioFormat(8000, 8, 1, true, false);
			SourceDataLine lineOut = AudioSystem.getSourceDataLine(DPCM);
			lineOut.open(DPCM,32000);
			lineOut.start();
			lineOut.write(song, 0, 256*pNum);
			lineOut.stop();
			lineOut.close();
			
			File filename;
			filename = new File("session2_DPCM_diffs_" + audioRequestCode + option + ".txt");
			if(!filename.exists()) 
				filename.createNewFile();
			FileWriter fw = new FileWriter(filename);
			BufferedWriter bw = null;
			bw = new BufferedWriter(fw);
			for(int l = 0 ; l < diffs.size() ; l+=2) {
				bw.write("" + diffs.get(l)+ " " + diffs.get(l + 1));
				bw.newLine();
			}
			if(bw != null) 
				bw.close();
			
			File filename2;
			filename2 = new File("session2_DPCM_tests_" + audioRequestCode + option + ".txt");
			if(!filename2.exists()) 
				filename2.createNewFile();
			FileWriter fw2 = new FileWriter(filename2);
			BufferedWriter bw2 = null;
			bw2 = new BufferedWriter(fw2);
			for(int l = 0 ; l < tests.size() ; l+=2) {
				bw2.write("" + tests.get(l)+ " " + tests.get(l + 1));
				bw2.newLine();
			}
			if(bw2 != null) 
				bw2.close();
		
			sSend.close();
			sReceive.close();
		}
	}
	
	//sound AQDPCM request
	public void soundAQDPCM() throws IOException, LineUnavailableException {
		String option = null;
		for (int i = 0; i < 2; i++) {
			if (i==0) {
				option = "AQF999";
				System.out.println("Audio clip starting...");
			}
			if (i==1) {
				option = "AQT999";
				System.out.println("Frequency generator starting...");
			}
			InetAddress hostAddress = InetAddress.getByAddress(hostIP);
		
			DatagramSocket sSend = new DatagramSocket();
			DatagramSocket sReceive = new DatagramSocket(clientListeningPort);
		
			byte[] txbuffer = (audioRequestCode + option).getBytes();
			DatagramPacket pSend = new DatagramPacket(txbuffer,txbuffer.length,hostAddress,serverListeningPort);

			sReceive.setSoTimeout(2000);

			byte[] rxbuffer = new byte[132];
			DatagramPacket pReceive = new DatagramPacket(rxbuffer,rxbuffer.length);
		
			int rx;
			int pNum = 999, beta = 0, mean = 0, temp = 0;
			int nibble1 = 0, nibble2 = 0, diff1 = 0, diff2 = 0, test1 = 0, test2 = 0, counter = 4;
		
			ArrayList<Integer> diffs = new ArrayList<Integer>();
			ArrayList<Integer> tests = new ArrayList<Integer>();
			ArrayList<Integer> means = new ArrayList<Integer>();
			ArrayList<Integer> betas = new ArrayList<Integer>();
			
			sSend.send(pSend);
			byte[] meanByte = new byte[4];
			byte[] betaByte = new byte[4];
			byte[] song = new byte[512*pNum];
			byte sign;
			
			for(int k = 1; k < pNum; k++){
				try{
					sReceive.receive(pReceive);
		
					if (rxbuffer[1] != 0 && 0x80 != 0)
						sign = (byte) 0xff;
					else 
						sign = (byte) 0x00;
					meanByte[3] = sign;
					meanByte[2] = sign; 
					meanByte[1] = rxbuffer[1]; 
					meanByte[0] = rxbuffer[0];
					mean = ByteBuffer.wrap(meanByte).order(ByteOrder.LITTLE_ENDIAN).getInt(); // converting array to int
					means.add(mean);
					
					if (rxbuffer[3] != 0 && 0x80 != 0)
						sign = (byte) 0xff;
					else 
						sign = (byte) 0x00;
					betaByte[3] = sign;
					betaByte[2] = sign; 
					betaByte[1] = rxbuffer[3]; 
					betaByte[0] = rxbuffer[2];
					beta = ByteBuffer.wrap(betaByte).order(ByteOrder.LITTLE_ENDIAN).getInt(); // converting array to int
					betas.add(beta);
					
					for (int j = 4; j < 132; j++){
						rx = rxbuffer[j];
						nibble1 = (int)(rx & 0x0000000F);
						nibble2 = (int)((rxbuffer[j] & 0x000000F0)>>4);
						diff1 = (nibble2-8);
						diffs.add(diff1);
						diff2 = (nibble1-8);
						diffs.add(diff2);
						diff1 = diff1*beta;
						diff2 = diff2*beta;
						test1 = temp + diff1 + mean;
						tests.add(test1);
						test2 = diff1 + diff2 + mean;
						temp = diff2;
						tests.add(test2);
						counter += 4;
						song[counter] = (byte)(test1 & 0x000000FF);
						song[counter + 1] = (byte)((test1 & 0x0000FF00)>>8);
						song[counter + 2] = (byte)(test2 & 0x000000FF);
						song[counter + 3] = (byte)((test2 & 0x0000FF00)>>8);
					}
				}catch (Exception x){
					System.out.println(x);
				}
			}
			
			if (i==0) {
				System.out.println("Audio clip received... ");
			}
			if (i==1) {
				System.out.println("Frequencies received... ");
			}
			
			AudioFormat AQDPCM = new AudioFormat(8000, 16, 1, true, false);
			SourceDataLine lineOut = AudioSystem.getSourceDataLine(AQDPCM);
			lineOut.open(AQDPCM,32000);
			lineOut.start();
			lineOut.write(song, 0, 512*pNum);
			lineOut.stop();
			lineOut.close();
			
			File filename;
			filename = new File("session2_AQDPCM_diffs2_" + audioRequestCode + option + ".txt");
			if(!filename.exists()) 
				filename.createNewFile();
			FileWriter fw = new FileWriter(filename);
			BufferedWriter bw = null;
			bw = new BufferedWriter(fw);
			for(int l = 0 ; l < diffs.size() ; l+=2) {
				bw.write("" + diffs.get(l) + " " + diffs.get(l + 1));
				bw.newLine();
			}
			if(bw != null) 
				bw.close();
			
			File filename2;
			filename2 = new File("session2_AQDPCM_tests2_" + audioRequestCode + option + ".txt");
			if(!filename2.exists()) 
				filename2.createNewFile();
			FileWriter fw2 = new FileWriter(filename2);
			BufferedWriter bw2 = null;
			bw2 = new BufferedWriter(fw2);
			for(int l = 0 ; l < tests.size() ; l+=2) {
				bw2.write("" + tests.get(l)+ " " + tests.get(l + 1));
				bw2.newLine();
			}
			if(bw2 != null) 
				bw2.close();
			
			File filename3;
			filename3 = new File("session2_AQDPCM_means2_" + audioRequestCode + option + ".txt");
			if(!filename3.exists()) 
				filename3.createNewFile();
			FileWriter fw3 = new FileWriter(filename3);
			BufferedWriter bw3 = null;
			bw3 = new BufferedWriter(fw3);
			for(int l = 0 ; l < means.size() ; l+=2) {
				bw3.write("" + means.get(l) + " " + means.get(l + 1));
				bw3.newLine();
			}
			if(bw3 != null) 
				bw3.close();
			
			File filename4;
			filename4 = new File("session2_AQDPCM_betas2_" + audioRequestCode + option + ".txt");
			if(!filename4.exists()) 
				filename4.createNewFile();
			FileWriter fw4 = new FileWriter(filename4);
			BufferedWriter bw4 = null;
			bw4 = new BufferedWriter(fw4);
			for(int l = 0 ; l < betas.size() ; l++) {
				bw4.write("" + betas.get(l));
				bw4.newLine();
			}
			if(bw4 != null) 
				bw4.close();
		
			sSend.close();
			sReceive.close();
		}
	}
	
	//Ithakicopter
	public void Ithakicopter() throws UnknownHostException, IOException {
		
		InetAddress hostAddress = InetAddress.getByAddress(hostIP);
		
		DatagramSocket sSend = new DatagramSocket();
		DatagramSocket sReceive = new DatagramSocket(48078);
	
		byte[] txbuffer = ithakiCopterCode.getBytes();
		DatagramPacket pSend = new DatagramPacket(txbuffer,txbuffer.length,hostAddress,serverListeningPort);

		sReceive.setSoTimeout(5000);

		byte[] rxbuffer = new byte[5000];
		DatagramPacket pReceive = new DatagramPacket(rxbuffer,rxbuffer.length);

		String message;
		ArrayList<String> messages = new ArrayList<String>();
		
		Calendar calendar = Calendar.getInstance();
		SimpleDateFormat date = new SimpleDateFormat("HH:mm:ss");
		messages.add("Session2 "+ ithakiCopterCode + " Current Time " + date.format(calendar.getTime()) + "\n");
		
		for (int i = 1; i < 61; i++){
				sSend.send(pSend);
				sReceive.receive(pReceive);
				message = new String(rxbuffer,0,pReceive.getLength());
				messages.add(message);
				System.out.println(message);
		}
		
		File filename;
		filename = new File("session2_Ithakicopter2_" + ithakiCopterCode + ".txt");
		if(!filename.exists()) 
			filename.createNewFile();
		FileWriter fw = new FileWriter(filename);
		BufferedWriter bw = null;
		bw = new BufferedWriter(fw);
		for(int l = 0 ; l < messages.size() ; l++) {
			bw.write("" + messages.get(l));
			bw.newLine();
		}
		if(bw != null) 
			bw.close();
		
		sSend.close();
		sReceive.close();
	}
	
	//vehicle
	public void vehicle() throws UnknownHostException, IOException {
		
		String[] pid = new String[6]; 
		pid[0]="1F"; 
		pid[1]="0F"; 
		pid[2]="11"; 
		pid[3]="0C"; 
		pid[4]="0D"; 
		pid[5]="05"; 
		
		
		InetAddress hostAddress = InetAddress.getByAddress(hostIP);
		
		DatagramSocket sSend = new DatagramSocket();
		DatagramSocket sReceive = new DatagramSocket(clientListeningPort);
	
		for(int i=0; i<6; i++) {

		sReceive.setSoTimeout(5000);

		byte[] rxbuffer = new byte[5000];
		DatagramPacket pReceive = new DatagramPacket(rxbuffer,rxbuffer.length);

	
		String message;
		ArrayList<String> messages = new ArrayList<String>();
		
		double start = 0;
		start = System.currentTimeMillis();
		
		while((System.currentTimeMillis() - start) < 4*10*1000){
			
			byte[] txbuffer = (vehicleRequestCode + "OBD=01 " + pid[i] + "\r").getBytes();
			DatagramPacket pSend = new DatagramPacket(txbuffer,txbuffer.length,hostAddress,serverListeningPort);
			try {
			sSend.send(pSend);
			
			sReceive.receive(pReceive);
			}catch (Exception x){
				System.out.println(x);
			}
			message = new String(rxbuffer,0,pReceive.getLength());
			messages.add(message);
			System.out.println(message);
		}
		
		File filename;
		filename = new File("session2_Vehicle_" + vehicleRequestCode + "_PID_" + pid[i] + ".txt");
		if(!filename.exists()) 
			filename.createNewFile();
		FileWriter fw = new FileWriter(filename);
		BufferedWriter bw = null;
		bw = new BufferedWriter(fw);
		for(int l = 0 ; l < messages.size() ; l++) {
			bw.write("" + messages.get(l));
			bw.newLine();
		}
		if(bw != null) 
			bw.close();
		}
		sSend.close();
		sReceive.close();
		
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
		System.out.println("3. Sound DPCM");
		System.out.println("4. Sound AQDPCM");
		System.out.println("5. Ithakicopter");
		System.out.println("6. Vehicle");
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
		kb.close();
		return choice;
	}
	
	public void performAction(int choice) throws IOException, LineUnavailableException {
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
				soundDPCM();
				break;
			case 4:
				soundAQDPCM();
				break;
			case 5:
				Ithakicopter();
				break;
			case 6:
				vehicle();
				break;
			default:
				System.out.println("An unknown error has occured. ");
		}
	}
	
	public void runMenu() throws IOException, LineUnavailableException {
		printHeader();
		while(!exit) {
			printMenu();
			int choice = getInput();
			performAction(choice);
		}
	}
	
	//main
	public static void main(String[] args) throws IOException, LineUnavailableException {
		userApplication menu = new userApplication();
		menu.runMenu();
		
	}
		
}