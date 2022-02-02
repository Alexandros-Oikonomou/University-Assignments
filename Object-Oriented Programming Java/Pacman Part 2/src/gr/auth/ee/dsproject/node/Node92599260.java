
/*
* Ηλίας Παπαδημητρίου
*  AEM: 9259
*  papilipan@ece.auth.gr
*
*  Αλέξανδρος Οικονόμου
*  AEM: 9260
*  alexanco@ece.auth.gr
*
*/
package gr.auth.ee.dsproject.node;

import gr.auth.ee.dsproject.pacman.*;

public class Node92599260
{

  int nodeX;
  int nodeY;
  int nodeMove;
  double nodeEvaluation;
  int[][] currentGhostPos = new int[4][2];
  int[][] flagPos = new int [4][2];
  boolean[] currentFlagStatus = new boolean[4];

  public Node92599260(int x, int y, int nm, Room[][] Maze) // αρχικοποίηση των μεταβλητών με ορίσματα
  {
      nodeX = x;
      nodeY = y;
      nodeMove = nm;
      currentGhostPos = findGhosts(Maze);
      flagPos = findFlags(Maze);
      currentFlagStatus = checkFlags(Maze);   
      nodeEvaluation = evaluation(Maze);
  }
  
  
  
  public double getNodeEvaluation() {
	  return nodeEvaluation;
  }
  
  
  private int[][] findGhosts (Room[][] Maze) // συνάρτηση που εντοπίζει τα φαντάσματα
  {
	  int k = 0;
	  for(int i = 0; i < PacmanUtilities.numberOfRows; i++) {
  		for(int j = 0; j < PacmanUtilities.numberOfColumns; j++) {
  			if(Maze[i][j].isGhost()) {
  				currentGhostPos[k][0] = i;
  				currentGhostPos[k][1] = j;
  				k++;
  			}
  		}
	  }
	  return currentGhostPos;
  }

  private int[][] findFlags (Room[][] Maze) // συνάρτηση που εντοπίζει τις σημαίες
  {
	  int k = 0;
	  for(int i = 0; i < PacmanUtilities.numberOfRows; i++) {
  		for(int j = 0; j < PacmanUtilities.numberOfColumns; j++) {
  			if(Maze[i][j].isFlag()) {
  				flagPos[k][0] = i;
  				flagPos[k][1] = j;
  				k++;
  			}
  		}
	  }
	  return flagPos;
  }

