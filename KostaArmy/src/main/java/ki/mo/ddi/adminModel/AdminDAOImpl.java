package ki.mo.ddi.adminModel;


import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class AdminDAOImpl implements AdminDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void dailyInsert(AdminDTO dto) {
		AdminDAO AdminDAO = sqlSession.getMapper(AdminDAO.class);
		AdminDAO.dailyInsert(dto);
	}

	@Override
	public ArrayList<AdminDTO> getDaily(String cadre_group) {
		AdminDAO AdminDAO = sqlSession.getMapper(AdminDAO.class);
		return AdminDAO.getDaily(cadre_group);
	}

	@Override
	public void dailyDelete(int dailyID) {
		AdminDAO AdminDAO = sqlSession.getMapper(AdminDAO.class);
		AdminDAO.dailyDelete(dailyID);
	}

	@Override
	public void dailyUpdate(AdminDTO dto) {
		AdminDAO AdminDAO = sqlSession.getMapper(AdminDAO.class);
		AdminDAO.dailyUpdate(dto);
	}

	@Override
	public void dailyAllDelete(String cadre_group) {
		AdminDAO AdminDAO = sqlSession.getMapper(AdminDAO.class);
		AdminDAO.dailyAllDelete(cadre_group);
		
	}


}
