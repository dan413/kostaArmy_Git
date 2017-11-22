package ki.mo.ddi.commuteModel;

import java.sql.Timestamp;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component 
public class Cadre_CommuteListDAOImpl implements Cadre_CommuteListDAO{
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void insertStart_time(Cadre_CommuteListDTO commute_dto) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		commuteDAO.insertStart_time(commute_dto);
	}
	@Override
	public String getStart_time(String cadre_number){
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.getStart_time(cadre_number);
	}
	@Override
	public int updateOver_Commute(String cadre_number) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.updateOver_Commute(cadre_number);
	}
	@Override
	public String getOver_CommuteTime(String cadre_number) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.getOver_CommuteTime(cadre_number);
	}
	@Override
	public Cadre_CommuteListDTO getLastCommute_time(String cadre_number) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.getLastCommute_time(cadre_number);
	}
	@Override
	public void setEnd_Commute_time(Cadre_CommuteListDTO commute_dto) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		commuteDAO.setEnd_Commute_time(commute_dto);
	}
	@Override
	public Cadre_CommuteListDTO getCadre_CommuteRecord(String cadre_number) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.getCadre_CommuteRecord(cadre_number);
	}
	@Override
	public void updateEnd_Commute(String cadre_number) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		commuteDAO.updateEnd_Commute(cadre_number);
	}
	@Override
	public void updateEnd_Commute_over(Cadre_CommuteListDTO cadre_commuteObj) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		commuteDAO.updateEnd_Commute_over(cadre_commuteObj);
	}
	@Override
	public String getEnd_CommuteTime(String cadre_number) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.getEnd_CommuteTime(cadre_number);
	}
	@Override
	public List<Cadre_CommuteListDTO> getCadre_CommuteList(Cadre_CommuteListDTO cadre_commuteObj) {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.getCadre_CommuteList(cadre_commuteObj);
	}
	@Override
	public List<Cadre_CommuteListDTO> getCadre_commute_payList() {
		Cadre_CommuteListDAO commuteDAO = sqlSession.getMapper(Cadre_CommuteListDAO.class);
		return commuteDAO.getCadre_commute_payList();
	}
}
