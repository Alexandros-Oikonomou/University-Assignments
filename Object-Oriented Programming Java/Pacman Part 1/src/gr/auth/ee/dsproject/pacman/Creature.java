/**
* Ηλίας Παπαδημητρίου
*  AEM: 9259
*  papilipan@ece.auth.gr
*
*  Αλέξανδρος Οικονόμου
*  AEM: 9260
*  alexanco@ece.auth.gr
*
*/

package gr.auth.ee.dsproject.pacman;

/**
 * <p>
 * Title: DataStructures2006
 * </p>
 * 
 * <p>
 * Description: Data Structures project: year 2011-2012
 * </p>
 * 
 * <p>
 * Copyright: Copyright (c) 2011
 * </p>
 * 
 * <p>
 * Company: A.U.Th.
 * </p>
 * 
 * @author Michael T. Tsapanos
 * @version 1.0
 */
public class Creature implements gr.auth.ee.dsproject.pacman.AbstractCreature
{

  public String getName ()
  {
    return "Mine";
  }

  private int step = 1;
  private boolean amPrey;

  public Creature (boolean isPrey)
  {
    amPrey = isPrey;

  }

  public int calculateNextPacmanPosition (Room[][] Maze, int[] currPosition)
  {

    int newDirection = -1;

    while (newDirection == -1) {

      int temp_dir = (int) (4 * Math.random());

      if (Maze[currPosition[0]][currPosition[1]].walls[temp_dir] == 1) {
        newDirection = temp_dir;
      }

    }
    step++;

    return newDirection;
  }

  // THIS IS THE FUNCTION TO IMPLEMENT!!!!!!
  public int[] calculateNextGhostPosition (Room[][] Maze, int[][] currentPos)
  /** Αυτή η συνάρτηση υπολογίζει την επόμενη θέση των φαντασμάτων, με τέτοιο τρόπο ώστε 
   * να μη συγκρούονται με τοίχους και μεταξύ τους.
   * newDirection, πίνακας για την επόμενη κίνηση των φαντασμάτων
   * temp_direction, πίνακας με προσωρινες τιμές πριν γίνουν έλεγχοι και εγκριθούν 
   */
  {
	  
	  int[] newDirection = {-1,-1,-1,-1}; // αρχικοποίηση του πίνακα
	  int[] temp_direction = new int[PacmanUtilities.numberOfGhosts];
	  if (step < PacmanUtilities.stepLimit) {  // ελεγχος για τον αριθμό των κινήσεων, αν εχουν απομίνει
		  for(int i = 0; i < PacmanUtilities.numberOfGhosts; i++) { // επανάληψη για 4 φαντάσματα
			  while (newDirection[i] == -1 ) { // όσο δεν έχει αλλάξει η αρχική τιμή
				  temp_direction[i] = (int) (4 * Math.random()); // εκχώρηση τυχαίας τιμής από 0 μέχρι 3
				  if (Maze[currentPos[i][0]][currentPos[i][1]].walls[temp_direction[i]] == 1) { // αν δεν έχει τοίχο είναι αληθής
	    	  			newDirection[i] = temp_direction[i]; // εκχώρηση της προσωρινής τιμής στον πίνακα με τη νέα κίνηση
				  }
			  }
		  }
		  boolean[] b = checkCollision(newDirection, currentPos); // πίνακας με τιμές της checkCollision
		  for (int j = 1; j < b.length; j++) { // επανάληψη για 3 φαντάσματα, αφου το πρώτο έχει παντα προτεραιότητα
			  int[] k = {-1, -2, -3}; // πίνακας που κρατάει μέχρι και 3 κατευθύνσεις της νέας κίνησης ενός φαντάσματος, ώστε να μειωθεί ο αριθμός των ελέγχων
			  int l = 0; // μεταβλητή μετρητής του πίνακα k
			  while(b[j] == true && l < 3) {  
				  do {
					k[l] = (int) (4 * Math.random()); // εκχώρηση τυχαίας τιμής από 0 μέχρι 3
					newDirection[j] = k[l];
				  }while(k[0] == k[1] || k[0] == k[2] || k[1] == k[2] || //όσο μία τιμή είναι ίδια με κάποια άλλη, εκχωείται νεα τυχαία τιμή
					k[l] == temp_direction[j] || Maze[currentPos[j][0]][currentPos[j][1]].walls[k[l]] == 0); // Σκοπός να μειώνει τις πράξεις που απαιτούνται
				  b = checkCollision(newDirection, currentPos);
				  l++;
			  }	
		  }
	  }
	  step++;	    
	    
	  return newDirection;

  }

  public boolean[] checkCollision (int[] moves, int[][] currentPos)
  {
    boolean[] collision = new boolean[PacmanUtilities.numberOfGhosts];

    int[][] newPos = new int[4][2];

    for (int i = 0; i < moves.length; i++) {

      if (moves[i] == 0) {
        newPos[i][0] = currentPos[i][0];
        newPos[i][1] = currentPos[i][1] - 1;
      } else if (moves[i] == 1) {
        newPos[i][0] = currentPos[i][0] + 1;
        newPos[i][1] = currentPos[i][1];
      } else if (moves[i] == 2) {
        newPos[i][0] = currentPos[i][0];
        newPos[i][1] = currentPos[i][1] + 1;
      } else {
        newPos[i][0] = currentPos[i][0] - 1;
        newPos[i][1] = currentPos[i][1];
      }

      collision[i] = false;
    }

    for (int k = 0; k < moves.length; k++) {
        // System.out.println("Ghost " + k + " new Position is (" + newPos[k][0] + "," + newPos[k][1] + ").");
    }

    for (int i = 0; i < moves.length; i++) {
      for (int j = i + 1; j < moves.length; j++) {
        if (newPos[i][0] == newPos[j][0] && newPos[i][1] == newPos[j][1]) {
           // System.out.println("Ghosts " + i + " and " + j + " are colliding");
          collision[j] = true;
        }

        if (newPos[i][0] == currentPos[j][0] && newPos[i][1] == currentPos[j][1] && newPos[j][0] == currentPos[i][0] && newPos[j][1] == currentPos[i][1]) {
           // System.out.println("Ghosts " + i + " and " + j + " are colliding");
          collision[j] = true;
        }

      }

    }
    return collision;
  }

}
