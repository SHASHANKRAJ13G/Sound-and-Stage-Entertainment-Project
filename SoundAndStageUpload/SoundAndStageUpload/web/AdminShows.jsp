<%-- 
    Document   : Home
    Created on : 4 May, 2016, 2:48:06 PM
    Author     : Vasudev
--%>
<%@page import="java.sql.ResultSetMetaData"%>
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
        <title>Admin Shows</title>
    </head>
    <body>
        
            <c:set var="error_msg" value=""/>
                   
            <%
                
            String values[] = request.getParameterValues("shows");
            
            String errormsg = "";
            
            String delete = null;
            
            try
            {
                
            
            
            if( values != null )
            {
                System.out.println( values[6] );
                
                delete = values[6];
                
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
                    Context ctx = new InitialContext();
                    
                    DataSource ds = (DataSource)ctx.lookup("jdbc/SnS");
                            
                    Connection conn = ds.getConnection();
                    
                    if( conn != null )
                    {
                        String query;
                        
                        PreparedStatement pstmt;
                        
                        if( delete.equals("false") )
                        {
                            /////////////
                            query = "select * from shows where show_code=?";
                                    
                            pstmt = conn.prepareStatement(query);

                            pstmt.setString(1, values[0]);

                            ResultSet rs = pstmt.executeQuery();

                            int count = 0;

                            while( rs.next() ) count++;

                            if( count == 0 )
                            {
                                query = "insert into shows (show_code,movie_name,start_time,end_time,hall_code,price) values (?,?,?,?,?,?)";

                                pstmt = conn.prepareStatement(query);

                                pstmt.setString(1, values[0]);
                                pstmt.setString(2, values[1]);
                                pstmt.setString(3, values[2]);
                                pstmt.setString(4, values[3]);
                                pstmt.setString(5, values[4]);
                                pstmt.setString(6, values[5]);

                                pstmt.executeUpdate();

                                errormsg = "Added Successfully.";

                                %>
                                <c:set var="error_msg" value="<%=errormsg%>"/>
                                <%
                            }
                            else
                            {
                                query = "update shows set show_code = ? , movie_name = ? , start_time = ? , end_time = ? , hall_code = ? , price = ? where show_code=?";

                                pstmt = conn.prepareStatement(query);

                                pstmt.setString(1, values[0]);
                                pstmt.setString(2, values[1]);
                                pstmt.setString(3, values[2]);
                                pstmt.setString(4, values[3]);
                                pstmt.setString(5, values[4]);
                                pstmt.setString(6, values[5]);
                                pstmt.setString(7, values[0]);

                                pstmt.executeUpdate();

                                errormsg = "Updated Successfully.";

                                %>
                                <c:set var="error_msg" value="<%=errormsg%>"/>
                                <%
                                
                                
                            }
                            /////////////
                        }
                        else
                        {
                            query = "delete from shows where show_code = ?";

                            pstmt = conn.prepareStatement(query);

                            pstmt.setString(1, values[0]);
                            
                            pstmt.executeUpdate();

                            errormsg = "Deleted Successfully.";

                            %>
                            <c:set var="error_msg" value="<%=errormsg%>"/>
                            <%
                            
                            values=null;
                        }
                        
                        conn.close();
                    }
                }
            }
            
            }
            catch(Exception e)
            {
                e.printStackTrace();
                
                errormsg = "Error on Page";

                %>
                <c:set var="error_msg" value="<%=errormsg%>"/>
                <%
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
                    " href="index.html">Log Out</a>
                    
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
                    
                    <div style="
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
                ">
                  
                        <hr style="position: absolute; top: 105px; width: 100%;"/>
                
                <a style="
                    position: absolute;
                    top: 35px;
                    left: 120px;
                    width: 100px;
                    height: 50px;
                    line-height: 50px;

                    background-color: rgb(120,220,120);
                    color: #333333;
                    text-align: center;
                    vertical-align: middle;

                    border: 2px solid #FFFFFF;
                    box-shadow: 5px 25px 40px #000000;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                    padding-left: 20px;
                    padding-right: 20px;
                    
                    z-index: 2;
                    " href="AdminSites.jsp">Sites</a>
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 1020px;
                    width: 120px;
                    height: 50px;
                    line-height: 50px;

                    background-color: rgb(120,220,120);
                    color: #333333;
                    text-align: center;
                    vertical-align: middle;

                    border: 2px solid #FFFFFF;
                    box-shadow: 5px 25px 40px #000000;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                    padding-left: 20px;
                    padding-right: 20px;
                    
                    z-index: 2;
                    " href="AdminMovieTheatres.jsp">Movie Theaters</a>
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 300px;
                    width: 100px;
                    height: 50px;
                    line-height: 50px;

                    background-color: rgb(120,220,120);
                    color: #333333;
                    text-align: center;
                    vertical-align: middle;

                    border: 2px solid #FFFFFF;
                    box-shadow: 5px 25px 40px #000000;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                    padding-left: 20px;
                    padding-right: 20px;
                    
                    z-index: 2;
                    " href="AdminPlanLayout.jsp">Plan Layout</a>
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 480px;
                    height: 50px;
                    width: 100px;
                    line-height: 50px;

                    background-color: rgb(120,220,120);
                    color: #333333;
                    text-align: center;
                    vertical-align: middle;

                    border: 2px solid #FFFFFF;
                    box-shadow: 5px 25px 40px #000000;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                    padding-left: 20px;
                    padding-right: 20px;
                    
                    z-index: 2;
                    " href="AdminMovies.jsp">Movies</a>
                    
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 660px;
                    height: 50px;
                    width: 100px;
                    line-height: 50px;

                    background-color: rgb(120,220,120);
                    color: #333333;
                    text-align: center;
                    vertical-align: middle;

                    border: 2px solid #FFFFFF;
                    box-shadow: 5px 25px 40px #000000;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                    padding-left: 20px;
                    padding-right: 20px;
                    
                    z-index: 2;
                    " href="AdminShows.jsp">Shows</a>
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 840px;
                    width: 100px;
                    height: 50px;
                    line-height: 50px;

                    background-color: rgb(120,220,120);
                    color: #333333;
                    text-align: center;
                    vertical-align: middle;

                    border: 2px solid #FFFFFF;
                    box-shadow: 5px 25px 40px #000000;
                    font-style: italic;
                    font-weight: bold;
                    font-family: 'Calibri';
                    padding-left: 20px;
                    padding-right: 20px;
                    
                    z-index: 2;
                    " href="AdminSnacks.jsp">Snacks</a>
                    
                    <div style="
                position: absolute;
                top: 125px;
                left: 5px;
                width: 98.9%;
                height: 60%;
                background-color: rgb(250,258,255);
                
                text-align: center;
                
                color: #FFFFFF;
                vertical-align: middle;
                padding-top: 90px;
                border: 2px solid #FFC706;
                box-shadow: 5px 25px 40px #000000;
                background-image: url('./images/now_showing.jpg');
                background-repeat: repeat;
                background-size: auto;
                font-family: 'Calibri';
                ">
                        <div >
                        
                        <form id="myForm" action="AdminShows.jsp" method="post"style="
                position: absolute;
                top: 0px;
                left: 0px;
                width: 100%;
                height: 35%;
                box-shadow: 5px 25px 40px #000000;
                background-image: url('./images/now_showing.jpg');
                background-repeat: repeat;
                background-size: auto;
                border-bottom : 2px solid #FFFFFF;
                font-family: 'Calibri';
                overflow-y: auto;
                ">
                            
                <input type="text" name="shows" autofocus="true" placeholder="Enter Show Code..." style="
                position: absolute;
                top: 45px;
                left: 165px;
                width: 25%;
                height: 60px;
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
                            
                            <select name="shows" autofocus="true" placeholder="Enter Movie Name..." style="
                position: absolute;
                top: 45px;
                left: 765px;
                width: 25%;
                height: 60px;
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
                            " value="<%=values[1]%>">
                        <%
                    }
                    else
                    {
                        %>
                            ">
                        <%
                    }
                    
                    Context ctx = new InitialContext();
                    
                    DataSource ds = (DataSource)ctx.lookup("jdbc/SnS");
                            
                    Connection conn = ds.getConnection();
                    
                    if( conn != null )
                    {
                        String query = "select movie_name from movies";
                        
                        PreparedStatement pstmt = conn.prepareStatement(query);
                        
                        ResultSet rs = pstmt.executeQuery();
                        
                        while( rs.next() )
                        {
                            %>
                            <option><%=rs.getString(1)%></option>
                            <%
                        }
                        
                        conn.close();
                    }
                %>
                </select>
                            
                <input type="text" name="shows" autofocus="true" placeholder="Enter Start Time..." style="
                position: absolute;
                top: 145px;
                left: 165px;
                width: 25%;
                height: 60px;
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
                
                <input type="text" name="shows" autofocus="true" placeholder="Enter End Time..." style="
                position: absolute;
                top: 145px;
                left: 765px;
                width: 25%;
                height: 60px;
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
                      
                <input type="text" name="shows" autofocus="true" placeholder="Enter Hall Code..." style="
                position: absolute;
                top: 245px;
                left: 165px;
                width: 25%;
                height: 60px;
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
                
                <input type="text" name="shows" autofocus="true" placeholder="Enter Price..." style="
                position: absolute;
                top: 245px;
                left: 765px;
                width: 25%;
                height: 60px;
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
                
                <input type="hidden" name="shows" id="delete" value="false"/>
                
                            <input type="submit" value="Go" style="
                position: absolute;
                top: 48px;
                right: 578px;
                width: 15%;
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
                            
                            <input type="submit" value="X" onclick=" document.getElementById('delete').value='true'; " style="
                position: absolute;
                top: 48px;
                right: 100px;
                width: 5%;
                height: 60px;
                background-color: rgb(228,44,55);
                color: #FFFFFF;
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
                        </div>
                        
                <!--<hr style="position: absolute; top: 135px; width: 100%;"/>-->
                        
                        <div style=" position: absolute; top: 40%; left: 10px; width: 98%; height: 55%; border: 1px solid #FFFFFF;; overflow-y: auto;">
                            
                            <%
                    try
                    {
                        ctx = new InitialContext();
                    
                        ds = (DataSource)ctx.lookup("jdbc/SnS");
                            
                        conn = ds.getConnection();
                    
                                if( conn != null )
                                {
                                    String query = "Select * from shows";
                                    
                                    PreparedStatement pstmt = conn.prepareStatement(query);

                                    ResultSet rs = pstmt.executeQuery();
                                    
                                    %>
                                    <center>
                                    <table style="border: 2px solid #FFC706; font-weight: bold; font-size: 20px; background: #FFFFFF; color: #000000; position: absolute; top: 10%; left: 5%; width: 90%; text-align: center; border-spacing: 0; padding: 50px;">
                                        <tr>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;" >Show Code</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;" >Movie Name</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">Start Time</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">End Time</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">Hall Code</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">Price</td>
                                        </tr>
                                    <%
                                    
                                    int count = 0;
                                    
                                    while( rs.next() )
                                    {
                                        count++;
                                        %>
                                            <tr onclick="
                                                
                                                oFormObject = document.forms['myForm'];
                                                
                                                oformElement = oFormObject.elements[0];
                                                oformElement.value = '<%=rs.getString(2)%>';
                                                
                                                oformElement = oFormObject.elements[1];
                                                oformElement.value = '<%=rs.getString(3)%>';
                                                
                                                oformElement = oFormObject.elements[2];
                                                oformElement.value = '<%=rs.getString(4)%>';
                                                
                                                oformElement = oFormObject.elements[3];
                                                oformElement.value = '<%=rs.getString(5)%>';
                                                
                                                oformElement = oFormObject.elements[4];
                                                oformElement.value = '<%=rs.getString(6)%>';
                                                
                                                oformElement = oFormObject.elements[5];
                                                oformElement.value = '<%=rs.getString(7)%>';
                                                
                                                //document.getElementById('myForm').submit();
                                                                                            " >
                                                <td style="border: 2px solid #FFC706;"><%=rs.getString(2)%></td>
                                                <td style="border: 2px solid #FFC706;"><%=rs.getString(3)%></td>
                                                <td style="border: 2px solid #FFC706;"><%=rs.getString(4)%></td>
                                                <td style="border: 2px solid #FFC706;"><%=rs.getString(5)%></td>
                                                <td style="border: 2px solid #FFC706;"><%=rs.getString(6)%></td>
                                                <td style="border: 2px solid #FFC706;"><%=rs.getString(7)%></td>
                                            </tr>
                                        <%
                                    }
                                    
                                    if( count == 0 )
                                    {
                                        %>
                                            <tr>
                                                <td style="border: 2px solid #FFC706;" colspan="6">No Data As Of Now</td>                                                
                                            </tr>
                                        <%
                                    }
                                    
                                    %>
                                    </table>
                                    </center>
                                    <%
                                    
                                    conn.close();
                                }
                    }
                    catch(Exception e)
                    {
                        
                    }
                                
                            %>
                            
                        </div>
                        
                    </div>
                    
                    </div>
    </body>
</html>
