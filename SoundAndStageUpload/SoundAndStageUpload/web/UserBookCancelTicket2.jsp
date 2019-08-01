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
        <title>User Book Tickets</title>
    </head>
    <body>
        
            <c:set var="error_msg" value=""/>
            
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
                    left: 260px;
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
                    " href="UserMovies.jsp">Movies</a>
                    
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 430px;
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
                    " href="UserShows.jsp">Shows</a>
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 600px;
                    width: 200px;
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
                    " href="UserBookCancelTicket.jsp">Book Ticket</a>
                    
                    <a style="
                    position: absolute;
                    top: 35px;
                    left: 870px;
                    width: 200px;
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
                    " href="UserViewCancelTicket.jsp">View Or Cancel Ticket</a>
                    
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
                        <div style=" position: absolute; top: 5%; left: 10px; width: 98%; bottom: 5%; border: 1px solid #FFFFFF;; overflow-y: auto;">
                            
                            <%
                    try
                    {
                        String values[] = request.getParameterValues("booking");
                        
                        if( values != null )
                        {
                            for(String x:values)
                            {
                                System.out.println(x);
                            }
                            
                            if( values[6].equals("0") )
                            {
                                %>
                                    <h1> Seats Cannot be 0 </h1>
                                <%
                            }
                            else
                            {
                                
                                ///
                                
                                String snacks = "";
                                
                                Context ctx = new InitialContext();
                    
                                DataSource ds = (DataSource)ctx.lookup("jdbc/SnS");

                                Connection conn = ds.getConnection();

                                int total = 0;

                                if( conn != null )
                                {
                                    if( values[7] != null )
                                    {
                                        for( int i = 7 ; i < values.length ; i += 2 )
                                        {
                                            snacks += values[i] + "," + values[i+1] + "," ;
                                            
                                            String query = "select * from snacks where snack_name = ? ";

                                            PreparedStatement pstmt = conn.prepareStatement(query);

                                            pstmt.setString(1, values[i]);

                                            ResultSet rs = pstmt.executeQuery();

                                            while( rs.next() )
                                            {
                                                total += Integer.parseInt(rs.getString(3)) * Integer.parseInt( values[i+1] ) ;
                                            }
                                        }
                                        
                                        System.out.println("Snacks:" + snacks);
                                    }
                                    conn.close();
                                }

                                ctx = new InitialContext();

                                ds = (DataSource)ctx.lookup("jdbc/SnS");

                                conn = ds.getConnection();

                                if( conn != null )
                                {
                                    total += Integer.parseInt(values[4]) * Integer.parseInt( values[6] ) ;

                                    String query = "insert into online_tickets (movie_name,start_time,end_time,location,price,selected_seats,selected_seats_count,snacks,total_price) values (?,?,?,?,?,?,?,?,?) ";

                                    PreparedStatement pstmt = conn.prepareStatement(query);

                                    pstmt.setString(1,values[0]);
                                    pstmt.setString(2,values[1]);
                                    pstmt.setString(3,values[2]);
                                    pstmt.setString(4,values[3]);
                                    pstmt.setString(5,values[4]);
                                    pstmt.setString(6,values[5]);
                                    pstmt.setString(7,values[6]);
                                    pstmt.setString(8,snacks);
                                    pstmt.setString(9,""+ total );

                                    pstmt.executeUpdate();

                                    conn.close();
                                }
                                
                                ///
                                
                                %>
                                    <h1> Booking Successful </h1>
                                <%
                            }
                            
                            
                                    
                        }
                                    
                                    %>
                                    <%
                                
                            ////
                        
                    }
                    catch(Exception e)
                    {
                        
                    }
                                
                            %>
                            
                        </div>
                        
                    </div>
                        
                    </div>
                    
                    </div>
            
    </body>
</html>
