package ki.mo.ddi.managerModel;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class Vacation_ReceiptDAOImpl implements Vacation_ReceiptDAO {
	
	@Autowired
	private SqlSession sqlSession;


	@Override
	public List<Vacation_ReceiptDTO> selectCalendar(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.selectCalendar(cadre_group);
	}


	@Override
	public void insert_vacation(Map<String, String> map) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		receiptDAO.insert_vacation(map);
	}


	@Override
	public void reset_vacation_apply(String vacation_number) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		receiptDAO.reset_vacation_apply(vacation_number);
	}


	@Override
	public void vacation_apply_toCaptain(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		receiptDAO.vacation_apply_toCaptain(cadre_group);
	}


	@Override
	public List<Vacation_ReceiptDTO> selectCalendar_Sign(String vacation_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.selectCalendar_Sign(vacation_group);
	}


	@Override
	public int getCount_soldier(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getCount_soldier(cadre_group);
	}


	@Override
	public int getCount_cadre(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getCount_cadre(cadre_group);
	}


	@Override
	public int getCount_receipt(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getCount_receipt(cadre_group);
	}


	@Override
	public List<Vacation_ReceiptDTO> Sign_success_1(String vacation_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.Sign_success_1(vacation_group);
	}


	@Override
	public void Sign_success_2(Map<String, String> map) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		receiptDAO.Sign_success_2(map);
	}


	@Override
	public void Sign_refuse(String vacation_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		receiptDAO.Sign_refuse(vacation_group);
	}


	@Override
	public void ok_bySergeant(String vacation_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		System.out.println("vacation_group gg:" + vacation_group);
		receiptDAO.ok_bySergeant(vacation_group);
	}


	@Override
	public void reset_bySergeant(String vacation_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		receiptDAO.reset_bySergeant(vacation_group);
	}


	@Override
	public int getVacationProcessCount(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getVacationProcessCount(cadre_group);
	}


	@Override
	public int getVacationAgreeCount(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getVacationAgreeCount(cadre_group);
	}


	@Override
	public int getVacationDisAgreelCount(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getVacationDisAgreelCount(cadre_group);
	}


	@Override
	public int getCenterVacationCount() {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getCenterVacationCount();
	}


	@Override
	public int getSquad1VacationCount() {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getSquad1VacationCount();
	}


	@Override
	public int getSquad2VacationCount() {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getSquad2VacationCount();
	}


	@Override
	public int getSquad3VacationCount() {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.getSquad3VacationCount();
	}


	@Override
	public List<Vacation_ReceiptDTO> select_backup(String cadre_group) {
		Vacation_ReceiptDAO receiptDAO = sqlSession.getMapper(Vacation_ReceiptDAO.class);
		return receiptDAO.select_backup(cadre_group);
	}

}
