package ki.mo.ddi.commuteModel;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Cadre_PayListDAOImpl implements Cadre_PayListDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int getSendPayCount() {
		Cadre_PayListDAO cadre_payListDAO = sqlSession.getMapper(Cadre_PayListDAO.class);
		return cadre_payListDAO.getSendPayCount();
	}

	@Override
	public void insertCadrePayRecord(Cadre_PayListDTO cadre_pay) {
		Cadre_PayListDAO cadre_payListDAO = sqlSession.getMapper(Cadre_PayListDAO.class);
		cadre_payListDAO.insertCadrePayRecord(cadre_pay);
	}

	@Override
	public Cadre_PayListDTO getCadre_PayList(Cadre_PayListDTO cadre_payObj) {
		Cadre_PayListDAO cadre_payListDAO = sqlSession.getMapper(Cadre_PayListDAO.class);
		return cadre_payListDAO.getCadre_PayList(cadre_payObj);
	}
}
