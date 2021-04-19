package com.smart_house.client.service.impl;

import com.smart_house.client.service.MqttService;
import org.eclipse.paho.client.mqttv3.*;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.PostConstruct;
import java.nio.charset.StandardCharsets;
import java.util.UUID;

@Transactional
@Component
public class MqttServiceImpl implements MqttService {

    private IMqttClient publisher;

    @Override
    @PostConstruct
    public void initService() throws MqttException {
        if(publisher == null) {
            String publisherId = UUID.randomUUID().toString();
            publisher = new MqttClient("tcp://192.168.100.2:1883",publisherId);

            MqttConnectOptions options = new MqttConnectOptions();
            options.setUserName("IvanTkachev");
            options.setPassword("Bvr25df52".toCharArray());
            options.setAutomaticReconnect(true);
            options.setCleanSession(true);
            options.setConnectionTimeout(10);
            publisher.connect(options);
        }

    }

    @Override
    public Void publishMessage(String topic, String message) throws MqttException {
        if (publisher == null || !publisher.isConnected()) {
            return null;
        }
        MqttMessage msg = new MqttMessage(message.getBytes());
        msg.setQos(0);
        msg.setRetained(true);
        publisher.publish(topic,msg);
        return null;
    }

    private MqttMessage readEngineTemp() {
        double temp =  1;
        byte[] payload = "10"
                .getBytes();
        return new MqttMessage(payload);
    }
}
