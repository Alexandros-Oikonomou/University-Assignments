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
    μια συνάρτηση τελικών συνθηκών, τις συναρτήσεις get και set, την status που εμφανίζει τα στοιχεία του αγωνίσματος και την συνάρτηση compete που υλοποιεί το αγώνισμα της ασυλίας.
*/

#ifndef IMMUNITYCOMPETITION_H_INCLUDED
#define IMMUNITYCOMPETITION_H_INCLUDED

#include "Competition.h"
#include "ImmunityAward.h"
#include "Team.h"

using namespace std;

class ImmunityCompetition: public Competition{

protected:
    ImmunityAward immunityAward;

public:
    ImmunityCompetition();//συνάρτηση αρχικών συνθηκών χωρίς ορίσματα
    ImmunityCompetition(int i1, string s1, ImmunityAward im);//συνάρτηση αρχικών συνθηκών με ορίσματα
    ~ImmunityCompetition();//συνάρτηση τελικών συνθηκών

    void setImmunityAward(ImmunityAward value);

    ImmunityAward getImmunityAward();

    void status();// συνάρτηση που εκτυπώνει τις μεταβλητές

    void compete(Team &team);// συνάρτηση για την ασυλια
};
#endif // IMMUNITYCOMPETITION_H_INCLUDED
