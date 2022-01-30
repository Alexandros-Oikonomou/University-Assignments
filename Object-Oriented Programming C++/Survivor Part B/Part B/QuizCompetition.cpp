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
#include "QuizCompetition.h"
#include <cmath>

using namespace std;



    QuizCompetition::QuizCompetition(){//συνάρτηση αρχικών συνθηκών χωρίς ορίσματα

    }

    QuizCompetition::QuizCompetition(int i1, string s1, CommunicationAward c1):Competition(i1, s1, ""){//συνάρτηση αρχικών συνθηκών με ορίσματα
        communicationAward = c1;
    }

    QuizCompetition::~QuizCompetition(){//συνάρτηση τελικών συνθηκών
        cout << "Team-competition is destroyed" << endl;
    }


    CommunicationAward QuizCompetition::getCommunicationAward(){
        return communicationAward;
    }


    void QuizCompetition::setCommunicationAward(CommunicationAward value){
        communicationAward = value;
    }

    void QuizCompetition::status(){// συνάρτηση που εκτυπώνει τις μεταβλητές
        Competition::status();
        cout << "Communication Award: " << communicationAward.getName() << endl;
        cout << "Rounds: " << rounds << endl;
    }



    void QuizCompetition::compete(Team &team1, Team &team2){ // συνάρτηση για το κουίζ
        int wins1 = 0;
        int wins2 = 0;
        int position;
        int i = 0;
        while(wins1 < 10 && wins2 < 10){
            cout << endl << "Round " << i + 1 << endl;// εκτυπώνει τον αριθμό του γύρου
            Player player1 = team1.getPlayers()[rand()%10];// διαλέγει εναν τυχαίο παίκτη της ομάδας
            cout << "Team Diasimoi is represented by " << player1.getName() << endl;
            Player player2 = team2.getPlayers()[rand()%10];// διαλέγει εναν τυχαίο παίκτη της ομάδας
            cout << "Team Maxites is represented by " << player2.getName() << endl;
            player1.compete();// ο παίκτης αγωνίζεται
            player2.compete();// ο παίκτης αγωνίζεται
            string question = QuizCompetition::questions[rand()%10];// διαλέγει μια τυχαία ερώτηση
            for(int j = 0; j < 10; j++){
                if(question == QuizCompetition::questions[j])
                    position = j; // εντοπισμός της ερώτησης

            }
            int answer1 = rand()%10; // διαλέγει μια τυχαία απάντηση
            int answer2 = rand()%10;// διαλέγει μια τυχαία απάντηση

            if (abs(answer1 - answers[position]) < abs(answer2 - answers[position])){ // απόλυτη τιμή για να φανεί ποια απάντηση είναι πιο κοντά στην σωστή
                rounds[i].setWinner(player1.getName());// ο νικητής του γύρου
                wins1 ++;// οι νίκες αυξανονται κατα μια
                cout << "Player " << player1.getName() << " is the winner " << endl;
            }
                else{
                rounds[i].setWinner(player2.getName());// ο νικητής του γύρου
                wins2 ++;// οι νίκες αυξανονται κατα μια
                cout << "Player " << player2.getName() << " is the winner " << endl;
            }
            cout << "Score: Diasimoi: " << wins1 << ", Maxites: " << wins2 << endl;// το σκορ του κουίζ
            i++;
        }

        if (wins1 == 10){// στις 10 νικες τελειώνει το κουίζ
            int a = team1.getWins() + 1;// οι νίκες αυξανονται κατα μια
            team1.setWins(a);
            cout << "Team Diasimoi is the winner " << endl;

        }
        else {
            int a = team2.getWins() + 1;// οι νίκες αυξανονται κατα μια
            team2.setWins(a);
            cout << "Team Maxites is the winner " << endl;

        }
        communicationAward.status();// εκτυπώνει πανηγυρισμούς
    }


