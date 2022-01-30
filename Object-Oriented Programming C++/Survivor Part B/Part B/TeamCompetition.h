/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/

/*  Αυτή η κλάση είναι μια υποκλάση της Competition. Σε αυτήν την κλάση εισάγωνται τα στοιχεία του αγωνίσματος. Αποτελείται από μεταβλητές, δυο συναρτήσεις αρχικών συνθηκών,
    μια συνάρτηση τελικών συνθηκών, τις συναρτήσεις get και set, την status που εμφανίζει τα στοιχεία του αγωνίσματος και την συνάρτηση compete που υλοποιεί το αγώνισμα.
*/

#ifndef TEAMCOMPETITION_H_INCLUDED
#define TEAMCOMPETITION_H_INCLUDED

#include "Competition.h"
#include "FoodAward.h"
#include "Round.h"
#include "Team.h"

using namespace std;

class TeamCompetition: public Competition{

protected:
    FoodAward foodAward;
    Round rounds[19];


public:

    TeamCompetition();//συνάρτηση αρχικών συνθηκών χωρίς ορίσματα
    TeamCompetition(int i1, string s1, FoodAward f);//συνάρτηση αρχικών συνθηκών με ορίσματα
    ~TeamCompetition();//συνάρτηση τελικών συνθηκών

    FoodAward getFoodAward();
    void setFoodAward(FoodAward value);

    void status();// συνάρτηση που εκτυπώνει τις μεταβλητές
    int compete(Team &team1, Team &team2);// συνάρτηση για το αγώνισμα
};

#endif // TEAMCOMPETITION_H_INCLUDED
