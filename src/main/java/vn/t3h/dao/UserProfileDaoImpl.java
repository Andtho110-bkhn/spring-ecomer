/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package vn.t3h.dao;

import java.util.List;
import org.springframework.stereotype.Repository;

import vn.t3h.model.UserProfile;
import javax.transaction.Transactional;

@Repository("userProfileDao")
@Transactional
public class UserProfileDaoImpl implements UserProfileDao {

    @Override
    public UserProfile findById(int id) {
        return null;
    }

    @Override
    public UserProfile findByType(String type) {
        return null;
    }

    @Override
    public List<UserProfile> findAll() {
        return null;
    }
}
