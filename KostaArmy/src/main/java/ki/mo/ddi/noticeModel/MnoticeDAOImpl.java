package ki.mo.ddi.noticeModel;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MnoticeDAOImpl implements MnoticeDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertNotice(MnoticeDTO dto) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		dao.insertNotice(dto);
	}

	@Override
	public MnoticeDTO getNoticeByNum(int num) {  // 특정 dcode 레코드 추출
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		return dao.getNoticeByNum(num);
	}

	@Override
	public List<MnoticeDTO> searchNoticeList(Map map) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		return dao.searchNoticeList(map);
	}

	@Override
	public void updateNotice(MnoticeDTO dto) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		dao.updateNotice(dto);
	}

	
	@Override
	public void deleteNotice(int num) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		dao.deleteNotice(num);
	}

	@Override
	public List<MnoticeDTO> selectAll(Map<Object, Object> map) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		return dao.selectAll(map);
	}

	@Override
	public void updateHit(int num) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		dao.updateHit(num);
	}

	public int getListCount() {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		return dao.getListCount();
	}
	
	@Override
	public List<MnoticeDTO> noticeList() {
		System.out.println("여긴 오냐??");
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
		return dao.noticeList();
	}

	@Override
	public List<MnoticeDTO> selectDeptAll(Map<Object, Object> map) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
	     return dao.selectDeptAll(map);
	}

	@Override
	public int getDeptListCount(String dept) {
		MnoticeDAO dao = sqlSession.getMapper(MnoticeDAO.class);
	    return dao.getDeptListCount(dept);
	}

	
}
