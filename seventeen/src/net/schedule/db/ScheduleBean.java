package net.schedule.db;

public class ScheduleBean {
	int sc_num;

	public int getSc_num() {
		return sc_num;
	}

	public void setSc_num(int sc_num) {
		this.sc_num = sc_num;
	}

	String sc_content;
	int sc_year;
	int sc_month;
	int sc_day;

	public String getSc_content() {
		return sc_content;
	}

	public void setSc_content(String sc_content) {
		this.sc_content = sc_content;
	}

	public int getSc_year() {
		return sc_year;
	}

	public void setSc_year(int sc_year) {
		this.sc_year = sc_year;
	}

	public int getSc_month() {
		return sc_month;
	}

	public void setSc_month(int sc_month) {
		this.sc_month = sc_month;
	}

	public int getSc_day() {
		return sc_day;
	}

	public void setSc_day(int sc_date) {
		this.sc_day = sc_date;
	}
}