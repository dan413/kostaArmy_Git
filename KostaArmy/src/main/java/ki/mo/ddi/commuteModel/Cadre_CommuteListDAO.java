package ki.mo.ddi.commuteModel;

import java.util.List;

public interface Cadre_CommuteListDAO{
	void insertStart_time(Cadre_CommuteListDTO commute_dto);
	
	String getStart_time(String cadre_number);
	
	int updateOver_Commute(String cadre_number);
	
	String getOver_CommuteTime(String cadre_number);
	
	Cadre_CommuteListDTO getLastCommute_time(String cadre_number);
	
	void setEnd_Commute_time(Cadre_CommuteListDTO cadre_commuteObj);
	
	Cadre_CommuteListDTO getCadre_CommuteRecord(String cadre_number);
	
	void updateEnd_Commute(String cadre_number);
	
	void updateEnd_Commute_over(Cadre_CommuteListDTO cadre_commuteObj);
	
	String getEnd_CommuteTime(String cadre_number);
	
	List<Cadre_CommuteListDTO> getCadre_CommuteList(Cadre_CommuteListDTO cadre_commuteObj);
	
	List<Cadre_CommuteListDTO> getCadre_commute_payList(); 
}
 