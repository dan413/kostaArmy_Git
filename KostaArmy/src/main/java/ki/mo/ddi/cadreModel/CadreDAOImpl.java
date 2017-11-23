package ki.mo.ddi.cadreModel;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ki.mo.ddi.noticeModel.MnoticeDTO;

@Component
public class CadreDAOImpl implements CadreDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<CadreDTO> getAllCadre() {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.getAllCadre();
	}

	@Override
	public CadreDTO findInfoByNum(String user) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.findInfoByNum(user);
	}

	@Override
	public List<MnoticeDTO> noticeList() {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.noticeList();
	}

	@Override
	public void insertCadre_nonFile(CadreDTO cadre) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.insertCadre_nonFile(cadre);
	}

	@Override
	public void insertCadre(CadreDTO cadre) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.insertCadre(cadre); 
	}

	@Override
	public CadreDTO getCadreInfo(String cadre_number) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.getCadreInfo(cadre_number);
	}

	@Override
	public void updateCadre_nonFile(CadreDTO cadre) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.updateCadre_nonFile(cadre);
	}

	@Override
	public void updateCadre(CadreDTO cadre) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.updateCadre(cadre);
	}

	@Override
	public List<CadreDTO> selectByKey(Map<String, String> map) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.selectByKey(map);
	}

	@Override
	public String getPassword(String cadre_number) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.getPassword(cadre_number);
	}

	@Override
	public int changePassword(CadreDTO cadre) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.changePassword(cadre);
	}
	
	@Override
	public List<CadreDTO> selectByKey_vacation_cadreUser_table(Map<String, String> map2) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.selectByKey_vacation_cadreUser_table(map2);
	}

	@Override
	public List<CadreDTO> select_Complete_Cadre_Vacation(String cadre_group) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.select_Complete_Cadre_Vacation(cadre_group);
	}

	@Override
	public void update_Day(CadreDTO cadre) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.update_Day(cadre);
	}

	@Override
	public void cadreDischargeProcess(String cadre_number) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.cadreDischargeProcess(cadre_number);
	}

	@Override
	public void cadre_vacation_start(String cadre_number) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.cadre_vacation_start(cadre_number);
	}

	@Override
	public void cadre_vacation_end(CadreDTO user) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		cadreDAO.cadre_vacation_end(user);
	}

	@Override
	public List<CadreDTO> getSelect_vacation(String cadre_group) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.getSelect_vacation(cadre_group);
	}
	@Override
	public List<CadreDTO> get_Cadre_By_Key(Map<String, String> map3) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.get_Cadre_By_Key(map3);
	}
	
	@Override
	public List<CadreDTO> getAllCadre_flagOn() {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.getAllCadre_flagOn();
	}

	@Override
	public List<CadreDTO> getCadre_vacationMember(String cadre_group) {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.getCadre_vacationMember(cadre_group);
	}

	@Override
	public List<CadreDTO> getOuterCadre() {
		CadreDAO cadreDAO = sqlSession.getMapper(CadreDAO.class);
		return cadreDAO.getOuterCadre();
	}
}
