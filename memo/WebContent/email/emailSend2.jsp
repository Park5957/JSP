<%@ page import="java.io.*" %>
<%@ page import="java.util.*"%>
<%@ page import="smtp.NaverSMTP"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%
    //넘겨받은 변수 처리
    Map<String, String> emailInfo = new HashMap<String, String>();
    emailInfo.put("from",request.getParameter("from"));//보내는 사람
    emailInfo.put("to",request.getParameter("to"));//받는 사람
    emailInfo.put("subject",request.getParameter("subject"));//제목
    //내용의 형식은 html text 형태에 따라 다르게 설정
    String content = request.getParameter("content");//내용
    String format = request.getParameter("format");//형식
    
    if(format.equals("text")){
    	emailInfo.put("content",content);
    	emailInfo.put("format","text/plain;charset=UTF-8");
    	
    }else if(format.equals("html")){
    	content = content.replace("\r\n", "<br>"); //줄바꿈 처리
    	String htmlContent = "";
    	try{
    		String templatePath = application.getRealPath("/email.emailForm.html");
    		BufferedReader br = new BufferedReader(new FileReader(templatePath));

            
            String oneLine;
            while ((oneLine = br.readLine()) != null) {
                htmlContent += oneLine + "\n";
            }
            br.close();
        }
        catch (Exception e) {
            e.printStackTrace();
        }
    	//템플릿내용 교체
    	htmlContent = htmlContent.replace("__CONTENT__", content);
    	emailInfo.put("content",htmlContent);
    	emailInfo.put("format","text/plain;charset=UTF-8");
    	}
    
    try {
        NaverSMTP smtpServer = new NaverSMTP();  // 메일 전송 클래스 생성
        smtpServer.emailSending(emailInfo);      // 전송
        out.print("이메일 전송 성공");
    }
    catch (Exception e) {
        out.print("이메일 전송 실패");
        e.printStackTrace();
    }
    
    
    
    
    
    
    %>