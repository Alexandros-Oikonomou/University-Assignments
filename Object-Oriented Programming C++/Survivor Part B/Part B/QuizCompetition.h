/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/

/*  Αυτή η κλάση είναι μια υποκλάση της Competition. Σε αυτήν την κλάση εισάγωνται τα στοιχεία του κουίζ. Αποτελείται από μεταβλητές, δυο συναρτήσεις αρχικών συνθηκών,
    μια συνάρτηση τελικών συνθηκών, τις συναρτήσεις get και set, την status που εμφανίζει τα στοιχεία του αγωνίσματος και την συνάρτηση compete που υλοποιεί το κουίζ.
*/

#ifndef QUIZCOMPETITION_H_INCLUDED
#define QUIZCOMPETITION_H_INCLUDED

#include "Competition.h"
#include "Round.h"
#include "Team.h"
#include "CommunicationAward.h"

using namespace std;

class QuizCompetition: public Competition{

protected:
    CommunicationAward communicationAward;
    Round rounds[19];
    string questions[10] = {"How many women has Spaliaras slept with? ",
                            "How many Nobel prizes have been won by Greeks? ",
                            "How many Tsangks are there in China? ",
                            "Which is the number in the jersey of LeBron James? ",
                            "How many stars are in Panos jersey? ",
                            "How many books are in Choutos' Library? ",
                            "How many fans are out there loving Danos? ",
                            "How many pounds are in one kilogram? ",
                            "How much is the fish? ",
                            "How many characters in the mandarene alphabet? "};
    int answers[10] = {4000, 2, 100000, 23, 12, 1, 200000, 2, 10, 6500};


public:

    QuizCompetition();//συνάρτηση αρχικών συνθηκών χωρίς ορίσματα
    QuizCompetition(int i1, string s1, CommunicationAward c1);//συνάρτηση αρχικών συνθηκών με ορίσματα
    ~QuizCompetition();//συνάρτηση τελικών συνθηκών

    CommunicationAward getCommunicationAward();

    void setCommunicationAward(CommunicationAward value);

    void status();// συνάρτηση που εκτυπώνει τις μεταβλητές

    void compete(Team &team1,Team &team2);// συνάρτηση για το κουίζ
};

#endif // QUIZCOMPETITION_H_INCLUDED
