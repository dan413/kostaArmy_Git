package ki.mo.ddi.managerModel;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Manager_SoldierDAOImpl implements Manager_SoldierDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Manager_SoldierDTO> getAllSoldierList() {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.getAllSoldierList();
	}

	@Override
	public void addNewSoldier(Manager_SoldierDTO dto) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		ms_DAO.addNewSoldier(dto);
	}

	@Override
	public Manager_SoldierDTO getSoldierInfo(String soldier_number) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.getSoldierInfo(soldier_number);
	}

	@Override
	public void updateSoldier(Manager_SoldierDTO soldier) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		ms_DAO.updateSoldier(soldier);
	}

	@Override
	public void updateSoldier_nonFile(Manager_SoldierDTO soldier) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		ms_DAO.updateSoldier_nonFile(soldier);
	}

	@Override
	public List<Manager_SoldierDTO> selectByKey(Map<String, String> map) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.selectByKey(map);
	}

	@Override
	public List<Manager_SoldierDTO> selectByKey_vacation_manager_soldier(Map<String, String> map2) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);

		return ms_DAO.selectByKey_vacation_manager_soldier(map2);
	}

	@Override
	public List<Manager_SoldierDTO> select_Complete_Soldier_Vacation(String cadre_group) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.select_Complete_Soldier_Vacation(cadre_group);
	}

	@Override
	public void update_Day(Manager_SoldierDTO soldier) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		ms_DAO.update_Day(soldier);
	}

	@Override
	public void dischargeProcess(String soldier_number) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		ms_DAO.dischargeProcess(soldier_number);
	}

	

	@Override
	public void soldier_vacation_start(String soldier_number) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		ms_DAO.soldier_vacation_start(soldier_number);
	}

	@Override
	public void soldier_vacation_end(Manager_SoldierDTO soldier_obj) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		ms_DAO.soldier_vacation_end(soldier_obj);
	}

	@Override
	public List<Manager_SoldierDTO> getSelect_vaction(String cadre_group) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.getSelect_vaction(cadre_group);
	}
	

	@Override
	public List<Manager_SoldierDTO> get_Soldier_By_Key(Map<String, String> map3) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.get_Soldier_By_Key(map3);
	}

	@Override
	public List<Manager_SoldierDTO> get_Driver_By_Key(Map<String, String> map4) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.get_Driver_By_Key(map4);
	}

	@Override
	public List<Manager_SoldierDTO> getSoldier_vacationMember(String cadre_group) {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.getSoldier_vacationMember(cadre_group);
	}

	@Override
	public List<Manager_SoldierDTO> getOuterSoldier() {
		Manager_SoldierDAO ms_DAO = sqlSession.getMapper(Manager_SoldierDAO.class);
		return ms_DAO.getOuterSoldier();
	}
	
}