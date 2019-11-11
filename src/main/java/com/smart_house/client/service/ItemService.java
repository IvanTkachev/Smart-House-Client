package com.smart_house.client.service;

import com.smart_house.client.model.Item;

import java.util.List;

public interface ItemService {

    List<Item> getItemsByOwnerUsername(String username);

    Item getItemById(Long id);

    List<Item> getAllItems();

    void updateItem(Item item);

    void save(Item item);

    Item getByNameAndLink(String name, String link);
}
