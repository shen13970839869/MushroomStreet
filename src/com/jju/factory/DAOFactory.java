package com.jju.factory;

import com.jju.dao.AdminDao;
import com.jju.dao.AdminPwdDao;
import com.jju.dao.FavoriteDao;
import com.jju.dao.FindAllDao;
import com.jju.dao.ShoppingDao;
import com.jju.dao.UserDao;
import com.jju.service.AdminPwdService;
import com.jju.service.AdminService;
import com.jju.service.FavoriteService;
import com.jju.service.FindAllService;
import com.jju.service.ShoppingService;
import com.jju.service.UserService;

public class DAOFactory {

	public static UserDao getUserServiceInstance() throws Exception {
		return new UserService();
	}
	public static FindAllDao getFindAllServiceInstance() throws Exception {
		return new FindAllService();
	}
	public static ShoppingDao getShoppingServiceInstance() throws Exception {
		return new ShoppingService();
	}
	public static FavoriteDao getFavoriteServiceInstance() throws Exception {
		return new FavoriteService();
	}
	public static AdminDao getAdminServiceInstance() throws Exception {
		return new AdminService();
	}
	public static AdminPwdDao getAdminPwdServiceInstance() throws Exception {
		return new AdminPwdService();
	}
}
