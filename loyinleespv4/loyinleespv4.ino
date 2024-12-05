#include <Arduino.h>
#include <WiFi.h>
#include <WiFiAP.h>
#include <ArduinoJson.h>
#include <WebServer.h>
#include <HTTPClient.h>

// input output :  22 - 23

// input only : 3  - 36 - 39

#define btnSelectGameTypeAdventure 35    // Adventure
#define btnSelectGameTypeMarathon 34  // Endurance
#define LedMarathon 15
#define LedAdventure 2

#define LedFault 12  // when Player1 touches his circuit(circuitOne)-------------------

#define LedLevel 23  // when Player1 Reach a level-------------------------




int PLAYER2_REACT[7] = { 13, 14, 27, 26, 25, 33, 32 };
int PLAYER1_REACT[7] = { 4, 16, 17, 5, 18, 19, 21 };

bool stickP1Value = false;
bool stickP2Value = false;
int adventureGameInput;
int marathonGameInput;


/*const char* ssid = "Eagle888";
const char* password = "mystere8";*/

const char* ssid = "MTNEAGLEHM";
const char* password = "28026374";


// Set your Access Point credentials
/*const char* ssid = "amz_elite"; 
const char* password = "amakamak";
const int   channel        = 10;                        // WiFi Channel number between 1 and 13
const bool  hide_SSID      = false;                     // To disable SSID broadcast -> SSID will not appear in a basic WiFi scan
const int   max_connection = 5; */
// il faut au moins 8 caracteres pour le mot de passe
                                    // sinon le esp32 genere une erreuur bootloader
                                    // strlen(passphrase) < 8 in WiFiAP.cpp

// Set static IP address for the Access Point

/*
IPAddress apIP(192, 168, 8, 2); // IP Adress for the device
IPAddress apGW(0, 0, 0, 0); // Gateway to 0 for our needs (you have to adapt it to your’s)
//IPAddress apGW(192, 168, 8, 254); // Gateway to 0 for our needs (you have to adapt it to your’s)
IPAddress apMSK(255, 255, 255, 240); // Network limited to 14 devices (standard is 255,255,255,0)
//IPAddress apMSK(255, 255, 255, 0); */







String serverName = "http://192.168.1.228:8082";


byte levelNB = 0;
byte circuitTouchNB = 0;
bool hasTouchedP1 = false;
bool hasTouchedP2 = false;
bool hasTouchedLevelCircuit1 = false;
bool hasTouchedLevelCircuit2 = false;

bool alreadyTouchLevel1P1;
bool alreadyTouchLevel2P1;
bool alreadyTouchLevel3P1;
bool alreadyTouchLevel4P1;
bool alreadyTouchLevel5P1;

bool alreadyTouchLevel1P2;
bool alreadyTouchLevel2P2;
bool alreadyTouchLevel3P2;
bool alreadyTouchLevel4P2;
bool alreadyTouchLevel5P2;

bool circuit1IsTouched;
bool circuit2IsTouched;
bool isFinishedTurnP1;
bool isFinishedTurnP2;

bool endGame;
bool gameFinish = false;
bool chooseGameMode = false;

bool isReachLev1P1;
bool isReachLev2P1;
bool isReachLev3P1;
bool isReachLev4P1;
bool finishCircuit1;

bool faultP1;

bool isReachLev1P2;
bool isReachLev2P2;
bool isReachLev3P2;
bool isReachLev4P2;
bool finishCircuit2;

bool faultP2 = false;

bool onTheMark = false;
bool startParty = false;
bool startTurn = false;

// Static IP configuration

IPAddress staticIP(192, 168, 1, 114);   
IPAddress gateway(192, 168, 1, 1);     
IPAddress subnet(255, 255, 255, 0);    
IPAddress primaryDNS(192, 168, 1, 1); 
IPAddress secondaryDNS(0, 0, 0, 0); 

WebServer server(80);

StaticJsonDocument<256> jsonDocument;
char buffer[256];



void create_json_gameInfos(byte level_nb, byte circuit_touch_nb, bool has_triggered, bool start_turn) {
  jsonDocument.clear();
  jsonDocument["levelNB"] = level_nb;
  jsonDocument["circuitTouchNB"] = circuit_touch_nb;
  jsonDocument["hasTriggered"] = has_triggered;
  jsonDocument["startTurn"] = start_turn;
  serializeJson(jsonDocument, buffer);
}

