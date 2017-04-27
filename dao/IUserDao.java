package com.toyota.project.dao;



import com.toyota.project.data.User;
import java.util.List;

public interface IUserDao {
   void save(User usr);
   void delete(User usr);
   void update(User usr);
   User findByUserName(String username);
   List <User> findAllUsers();
}
