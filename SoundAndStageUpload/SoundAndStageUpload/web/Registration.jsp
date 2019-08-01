<%-- 
    Document   : Registration
    Created on : 2 May, 2016, 1:40:27 PM
    Author     : Vasudev
--%>

<%@page import="java.sql.ResultSetMetaData"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="javax.persistence.EntityManagerFactory"%>
<%@page import="javax.persistence.PersistenceUnit"%>
<%@page import="javax.naming.InitialContext"%>
<%@page import="java.util.List"%>
<%@page import="javax.annotation.Resource"%>
<%@page import="javax.persistence.EntityManager"%>
<%@page import="javax.persistence.PersistenceContext"%>
<%@page import="databasepack.Profiles"%>
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
            String values[] = request.getParameterValues("registration");
            
            String errormsg = "";
            
            if( values != null )
            {
                for( String x: values )
                {
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
                    if( !values[2].equals(values[3]) )
                    {
                        errormsg = "Passwords must match";
                        
                        %>
                        <c:set var="error_msg" value="<%=errormsg%>"/>
                        <%
                    }
                }
                
                if( errormsg.equals("") )
                {
                    try
                    {   
                        Long.parseLong(values[4]);
                        
                        if( values[4].length() < 10 )
                        {
                            errormsg = "Phone number length Invalid";
                            
                            %>
                            <c:set var="error_msg" value="<%=errormsg%>"/>
                            <%
                        }
                        else
                        {
                            errormsg = "All good";
                        } 
                    }
                    catch(Exception e)
                    {
                        errormsg = "Invalid Phone Number.";
                        
                        %>
                        <c:set var="error_msg" value="<%=errormsg%>"/>
                        <%
                    }
                    
                    
                }
                
                if( errormsg.equals("All good") )
                {
                    Context ctx = new InitialContext();
                    
                    DataSource ds = (DataSource)ctx.lookup("jdbc/SnS");
                    
                    Connection conn = ds.getConnection();
                    
                    if( conn != null )
                    {
                        String query = "Select * from Profiles where username=?";
                        
                        PreparedStatement psmt = conn.prepareStatement(query);
                        
                        psmt.setString(1, values[0]);
                        
                        ResultSet rs = psmt.executeQuery();
                        
                        //ResultSetMetaData rsmd = rs.getMetaData();
                        
                        int count = 0;
                        
                        while( rs.next() ) count++;
                        
                        if( count != 0 )
                        {
                            errormsg = "User Already Exists";
                        
                            %>
                            <c:set var="error_msg" value="<%=errormsg%>"/>
                            <%
                        }
                        else
                        {
                            query = "insert into Profiles "
                                    + "(username,"
                                    + "password ,"
                                    + "email ,"
                                    + "phone_no ,"
                                    + "address ,"
                                    + "role_name,"
                                    + "login_status)"
                                    + " values "
                                    + "(?,?,?,?,?,'Normal','Logged_Out')"
                                    + "";
                            
                            psmt = conn.prepareStatement(query);
                        
                            psmt.setString(1, values[0]);
                            psmt.setString(2, values[2]);
                            psmt.setString(3, values[1]);
                            psmt.setString(4, values[4]);
                            psmt.setString(5, values[5]);
                        
                            psmt.executeUpdate();
                            
                            errormsg = "User Updated Successfully";
                        
                            %>
                            <c:set var="error_msg" value="<%=errormsg%>"/>
                            <%
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
                
        <form method="post" action="Registration.jsp" style="
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
                background-image: url('./registration.jpg');
                background-repeat: no-repeat;
                background-size: cover;
                ">
                    
            <input type="text" name="registration" autofocus="true" placeholder="Enter Username..." style="
                position: absolute;
                top: 85px;
                left: 145px;
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
                
                    
                    <input type="email" name="registration" placeholder="Enter Email ID..." style="
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
                    
                    <input type="password" name="registration" placeholder="Enter Password..." style="
                position: absolute;
                top: 185px;
                left: 195px;
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
                            " value="<%=values[2]%>"/>
                        <%
                    }
                    else
                    {
                        %>
                            "/>
                        <%
                    }
                %>
                    
                    <input type="password" name="registration" placeholder="Confirm Password..." style="
                position: absolute;
                top: 185px;
                right: 195px;
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
                            " value="<%=values[3]%>"/>
                        <%
                    }
                    else
                    {
                        %>
                            "/>
                        <%
                    }
                %>
                    
                    <input type="phone" name="registration" placeholder="Enter Phone No. ..." style="
                position: absolute;
                top: 290px;
                left: 245px;
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
                            " value="<%=values[4]%>"/>
                        <%
                    }
                    else
                    {
                        %>
                            "/>
                        <%
                    }
                %>
                    
                    <input type="text" name="registration" placeholder="Enter Address..." style="
                position: absolute;
                top: 290px;
                right: 245px;
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
                            " value="<%=values[5]%>"/>
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
                top: 410px;
                right: 495px;
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
