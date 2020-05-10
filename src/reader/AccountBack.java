package reader;
import reader.SendMail;

import java.sql.SQLException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Scanner;

public class AccountBack {
	private static String JDBC_DRIVER = "com.mysql.jdbc.Driver";
	private static String DB_URL = "jdbc:mysql://localhost:3306/spm_library_system?serverTimezone=GMT%2B8&useSSL=false";
	private static String USER = "root";
	private static String PASS = "1234";
    private  int RanNum;               
    private String Account;     
    private reader.SendMail sm=new SendMail();

    private int  RandomNum(){
        int RanNum=(int)((Math.random()+1)*1000);
        return RanNum;
    }
    public String getAccount() {
    	return Account;
    }
    public int getRanNum() {
    	return RanNum;
    }
    public void SetAccount(String account) {
    	this.Account=account;
    }
    public void SetRanNum(int ranNum) {
    	this.RanNum=ranNum;
    }
    private void  DeliveryMail(String account,int RanNum){    
     String email=sm.queryMail(account);
     String text="Your verification code:"+RanNum;
     String title="verification code";
     sm.sendMail(email,text,title);

    }
    private Boolean Check(int InputVc,int RanNum){   
        if(InputVc==RanNum){
            return true;
        }else {
            return false;
        }
    }
    private void SetPw(String account,String NewPw) {     
        try {
            Connection con1=conn.con();
            Statement s=null;
            s = con1.createStatement();
            String sql="update reader set re_password='"+NewPw+"' where re_account='"+account+"'";
            s.executeUpdate(sql);
            s.close();
            con1.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }
    public void  Main1(){            
        DeliveryMail(Account,RanNum);
    }
    public boolean Main2(int InputVc,String NewPw){   
        if(Check(InputVc,RanNum)){
            SetPw(Account,NewPw);
            return true;
        }else{
            return false;
        }
    }
    public boolean checkAccount(String account)
    {
    	RanNum=RandomNum();
    	Account=account;
    	try {
			Class.forName(JDBC_DRIVER);
			Connection con = DriverManager.getConnection(DB_URL, USER, PASS);
			Statement st1 = con.createStatement();
			ResultSet rs = st1.executeQuery("select * from reader where re_account='" + account + "'");
			if(rs.next()) return true;
			else return false;
		} 
    	catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	return false;
    }
}
class conn{
    static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    static final String DB_URL = "jdbc:mysql://localhost:3306/SPM_library_system";
    static final String USER = "root";
    static final String PASS = "1234";

    static Connection con() throws SQLException {
        Connection conn = null;
        try {
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return conn;
    }
}