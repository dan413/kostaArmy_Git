package ki.mo.ddi.supplyModel;

import java.util.Date;

public class Supply_TableDTO {
	private String supply_num;
	private String supply_name;
	private int supply_order;
	private int supply_set;
	private int supply_total;
	private int supply_flag;
	private String supply_comments;
	
	private String cadre_group;
	
	public String getCadre_group() {
		return cadre_group;
	}
	public void setCadre_group(String cadre_group) {
		this.cadre_group = cadre_group;
	}
	private String tableName;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;  
	}
	public String getSupply_comments() {
		return supply_comments;
	}
	public void setSupply_comments(String supply_comments) {
		this.supply_comments = supply_comments;
	}
	
	public String getSupply_num() {
		return supply_num;
	}
	public void setSupply_num(String supply_num) {
		this.supply_num = supply_num;
	}
	public String getSupply_name() {
		return supply_name;
	}
	public void setSupply_name(String supply_name) {
		this.supply_name = supply_name;
	}
	public int getSupply_order() {
		return supply_order;
	}
	public void setSupply_order(int supply_order) {
		this.supply_order = supply_order;
	}
	public int getSupply_set() {
		return supply_set;
	}
	public void setSupply_set(int supply_set) {
		this.supply_set = supply_set;
	}
	public int getSupply_total() {
		return supply_total;
	}
	public void setSupply_total(int supply_total) {
		this.supply_total = supply_total;
	}
	public int getSupply_flag() {
		return supply_flag;
	}
	public void setSupply_flag(int supply_flag) {
		this.supply_flag = supply_flag;
	}
}
