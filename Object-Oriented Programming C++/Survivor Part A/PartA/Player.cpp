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

Player::Player(){

    name = "";

    gender = "";

    age = 0;

    occupation = "";

    hunger = 0.0;

    power = 100.0;

    votes = 0;

    public_votes = 0;

    object = "";
};

Player::Player(string s1, string s2, int i1, string s3, int i2, int i3, int i4, int i5, string s4){

    name = s1;

    gender = s2;

    age = i1;

    occupation = s3;

    hunger = i2;

    power = i3;

    votes = i4;

    public_votes = i5;

    object = s4;
};

Player::~Player(){
    cout << endl << endl;
};

    void Player::setName(string value){
        name = value;
    };

    void Player::setGender(string value){
        gender = value;
    };

    void Player::setAge(int value){
        age = value;
    };

    void Player::setOccupation(string value){
        occupation = value;
    };

    void Player::setHunger(int value){
        hunger = value;
    };

    void Player::setPower(int value){
        power = value;
    };

    void Player::setVote(int value){
        votes = value;
    };

    void Player::setPublicVote(int value){
        votes = value;
    };

    void Player::setObject(string value){
        object = value;
    };

    string Player::getName(){
        return name;
    };

    string Player::getGender(){
        return gender;
    };

    int Player::getAge(){
        return age;
    };

    string Player::getOccupation(){
        return occupation;
    };

    int Player::getHunger(){
        return hunger;
    };

    int Player::getPower(){
        return power;
    };

    int Player::getVote(){
        return votes;
    };

    int Player::getPublicVote(){
        return votes;
    };

    string Player::getObject(){
        return object;
    };


    void Player::status(){
        cout << "Name of player: " << name << endl;
        cout << "Gender: " << gender << endl;
        cout << "Age: " << age << endl;
        cout << "Occupation: " << occupation << endl;
        cout << "Hunger: " << hunger << "%" << endl;
        cout << "Power: " << power << "%" << endl;
        cout << "Votes: " << votes << endl;
        cout << "Public votes: " << public_votes << endl;
        cout << "Lucky object: " << object << endl;
    };

    void Player::work(){
        power = power - (random(30, 60) * power);
        hunger = hunger + ((int)(20/100) * hunger);

    };

    void Player::eat(){
        hunger -= 80;
        power = power + random(10, 40);

        if (hunger < 0)
            hunger = 0;
        if (power > 100)
            power = 100;
    };

    void Player::sleep(){
        power = 100;
    };

    void Player::play(){
        hunger += 25;
        power = power - (random(20, 50) * power);

        if (hunger > 100)
            hunger = 100;
    };


    int Player::random(int min, int max){ // υπολογισμός της ποσοστιαίας μεταβολής για τις καταστάσεις του παίκτη
        float r = (int)rand() / (float)RAND_MAX;
        return min + r * (max - min);
    }