void SendGameMode(char* mode){

  jsonDocument.clear();
  jsonDocument["gametable"] = "loyinle";
  jsonDocument["gamemode"] = mode;
  serializeJson(jsonDocument, buffer);

   if(WiFi.status()== WL_CONNECTED){
   // if(WiFi.softAP(apIP, apGW, apMSK)){
  //  if(WiFi.softAP(ssid)){
      WiFiClient client;
      HTTPClient http;
      // Your Domain name with URL path or IP address with path
      http.begin(client, serverName + "/gamemode");
      
      http.addHeader("Content-Type", "application/json");
  
        Serial.println(buffer);
      // Send HTTP POST request
      int httpResponseCode = http.POST(buffer);
     
      Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);
      // Free resources
      http.end();
    }
}

void SendGameInfos() {
  create_json_gameInfos(0, 0, false,startTurn);
 if(startTurn && !startParty){
    create_json_gameInfos(0, 0, false,startTurn);
    startParty = true;
 }

  if (hasTouchedP1) {
    create_json_gameInfos(levelNB, circuitTouchNB, hasTouchedP1,startTurn);
  
  }

  if (hasTouchedLevelCircuit1) {
    create_json_gameInfos(levelNB, circuitTouchNB, hasTouchedLevelCircuit1,startTurn);
   
  }

  if (hasTouchedP2) {
    create_json_gameInfos(levelNB, circuitTouchNB, hasTouchedP2,startTurn);
    
  }

  if (hasTouchedLevelCircuit2) {
    create_json_gameInfos(levelNB, circuitTouchNB, hasTouchedLevelCircuit2,startTurn);
    
  }

 /* Serial.println("game finish : ");
  Serial.println(gameFinish); */
  //server.send(200, "application/json", buffer);

// exemple take from random nerd
   if(WiFi.status()== WL_CONNECTED){
   //if(WiFi.softAPConfig(apIP, apGW, apMSK)){
   //if(WiFi.softAP(ssid)){
      WiFiClient client;
      HTTPClient http;
      // Your Domain name with URL path or IP address with path
      http.begin(client, serverName + "/gameinfos");
      
      http.addHeader("Content-Type", "application/json");
  
        Serial.println(buffer);
      // Send HTTP POST request
      int httpResponseCode = http.POST(buffer);
     
      /*Serial.print("HTTP Response code: ");
      Serial.println(httpResponseCode);*/
      
        
      // Free resources
      http.end();
    }
}

void freezeCircuit1(){
 isFinishedTurnP1 = true;
}

void freezeCircuit2(){
 isFinishedTurnP2 = true;
}

void endParty(){
  Serial.println("END THE PARTY : ");
  resetAllDataGame();
   endGame = true;
   gameFinish = true;
}

void launchParty(){
  endGame = false;
  gameFinish = false;
}


void resetAllDataGame() {
  chooseGameMode = false;
  startTurn = false;
  isFinishedTurnP1 = false;
  isFinishedTurnP2 = false;
  levelNB = 0;
  circuitTouchNB = 0;
  hasTouchedP1 = false;
  hasTouchedP2 = false;
  hasTouchedLevelCircuit1 = false;
  hasTouchedLevelCircuit2 = false;

  alreadyTouchLevel1P1 = false;
  alreadyTouchLevel2P1 = false;
  alreadyTouchLevel3P1 = false;
  alreadyTouchLevel4P1 = false;
  alreadyTouchLevel5P1 = false;

  alreadyTouchLevel1P2 = false;
  alreadyTouchLevel2P2 = false;
  alreadyTouchLevel3P2 = false;
  alreadyTouchLevel4P2 = false;
  alreadyTouchLevel5P2 = false;

  digitalWrite(LedLevel, LOW);

  digitalWrite(LedFault, LOW);
  


  Serial.println("turn finish");
}

