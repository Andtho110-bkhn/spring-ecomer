
package vn.t3h.services;

import vn.t3h.model.User;
import vn.t3h.security.UserPrinciple;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

@Service
public class UserDetailsServiceImpl implements UserDetailsService {
 
    @Autowired
    UserService userRepository;
 
    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
    	
        User user = userRepository.findBySSO(username);
        if(user == null ) {
            throw new UsernameNotFoundException("User Not Found with -> username or email : " + username);
        } 	
        return UserPrinciple.build(user);
    }
}
