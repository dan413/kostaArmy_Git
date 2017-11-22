package ki.mo.ddi.supplyModel;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Supply_ReceiptDAOImpl implements Supply_ReceiptDAO{
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Supply_ReceiptDTO> selectAll() {
		Supply_ReceiptDAO supply_ReceiptDAO = sqlSession.getMapper(Supply_ReceiptDAO.class);
		return supply_ReceiptDAO.selectAll();
	}

	@Override
	public List<Supply_ReceiptDTO> getSearchDateList(Map<Object, Object> map) {
		Supply_ReceiptDAO supply_ReceiptDAO = sqlSession.getMapper(Supply_ReceiptDAO.class);
		return supply_ReceiptDAO.getSearchDateList(map);
	}
	

	@Override
	public void insertReceipt(Supply_ReceiptDTO dto) {
		Supply_ReceiptDAO supply_ReceiptDAO = sqlSession.getMapper(Supply_ReceiptDAO.class);
		supply_ReceiptDAO.insertReceipt(dto);
	}

	@Override
	public void setTotal(Supply_ReceiptDTO dto) {
		Supply_ReceiptDAO supply_ReceiptDAO = sqlSession.getMapper(Supply_ReceiptDAO.class);
		supply_ReceiptDAO.setTotal(dto);
	}

	@Override
	public void setConsumeReceipt(Supply_ReceiptDTO dto) {
		Supply_ReceiptDAO supply_ReceiptDAO = sqlSession.getMapper(Supply_ReceiptDAO.class);
		supply_ReceiptDAO.setConsumeReceipt(dto);
	}



	
	
}
