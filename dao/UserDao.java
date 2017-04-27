package com.toyota.project.dao;
import javax.transaction.Transactional;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import java.util.List;
import org.hibernate.Criteria;
import com.toyota.project.data.User;

@Transactional
public class UserDao extends AbstractDao implements IUserDao {
	
	@Autowired
	private HibernateTemplate hibernateTemplate;
	
	public void save(User usr){
		hibernateTemplate.save(usr);
	}
	public void delete(User usr){
		hibernateTemplate.delete(usr);
	}
	public void update(User usr){
		hibernateTemplate.update(usr);
	}
	public User findByUserName(String username){
		return (User) hibernateTemplate.get(User.class, username);
	}
	public List<User> findAllUsers() {
		Criteria criteria = getSession().createCriteria(User.class);
		return (List<User>) criteria.list();
	}



}
