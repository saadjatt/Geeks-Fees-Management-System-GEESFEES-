package fms.dao;
import java.util.ArrayList;

import fms.model.*;


public interface BatchDAO {
	public int addBatch(String name,String course, String timing,String start,String end,String fees);
	public int editBatch(int batch_id,String name,String course, String timing,String start,String end,String fees);
	public ArrayList<BatchBean> viewAllBatch();
	public ArrayList<BatchBean> searchBatch(String n);
	public int countRows();
	public int deleteBatch(int batch_id);
	public ArrayList<BatchBean> getBatch(int id);
	
}