  private boolean[] checkFlags (Room[][] Maze) // συνάρτηση που ελέγχει αν η σημαίες έχουν κατακτηθεί
  {
	  int k = 0;
	  for(int i = 0; i < 4; i++) {
	  		if(Maze[flagPos[i][0]][flagPos[i][1]].isCapturedFlag()) {
	  			currentFlagStatus[k] = true;
	  		}
	  		else {
	  			currentFlagStatus[k] = false;
	  		}
	  		k++;
	  }
	  return currentFlagStatus;
  }
  private double evaluation (Room[][] Maze)// συνάρτηση αξιολόγησης
  {
	  nodeEvaluation = 0;
	  
	  	int n = 0;
	  	if(Maze[nodeX][nodeY].walls[nodeMove] == 0) {
	  		n = -1000; // αν είναι τοίχος δεν πρέπει να γίνει η κίνηση και βάζουμε πολυ μεγάλη αρνητκή τιμή
	  	}
	  	
	  	// εύρεση ελάχιστης απόστασης φαντάσματος
	  	int minDistanceGhostX = 1000; // αρχικοποίηση πολύ μεγάλης τιμής
		int minDistanceGhostY = 1000;
		int minGhost = -1;
		for(int i = 0; i < 4; i++) {
			// αν η απόσταση του πακμαν και του φαντάσματος μειώνεται σε συντεταγμένες X και Y 
		  	if(Math.abs(nodeX - currentGhostPos[i][0]) + Math.abs(nodeY - currentGhostPos[i][1]) < minDistanceGhostX + minDistanceGhostY) {
		  		minDistanceGhostX = Math.abs(nodeX - currentGhostPos[i][0]); // νέα ελάχιστη απόσταση
		  		minDistanceGhostY = Math.abs(nodeY - currentGhostPos[i][1]);
		  		minGhost = i; // ο αριθμός του φαντάσματος
		  	}
		}
		// εύρεση ελάχιστης απόστασης σημαίας
	  	int minDistanceFlagX = 1000; // αρχικοποίηση πολύ μεγάλης τιμής
	  	int minDistanceFlagY = 1000;
	  	int minFlag = -1;
	  	for(int i = 0; i < 4; i++) {
	  	// αν η απόσταση του πακμαν και της σημαιας μειώνεται σε συντεταγμένες X και Y 
	  		if(Math.abs(nodeX - flagPos[i][0]) + Math.abs(nodeY - flagPos[i][1]) < minDistanceFlagX + minDistanceFlagY && !currentFlagStatus[i]) {
	  			minDistanceFlagX = Math.abs(nodeX - flagPos[i][0]); // νέα ελάχιστη απόσταση
	  			minDistanceFlagY = Math.abs(nodeY - flagPos[i][1]);
	  			minFlag = i; // ο αριθμός του φαντάσματος
	  		}
	  	}
	  	
	  	int p = 0;
	    for(int i = 0; i < 4; i++){ // 4 επαναλήψεις, μια για κάθε φάντασμα/ σημαία
	    		if(nodeMove == 0 && nodeY > 0) {
	    			// αν η κίνηση ειναι αριστερά και ο πακμαν δεν βρίσκεται τέρμα αριστερά
	    			//αν μειώνεται η απόσταση του πακμαν με την κοντινότερη σημαία
	    			if(Math.abs(nodeY - flagPos[minFlag][1]) > Math.abs(nodeY - 1  - flagPos[minFlag][1])) {
	    				p += 5;
	    			}
	    			// αν είναι η σημαία
	    			if(Maze[nodeX][nodeY - 1] == Maze[flagPos[i][0]][flagPos[i][1]] && !currentFlagStatus[i]) {
	    				p += 100;
	    			}
	    			// αν αυξάνεται η απόσταση του πακμαν από το κοντινότερο φάντασμα
	    			if(Math.abs(nodeY - currentGhostPos[minGhost][1]) > Math.abs(nodeY - 1  - currentGhostPos[minGhost][1])) {
	    				p += 2;
	    			}
	    			else {
	    				p -= 2;
	    			}
	    			// αν είναι φαντασμα
	    			if(Maze[nodeX][nodeY - 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    				p -= 100;
	    			}
	    			if(nodeX > 0) {
	    				// αν ο πακμαν κινηθεί αριστερά και πάνω του ειναι φάντασμα
	    				if(Maze[nodeX - 1][nodeY - 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    			if(nodeX < PacmanUtilities.numberOfRows - 1) {
	    				// αν ο πακμαν κινηθεί αριστερά και κάτω του ειναι φάντασμα
	    				if(Maze[nodeX + 1][nodeY - 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    		}
	    		else if(nodeMove == 1 && nodeX < PacmanUtilities.numberOfRows - 1) {
	    			// αν η κίνηση ειναι κάτω και ο πακμαν δεν βρίσκεται τέρμα κάτω
	    			//αν μειώνεται η απόσταση του πακμαν με την κοντινότερη σημαία
	    			if(Math.abs(nodeX - flagPos[minFlag][0]) > Math.abs(nodeX + 1  - flagPos[minFlag][0])) {
	    				p += 5;
	    			}
	    			// αν είναι η σημαία
	    			if(Maze[nodeX + 1][nodeY] == Maze[flagPos[i][0]][flagPos[i][1]] && !currentFlagStatus[i]) {
	    				p += 100;
	    			}
	    			// αν αυξάνεται η απόσταση του πακμαν από το κοντινότερο φάντασμα
	    			if(Math.abs(nodeX - currentGhostPos[minGhost][0]) > Math.abs(nodeX + 1  - currentGhostPos[minGhost][0])) {
	    				p += 2;
	    			}
	    			else {
	    				p -= 2;
	    			}
	    			// αν είναι φαντασμα
	    			if(Maze[nodeX + 1][nodeY] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    				p -= 100;
	    			}
	    			if(nodeY > 0) {
	    				// αν ο πακμαν κινηθεί κάτω και αριστερά του ειναι φάντασμα
	    				if(Maze[nodeX + 1][nodeY - 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    			if(nodeY < PacmanUtilities.numberOfColumns - 1) {
	    				// αν ο πακμαν κινηθεί κάτω και δεξιά του ειναι φάντασμα
	    				if(Maze[nodeX + 1][nodeY + 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    		}
	    		else if(nodeMove == 2 && nodeY < PacmanUtilities.numberOfColumns - 1) {
	    			// αν η κίνηση ειναι δεξιά και ο πακμαν δεν βρίσκεται τέρμα δεξιά
	    			//αν μειώνεται η απόσταση του πακμαν με την κοντινότερη σημαία
	    			if(Math.abs(nodeY - flagPos[minFlag][1]) > Math.abs(nodeY + 1  - flagPos[minFlag][1])) {
	    				p += 5;
	    			}
	    			// αν είναι η σημαία
	    			if(Maze[nodeX][nodeY + 1] == Maze[flagPos[i][0]][flagPos[i][1]] && !currentFlagStatus[i]) {
	    				p += 100;
	    			}
	    			// αν αυξάνεται η απόσταση του πακμαν από το κοντινότερο φάντασμα
	    			if(Math.abs(nodeY - currentGhostPos[minGhost][1]) > Math.abs(nodeY + 1  - currentGhostPos[minGhost][1])) {
	    				p += 2;
	    			}
	    			else {
	    				p -= 2;
	    			}
	    			// αν είναι φαντασμα
	    			if(Maze[nodeX][nodeY + 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    				p -= 100;
	    			}
	    			if(nodeX < PacmanUtilities.numberOfRows - 1) {
	    				// αν ο πακμαν κινηθεί δεξιά και κάτω του ειναι φάντασμα
	    				if(Maze[nodeX + 1][nodeY + 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    			if(nodeX > 0) {
	    				// αν ο πακμαν κινηθεί δεξιά και πάνω του ειναι φάντασμα
	    				if(Maze[nodeX - 1][nodeY + 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    		}
	    		else if(nodeMove == 3 && nodeX > 0) {
	    			// αν η κίνηση ειναι πάνω και ο πακμαν δεν βρίσκεται τέρμα πάνω
	    			//αν μειώνεται η απόσταση του πακμαν με την κοντινότερη σημαία
	    			if(Math.abs(nodeX - flagPos[minFlag][0]) > Math.abs(nodeX - 1  - flagPos[minFlag][0])) {
	    				p += 5;
	    			}
	    			// αν είναι η σημαία
	    			if(Maze[nodeX - 1][nodeY] == Maze[flagPos[i][0]][flagPos[i][1]] && !currentFlagStatus[i]) {
	    				p += 100;
	    			}
	    			// αν αυξάνεται η απόσταση του πακμαν από το κοντινότερο φάντασμα
	    			if(Math.abs(nodeX - currentGhostPos[minGhost][0]) > Math.abs(nodeX - 1  - currentGhostPos[minGhost][0])) {
	    				p += 2;
	    			}
	    			else {
	    				p -= 2;
	    			}
	    			// αν είναι φαντασμα
	    			if(Maze[nodeX - 1][nodeY] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    				p -= 100;
	    			}
	    			if(nodeY < PacmanUtilities.numberOfColumns - 1) {
	    				// αν ο πακμαν κινηθεί πάνω και δεξιά του ειναι φάντασμα
	    				if(Maze[nodeX - 1][nodeY + 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    			if(nodeY > 0) {
	    				// αν ο πακμαν κινηθεί πάνω και αριστερά του ειναι φάντασμα
	    				if(Maze[nodeX - 1][nodeY - 1] == Maze[currentGhostPos[i][0]][currentGhostPos[i][1]]) {
	    					p -= 100;
	    				}
	    			}
	    		}
	    }
	    
	    nodeEvaluation = p + n; // πρόσθεση των τιμών
	    //System.out.println(nodeEvaluation + " + " + nodeMove);
	    return nodeEvaluation; // επιστροφή της τιμής
  	}

}