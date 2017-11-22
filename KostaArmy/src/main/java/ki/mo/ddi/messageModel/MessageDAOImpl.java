package ki.mo.ddi.messageModel;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import ki.mo.ddi.cadreModel.CadreDTO;

@Component
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<MessageDTO> getMsgList() {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.getMsgList();
	}

	

	@Override
	public void readMsg(int msg_no) {
		
		MessageDAO msgDAO = sqlSession.getMapper(MessageDAO.class);
		msgDAO.readMsg(msg_no);
		
	}

	@Override
	public void deleteMsg(int msg_no) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public int alramMsg(String id) {
		
		MessageDAO msgDAO = sqlSession.getMapper(MessageDAO.class);
		
		return msgDAO.alramMsg(id);
		
	}

	@Override
	public MessageDTO getMsgNo(int msg_no) {

		MessageDAO msgDAO = sqlSession.getMapper(MessageDAO.class);
		return msgDAO.getMsgNo(msg_no);
	}

	@Override
	public List<MessageDTO> getReceivedList(String id) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.getReceivedList(id);
	
	}
	
	@Override
	public List<MessageDTO> getSentList(String id) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.getSentList(id);
	}

	@Override
	public ArrayList<CadreDTO> getAddrList(String cadre_num) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.getAddrList(cadre_num);
	}
	
	@Override
	public ArrayList<CadreDTO> searchAddr(Map<String, String> map) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.searchAddr(map);
	}

	@Override
	public void sendMsg(Map<String, String> map) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		 dao.sendMsg(map);
		
	}
	@Override
	public ArrayList<MessageDTO> getDetailView(int msg_no) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.getDetailView(msg_no);
	}



	@Override
	public List<MessageDTO> getWorkList(Map<String, String> map) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.getWorkList(map);
	}



	@Override
	public int alramWorkMsg(Map<String, String> map) {
		MessageDAO dao = sqlSession.getMapper(MessageDAO.class);
		return dao.alramWorkMsg(map);
	}



}
