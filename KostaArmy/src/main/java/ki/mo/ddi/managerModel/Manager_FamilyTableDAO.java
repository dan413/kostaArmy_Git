package ki.mo.ddi.managerModel;

public interface Manager_FamilyTableDAO {
	void addSoldierNumber(String soldier_number);
	
	Manager_FamilyTableDTO getFamilyInfo(String soldier_number);
	
	void updateSoldierFamily(Manager_FamilyTableDTO familyDTO);
	
}
