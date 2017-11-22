package ki.mo.ddi.commuteModel;

import java.util.List;

public interface Cadre_PayListDAO{
	int getSendPayCount();
	
	void insertCadrePayRecord(Cadre_PayListDTO cadre_pay);
	
	Cadre_PayListDTO getCadre_PayList(Cadre_PayListDTO cadre_payObj);
	
}

