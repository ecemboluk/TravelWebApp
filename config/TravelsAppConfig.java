package com.toyota.project.config;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSource;
import org.hibernate.SessionFactory;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.orm.hibernate4.HibernateTransactionManager;
import org.springframework.orm.hibernate4.LocalSessionFactoryBuilder;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.toyota.project.dao.ITravelsDao;
import com.toyota.project.dao.TravelsDao;
import com.toyota.project.data.Travels;

@Configuration
@EnableTransactionManagement
public class TravelsAppConfig {
    @Bean
    public ITravelsDao personDao() {
        return new TravelsDao();
    }
    @Bean
    public HibernateTemplate hibernateTemplate() {
        return new HibernateTemplate(sessionFactory());
    }

    @Bean
    public SessionFactory sessionFactory() {
        return new LocalSessionFactoryBuilder(getDataSource())
                .addAnnotatedClasses(Travels.class)
                .buildSessionFactory();
    }
    @Bean
    public DataSource getDataSource() {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("org.postgresql.Driver");
        dataSource.setUrl("jdbc:postgresql://localhost:5432/toyota");
        dataSource.setUsername("postgres");
        dataSource.setPassword("1234");
        return dataSource;
    }
    @Bean
    public HibernateTransactionManager hibTransMan(){
        return new HibernateTransactionManager(sessionFactory());
    }

}
