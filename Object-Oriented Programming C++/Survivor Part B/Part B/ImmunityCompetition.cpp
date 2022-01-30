/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/

#include "Competition.h"
#include "ImmunityCompetition.h"
#include "ImmunityAward.h"
#include "TeamCompetition.h"
#include "Team.h"
#include "Player.h"


using namespace std;

    ImmunityCompetition::ImmunityCompetition(){}//συνάρτηση αρχικών συνθηκών χωρίς ορίσματα

    ImmunityCompetition::ImmunityCompetition(int i1, string s1, ImmunityAward im):Competition(i1, s1, ""){//συνάρτηση αρχικών συνθηκών με ορίσματα
        immunityAward = im;
    }

    ImmunityCompetition::~ImmunityCompetition(){//συνάρτηση τελικών συνθηκών
        cout << "Immunity Competition is destroyed" << endl;
    }

    ImmunityAward ImmunityCompetition::getImmunityAward(){
        return immunityAward;
    }

    void ImmunityCompetition::setImmunityAward(ImmunityAward value){
        immunityAward = value;
    }

    void ImmunityCompetition::status(){// συνάρτηση που εκτυπώνει τις μεταβλητές
        Competition::status();
        cout << "Immunity Award: " << immunityAward.getName() << endl;
    }

    void ImmunityCompetition::compete(Team &team){ // συνάρτηση για την ασυλία
        Player winner = team.getPlayers()[0]; // θέτουμε τον πρωτο παικτη ως νικητή
        for(int i = 1; i < 10; i++){
            if(team.getPlayers()[i].getPower() > winner.getPower()){ // αν ο παίκτης εχει περισσότερη δύναμη γίνεται νικητής
                winner = team.getPlayers()[i];
            }
        }
        cout << "Player " << winner.getName() << " is the winner" << endl;
    }

