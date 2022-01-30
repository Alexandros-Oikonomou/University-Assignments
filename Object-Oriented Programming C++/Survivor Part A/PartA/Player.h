/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/

/* Σε αυτήν την κλάση εισάγωνται τα στοιχεία των παικτών. Αποτελείται από μεταβλητές, δυο συναρτήσεις αρχικών συνθηκών, μια συνάρτηση τελικών συνθηκών,
    τις συναρτήσεις get και set, την status που εμφανίζει τα στοιχεία του παίκτη, τις μεθόδους eat, sleep, work, play και την random που υπολογίζει την τυχαία
    αύξηση ή μείωση στις καταστάσεις του παίκτη(power, hunger).
*/

#ifndef PLAYER_H_INCLUDED
#define PLAYER_H_INCLUDED


#include <iostream>
#include <string>
#include <cstdlib>

using namespace std;

class Player{

public:
    string name;
    string gender;
    int age;
    string occupation;
    int hunger;
    int power;
    int votes;
    int public_votes;
    string object;

    Player();
    Player(string s1, string s2, int i1, string s3, int i2, int i3, int i4, int i5, string s4);
    ~Player();

    void setName(string value);
    void setGender(string value);
    void setAge(int value);
    void setOccupation(string value);
    void setHunger(int value);
    void setPower(int value);
    void setVote(int value);
    void setPublicVote(int value);
    void setObject(string value);

    string getName();
    string getGender();
    int getAge();
    string getOccupation();
    int getHunger();
    int getPower();
    int getVote();
    int getPublicVote();
    string getObject();

    void status();

    void work();
    void eat();
    void sleep();
    void play();

    int random(int min, int max);

};


#endif // PLAYER_H_INCLUDED
