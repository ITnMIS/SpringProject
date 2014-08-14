package dao;

import java.util.List;

import model.TrainerModel;



public interface TrainerDao {

	List<TrainerModel> getTrainerList(String gseq);
}
