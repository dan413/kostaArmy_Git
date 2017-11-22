package ki.mo.ddi.supplyModel;

import java.sql.Timestamp;

public class Supply_ReceiptDTO {
	private Timestamp supply_r_date;
	private String supply_r_num;
	private String supply_r_name;
	private int supply_r_order;
	private int supply_r_total;
	private int supply_r_consumeCount;
	private String supply_group;
	private String supply_r_comments;
	private int supply_r_flag;
	
	private String tableName;
	public String getTableName() {
		return tableName;
	}
	public void setTableName(String tableName) {
		this.tableName = tableName;
	}
	public String getSupply_group() {
		return supply_group;
	}
	public void setSupply_group(String supply_group) {
		this.supply_group = supply_group;
	}
	public int getSupply_r_consumeCount() {
		return supply_r_consumeCount;
	}
	public void setSupply_r_consumeCount(int supply_r_consumeCount) {
		this.supply_r_consumeCount = supply_r_consumeCount;
	}
	public String getSupply_r_comments() {
		return supply_r_comments;
	}
	public void setSupply_r_comments(String supply_r_comments) {
		this.supply_r_comments = supply_r_comments;
	}
	public int getSupply_r_flag() {
		return supply_r_flag;
	}
	public void setSupply_r_flag(int supply_r_flag) {
		this.supply_r_flag = supply_r_flag;
	}
	public Timestamp getSupply_r_date() {
		return supply_r_date;
	}
	public void setSupply_r_date(Timestamp supply_r_date) {
		this.supply_r_date = supply_r_date;
	}
	public String getSupply_r_num() {
		return supply_r_num;
	}
	public void setSupply_r_num(String supply_r_num) {
		this.supply_r_num = supply_r_num;
	}
	public String getSupply_r_name() {
		return supply_r_name;
	}
	public void setSupply_r_name(String supply_r_name) {
		this.supply_r_name = supply_r_name;
	}
	public int getSupply_r_order() {
		return supply_r_order;
	}
	public void setSupply_r_order(int supply_r_order) {
		this.supply_r_order = supply_r_order;
	}
	public int getSupply_r_total() {
		return supply_r_total;
	}
	public void setSupply_r_total(int supply_r_total) {
		this.supply_r_total = supply_r_total;
	}
	
	
}