void setup_routing() {
  //server.on("/gameinfoschannel", HTTP_POST, SendGameInfos);
  server.on("/turnfinish", HTTP_GET, resetAllDataGame);
  server.on("/turnfinishP1", HTTP_GET, freezeCircuit1);
  server.on("/turnfinishP2", HTTP_GET, freezeCircuit2);
  server.on("/startGame", HTTP_GET, launchParty);
  server.on("/endGame", HTTP_GET, endParty);
 
}


void resetAll() {
  stickP1Value = false;
  stickP2Value = false;
  isFinishedTurnP1 = false;
  isFinishedTurnP2 = false;
  hasTouchedLevelCircuit1 = false;
  hasTouchedLevelCircuit2 = false;
  levelNB = 0;
  circuitTouchNB = 0;
  digitalWrite(LedLevel, LOW);
  
  hasTouchedP1 = false;
  hasTouchedP2 = false;
  // circuitTouchNB = 0;
  digitalWrite(LedFault, LOW);

}


bool button1Release = false;
bool button2Release = false;
unsigned long timeButton1 = 0;
unsigned long timeButton2 = 0;


void startingGameSynchro() {
  if (digitalRead(PLAYER1_REACT[0])==LOW || digitalRead(PLAYER2_REACT[0])==LOW && button1Release == false) {  // Check if button 1 is pressed

    timeButton1 = millis();  // Record time of button 1 press

    button1Release = true;
  }

  if (digitalRead(PLAYER1_REACT[0])==LOW && digitalRead(PLAYER2_REACT[0])==LOW && button1Release == true) {

    //  timeButton2 = millis(); // Record time of button 2 press
    unsigned long timeDifference = millis() - timeButton1;
    Serial.print("Time difference in milliseconds: ");
    Serial.println(timeDifference);

    if (timeDifference < 3000) {
      startTurn = true;
      gameFinish = false;
      chooseGameMode = true;
      delay(200);
    }

    timeButton1 = 0;
    onTheMark = false;
    button1Release = false;
  }
}

bool stateStartP1 = false;
bool stateStartP2 = false;

void setup() {
  Serial.begin(115200);  // setup Serial Monitor to display information

  
  
  WiFi.persistent(false);
  WiFi.begin(ssid, password);


  Serial.print("Tentative de connexion...");

  while (WiFi.status() != WL_CONNECTED) {
    Serial.print(".");
    delay(100);
  }

  // Configuring static IP
  if (!WiFi.config(staticIP, gateway, subnet, primaryDNS, secondaryDNS)) {
    Serial.println("Failed to configure Static IP");
  } else {
    Serial.println("Static IP configured!");
  }

  Serial.println("\n");
  Serial.println("Connexion etablie!");
  Serial.print("Adresse IP: ");
  Serial.println(WiFi.localIP());
  Serial.print("Current ESP32 IP: ");
  Serial.println(WiFi.localIP());

   // Start the access point

    // Remove the password parameter, if you want the AP (Access Point) to be open

  
  /*
  WiFi.softAP(ssid, password,channel, hide_SSID, max_connection);

  Serial.print("Tentative de connexion...");

  /*while (!WiFi.softAPConfig(apIP, apGW, apMSK)) {
    Serial.print(".");
    delay(100);
  }*/
  /*
  while (!WiFi.softAP(ssid)) {
    Serial.print(".");
    delay(100);
  }*/

 

  Serial.println();
  Serial.print("Access Point \"");
  Serial.print(ssid);
  Serial.println("\" started");

  // Print the static IP address
  Serial.print("Fixed IP Address: ");
  Serial.println(WiFi.softAPIP());
  // Start Server
  server.begin();

   delay(250);

  setup_routing();
  Serial.println("Serveur web disponible!");


  alreadyTouchLevel1P1 = false;
  alreadyTouchLevel2P1 = false;
  alreadyTouchLevel3P1 = false;
  alreadyTouchLevel4P1 = false;
  alreadyTouchLevel5P1 = false;

  alreadyTouchLevel1P2 = false;
  alreadyTouchLevel2P2 = false;
  alreadyTouchLevel3P2 = false;
  alreadyTouchLevel4P2 = false;
  alreadyTouchLevel5P2 = false;

  isFinishedTurnP1 = false;
  isFinishedTurnP2 = false;
  endGame = false;
  gameFinish = false;
 
  // players sticks whether it is easy game or hard game

 for (int i = 0; i < 7; i++) {
    pinMode(PLAYER1_REACT[i], INPUT_PULLDOWN);
  }

  for (int i = 0; i < 7; i++) {
    pinMode(PLAYER2_REACT[i], INPUT_PULLDOWN);
  }



  pinMode(btnSelectGameTypeAdventure, INPUT_PULLDOWN);
  pinMode(LedAdventure, OUTPUT);

  pinMode(btnSelectGameTypeMarathon, INPUT_PULLDOWN);
  pinMode(LedMarathon, OUTPUT);

  

  // led witness
 
  pinMode(LedFault, OUTPUT);


  pinMode(LedLevel, OUTPUT);

  delay(1000);
  
}

