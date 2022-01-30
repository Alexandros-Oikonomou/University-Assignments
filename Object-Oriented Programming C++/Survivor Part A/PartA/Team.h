/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/

/* Σε αυτήν την κλάση εισάγωνται τα στοιχεία της ομάδας. Αποτελείται από μεταβλητές, δυο συναρτήσεις αρχικών συνθηκών, μια συνάρτηση τελικών συνθηκών,
    τις συναρτήσεις get και set, την status που εμφανίζει τα στοιχεία της ομάδας, τις μεθόδους add_player με την οποία εισάγεται ένας παίκτης στην ομάδα
    και την portions η οποία μειώνει τις μερίδες κατα μία όταν κάποιος παίκτης τρώει.
*/


#ifndef TEAM_H_INCLUDED
#define TEAM_H_INCLUDED

#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

class Team{

public:
    string name;
    int number_of_players;
    int wins;
    int portions;
    Player table[10];

    Team();
    Team(string s1, int i1, int i2, int i3);
    ~Team();

    void setName(string value);
    void setNumber_of_players(int value);
    void setWins(int value);
    void setPortions(int value);

    string getName();
    int getNumber_of_players();
    int getWins();
    int getPortions();

    void status();

    void add_player();

    void portions1();
};

#endif // TEAM_H_INCLUDED
