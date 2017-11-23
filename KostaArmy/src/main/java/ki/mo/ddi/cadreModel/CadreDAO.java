package ki.mo.ddi.cadreModel;

import java.util.List;
import java.util.Map;

import ki.mo.ddi.noticeModel.MnoticeDTO;

public interface CadreDAO {
	public List<CadreDTO> getAllCadre();

	public CadreDTO findInfoByNum(String user);
 
	public List<MnoticeDTO> noticeList();

	public void insertCadre_nonFile(CadreDTO cadre);

	public void insertCadre(CadreDTO cadre);

	public CadreDTO getCadreInfo(String cadre_number);

	public void updateCadre_nonFile(CadreDTO cadre);

	public void updateCadre(CadreDTO cadre);

	public List<CadreDTO> selectByKey(Map<String, String> map);

	public String getPassword(String cadre_number);

	public int changePassword(CadreDTO cadre);

	public List<CadreDTO> selectByKey_vacation_cadreUser_table(Map<String, String> map2);

	public List<CadreDTO> select_Complete_Cadre_Vacation(String cadre_group);

	public void update_Day(CadreDTO cadre);

	public void cadreDischargeProcess(String cadre_number);

	public void cadre_vacation_start(String cadre_number);

	public void cadre_vacation_end(CadreDTO user);

	public List<CadreDTO> getCadre_vacationMember(String cadre_group);
	
	public List<CadreDTO> getSelect_vacation(String cadre_group);

	public List<CadreDTO> get_Cadre_By_Key(Map<String, String> map3);

	List<CadreDTO> getAllCadre_flagOn();
	
	public List<CadreDTO> getOuterCadre();

}
