package com.toyota.project.controller;

import com.toyota.project.config.UserAppConfig;
import com.toyota.project.dao.IUserDao;
import com.toyota.project.data.User;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;
import  java.util.List;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class UserController {
  private AnnotationConfigApplicationContext ctx;
  public void Save(String username, String name, String surname, String scrnumber, String pass, String role, String departmen, String departmenManager, String informationservice, String travelsystem){
	  String password=MD5(pass);
  	  ctx = new AnnotationConfigApplicationContext();
	  ctx.register(UserAppConfig.class);
	  ctx.refresh();
	  IUserDao udao=ctx.getBean(IUserDao.class);
	  User usr=new User();
		usr.setUsername(username);
		usr.setName(name);
		usr.setSurname(surname);
		usr.setPass(password);
		usr.setScNumber(scrnumber);
		usr.setRole(role);
		usr.setDepartmen(departmen);
		usr.setDepartmenManager(departmenManager);
		usr.setTravelsystem(travelsystem);
		usr.setInformationservice(informationservice);
	    udao.save(usr);
  }
  public int Login(String username, String pass){
	ctx = new AnnotationConfigApplicationContext();
	ctx.register(UserAppConfig.class);
	ctx.refresh();
	String pss=MD5(pass);
	IUserDao udao=ctx.getBean(IUserDao.class);
    User usr=udao.findByUserName(username);
    if(usr.getUsername().equals(username) && usr.getPass().equals(pss) && usr.getRole().equals("Normal Kullanıcı"))
    {
    	return 1;
    }
	else if(usr.getUsername().equals(username) && usr.getPass().equals(pss) && usr.getRole().equals("Admin")){
    	return -1;
	}
	return 0;
  }
  public List<User> Get(){
	  ctx = new AnnotationConfigApplicationContext();
	  ctx.register(UserAppConfig.class);
	  ctx.refresh();
	  IUserDao udao=ctx.getBean(IUserDao.class);
	  return (List<User>) udao.findAllUsers();
  }
  public void Delete(String username){
	  ctx = new AnnotationConfigApplicationContext();
	  ctx.register(UserAppConfig.class);
	  ctx.refresh();
	  IUserDao udao=ctx.getBean(IUserDao.class);
	  User u=udao.findByUserName(username);
	  udao.delete(u);
  }
  public void Update(String username, String name, String surname, String scrnumber, String pass, String role, String departmen, String departmenManager, String informationservice, String travelsystem){
	  ctx = new AnnotationConfigApplicationContext();
	  ctx.register(UserAppConfig.class);
	  ctx.refresh();
	  IUserDao udao=ctx.getBean(IUserDao.class);
	  User user=udao.findByUserName(username);
	  if(username!=user.getUsername()){
         user.setUsername(username);
	  }
	  else if(name!=user.getName()){
	  	user.setName(name);
	  }
	  else if(surname!=user.getSurname()){
	  	user.setSurname(surname);
	  }
	  else if(scrnumber!=user.getScNumber()){
	  	user.setScNumber(scrnumber);
	  }
	  else if(pass!=user.getPass()){
	  	user.setPass(pass);
	  }
	  else if(role!=user.getRole()){
	  	user.setRole(role);
	  }
	  else if(departmen!=user.getDepartmen()){
	  	user.setDepartmen(departmen);
	  }
	  else if(departmenManager!=user.getDepartmenManager()){
	  	user.setDepartmenManager(departmenManager);
	  }
	  else if(informationservice!=user.getInformationservice()){
	  	user.setInformationservice(informationservice);
	  }
	  else if(travelsystem!=user.getTravelsystem()){
	  	user.setTravelsystem(travelsystem);
	  }

	  udao.update(user);
  }
  public User findByUsername(String userName){
	  ctx = new AnnotationConfigApplicationContext();
	  ctx.register(UserAppConfig.class);
	  ctx.refresh();
	  IUserDao udao=ctx.getBean(IUserDao.class);
  	  User user=udao.findByUserName(userName);

  	  return user;
  }
  public String MD5(String pass){
	  StringBuffer hexString = new StringBuffer();
	  byte[] defaultBytes = pass.getBytes();
	  try{
		  MessageDigest algorithm = MessageDigest.getInstance("MD5");
		  algorithm.reset();
		  algorithm.update(defaultBytes);
		  byte messageDigest[] = algorithm.digest();
		  for (int i=0;i<messageDigest.length;i++) {
			  String hex = Integer.toHexString(0xFF & messageDigest[i]);
			  if(hex.length()==1)
				  hexString.append('0');
			  hexString.append(hex);
		  }
	  }
	  catch(NoSuchAlgorithmException nsae){

	  }
	  return hexString.toString();
  }


}
