package ki.mo.ddi.supplyModel;

import java.util.List;

public interface Supply_BasketDAO {
	
	public void insertBasketSupply(Supply_BasketDTO dto);
	
	public List<Supply_BasketDTO> getBasketList();
	
	public void deleteBasketSupply(String osupply_num);
	
	public void initialization();
	
}
