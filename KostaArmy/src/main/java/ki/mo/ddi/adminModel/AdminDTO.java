package ki.mo.ddi.adminModel;

public class AdminDTO {
	private String dailyID;
	private String dailyContent;
	private String dailyMemo;
	private String dailyTime;
	private String cadre_group;
	
	
	
	public String getCadre_group() {
		return cadre_group;
	}
	public void setCadre_group(String cadre_group) {
		this.cadre_group = cadre_group;
	}
	public String getDailyID() {
		return dailyID;
	}
	public void setDailyID(String dailyID) {
		this.dailyID = dailyID;
	}
	public String getDailyContent() {
		return dailyContent;
	}
	public void setDailyContent(String dailyContent) {
		this.dailyContent = dailyContent;
	}
	public String getDailyMemo() {
		return dailyMemo;
	}
	public void setDailyMemo(String dailyMemo) {
		this.dailyMemo = dailyMemo;
	}
	public String getDailyTime() {
		return dailyTime;
	}
	public void setDailyTime(String dailyTime) {
		this.dailyTime = dailyTime;
	}
	
}
