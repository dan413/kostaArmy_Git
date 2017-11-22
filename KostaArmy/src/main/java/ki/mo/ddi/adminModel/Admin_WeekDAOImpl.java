package ki.mo.ddi.adminModel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;


@Component
public class Admin_WeekDAOImpl implements Admin_WeekDAO {

	@Autowired
	private SqlSession sqlSession;

	/*주간 계획서 작성*/
	@Override
	public void insertWeekly(Admin_WeekDTO dto) {
		Admin_WeekDAO dao = sqlSession.getMapper(Admin_WeekDAO.class);
		dao.insertWeekly(dto);
	}

	@Override
	public Admin_WeekDTO selectWeekly(String w_num) {
		Admin_WeekDAO dao = sqlSession.getMapper(Admin_WeekDAO.class);
		return dao.selectWeekly(w_num);
	}
	
	/*월간 계획서 작성 */
	@Override
	public List<Admin_WeekDTO> getAllWeekly(String cadre_group) {
		Admin_WeekDAO Admin_WeekDAO = sqlSession.getMapper(Admin_WeekDAO.class);
		return Admin_WeekDAO.getAllWeekly(cadre_group);
	}
	
	/*월간 계획서 저장*/ 
	@Override
	public void deleteWeekly(String cadre_group) {
		Admin_WeekDAO dao = sqlSession.getMapper(Admin_WeekDAO.class);
		dao.deleteWeekly(cadre_group);
	}
	
	@Override
	public void updateWeekly(Admin_WeekDTO dto) {
		Admin_WeekDAO dao = sqlSession.getMapper(Admin_WeekDAO.class);
		dao.updateWeekly(dto);
	}
	
}