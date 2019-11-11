package com.smart_house.client.service.impl;

import com.smart_house.client.model.Item;
import com.smart_house.client.repository.ItemRepository;
import com.smart_house.client.repository.UserRepository;
import com.smart_house.client.service.ItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ItemServiceImpl implements ItemService {

    @Autowired
    ItemRepository itemRepository;

    @Autowired
    UserRepository userRepository;

    @Override
    public List<Item> getItemsByOwnerUsername(String username) {
        return itemRepository.findByOwners(userRepository.findByUsername(username));
    }

    @Override
    public Item getItemById(Long id) {
        return itemRepository.getOne(id);
    }

    @Override
    public List<Item> getAllItems() {
        return itemRepository.findAll();
    }

    @Override
    public void updateItem(Item item) {
        itemRepository.save(item);
    }

    @Override
    public void save(Item item) {
        itemRepository.save(item);
    }

    @Override
    public Item getByNameAndLink(String name, String link) {
        return itemRepository.getByNameAndLink(name, link);
    }

}
