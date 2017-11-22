package ki.mo.ddi.commuteModel;

import java.sql.Timestamp;

public class Cadre_PayListDTO {
	private Timestamp cadre_sendPayDate;
	private String cadre_number;
	private int cadre_normalPay;
	private int cadre_overPay;
	private int cadre_incomeTax;
	private int cadre_sub_incomeTax;
	private int cadre_healthyTax;
	
	public Timestamp getCadre_sendPayDate() {
		return cadre_sendPayDate;
	}
	public void setCadre_sendPayDate(Timestamp cadre_sendPayDate) {
		this.cadre_sendPayDate = cadre_sendPayDate;
	}
	public String getCadre_number() {
		return cadre_number;
	}
	public void setCadre_number(String cadre_number) {
		this.cadre_number = cadre_number;
	}
	public int getCadre_normalPay() {
		return cadre_normalPay;
	}
	public void setCadre_normalPay(int cadre_normalPay) {
		this.cadre_normalPay = cadre_normalPay;
	}
	public int getCadre_overPay() {
		return cadre_overPay;
	}
	public void setCadre_overPay(int cadre_overPay) {
		this.cadre_overPay = cadre_overPay;
	}
	public int getCadre_incomeTax() {
		return cadre_incomeTax;
	}
	public void setCadre_incomeTax(int cadre_incomeTax) {
		this.cadre_incomeTax = cadre_incomeTax;
	}
	public int getCadre_sub_incomeTax() {
		return cadre_sub_incomeTax;
	}
	public void setCadre_sub_incomeTax(int cadre_sub_incomeTax) {
		this.cadre_sub_incomeTax = cadre_sub_incomeTax;
	}
	public int getCadre_healthyTax() {
		return cadre_healthyTax;
	}
	public void setCadre_healthyTax(int cadre_healthyTax) {
		this.cadre_healthyTax = cadre_healthyTax;
	}
	
	
}
