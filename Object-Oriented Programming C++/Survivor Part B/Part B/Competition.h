/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/

/*  Σε αυτήν την κλάση εισάγωνται τα στοιχεία του αγωνίσματος. Αποτελείται από μεταβλητές, δυο συναρτήσεις αρχικών συνθηκών, μια συνάρτηση τελικών συνθηκών,
    τις συναρτήσεις get και set, την status που εμφανίζει τα στοιχεία του αγωνίσματος.
*/

#ifndef COMPETITION_H_INCLUDED
#define COMPETITION_H_INCLUDED
#include <iostream>
using namespace std;


class Competition{
protected:
    int id;
    string name;
    string winner;

public:

    Competition(){ //συνάρτηση αρχικών συνθηκών χωρίς ορίσματα
        id = 0;
        name = "";
        winner = "";
    }

    Competition(int i, string s1, string s2){ //συνάρτηση αρχικών συνθηκών με ορίσματα
        id = i;
        name = s1;
        winner = s2;

    }

    ~Competition(){ //συνάρτηση τελικών συνθηκών
        cout << "Competition is destroyed" << endl;
    }

    int getId(){return id;}
    string getName(){return name;}
    string getWinner(){return winner;}

    void setId(int value){id = value;}
    void setName(string value){name = value;}
    void setWinner(string value){winner = value;}

    void status(){ // συνάρτηση που εκτυπώνει τις μεταβλητές
        cout << "Competition code: " << id << endl;
        cout << "Name: " << name << endl;
        cout << "Winner: " << winner << endl;

    }
};

#endif // COMPETITION_H_INCLUDED
