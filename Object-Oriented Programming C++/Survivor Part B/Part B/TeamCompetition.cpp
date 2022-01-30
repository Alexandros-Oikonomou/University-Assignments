/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/

#include "TeamCompetition.h"
#include "FoodAward.h"
#include "Round.h"
#include "Competition.h"
#include "Team.h"
#include "Player.h"

using namespace std;



    TeamCompetition::TeamCompetition(){//συνάρτηση αρχικών συνθηκών χωρίς ορίσματα

    }

    TeamCompetition::TeamCompetition(int i1, string s1, FoodAward f):Competition(i1,s1,"") {//συνάρτηση αρχικών συνθηκών με ορίσματα
        foodAward = f;
    }

    TeamCompetition::~TeamCompetition(){//συνάρτηση τελικών συνθηκών
        cout << "Team-competition is destroyed" << endl;
    }

    FoodAward TeamCompetition::getFoodAward(){
        return foodAward;
    }

    void TeamCompetition::setFoodAward(FoodAward value){foodAward = value;}

    void TeamCompetition::status(){// συνάρτηση που εκτυπώνει τις μεταβλητές
        Competition::status();
        cout << "Food Award: " << foodAward.getName() << endl;
        cout << "rounds: " << rounds << endl;
    }
    int TeamCompetition::compete(Team &team1, Team &team2){ // συνάρτηση για το αγώνισμα
        int wins1 = 0;
        int wins2 = 0;
        int i = 0;
        while(wins1 < 10 && wins2 < 10){
            cout << endl << "Round " << i + 1 << endl; // εκτυπώνει τον αριθμό του γύρου
            Player player1 = team1.getPlayers()[rand()%10]; // διαλέγει εναν τυχαίο παίκτη της ομάδας
            cout << "Team Diasimoi is represented by " << player1.getName() << endl;
            Player player2 = team2.getPlayers()[rand()%10];// διαλέγει εναν τυχαίο παίκτη της ομάδας
            cout << "Team Maxites is represented by " << player2.getName() << endl;
            player1.compete(); // ο παίκτης αγωνίζεται
            player2.compete();// ο παίκτης αγωνίζεται
            if (player1.getPower() > player2.getPower()){ // αν οι δυνάμεις του πρώτου παίκτη είναι μεγαλύτερες τοτε κερδίζει
                rounds[i].setWinner(player1.getName()); // ο νικητής του γύρου
                wins1 ++; // οι νίκες αυξανονται κατα μια
                cout << "Player " << player1.getName() << " is the winner " << endl;
            }
            else if (player1.getPower() < player2.getPower()){// αν οι δυνάμεις του δευτερου παίκτη είναι μεγαλύτερες τοτε κερδίζει
                rounds[i].setWinner(player2.getName()); // ο νικητής του γύρου
                wins2 ++;// οι νίκες αυξανονται κατα μια
                cout << "Player " << player2.getName() << " is the winner " << endl;
            }
            else {
                if (player1.getHunger() < player2.getHunger()){// αν οι δυνάμεις ειναι ίσες τοτε γίνεται ελεγχος στην πείνα
                rounds[i].setWinner(player1.getName());// ο νικητής του γύρου
                wins1 ++;// οι νίκες αυξανονται κατα μια
                cout << "Player " << player1.getName() << " is the winner " << endl;
                }
                else {
                    rounds[i].setWinner(player2.getName());// ο νικητής του γύρου
                    wins2 ++;// οι νίκες αυξανονται κατα μια
                    cout << "Player " << player2.getName() << " is the winner " << endl;
                }
            }
            cout << "Score: Diasimoi: " << wins1 << ", Maxites: " << wins2 << endl; // το σκορ του αγωνίσματος
            i++;
        }

        if (wins1 == 10){ // στις 10 νικες τελειώνει το αγώνισμα
            int a = team1.getWins() + 1; // // οι νίκες αυξανονται κατα μια
            team1.setWins(a);

            team1.setSupplies(team1.getSupplies() + foodAward.getBonusSupplies());// η νικήτρια παίρνει επαθλο φαγητού

            cout << "Team Diasimoi is the winner " << endl;
            cout << "Team Maxites is now competing for the immunity award " << endl;
            return 1;
        }
        else {
            int a = team2.getWins() + 1;// οι νίκες αυξανονται κατα μια
            team2.setWins(a);

            team2.setSupplies(team2.getSupplies() + foodAward.getBonusSupplies());// η νικήτρια παίρνει επαθλο φαγητού

            cout << "Team Maxites is the winner " << endl;
            cout << "Team Diasimoi is now competing for the immunity award " << endl;
            return 0;
        }
    }

