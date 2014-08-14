package dao;

import model.MemberModel;

	public interface SendMailDAO {
		public void sendMail(String from, String to, String subject, String msg);
	} 
