package ki.mo.ddi.managerModel;

import java.util.List;
import java.util.Map;

public interface Vacation_ReceiptDAO {


	public List<Vacation_ReceiptDTO> selectCalendar(String cadre_group);

	public void insert_vacation(Map<String, String> map);

	public void reset_vacation_apply(String vacation_number);

	public void vacation_apply_toCaptain(String cadre_group);

	public List<Vacation_ReceiptDTO> selectCalendar_Sign(String vacation_group);

	public int getCount_soldier(String cadre_group);

	public int getCount_cadre(String cadre_group);

	public int getCount_receipt(String cadre_group);

	public List<Vacation_ReceiptDTO> Sign_success_1(String vacation_group);

	public void Sign_success_2(Map<String, String> map);

	public void Sign_refuse(String vacation_group);

	public void ok_bySergeant(String vacation_group);

	public void reset_bySergeant(String vacation_group);

	public int getVacationProcessCount(String cadre_group);

	public int getVacationAgreeCount(String cadre_group);

	public int getVacationDisAgreelCount(String cadre_group);

	public int getCenterVacationCount();

	public int getSquad1VacationCount();

	public int getSquad2VacationCount();

	public int getSquad3VacationCount();

	public List<Vacation_ReceiptDTO> select_backup(String cadre_group);

}
