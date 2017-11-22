package ki.mo.ddi.adminModel;

import java.util.List;


public interface Admin_WeekDAO {

	public void insertWeekly(Admin_WeekDTO dto);
	
	public List<Admin_WeekDTO> getAllWeekly(String cadre_group);
	
	public void deleteWeekly(String cadre_group);

	public void updateWeekly(Admin_WeekDTO dto);
	
	public Admin_WeekDTO selectWeekly(String w_num);
}
