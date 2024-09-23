package kr.or.ddit.comm.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.MultipartConfig;

public class MyCharacterEncodingFilter implements Filter {
	
	private String encoding; // 인코딩 정보 
	
	@Override
	public void destroy() {
		
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain)
			throws IOException, ServletException {
		
		req.setCharacterEncoding(this.encoding);
		resp.setCharacterEncoding(this.encoding);
		
		chain.doFilter(req, resp);
	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		if(config.getInitParameter("encoding") == null) {
			this.encoding = "UTF-8";
		}else {
			this.encoding = config.getInitParameter("encoding");
		}
		
		System.out.println("설정된 인코딩 정보 : " + this.encoding);
	}
	
}