int dl = 300;

//int df = 50;
int df = 50;

unsigned long lastTouchTime = 0;  // To store the last time the wire was touched
const int debounceDelay = 50;     // Debounce time in milliseconds


void loop() {
  // put your main code here, to run repeatedly:

  server.handleClient();
  resetAll();
 // delay(200);
  
  adventureGameInput = digitalRead(btnSelectGameTypeAdventure);
  marathonGameInput = digitalRead(btnSelectGameTypeMarathon);


  Serial.println("GAME MODE");
  Serial.println(adventureGameInput);
  Serial.println(marathonGameInput);

  if(chooseGameMode == false && !startTurn){

     if(adventureGameInput == LOW && marathonGameInput == HIGH){
        digitalWrite(LedMarathon,HIGH);
        digitalWrite(LedAdventure,LOW);
        SendGameMode("| MARATHON |");
     }
     
     if(marathonGameInput == LOW && adventureGameInput == HIGH){
        digitalWrite(LedMarathon,LOW);
        digitalWrite(LedAdventure,HIGH);
         SendGameMode("| ADVENTURE |");
     }

  }
  




 faultP1 = digitalRead(PLAYER1_REACT[1]);
 isReachLev1P1 = digitalRead(PLAYER1_REACT[2]);
 isReachLev2P1 = digitalRead(PLAYER1_REACT[3]);
 isReachLev3P1 = digitalRead(PLAYER1_REACT[4]);
 isReachLev4P1 =  digitalRead(PLAYER1_REACT[5]);
 finishCircuit1 = digitalRead(PLAYER1_REACT[6]);
 

 faultP2 = digitalRead(PLAYER2_REACT[1]);
 isReachLev1P2 = digitalRead(PLAYER2_REACT[2]);
 isReachLev2P2 = digitalRead(PLAYER2_REACT[3]);
 isReachLev3P2 = digitalRead(PLAYER2_REACT[4]);
 isReachLev4P2 =  digitalRead(PLAYER2_REACT[5]);
 finishCircuit2 = digitalRead(PLAYER2_REACT[6]);

 stickP1Value = faultP1 || isReachLev1P1 || isReachLev2P1 || isReachLev3P1 || isReachLev4P1 || finishCircuit1;
 stickP2Value = faultP2 || isReachLev1P2 || isReachLev2P2 || isReachLev3P2 || isReachLev4P2 || finishCircuit2;
 
 /*
 for(int t = 1 ; t<7; t++){
  bool readDigit = digitalRead(PLAYER2_REACT[t]);
  Serial.print(readDigit);
  
 }
  Serial.println();
  */

  if (stickP1Value  && startTurn && !isFinishedTurnP1) {

    if (finishCircuit1 && !alreadyTouchLevel5P1 && alreadyTouchLevel4P1) {
      alreadyTouchLevel5P1 = true;
      hasTouchedLevelCircuit1 = true;
      levelNB = 5;
      circuitTouchNB = 1;
      digitalWrite(LedLevel, HIGH);
      isFinishedTurnP1 = true;
  
      delay(dl);
    } else if (isReachLev4P1 && !alreadyTouchLevel4P1 && alreadyTouchLevel3P1) {
      alreadyTouchLevel4P1 = true;
      hasTouchedLevelCircuit1 = true;
      levelNB = 4;
      circuitTouchNB = 1;
      digitalWrite(LedLevel, HIGH);
     
      delay(dl);
    } else if (isReachLev3P1 && !alreadyTouchLevel3P1 && alreadyTouchLevel2P1) {
      alreadyTouchLevel3P1 = true;
      hasTouchedLevelCircuit1 = true;
      levelNB = 3;
      circuitTouchNB = 1;
      digitalWrite(LedLevel, HIGH);
      //SendGameInfos();
      delay(dl);
    } else if (isReachLev2P1 && !alreadyTouchLevel2P1 && alreadyTouchLevel1P1) {
      alreadyTouchLevel2P1 = true;
      hasTouchedLevelCircuit1 = true;
      levelNB = 2;
      circuitTouchNB = 1;
      digitalWrite(LedLevel, HIGH);
      //SendGameInfos();
      delay(dl);
    } else if (isReachLev1P1 && !alreadyTouchLevel1P1) {

      alreadyTouchLevel1P1 = true;
      hasTouchedLevelCircuit1 = true;
      levelNB = 1;
      circuitTouchNB = 1;
      digitalWrite(LedLevel, HIGH);
      
      delay(dl);
    } else if (faultP1 && !alreadyTouchLevel5P1) {

    if (millis() - lastTouchTime > debounceDelay) {
      // If the hook touches the wire, trigger the buzzer
      hasTouchedP1 = true;
      digitalWrite(LedFault, HIGH);
      circuitTouchNB = 1;
      lastTouchTime = millis();
    }
     /* hasTouchedP1 = true;
      digitalWrite(LedFault, HIGH);
      circuitTouchNB = 1;
      delay(df);*/
    }
    
  }

  if (stickP2Value && startTurn && !isFinishedTurnP2) {

    if (finishCircuit2 && !alreadyTouchLevel5P2 && alreadyTouchLevel4P2) {
      alreadyTouchLevel5P2 = true;
      hasTouchedLevelCircuit2 = true;
      levelNB = 5;
      circuitTouchNB = 2;
      digitalWrite(LedLevel, HIGH);
      isFinishedTurnP2 = true;
      delay(dl);
    } else if (isReachLev4P2 && !alreadyTouchLevel4P2 && alreadyTouchLevel3P2) {
      alreadyTouchLevel4P2 = true;
      hasTouchedLevelCircuit2 = true;
      levelNB = 4;
      circuitTouchNB = 2;
      digitalWrite(LedLevel, HIGH);
      delay(dl);
    } else if (isReachLev3P2 && !alreadyTouchLevel3P2 && alreadyTouchLevel2P2) {
      alreadyTouchLevel3P2 = true;
      hasTouchedLevelCircuit2 = true;
      levelNB = 3;
      circuitTouchNB = 2;
      digitalWrite(LedLevel, HIGH);
      delay(dl);
    } else if (isReachLev2P2 && !alreadyTouchLevel2P2 && alreadyTouchLevel1P2) {
      alreadyTouchLevel2P2 = true;
      hasTouchedLevelCircuit2 = true;
      levelNB = 2;
      circuitTouchNB = 2;
      digitalWrite(LedLevel, HIGH);
     
      delay(dl);
    } else if (isReachLev1P2 && !alreadyTouchLevel1P2) {
      alreadyTouchLevel1P2 = true;
      hasTouchedLevelCircuit2 = true;
      levelNB = 1;
      circuitTouchNB = 2;
      digitalWrite(LedLevel, HIGH);
     
      delay(dl);
    } else if (faultP2 && !alreadyTouchLevel5P2) {
      hasTouchedP2 = true;
      digitalWrite(LedFault, HIGH);
      circuitTouchNB = 2;
      delay(df);
    }
  }

    stateStartP1 = digitalRead(PLAYER1_REACT[0]);
    stateStartP2 = digitalRead(PLAYER2_REACT[0]);
   /*Serial.println();
   //Serial.println("stateStartP1");
   Serial.print(stateStartP1);
   Serial.print("   --------    ");
   //Serial.print("stateStartP1");
   Serial.print(stateStartP2);
   Serial.println();*/
   


  if (stateStartP1 && stateStartP2 && !gameFinish) {
    digitalWrite(LedLevel, HIGH);
    onTheMark = true;
    delay(50);
  }

  if (onTheMark) {

    startingGameSynchro();

    delay(100);
  }
  SendGameInfos();
  delay(500);
}
