package com.nore.service;

import org.apache.ibatis.annotations.Param;

import java.util.Set;

/**
 * @Author:nore
 */
public interface RoleService {
    public Set<String> queryAllRolenameByUsername(@Param("username") String username);
}
