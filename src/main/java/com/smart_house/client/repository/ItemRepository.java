package com.smart_house.client.repository;

import com.smart_house.client.model.Item;
import com.smart_house.client.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ItemRepository extends JpaRepository<Item, Long> {

    List<Item> findByOwners(User user);

    Item getByNameAndLink(String name, String link);
}
