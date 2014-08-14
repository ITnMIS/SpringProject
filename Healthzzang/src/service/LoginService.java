package service;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import dao.LoginDao;
import model.LoginSessionModel;


public class LoginService implements LoginDao {
	private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	@Override
	public LoginSessionModel checkUserId(String id) {
		return (LoginSessionModel) sqlMapClientTemplate.queryForObject("login.loginCheck", id);

	}	
}
