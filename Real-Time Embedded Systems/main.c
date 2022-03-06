// Alexandros Oikonomou
// Bluetooth MAC address simulation
// Date: March 2022

#include <stdio.h>
#include <time.h> 
#include <errno.h>  	
#include <stdint.h> 
#include <inttypes.h>  
#include <stdlib.h>	
#include <stdbool.h> 	
#include <pthread.h>	

struct timespec ts;

pthread_mutex_t mutex;

FILE* closeContactsFile;
FILE* logsFile;
FILE* callFile;

unsigned char buff1[100];
unsigned char buff2[200];

// 48-bit integer
typedef struct { 
  uint64_t v: 48;
} uint48;

// macaddress struct
typedef struct {
  uint48 mac;
  time_t timestamp;
  int key;
} macaddress;

// linked list struct
struct linkedList {
  macaddress macaddr;
  struct linkedList* next;
};
typedef struct linkedList list;

list* contactsStart = NULL;
list* closeContactsStart = NULL;

// searching a macaddress inside a linked list
// returning the timestamp it was created
time_t search(list* start, int key) {
  list* temp = start;
  while (temp != NULL) {
    if (temp->macaddr.key == key)
      return temp->macaddr.timestamp;
    temp = temp->next;
  }
  return 0;
}

// returning the length of a linked list
int getLength(list* start) {
  if (start == NULL)
    return 0;
  else
    return 1 + getLength(start->next);
}

// adding a macaddress to a linked list
void addToList(list** start, macaddress newMacaddress) {
  list* newList = malloc(sizeof(list));
  newList->macaddr = newMacaddress;
  newList->next = (*start);
  (*start) = newList;
  fprintf(logsFile, "Added Mac address: %" PRIu64 ", Time scanned:%d\n", newMacaddress.mac, (int) newMacaddress.timestamp);
  fflush(logsFile);
}

// removing a macaddress from a linked list
void deList(list** start, macaddress newMacaddress) {
  list* temp = *start, *prev;
  if (temp != NULL && temp->macaddr.key == newMacaddress.key) {
    *start = temp->next;
    free(temp);
    return;
  }
  while (temp != NULL && temp->macaddr.key != newMacaddress.key) {
    prev = temp;
    temp = temp->next;
  }
  if (temp == NULL)
    return;
  prev->next = temp->next;
  free(temp);
  fprintf(logsFile, "Delete Mac address: %" PRIu64 ", Time scanned:%d\n", newMacaddress.mac, (int) newMacaddress.timestamp);
  fflush(logsFile);
} 

// creating a new macaddress every 10 seconds
macaddress BTnearMe() {
  macaddress randomMac;
  randomMac.timestamp = time(NULL);
  timespec_get(&ts, TIME_UTC);
  strftime(buff1, sizeof(buff1), "%T", gmtime(&ts.tv_sec));
  fprintf(callFile, "%s.%09ld\n", buff1, ts.tv_nsec);
  fflush(callFile);
  randomMac.key = (rand() % 1000000) + 1;
  randomMac.mac.v = (uint64_t) randomMac.key; 
  return randomMac;
}

// adding a macaddress to either the all contacts list or the close contacts list
void addContact(macaddress randomMac) {
  if (search(contactsStart, randomMac.key) == 0) {
    addToList(&contactsStart, randomMac);
    return;
  }
  else if (search(closeContactsStart, randomMac.key) == 0) {
    time_t timeLimit = randomMac.timestamp - search(contactsStart, randomMac.key);
    fprintf(logsFile, "Seen %d seconds before. Mac address: %" PRIu64 ", Time scanned: %d\n", (int) timeLimit, randomMac.mac, (int) randomMac.timestamp);
    fflush(logsFile);
    if ((timeLimit >= 4*60*0.1) && (timeLimit <= 20*60*0.1)) {
      addToList(&closeContactsStart, randomMac);
      return;
    }
    return;
  }
}

// simulating the result of a covid test
bool testCOVID() {
  if (rand() % 100 > 90)
    return 0;
  else
    return 1;
}

// uploading close contacts to a file
void uploadCloseContacts() {
  list* start = closeContactsStart;
  timespec_get(&ts, TIME_UTC);
  strftime(buff2, sizeof(buff2), "%D %T", gmtime(&ts.tv_sec));
  fprintf(closeContactsFile, "%d Macaddresses uploaded at %s.%09ld\n", getLength(closeContactsStart), buff2, ts.tv_nsec);
  fflush(closeContactsFile);
  while (start != NULL) {
    fprintf(closeContactsFile, "%" PRIu64 "\n",start->macaddr.mac);
    fflush(closeContactsFile);
    start = start->next;
  }
  fprintf(closeContactsFile, "\n");
  fflush(closeContactsFile);
  fprintf(logsFile, "closeContacts.txt updated!\n");
  fflush(logsFile);
}

