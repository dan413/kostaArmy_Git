package ki.mo.ddi.supplyModel;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Supply_TableDAOImpl implements Supply_TableDAO{
	
	@Autowired
	private SqlSession sqlSession;
	@Override
	public void SupplyCompleteAdd(Supply_TableDTO dto) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.SupplyCompleteAdd(dto);
	}
	@Override
	public List<Supply_TableDTO> getCurrentSupplyList(String tableName) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getCurrentSupplyList(tableName);
	}
	@Override
	public List<Supply_TableDTO> selectByKey(Map<String, String> map) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.selectByKey(map);
	}
	@Override
	public List<Supply_TableDTO> searchDate(String date1) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.searchDate(date1);
	}
	@Override
	public List<Supply_TableDTO> selectByOrder(String tableName) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.selectByOrder(tableName);
	}
	@Override
	public int countByOrder(String tableName) {
		// TODO Auto-generated method stub
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.countByOrder(tableName);
	}
	@Override
	public void deleteOrder(Map<String, String> map) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.deleteOrder(map);
		
	}
	@Override
	public List<Supply_TableDTO> completeOrder_1() {
		
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.completeOrder_1(); 
	}
	@Override
	public Supply_TableDTO completeOrder_2(String supply_num) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.completeOrder_2(supply_num);
	}
	@Override
	public void sumTotal(Map<Object, Object> map) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.sumTotal(map);
	}
	@Override
	public void insertReceive(Supply_TableDTO dto) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.insertReceive(dto);
	}
	@Override
	public void resetOrder(Supply_TableDTO dto) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.resetOrder(dto);
		
	}
	@Override
	public List<Supply_TableDTO> selectByReceive() {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.selectByReceive();
	}
	@Override
	public int sign_Order_1(Map<String, String> map) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.sign_Order_1(map);
	}
	@Override
	public void sign_Order_2(Supply_TableDTO dto) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.sign_Order_2(dto);
	}
	@Override
	public void Sign_Order_Reset(Map<String, String> map) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.Sign_Order_Reset(map);
	}
	@Override
	public int getAgreeCount(String tableName) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getAgreeCount(tableName);
	}
	@Override
	public List<Supply_TableDTO> getSupplyAgreeList(String tableName) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getSupplyAgreeList(tableName);
	}
	@Override
	public void resetSupply_Set(Supply_TableDTO tableDTO) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.resetSupply_Set(tableDTO);
	}
	@Override
	public void setTotal(Supply_ReceiptDTO dto) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.setTotal(dto);
	}
	@Override
	public List<Supply_TableDTO> getCurrentOrderSupplyList(String tableName) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getCurrentOrderSupplyList(tableName);
	}
	@Override
	public Supply_TableDTO getTotal(Map<String, String> map) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getTotal(map);
	}
	@Override
	public void setConsume_total(Map<Object, Object> map) {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		supply_tableDAO.setConsume_total(map);
	}
	@Override
	public int getSupplyOrderCountCenter() {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getSupplyOrderCountCenter();
	}
	@Override
	public int getSupplyOrderCount1() {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getSupplyOrderCount1();
	}
	@Override
	public int getSupplyOrderCount2() {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getSupplyOrderCount2();
	}
	@Override
	public int getSupplyOrderCount3() {
		Supply_TableDAO supply_tableDAO = sqlSession.getMapper(Supply_TableDAO.class);
		return supply_tableDAO.getSupplyOrderCount3();
	}
	
}
