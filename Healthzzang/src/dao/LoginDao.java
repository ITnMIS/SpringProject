package dao;

import model.LoginSessionModel;


public interface LoginDao {
	
	LoginSessionModel checkUserId(String id);

}
