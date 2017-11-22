package ki.mo.ddi.managerModel;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Manager_FamilyTableDAOImpl implements Manager_FamilyTableDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void addSoldierNumber(String soldier_number) {
		Manager_FamilyTableDAO familyTableDAO = sqlSession.getMapper(Manager_FamilyTableDAO.class);
		familyTableDAO.addSoldierNumber(soldier_number); 
	}

	@Override
	public Manager_FamilyTableDTO getFamilyInfo(String soldier_number) {
		Manager_FamilyTableDAO familyTableDAO = sqlSession.getMapper(Manager_FamilyTableDAO.class);
		return familyTableDAO.getFamilyInfo(soldier_number);
	}

	@Override
	public void updateSoldierFamily(Manager_FamilyTableDTO familyDTO) {
		Manager_FamilyTableDAO familyTableDAO = sqlSession.getMapper(Manager_FamilyTableDAO.class);
		familyTableDAO.updateSoldierFamily(familyDTO);
	}
	
	
}
