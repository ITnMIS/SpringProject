package dao;

import model.MemberModel;
;
public interface MemberDao {
	boolean addMember(MemberModel memberModel);
	MemberModel findByUserId(String id);
	boolean changePw(MemberModel member);
	MemberModel findByUserEmail(String email);
}
