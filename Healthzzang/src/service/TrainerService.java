package service;

import java.util.List;

import org.springframework.orm.ibatis.SqlMapClientTemplate;




import model.TrainerModel;
import dao.TrainerDao;

public class TrainerService implements TrainerDao{

	private SqlMapClientTemplate sqlMapClientTemplate;		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	@Override
	public List<TrainerModel> getTrainerList(String gseq) {
		return sqlMapClientTemplate.queryForList("trainer.getOneTrainerName", gseq);

	}

}
