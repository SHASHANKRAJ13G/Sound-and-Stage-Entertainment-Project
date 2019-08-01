<%-- 
    Document   : Login
    Created on : 3 May, 2016, 12:01:39 PM
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
        
        <c:set var="error_msg" value=""/>
        
        <%
            String values[] = request.getParameterValues("login");
            
            String errormsg = "";
            
            if( values != null )
            {
                for( String x : values )
                {
                    System.out.println(x);
                    
                    if( x.equals("") )
                    {
                        errormsg = "Empty Value(s) not allowed.";
                        
                        %>
                        <c:set var="error_msg" value="<%=errormsg%>"/>
                        <%
                        
                        break;
                    }
                }
                
                if( errormsg.equals("") )
                {
                    Context ctx = new InitialContext();
                    
                    DataSource ds = (DataSource)ctx.lookup("jdbc/SnS");
                    
                    Connection conn = ds.getConnection();
                    
                    if( conn != null )
                    {
                        System.out.println("Connected");
                        
                        String query = "Select role_name from Profiles where username=? and password=?";
                        
                        PreparedStatement psmt = conn.prepareStatement(query);
                        
                        psmt.setString(1, values[0]);
                        psmt.setString(2, values[1]);
                        
                        ResultSet rs = psmt.executeQuery();
                        
                        //ResultSetMetaData rsmd = rs.getMetaData();
                        
                        int count = 0;

                        String role = "";
                        
                        while( rs.next() )
                        {
                            role = rs.getString(1);
                            count++;
                        }
                        
                        System.out.println(count);
                        
                        if( count == 0 )
                        {
                            errormsg = "Invalid Credential(s).";
                        
                            %>
                            <c:set var="error_msg" value="<%=errormsg%>"/>
                            <%
                        }
                        else
                        {
                            try
                            {
                                query = "update PROFILES SET Login_Status = 'Logged_In' where username = ?";
                        
                                psmt = conn.prepareStatement(query);

                                psmt.setString(1, values[0]);

                                psmt.executeUpdate();
                                
                                request.setAttribute("login_name",values[0]);
                                
                                if( role.equals("Admin") )
                                {
                                    RequestDispatcher rd = request.getRequestDispatcher("AdminHome.jsp");
                                    rd.forward(request, response);
                                }
                                else
                                {
                                    RequestDispatcher rd = request.getRequestDispatcher("UserHome.jsp");
                                    rd.forward(request, response);
                                }

                            }
                            catch(Exception e)
                            {
                                errormsg = "Error Logging In";
                        
                                %>
                                <c:set var="error_msg" value="<%=errormsg%>"/>
                                <%
                            }
                        }
                        
                        conn.close();
                    }
                }
                    
            }
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
                " href="index.html">Home</a>
        
                <div style="
                position: absolute;
                top: 15px;
                left: 20px;
                height: 50px;
                width: 250px;
                line-height: 50px;
                
                background: none;
                color: #FFFFFF;
                text-align: center;
                vertical-align: middle;
                
                border: 0px solid #FFC706;
                box-shadow: 0px 5px 20px #000000;
                font-style: italic;
                font-weight: bold;
                font-family: 'Calibri';
                padding-left: 20px;
                padding-right: 20px;
                ">${error_msg}</div>
                
                <form method="post" action="Login.jsp" style="
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
                background-image: url('./login.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                ">
                    
            <input type="text" name="login" autofocus="true" placeholder="Enter Username..." style="
                position: absolute;
                top: 85px;
                right: 145px;
                width: 25%;
                height: 10%;
                background-color: rgb(250,258,255);
                color: #000000;
                vertical-align: middle;
                line-height: 60px;
                border: 2px solid #FFC706;
                box-shadow: 5px 25px 40px #000000;
                
                padding-left: 10px;
                padding-right: 10px;
                
                font-family: 'Calibri';
                font-size: 20px;
                
                <%
                    if( values != null )
                    {
                        %>
                            " value="<%=values[0]%>"/>
                        <%
                    }
                    else
                    {
                        %>
                            "/>
                        <%
                    }
                %>
            
                    <input type="password" name="login" placeholder="Enter Password..." style="
                position: absolute;
                top: 185px;
                right: 145px;
                width: 25%;
                height: 10%;
                background-color: rgb(250,258,255);
                color: #000000;
                vertical-align: middle;
                line-height: 60px;
                border: 2px solid #FFC706;
                box-shadow: 5px 25px 40px #000000;
                
                padding-left: 10px;
                padding-right: 10px;
                
                font-family: 'Calibri';
                font-size: 20px;
                
                <%
                    if( values != null )
                    {
                        %>
                            " value="<%=values[1]%>"/>
                        <%
                    }
                    else
                    {
                        %>
                            "/>
                        <%
                    }
                %>
                    
                    <input type="submit" value="Go" style="
                position: absolute;
                top: 310px;
                right: 155px;
                width: 25%;
                height: 60px;
                background-color: rgb(0,244,255);
                color: #000000;
                vertical-align: middle;
                line-height: 40px;
                border: 5px solid #FFFFFF;
                box-shadow: 5px 25px 40px #000000;
                
                padding-left: 10px;
                padding-right: 10px;
                
                font-family: 'Calibri';
                font-size: 20px;
                
                "/>
                    
                </form>
                
    </body>
</html>
