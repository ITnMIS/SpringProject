package service;

import java.util.HashMap;
import java.util.List;

import model.GymFeeModel;
import model.GymModel;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import dao.GymDao;



public class GymService implements GymDao {

	
	private SqlMapClientTemplate sqlMapClientTemplate;		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	@Override
	public GymModel getOneGymName(String gseq) {
		return (GymModel)sqlMapClientTemplate.queryForObject("gym.getOneGymName", gseq);
	}



}
