<%-- 
    Document   : Home
    Created on : 4 May, 2016, 2:48:06 PM
    Author     : Vasudev
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.naming.Context"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
        <%
            System.out.println("Welcome to Home");
            
            Context ctx = new InitialContext();
                    
            DataSource ds = (DataSource)ctx.lookup("jdbc/SnS");
                    
            Connection conn = ds.getConnection();
                    
            if( conn != null )
            {
                System.out.println("Connected");
                        
                String query = "Select Login_Status from Profiles where username=?";
                        
                PreparedStatement psmt = conn.prepareStatement(query);
                        
                psmt.setString(1, (String)request.getAttribute("login_name"));
                      
                System.out.println( (String)request.getAttribute("login_name") );
                
                ResultSet rs = psmt.executeQuery();
                     
                boolean flag = false;
                
                String role = "";
                
                while( rs.next() )
                {
                    if( rs.getString(1).equals("Logged_In") )
                    {
                        flag = true;
                        break;
                    }
                }
                        
                if( flag )
                {
                    %>
                    
                    <h1 style="
                    position: absolute;
                    top: -10px;
                    left: 0px;
                    right: 0px;
                    height: 60px;
                    background-color: rgb(128,0,0);
                    color: #FFFFFF;
                    text-align: center;
                    vertical-align: middle;
                    line-height: 60px;
                    border: 2px solid #FFC706;
                    box-shadow: 5px 25px 40px #555555;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                ">Sound and Stage Entertainment</h1>
            
                <a style="
                    position: absolute;
                    top: 15px;
                    right: 120px;
                    height: 50px;
                    line-height: 50px;

                    background-color: rgb(220,220,0);
                    color: #333333;
                    text-align: center;
                    vertical-align: middle;

                    border: 2px solid #FFC706;
                    box-shadow: 5px 25px 40px #000000;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                    padding-left: 20px;
                    padding-right: 20px;
                    " href="index.html">Log Out</a>
                    
                    <iframe style="
                position: absolute;
                top: 85px;
                left: 5px;
                width: 98.9%;
                height: 85%;
                background-color: rgb(250,258,255);
                color: #FFFFFF;
                vertical-align: middle;
                line-height: 60px;
                border: 2px solid #FFC706;
                box-shadow: 5px 25px 40px #000000;
                background-image: url('./images/now_showing.jpg');
                background-repeat: repeat;
                background-size: auto;
                "/>
                    
                    <%
                    
                    if( role.equals("Normal") )
                    {
                        
                    }
                    else if( role.equals("Admin") )
                    {
                        
                    }
                }
                else
                {
                    %>
                    <h1>Invalid Login</h1>
                    <%
                }
                
                conn.close();
            }
        %>
        
        
    </body>
</html>
