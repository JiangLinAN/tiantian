package com.nore.realm;

import com.nore.pojo.User;
import com.nore.service.PermissionService;
import com.nore.service.RoleService;
import com.nore.service.UserService;
import lombok.Setter;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authz.AuthorizationInfo;
import org.apache.shiro.authz.SimpleAuthorizationInfo;
import org.apache.shiro.realm.AuthorizingRealm;
import org.apache.shiro.subject.PrincipalCollection;
import org.apache.shiro.util.ByteSource;

import java.util.Set;

/**
 * @Author:nore
 */
@Setter
public class MyRealm  extends AuthorizingRealm {
    //注入service
    private PermissionService permissionService;
    private RoleService roleService;
    private UserService userService;
    /**
     * 权限验证
     * @param principals
     * @return
     */
    @Override
    protected AuthorizationInfo doGetAuthorizationInfo(PrincipalCollection principals) {
        System.out.println("在realm中查询角色和权限");
        //接受用户名
        String username=(String)principals.getPrimaryPrincipal();
        //查询用户权限和角色
        Set<String> permission = permissionService.queryAllPermissionByUsername(username);
        Set<String> role = roleService.queryAllRolenameByUsername(username);
        //封装数据
        SimpleAuthorizationInfo simpleAuthorizationInfo = new SimpleAuthorizationInfo(role);
        simpleAuthorizationInfo.setStringPermissions(permission);
        return simpleAuthorizationInfo;
    }

    /**
     * 身份验证
     * @param token
     * @return
     * @throws AuthenticationException
     */
    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(AuthenticationToken token) throws AuthenticationException {
        System.out.println("在realm中查询身份信息");
        //1.获取用户传来的用户名
        String userString=(String)token.getPrincipal();
        //2.查询用户的信息
        User userName = userService.queryUserByUsername(userString);
        System.out.println("realm::"+userName);
        //3.判断用户名是否为空
        if (userName==null){
            return null;
        }
        //密码比较
            return new SimpleAuthenticationInfo(
                    userName.getUsername(),
                    userName.getPassword(),
                    ByteSource.Util.bytes(userName.getSalt()),
                    this.getName());

    }
}
