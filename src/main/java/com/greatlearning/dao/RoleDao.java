package com.greatlearning.dao;


import com.greatlearning.entity.Role;

public interface RoleDao {

    public Role findRoleByName(String theRoleName);

}
