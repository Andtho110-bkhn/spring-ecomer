
package vn.t3h.dao;

import java.util.List;

import org.hibernate.Hibernate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;

import vn.t3h.model.User;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

@Repository("userDao")
@Transactional
public class UserDaoImpl implements UserDao {

    static final Logger logger = LoggerFactory.getLogger(UserDaoImpl.class);
    @PersistenceContext EntityManager entityManager;
    
    public User findById(int id) {
		try {
			User instance = entityManager.find(User.class, id);
			if (instance != null) {
	            Hibernate.initialize(instance.getUserProfiles());
	        }
			return instance;
		} catch (RuntimeException re) {
			throw re;
		}
    }

    public User findBySSO(String sso) {
    	return null;
    }

    public List<User> findAllUsers() {
    	return null;
    }

    public void save(User user) {
    	return ;
    }

    public void deleteBySSO(String sso) {
       
    }
}
