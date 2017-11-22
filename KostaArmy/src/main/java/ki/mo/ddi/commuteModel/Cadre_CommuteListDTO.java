package ki.mo.ddi.commuteModel;

import java.sql.Timestamp;

public class Cadre_CommuteListDTO {
	private String cadre_number;
	private Timestamp start_time;
	private Timestamp end_time;
	private Timestamp over_time;
	private int over_pay;
	private int commute_flag;
	public String getCadre_number() {
		return cadre_number;
	}
	public int getCommute_flag() {
		return commute_flag;
	}
	public void setCommute_flag(int commute_flag) {
		this.commute_flag = commute_flag;
	}
	public void setCadre_number(String cadre_number) {
		this.cadre_number = cadre_number;
	}
	public Timestamp getStart_time() {
		return start_time;
	}
	public void setStart_time(Timestamp start_time) {
		this.start_time = start_time;
	}
	public Timestamp getEnd_time() {
		return end_time;
	}
	public void setEnd_time(Timestamp end_time) {
		this.end_time = end_time;
	}
	public Timestamp getOver_time() {
		return over_time;
	}
	public void setOver_time(Timestamp over_time) {
		this.over_time = over_time;
	}
	public int getOver_pay() {
		return over_pay;
	}
	public void setOver_pay(int over_pay) {
		this.over_pay = over_pay;
	}
	
	
}
