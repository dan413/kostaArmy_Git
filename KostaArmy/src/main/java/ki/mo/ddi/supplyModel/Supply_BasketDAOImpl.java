package ki.mo.ddi.supplyModel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Supply_BasketDAOImpl implements Supply_BasketDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public void insertBasketSupply(Supply_BasketDTO dto) {
		// TODO Auto-generated method stub
		Supply_BasketDAO supply_basketDAO = sqlSession.getMapper(Supply_BasketDAO.class);
		supply_basketDAO.insertBasketSupply(dto);
	}

	@Override
	public List<Supply_BasketDTO> getBasketList() {
		Supply_BasketDAO supply_basketDAO = sqlSession.getMapper(Supply_BasketDAO.class);
		return supply_basketDAO.getBasketList();
	}

	@Override
	public void deleteBasketSupply(String osupply_num) {
		Supply_BasketDAO supply_basketDAO = sqlSession.getMapper(Supply_BasketDAO.class);
		supply_basketDAO.deleteBasketSupply(osupply_num);
	}

	@Override
	public void initialization() {
		Supply_BasketDAO supply_basketDAO = sqlSession.getMapper(Supply_BasketDAO.class);
		supply_basketDAO.initialization();
	}

}
