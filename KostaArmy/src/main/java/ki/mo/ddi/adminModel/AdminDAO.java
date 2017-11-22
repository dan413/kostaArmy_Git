package ki.mo.ddi.adminModel;

import java.util.ArrayList;

public interface AdminDAO {
	
	public void dailyInsert(AdminDTO dto);
	
	public void dailyUpdate(AdminDTO dto);
	
	public void dailyDelete(int dailyID);
	
	public void dailyAllDelete(String cadre_group);
	
	public ArrayList<AdminDTO> getDaily(String cadre_group);
}
