package ki.mo.ddi.supplyModel;

import java.util.List;
import java.util.Map;

public interface Supply_ReceiptDAO {
	
	List<Supply_ReceiptDTO> selectAll();
	
	void insertReceipt(Supply_ReceiptDTO dto);
	
	void setTotal(Supply_ReceiptDTO dto);
	
	void setConsumeReceipt(Supply_ReceiptDTO rec_dto);
	
	List<Supply_ReceiptDTO> getSearchDateList(Map<Object, Object> map);

}
