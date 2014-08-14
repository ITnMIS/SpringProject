package service;

import java.util.HashMap;
import java.util.List;

import model.CeventModel;
import model.GymModel;

import org.springframework.orm.ibatis.SqlMapClientTemplate;

import dao.SearchDao;

public class SearchService implements SearchDao{
	private  SqlMapClientTemplate sqlMapClientTemplate;
	private  HashMap<String, Object> valueMap = new HashMap<String, Object>();
		

	public void setSqlMapClientTemplate(SqlMapClientTemplate sqlMapClientTemplate) {
		this.sqlMapClientTemplate = sqlMapClientTemplate;
	}
	

	//searching boards
	public List<CeventModel> searchCevent(String search, int startArticleNum, int endArticleNum) {
		valueMap.put("search", search);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("search.searchCevent", valueMap);
	}
	
	public List<CeventModel> searchCFree(String search, int startArticleNum,
			int endArticleNum) {
		valueMap.put("search", search);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("search.searchCFree", valueMap);
	}

	public List<CeventModel> searchChealthz(String search, int startArticleNum,
			int endArticleNum) {
		valueMap.put("search", search);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("search.searchChealthz", valueMap);

	}

	public List<CeventModel> searchCidea(String search, int startArticleNum,
			int endArticleNum) {
		valueMap.put("search", search);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("search.searchCidea", valueMap);
	}
	
	
	//searching gym
	public List<GymModel> searchGym(String search, int startArticleNum, int endArticleNum) {
		valueMap.put("search", search);
		valueMap.put("startArticleNum", startArticleNum);
		valueMap.put("endArticleNum", endArticleNum);
		return sqlMapClientTemplate.queryForList("search.searchGym", valueMap);
	}
	
	// setting total number
	@Override
	public int getCeventSearchTotalNum(String search) {
		valueMap.put("search", search);
		return (Integer) sqlMapClientTemplate.queryForObject("search.getCeventSearchTotalNum");
	}

	@Override
	public int getCFreeSearchTotalNum(String search) {
		valueMap.put("search", search);
		return (Integer) sqlMapClientTemplate.queryForObject("search.getCFreeSearchTotalNum");
	}


	@Override
	public int getChealthzSearchTotalNum(String search) {
		valueMap.put("search", search);
		return (Integer) sqlMapClientTemplate.queryForObject("search.getChealthzSearchTotalNum");
	}


	@Override
	public int getCideaSearchTotalNum(String search) {
		valueMap.put("search", search);
		return (Integer) sqlMapClientTemplate.queryForObject("search.getCideaSearchTotalNum");
	}


	@Override
	public int getGymSearchTotalNum(String search) {
		valueMap.put("search", search);
		return (Integer) sqlMapClientTemplate.queryForObject("search.getGymSearchTotalNum");
	}
	
}





	


	

