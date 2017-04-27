package com.toyota.project.dao;

import com.toyota.project.data.Travels;
import java.util.List;
import java.util.Date;

public interface ITravelsDao {
    void save(Travels travels);
    void delete(Travels travels);
    List <Travels> findTravels(String username);
    List <Travels> findAllTravels();
}
