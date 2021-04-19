package com.smart_house.client.service;

import org.eclipse.paho.client.mqttv3.MqttException;

public interface MqttService {

    void initService() throws MqttException;

    Void publishMessage(String topic, String message) throws MqttException;
}
