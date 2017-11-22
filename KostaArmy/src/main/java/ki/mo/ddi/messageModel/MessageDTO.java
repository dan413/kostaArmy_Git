package ki.mo.ddi.messageModel;

public class MessageDTO {
	
	private int msg_no, msg_flag;

	private String msg_to_number, msg_from_number, msg_content, msg_date;
	private String cadre_name,cadre_mmr,cadre_dept,cadre_group;
	
	public MessageDTO() {}

	
	
	

	public String getCadre_name() {
		return cadre_name;
	}





	public void setCadre_name(String cadre_name) {
		this.cadre_name = cadre_name;
	}





	public String getCadre_mmr() {
		return cadre_mmr;
	}





	public void setCadre_mmr(String cadre_mmr) {
		this.cadre_mmr = cadre_mmr;
	}





	public String getCadre_dept() {
		return cadre_dept;
	}





	public void setCadre_dept(String cadre_dept) {
		this.cadre_dept = cadre_dept;
	}





	public String getCadre_group() {
		return cadre_group;
	}





	public void setCadre_group(String cadre_group) {
		this.cadre_group = cadre_group;
	}





	public int getMsg_no() {
		return msg_no;
	}


	public void setMsg_no(int msg_no) {
		this.msg_no = msg_no;
	}


	public int getMsg_flag() {
		return msg_flag;
	}


	public void setMsg_flag(int msg_flag) {
		this.msg_flag = msg_flag;
	}


	public String getMsg_to_number() {
		return msg_to_number;
	}


	public void setMsg_to_number(String msg_to_number) {
		this.msg_to_number = msg_to_number;
	}


	public String getMsg_from_number() {
		return msg_from_number;
	}


	public void setMsg_from_number(String msg_from_number) {
		this.msg_from_number = msg_from_number;
	}


	public String getMsg_content() {
		return msg_content;
	}


	public void setMsg_content(String msg_content) {
		this.msg_content = msg_content;
	}


	public String getMsg_date() {
		return msg_date;
	}


	public void setMsg_date(String msg_date) {
		this.msg_date = msg_date;
	}
	
	
	

	
	
	

}
