package ki.mo.ddi.adminModel;

public class Admin_WeekDTO {

	private String w_num;
	private String weekly;
	private String w_monday;
	private String w_tuesday;
	private String w_wednesday;
	private String w_thursday;
	private String w_friday;
	private String w_saturday;
	private String w_sunday;
	private String cadre_group;
	
	
	
	
	@Override
	public String toString() {
		return "Admin_WeekDTO [w_num=" + w_num + ", weekly=" + weekly + ", w_monday=" + w_monday + ", w_tuesday="
				+ w_tuesday + ", w_wednesday=" + w_wednesday + ", w_thursday=" + w_thursday + ", w_friday=" + w_friday
				+ ", w_saturday=" + w_saturday + ", w_sunday=" + w_sunday + ", cadre_group=" + cadre_group + "]";
	}
	public String getCadre_group() {
		return cadre_group;
	}
	public void setCadre_group(String cadre_group) {
		this.cadre_group = cadre_group;
	}
	public String getW_num() {
		return w_num;
	}
	public void setW_num(String w_num) {
		this.w_num = w_num;
	}
	public String getWeekly() {
		return weekly;
	}
	public void setWeekly(String weekly) {
		this.weekly = weekly;
	}
	public String getW_monday() {
		return w_monday;
	}
	public void setW_monday(String w_monday) {
		this.w_monday = w_monday;
	}
	public String getW_tuesday() {
		return w_tuesday;
	}
	public void setW_tuesday(String w_tuesday) {
		this.w_tuesday = w_tuesday;
	}
	public String getW_wednesday() {
		return w_wednesday;
	}
	public void setW_wednesday(String w_wednesday) {
		this.w_wednesday = w_wednesday;
	}
	public String getW_thursday() {
		return w_thursday;
	}
	public void setW_thursday(String w_thursday) {
		this.w_thursday = w_thursday;
	}
	public String getW_friday() {
		return w_friday;
	}
	public void setW_friday(String w_friday) {
		this.w_friday = w_friday;
	}
	public String getW_saturday() {
		return w_saturday;
	}
	public void setW_saturday(String w_saturday) {
		this.w_saturday = w_saturday;
	}
	public String getW_sunday() {
		return w_sunday;
	}
	public void setW_sunday(String w_sunday) {
		this.w_sunday = w_sunday;
	}
	
}
