package com.portfolio.springsecurity.service;


import com.portfolio.springsecurity.model.Profiles;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.portfolio.springsecurity.model.User_1;
import org.springframework.context.annotation.Profile;

@Service("customUserDetailsService")
public class CustomUserDetailsService implements UserDetailsService {

    @Autowired
    private UserService userService;

    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username)
            throws UsernameNotFoundException {
        User_1 user = userService.findByUsername(username);
        System.out.println("User : " + user);
        if (user == null && user.getState() == "Active") {
            System.out.println("User not found");
            throw new UsernameNotFoundException("Username not found");
        }
        return new org.springframework.security.core.userdetails.User(user.getUsername(), user.getPassword(),
                user.getState().equals("Active"), true, true, true, getGrantedAuthorities(user));
    }

    private List<GrantedAuthority> getGrantedAuthorities(User_1 user) {
        List<GrantedAuthority> authorities = new ArrayList<GrantedAuthority>();
        
        for (Profiles profile : user.getProfilesCollection()) {
            System.out.println("Profile : " + profile);
            authorities.add(new SimpleGrantedAuthority("ROLE_" + profile.getName()));
        }
        System.out.print("authorities :" + authorities);
        return authorities;
    }

}
