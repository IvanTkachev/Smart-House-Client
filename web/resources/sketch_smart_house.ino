#include <PubSubClient.h>
#include <SPI.h>
#include <Ethernet.h>


// -------------------------------------- BEGIN - Пины Arduino ----------------------------------------------
#define LED_pin 5                         //Пин 5 для светодиодов
#define Relay1_pin 6                      //Пин 6 для реле 1
#define Relay2_pin 7                      //Пин 7 для реле 2  
// -------------------------------------- END - Пины Arduino ------------------------------------------------


// -------------------------------------- BEGIN - Глобальные переменные -------------------------------------
int Led = 0;                              //Переменная для хранения состояния светодиода 
boolean Relay1 = HIGH;                    //Переменная для хранения состояния Реле 1 
boolean Relay2 = HIGH;                    //Переменная для хранения состояния Реле 2
// -------------------------------------- END - Глобальные переменные ---------------------------------------


// -------------------------------------- BEGIN - Установка параметров сети ---------------------------------
void callback(char* topic, byte* payload, unsigned int length);
// Установить MAC адресс для этой Arduino (должен быть уникальным в вашей сети)
byte mac[] = { 0x90, 0xB2, 0xFA, 0x0D, 0x4E, 0x49 };

// Утановить IP адресс для этой Arduino (должен быть уникальным в вашей сети)
IPAddress ip(192, 168, 0, 213);

// Уставновить IP адресс MQTT брокера
byte server[] = { 192, 168, 100, 42 };

// Уставновить Логин и Пароль для подключения к MQTT брокеру
const char* mqtt_username = "IvanTkachev";
const char* mqtt_password = "Bvr25df52";

EthernetClient ethClient;
PubSubClient client(server, 1883, callback, ethClient);
// --------------------------------------- END - Установка параметров сети ----------------------------------


// --------------------------------------- BEGIN - Подключение и подписка на MQTT broker ----------------------------------
boolean reconnect() {
  //Serial.println("reconnect...");
  if (client.connect("Arduino_test", mqtt_username, mqtt_password)) {       
    client.subscribe("/test/led"); Serial.println("Connected to: /test/led");
    client.subscribe("/test/relay1"); Serial.println("Connected to: /test/relay1");
    client.subscribe("/test/relay2"); Serial.println("Connected to: /test/relay2");
    Serial.println("MQTT connected");    
  }
  return client.connected();
}
// --------------------------------------- END - Подключение и подписка на MQTT broker ----------------------------------

// --------------------------------------- BEGIN - void setup() -------------------------------------------
void setup()
{
  digitalWrite(Relay1_pin, HIGH); // Решение проблемы с LOW статусом пинов при загрузке ардуино
  digitalWrite(Relay2_pin, HIGH); // Решение проблемы с LOW статусом пинов при загрузке ардуино
  pinMode(LED_pin, OUTPUT);
  pinMode(Relay1_pin, OUTPUT);
  pinMode(Relay2_pin, OUTPUT);                
 
  Serial.begin(9600); // Open serial communications

  // Start with a hard-coded address:
  Ethernet.begin(mac, ip);

  Serial.print("My ip address: ");
  Serial.println(Ethernet.localIP());

  reconnect(); // Подключение к брокеру, подписка на прописанные выше темы

}
// --------------------------------------- END - void setup() ---------------------------------------------


// --------------------------------------- BEGIN - void loop() --------------------------------------------
void loop() {

client.loop();
}
// --------------------------------------- END - void loop() ----------------------------------------------


// --------------------------------------- BEGIN - void callback ------------------------------------------
// Чтение данных из MQTT брокера
void callback(char* topic, byte* payload, unsigned int length) {
  // проверка новых сообщений в подписках у брокера
    payload[length] = '\0';
    Serial.print("Topic: ");
    Serial.print(String(topic));
    Serial.println(" - ");

  if (String(topic) == "/test/led") {
    String value = String((char*)payload);
    Led = value.substring(0, value.indexOf(';')).toInt();
    Led = map(Led, 0, 100, 0, 255);   
    analogWrite(LED_pin, Led);
    Serial.print("Znachenie prisvoenoe peremennoy Led: ");
    Serial.println(Led);
  }
  
  if (String(topic) == "/test/relay1") {
    String value = String((char*)payload);
    Relay1 = value.substring(0, value.indexOf(';')).toInt();
    Serial.print("Znachenie prisvoenoe peremennoy Relay1: ");
    Serial.println(Relay1);   
    digitalWrite(Relay1_pin, Relay1);
  }

  if (String(topic) == "/test/relay2") {
    String value = String((char*)payload);
    Relay2 = value.substring(0, value.indexOf(';')).toInt();
    Serial.print("Znachenie prisvoenoe peremennoy Relay2: ");
    Serial.println(Relay2);   
    digitalWrite(Relay2_pin, Relay2);
  }
  
}
// ---------------------------------------- END - void callback -------------------------------------------
