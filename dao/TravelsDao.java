package com.toyota.project.dao;

import javax.transaction.Transactional;

import com.toyota.project.data.Travels;
import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.hibernate.criterion.Restrictions;
import org.hibernate.Criteria;

import java.util.List;

@Transactional
public class TravelsDao extends AbstractDao implements ITravelsDao{

    @Autowired
    private HibernateTemplate hibernateTemplate;

    public void save(Travels travels){
        hibernateTemplate.save(travels);
    }

    public List<Travels> findTravels(String username){
        Criteria criteria = getSession().createCriteria(Travels.class);
        criteria.add( Restrictions.like("username", username) );
        return (List<Travels>) criteria.list();
    }
    public List<Travels> findAllTravels(){
        Criteria criteria = getSession().createCriteria(Travels.class);
        return (List<Travels>) criteria.list();
    }
    public void delete(Travels travels){
        hibernateTemplate.delete(travels);
    }

}
