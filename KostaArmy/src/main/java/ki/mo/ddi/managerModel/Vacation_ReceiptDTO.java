package ki.mo.ddi.managerModel;

import java.sql.Timestamp;

public class Vacation_ReceiptDTO {
	
	private String vacation_number;
	private String vacation_name;
	private String vacation_mmr;
	private String vacation_group;
	private String vacation_kind;
	private Timestamp vacation_start;
	private Timestamp vacation_end;
	private String vacation_flag;
	
	private String vacation_start1;
	private String vacation_end1;
	public String getVacation_number() {
		return vacation_number;
	}
	public void setVacation_number(String vacation_number) {
		this.vacation_number = vacation_number;
	}
	public String getVacation_name() {
		return vacation_name;
	}
	public void setVacation_name(String vacation_name) {
		this.vacation_name = vacation_name;
	}
	public String getVacation_mmr() {
		return vacation_mmr;
	}
	public void setVacation_mmr(String vacation_mmr) {
		this.vacation_mmr = vacation_mmr;
	}
	public String getVacation_group() {
		return vacation_group;
	}
	public void setVacation_group(String vacation_group) {
		this.vacation_group = vacation_group;
	}
	public String getVacation_kind() {
		return vacation_kind;
	}
	public void setVacation_kind(String vacation_kind) {
		this.vacation_kind = vacation_kind;
	}
	public Timestamp getVacation_start() {
		return vacation_start;
	}
	public void setVacation_start(Timestamp vacation_start) {
		this.vacation_start = vacation_start;
	}
	public Timestamp getVacation_end() {
		return vacation_end;
	}
	public void setVacation_end(Timestamp vacation_end) {
		this.vacation_end = vacation_end;
	}
	public String getVacation_flag() {
		return vacation_flag;
	}
	public void setVacation_flag(String vacation_flag) {
		this.vacation_flag = vacation_flag;
	}
	public String getVacation_start1() {
		return vacation_start1;
	}
	public void setVacation_start1(String vacation_start1) {
		this.vacation_start1 = vacation_start1;
	}
	public String getVacation_end1() {
		return vacation_end1;
	}
	public void setVacation_end1(String vacation_end1) {
		this.vacation_end1 = vacation_end1;
	}

	
}
