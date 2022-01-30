/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/


#include "Player.h"
#include "Team.h"

Team::Team(){
    name = "";
    number_of_players = 0;
    wins = 0;
    portions = 500;
};

Team::Team(string s1, int i1, int i2, int i3){
    name = s1;
    number_of_players = i1;
    wins = i2;
    portions = i3;
};

Team::~Team(){
    cout << endl << endl;
};

void Team::setName(string value){
    name = value;
};

void Team::setNumber_of_players(int value){
    number_of_players = value;
};

void Team::setWins(int value){
    wins = value;
};

void Team::setPortions(int value){
    portions = value;
};

string Team::getName(){
    return name;
};

int Team::getNumber_of_players(){
    return number_of_players;
};

int Team::getWins(){
    return wins;
};

int Team::getPortions(){
    return portions;
};

void Team::status(){
    cout << "Name of team: " << name << endl;
    cout << "Number of players: " << number_of_players << endl;
    cout << "Players: ";
    for (int k = 1; k < number_of_players+1; k++){
        cout << table[k].name << endl;
    }
    cout << "Wins: " << wins << endl;
    cout << "Portions: " << portions << endl << endl << endl;
};

void Team::add_player(){
  int i1, i2, i3;
  string s1, s2, s3, s4;

    cout << "Enter name of player: " << endl;
    cin >> s1;
    cout << "Enter gender of player: " << endl;
    cin >> s2;
    cout << "Enter age of player: " << endl;
    cin >> i1;
    cout << "Enter occupation of player: " << endl;
    cin >> s3;
    cout << "Enter votes of player: " << endl;
    cin >> i2;
    cout << "Enter public votes of player: " << endl;
    cin >> i3;
    cout << "Enter lucky object of player: " << endl;
    cin >> s4;

    Player new1(s1, s2, i1, s3, 0, 100, i2, i3, s4);
    number_of_players++;//αυξάνει τους παίχτες κατα 1.
    table[number_of_players] = new1; //εισχωρεί τον νέο παίχτη στον πίνακα Παιχτών.

};

void Team::portions1(){
    portions--;
};

