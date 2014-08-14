package service;

import java.util.List;
import model.GymFeeModel;
import org.springframework.orm.ibatis.SqlMapClientTemplate;
import dao.GymFeeDao;



public class GymFeeService implements GymFeeDao {

	
	private SqlMapClientTemplate sqlMapClientTemplate;		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}


	@Override
	public List<GymFeeModel> getGymFeeList(String gseq) {
		return sqlMapClientTemplate.queryForList("gymFee.getGymFeeList", gseq);
	}

}
