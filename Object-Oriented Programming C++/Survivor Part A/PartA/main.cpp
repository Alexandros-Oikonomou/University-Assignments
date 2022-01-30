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

using namespace std;

int main()
{

    Team t1("Maxites", 0, 0, 500);
    Team t2("Diasimoi", 0, 0, 500);

    int answer, answer2, answer3, answer4, answer5, answer7;
    int i = 0, j = 0; // μεταβλητές για έλεγχο αριθμό παικτών
    string answer6;
    bool flag; // μεταβλητή για τον έλεγχο εάν έχει βρεθεί το όνομα του παίκτη
    do{
    cout << endl << "1. Add player to team" << endl;
    cout << "2. View team statistics" << endl;
    cout << "3. View statistics of player" << endl;
    cout << "4. Exit" << endl << endl;
    cout << "Choose an option: " << endl << endl;
    do
    cin >> answer;
    while(answer < 1 || answer > 4); // για να βεβαιωθεί ότι η απάντηση θα είναι σωστή
    switch(answer){
        case 1:
            cout << "Press: " << endl;
            cout << "1, to add player to Team Maxites... " << endl;
            cout << "2, to add player to Team Diasimoi... " << endl << endl;
            do
            cin >> answer2;
            while(answer2 < 1 || answer2 > 2); // για να βεβαιωθεί ότι η απάντηση θα είναι σωστή
            if(answer2 == 1){
                if(i < 10){ // όσο το i είναι μικρότερο του 10, η ομάδα δεν είναι πλήρης
                    t1.add_player();
                    i++;
                }
                else
                    cout << "Team is full... " << endl << endl;
            }
            else{
                if(j < 10){
                    t2.add_player(); // όσο το j είναι μικρότερο του 10, η ομάδα δεν είναι πλήρης
                    j++;
                }
                else
                    cout << "Team is full... " << endl << endl;
                }
            break;
        case 2:
            cout << "Press: " << endl;
            cout << "1, to view team statistics of Team Maxites... " << endl;
            cout << "2, to view team statistics of Team Diasimoi... " << endl << endl;
            do
            cin >> answer3;
            while(answer2 < 1 || answer2 > 2); // για να βεβαιωθεί ότι η απάντηση θα είναι σωστή
            if(answer2 == 1)
                t1.status();
            else
                t2.status();
            break;
        case 3:
            cout << "Press: " << endl;
            cout << "1, to find player by name." << endl;
            cout << "2, to find player by position." << endl << endl;
            do
            cin >> answer4;
            while(answer4 < 1 || answer4 > 2); // για να βεβαιωθεί ότι η απάντηση θα είναι σωστή

            cout << "Press: " << endl;
            cout << "1, for Team Maxites. " << endl;
            cout << "2, for Team Diasimoi. " << endl << endl;
            do
            cin >> answer5;
            while(answer5 < 1 || answer5 > 2); // για να βεβαιωθεί ότι η απάντηση θα είναι σωστή

            if(answer5 == 1){
                if(answer4 == 1){ // υλοποίηση για μαχητές
                    cout << "Type player's name: " << endl << endl;
                    cin >> answer6;
                    flag = 0;
                    for(i = 0; i < 10; i++){
                        if (answer6 == t1.table[i].name ){
                            t1.table[i].status();
                            flag = 1; // γίνεται 1 άμα θα βρεθεί ο παίκτης στην ομάδα
                            continue;
                        }
                    }
                        if(flag == 0) // αν δεν βρεθεί ο παίκτης εμφανίζει κατάλληλο μήνυμα
                            cout << "Player not found... " << endl << endl;
                }
                else{
                    cout << "Type player's position: " << endl << endl;
                    cin >> answer7;
                    t1.table[answer7].status();
                continue;
                }
            }
            else{
                if(answer4 == 1){ // υλοποίηση για διάσημους
                    cout << "Type player's name: " << endl << endl;
                    cin >> answer6;
                    for(i = 0; i < 10; i++){
                        if (answer6 == t2.table[i].name ){
                            t2.table[i].status();
                            continue;
                        }
                    }
                }
                else{
                    cout << "Type player's position: " << endl << endl;
                    cin >> answer7;
                    t2.table[answer7].status();
                continue;
                }
            }
            break;
        case 4:
            cout << "Exiting..." << endl;
            break;
            }


    }while (answer != 4); // αν η απάντηση είναι 4 το πρόγραμμα τερματίζει
    return 0;
}