// sleep function for msec milliseconds
int msleep(long msec) {
    struct timespec ts;
    int res;
    if (msec < 0){
        errno = EINVAL;
        return -1;
    }
    ts.tv_sec = msec / 1000;
    ts.tv_nsec = (msec % 1000) * 1000000;
    do {
        res = nanosleep(&ts, &ts);
    } while (res && errno == EINTR);

    return res;
}

// creating a macaddress and adding it to a list
void* createRandomMAC() {
  while(1) {
    msleep(10*0.1*1000);
    pthread_mutex_lock(&mutex);
    macaddress randomMac = BTnearMe();
    addContact(randomMac);
    pthread_mutex_unlock(&mutex);
  }
}

// clearing contacts from all contacts list after 20 minutes
void* clearContacts() {
  list* temp;
  time_t timeLimit;
  int length;
  msleep(20*60*0.1*1000);
  while(1) {
    msleep(60*0.1*1000);
    pthread_mutex_lock(&mutex);
    temp = contactsStart;
    length = getLength(contactsStart);
    for (int i=0; i<length; i++) {
      timeLimit = time(NULL) - temp->macaddr.timestamp; 
      if (timeLimit > (20*60*0.1)) {      
        deList(&contactsStart, temp->macaddr);
        temp = temp->next;
      }
      else
        temp = temp->next;
    } 
    pthread_mutex_unlock(&mutex);
  }
}

// clearing close contacts from close contacts list after 14 days
void* clearCloseContacts() {
  list* temp;
  time_t timeLimit;
  int length;
  msleep(14*24*60*60*0.1*1000);
  while(1) {
    msleep(24*60*60*0.1*1000);
    pthread_mutex_lock(&mutex);
    temp = closeContactsStart;
    length = getLength(closeContactsStart);
    for (int i=0; i<length; i++) {
      timeLimit = time(NULL) - temp->macaddr.timestamp;
      pthread_mutex_lock(&mutex);
      if (timeLimit > (14*24*60*60*0.1)) {
        deList(&closeContactsStart, temp->macaddr);
        temp = temp->next;
      }
      else
        temp = temp->next;
    } 
    pthread_mutex_unlock(&mutex);
  }
}

// taking a covid test and uploading close contacts to file if positive
void* testCov()  {
  while(1) {
    msleep(4*60*60*0.1*1000);
    if (testCOVID()) {
      pthread_mutex_lock(&mutex);
      uploadCloseContacts();
      timespec_get(&ts, TIME_UTC);
      strftime(buff2, sizeof(buff2), "%D %T", gmtime(&ts.tv_sec));
      fprintf(logsFile, "Upload %d close contacts after possitive COVID test\nLocal date & time = %s.%09ld\n", getLength(closeContactsStart), buff2, ts.tv_nsec);
      fflush(logsFile);
      pthread_mutex_unlock(&mutex);
    }
  }
}


int main(void) {
  
  closeContactsFile = fopen("closeContacts.txt", "w");
  logsFile = fopen("logsFile.txt", "w");
  callFile = fopen("callFile.csv", "w");
 
  pthread_t createRandomMAC_t, clearContacts_t, clearCloseContacts_t, testCov_t;

  // Thread for creating macaddresses and adding them to lists
  if (pthread_create(&createRandomMAC_t, NULL, &createRandomMAC, NULL)) {
    printf("MAC error!\n");
    return 1;
  }
  // Thread for removing contacts 
  if (pthread_create(&clearContacts_t, NULL, &clearContacts, NULL)) {
    printf("All contacts error!\n");
    return 2;
  }
  // Thread for removing close contacts 
  if (pthread_create(&clearCloseContacts_t, NULL, &clearCloseContacts, NULL)) {
    printf("Close contacts error!\n");
    return 3;
  }
  // Thread for uploading close contacts to file if cov test positive
  if (pthread_create(&testCov_t, NULL, &testCov, NULL)) {
    printf("Covid test error!\n");
    return 4;
  }
  
  msleep(30*24*60*60*0.1*1000);

  fclose(closeContactsFile);
  fclose(logsFile);
  fclose(callFile);

  return 0;
}
