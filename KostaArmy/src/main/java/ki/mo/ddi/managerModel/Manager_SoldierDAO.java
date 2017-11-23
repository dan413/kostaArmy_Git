package ki.mo.ddi.managerModel;

import java.util.List;
import java.util.Map;

public interface Manager_SoldierDAO {
	List<Manager_SoldierDTO> getAllSoldierList();

	void addNewSoldier(Manager_SoldierDTO dto);

	Manager_SoldierDTO getSoldierInfo(String soldier_number);

	void updateSoldier(Manager_SoldierDTO soldier);

	void updateSoldier_nonFile(Manager_SoldierDTO soldier);

	List<Manager_SoldierDTO> selectByKey(Map<String, String> map);

	List<Manager_SoldierDTO> selectByKey_vacation_manager_soldier(Map<String, String> map2);

	List<Manager_SoldierDTO> select_Complete_Soldier_Vacation(String cadre_group);

	void update_Day(Manager_SoldierDTO soldier);

	void dischargeProcess(String soldier_number);

	List<Manager_SoldierDTO> getSoldier_vacationMember(String cadre_group);
		
	void soldier_vacation_start(String soldier_number);

	void soldier_vacation_end(Manager_SoldierDTO soldier_obj);

	List<Manager_SoldierDTO> getSelect_vaction(String cadre_group);
	
	List<Manager_SoldierDTO> get_Soldier_By_Key(Map<String, String> map3);
	
	List<Manager_SoldierDTO> get_Driver_By_Key(Map<String, String> map4);

	List<Manager_SoldierDTO> getOuterSoldier();

}