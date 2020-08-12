package vn.t3h.components;

import java.util.ArrayList;
import java.util.List;

public class SingletonData {

	private static SingletonData intance = null;

	public static SingletonData getIntance() {
		return intance != null ? intance : new SingletonData();
	}
	
	private List<String> datas = new ArrayList<String>();
	
	public void addString(String str) {
		datas.add(str);
	}
	
	public List<String> getDatas() {
		return datas;
	}
	
	public int checkSizeData () {
		return datas.size();
	}
}
