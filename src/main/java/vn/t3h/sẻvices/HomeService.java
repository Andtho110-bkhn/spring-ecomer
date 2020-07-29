package vn.t3h.sẻvices;

import org.springframework.stereotype.Service;

@Service
public class HomeService {
	private String fixStr = "Hello Spring Spring .!";
	
	public String hello() {
		return fixStr;
	}
}
