package ki.mo.ddi.supplyModel;

import java.util.List;
import java.util.Map;

public interface Supply_TableDAO {

	public void SupplyCompleteAdd(Supply_TableDTO dto);

	public List<Supply_TableDTO> getCurrentSupplyList(String tableName);

	public List<Supply_TableDTO> selectByKey(Map<String, String> map);

	public List<Supply_TableDTO> searchDate(String date1);

	public List<Supply_TableDTO> selectByOrder(String tableName);

	public int countByOrder(String tableName);

	public void deleteOrder(Map<String, String> map);

	public List<Supply_TableDTO> completeOrder_1();

	public Supply_TableDTO completeOrder_2(String supply_num);

	public void sumTotal(Map<Object, Object> map);

	public void insertReceive(Supply_TableDTO dto);

	public void resetOrder(Supply_TableDTO dto);

	public List<Supply_TableDTO> selectByReceive();

	public int sign_Order_1(Map<String, String> map);

	public void sign_Order_2(Supply_TableDTO dto);

	public void Sign_Order_Reset(Map<String, String> map);

	public int getAgreeCount(String tableName);

	public List<Supply_TableDTO> getSupplyAgreeList(String tableName);

	public void resetSupply_Set(Supply_TableDTO supply_TableDTO);

	public void setTotal(Supply_ReceiptDTO dto);

	public List<Supply_TableDTO> getCurrentOrderSupplyList(String tableName);

	public Supply_TableDTO getTotal(Map<String, String> t_map);

	public void setConsume_total(Map<Object, Object> map);

	public int getSupplyOrderCountCenter();

	public int getSupplyOrderCount1();

	public int getSupplyOrderCount2();

	public int getSupplyOrderCount3();
	
}
