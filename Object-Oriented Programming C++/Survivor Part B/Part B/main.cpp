/*  Ονοματεπώνυμο: Αλέξανδρος Οικονόμου
    ΑΕΜ: 9260
    Τηλέφωνο: 6970624527
    email: alexanco@ece.auth.gr

    Ονοματεπώνυμο: Ηλίας Παπαδημητρίου
    ΑΕΜ: 9259
    Τηλέφωνο: 6970834467
    email: papilipan@ece.auth.gr
*/


#include "Team.h"
#include "Player.h"
#include "Competition.h"
#include "TeamCompetition.h"
#include "QuizCompetition.h"
#include "ImmunityCompetition.h"
#include "FoodAward.h"
#include "ImmunityAward.h"
#include "Award.h"


using namespace std;

Team teams[2] = { Team("Diasimoi"), Team("Maxites")};
int competitionId = 0;
void menu();
void normalDay();
void teamCompetitionDay();
void quizDay();

int main()
{
    menu();

    return 0;
}

void menu()
{
    int choice = -1;

    while(choice != 0)
    {
        cout << "1.Normal Day." << endl;
        cout << "2.Team Competition Day." << endl;
        cout << "3.Quiz Day." << endl;
        cout << "0.Quit" << endl;

        cin >> choice;

        switch(choice)
        {

        case 1:
            normalDay();
            break;
        case 2:
            teamCompetitionDay();
            break;
        case 3:
            quizDay();
            break;
        case 0:
            break;
        default:
            cout << "Incorrect Input. Choose between 1 and 3. Press 0 to quit." << endl;

        }
    }
}

void normalDay()
{

    cout << "This is a normal day in the Survivor Game." << endl << endl;

   for(int j = 0; j < 2; j++){
        teams[j].teamWorks(); // συναρτήσεις για να δουλέψουν οι παίκτες των δυο ομάδων
        teams[j].teamEats(); // συναρτήσεις για να φαν οι παίκτες των δυο ομάδων
        teams[j].teamSleeps(); // συναρτήσεις για να κοιμηθούν οι παίκτες των δυο ομάδων

    }

}

void teamCompetitionDay()
{
    cout << "This is a team competition day in the Survivor Game." << endl << endl;
    teams[0].teamWorks();// συναρτήσεις για να δουλέψουν οι παίκτες της ομάδας των διασήμων
    teams[1].teamWorks();// συναρτήσεις για να δουλέψουν οι παίκτες της ομάδας των μαχητών
    FoodAward food("food1", false); // όρισμα ενός αντικειμένου τύπου FoodAward
    TeamCompetition run(competitionId, "Competition ", food); // όρισμα ενός αντικειμένου τύπου TeamCompetition
    int com = run.compete(teams[0], teams[1]); // κάλεσμα της compete με όρισμα τις 2 ομάδες
    ImmunityAward imAward("Award1", true); // όρισμα ενός αντικειμένου τύπου ImmunityAward
    ImmunityCompetition imCom(competitionId, "Competition ", imAward);// όρισμα ενός αντικειμένου τύπου ImmunityCompetition
    if(com == 1) // αν είναι 1, τότε οι μαχητές αγωνίζονται για ασυλία
        imCom.compete(teams[1]);
    else
        imCom.compete(teams[0]); // αν είναι 0, τότε οι διάσημοι αγωνίζονται για ασυλία
    teams[0].teamEats();// συναρτήσεις για να φαν οι παίκτες της ομάδας των διασήμων
    teams[1].teamEats();// συναρτήσεις για να φαν οι παίκτες της ομάδας των μαχητών
    teams[0].teamSleeps();// συναρτήσεις για να κοιμηθούν οι παίκτες της ομάδας των διασήμων
    teams[1].teamSleeps();// συναρτήσεις για να κοιμηθούν οι παίκτες της ομάδας των μαχητών

}

void quizDay()
{

    cout << "This is a quiz day in the Survivor Game." << endl << endl;

    teams[0].teamWorks();// συναρτήσεις για να δουλέψουν οι παίκτες της ομάδας των διασήμων
    teams[1].teamWorks();// συναρτήσεις για να δουλέψουν οι παίκτες της ομάδας των μαχητών
    CommunicationAward comAward("Award2", true);// όρισμα ενός αντικειμένου τύπου CommunicationAward
    QuizCompetition quiz(competitionId, "Competition ", comAward);// όρισμα ενός αντικειμένου τύπου QuizCompetition
    quiz.compete(teams[0], teams[1]);// κάλεσμα της compete με όρισμα τις 2 ομάδες
    teams[0].teamEats();// συναρτήσεις για να φαν οι παίκτες της ομάδας των διασήμων
    teams[1].teamEats();// συναρτήσεις για να φαν οι παίκτες της ομάδας των μαχητών
    teams[0].teamSleeps();// συναρτήσεις για να κοιμηθούν οι παίκτες της ομάδας των διασήμων
    teams[1].teamSleeps();// συναρτήσεις για να κοιμηθούν οι παίκτες της ομάδας των μαχητών

}
