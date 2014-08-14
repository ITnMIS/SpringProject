package service;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import dao.MemberDao;
import model.MemberModel;

public class MemberService implements MemberDao{
private SqlMapClientTemplate sqlMapClientTemplate;
	
	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}

	@Override
	public boolean addMember(MemberModel memberModel) {
		sqlMapClientTemplate.insert("member.addMember", memberModel);
		MemberModel checkAddMember = findByUserId(memberModel.getId());
		
		//check addMember Process
		if(checkAddMember == null){
			return false;
		} else {
			return true;
		}
	}

	@Override
	public MemberModel findByUserId(String id) {
		return (MemberModel) sqlMapClientTemplate.queryForObject("member.findByUserId", id);
	}

	@Override
	public boolean changePw(MemberModel member) {
		sqlMapClientTemplate.update("member.changePw", member);
		return true;
	}

	@Override
	public MemberModel findByUserEmail(String email) {
		return (MemberModel) sqlMapClientTemplate.queryForObject("member.findByUserEmail", email);
	}

}
