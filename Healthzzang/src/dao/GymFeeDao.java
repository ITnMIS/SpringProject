package dao;

import java.util.List;

import model.GymFeeModel;
import model.GymModel;



public interface GymFeeDao {

	// show detail about selected article

	List<GymFeeModel> getGymFeeList(String gseq);

}
