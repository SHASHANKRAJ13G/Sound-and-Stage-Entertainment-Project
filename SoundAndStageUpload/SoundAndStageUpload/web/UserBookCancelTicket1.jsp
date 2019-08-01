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
                            ////
                            %>
                                    <center>
                                    <table style="border: 2px solid #FFC706; font-weight: bold; font-size: 20px; background: #FFFFFF; color: #000000; position: absolute; top: 10%; left: 5%; width: 90%; text-align: center; border-spacing: 0; padding: 50px; border-radius: 40px; box-shadow: 0px 0px 160px #000000;">
                                        <tr>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;" >Movie Name</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">Start Time</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">End Time</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">Theatre Name</td>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;">Price</td>
                                        </tr>
                                    
                                        <tr>
                                        <form action="UserBookCancelTicket2.jsp" method="post">
                                                <td style="border: 2px solid #FFC706;"><%=values[0]%></td>
                                                <input type="hidden" value="<%=values[0]%>" name="booking"/>
                                                <td style="border: 2px solid #FFC706;"><%=values[1]%></td>
                                                <input type="hidden" value="<%=values[1]%>" name="booking"/>
                                                <td style="border: 2px solid #FFC706;"><%=values[2]%></td>
                                                <input type="hidden" value="<%=values[2]%>" name="booking"/>
                                                <td style="border: 2px solid #FFC706;"><%=values[3]%></td>
                                                <input type="hidden" value="<%=values[3]%>" name="booking"/>
                                                <td style="border: 2px solid #FFC706;"><%=values[4]%></td>
                                                <input type="hidden" value="<%=values[4]%>" name="booking"/>
                                                
                                                <td style="border: 2px solid #FFC706;"><input type="submit" value="Go" style="
                                                    width: 75%;
                                                    height: 40px;
                                                    background-color: rgb(0,244,255);
                                                    color: #000000;
                                                    vertical-align: middle;
                                                    line-height: 30px;
                                                    border: 5px solid #FFFFFF;
                                                    box-shadow: 0px 15px 40px #000000;

                                                    font-family: 'Calibri';
                                                    font-size: 15px;

                                                    "/></td>
                                                
                                            </tr>
                                            <tr>
                                                <td style="border: 2px solid #FFC706; background: #CCCCFF;" colspan="5" >Book Seats</td>
                                            </tr>
                                            <input type="hidden" value="" name="booking" id="selected_seats"/>
                                            <input type="hidden" value="0" name="booking" id="selected_seats_count"/>
                                            <tr>
                                                <td style="border: 2px solid #FFC706;" colspan="5" >
                                                    
                                                    <%
                                                    int rows = 0;
                                                    int cols = 0;
                                    
                                                    String invalid_seats = "";
                                                    String snacks = "";
                                    
                                                    String selected_seats = "";
                                                    
                                                    if( values != null )
                                                    {
                                                        Context ctx = new InitialContext();
                    
                                                        DataSource ds = (DataSource)ctx.lookup("jdbc/SnS");

                                                        Connection conn = ds.getConnection();
                                                        
                                                        if( conn != null )
                                                        {
                                                            String query = "Select b.SNACKS,c.T_ROWS,c.T_COLS,c.INVALID_SEATS from shows a, halls b , layouts c where a.HALL_CODE = b.HALL_CODE and b.HALL_PLAN = c.PLAN_CODE and a.MOVIE_NAME = ? and b.SITE_NAME = ?";
                                    
                                                            PreparedStatement pstmt = conn.prepareStatement(query);

                                                            pstmt.setString(1,values[0]);
                                                            pstmt.setString(2,values[3]);
                                                            
                                                            ResultSet rs = pstmt.executeQuery();
                                                            
                                                            while( rs.next() )
                                                            {
                                                                snacks = rs.getString(1);
                                                            
                                                                rows = Integer.parseInt(rs.getString(2));
                                                                cols = Integer.parseInt(rs.getString(3));
                                                                
                                                                invalid_seats = rs.getString(4);
                                                            }
                                                            
                                                            query = "select Selected_seats from ONLINE_TICKETS where movie_name = ? and Location = ?";
                                    
                                                            pstmt = conn.prepareStatement(query);

                                                            pstmt.setString(1,values[0]);
                                                            pstmt.setString(2,values[3]);
                                                            
                                                            rs = pstmt.executeQuery();
                                                            
                                                            while( rs.next() )
                                                            {
                                                                selected_seats += rs.getString(1);
                                                            
                                                            }
                                                            
                                                            conn.close();
                                                        }
                                                        
                                                    %>
                                                    <center>
                                                    <table style="border: 2px solid #FFC706; font-weight: bold; font-size: 14px; background: #FFFFFF; color: #000000; width: 100%; text-align: center;  padding: 50px;">
                                                        <tr><td style="border: 2px solid #FFC706; font-weight: bold; font-size: 14px; background: rgb(128,0,0); color: #FFFFFF;" colspan="5">Screen This Way</td></tr>
                                                        <tr><td style="border: 0px solid #FFC706; font-weight: bold; font-size: 14px; color: #FFFFFF; height: 50px;" colspan="5">  </td></tr>
                                                    <%
                                            for(int i = 0 ; i < rows ; i++)
                                            {
                                                %><tr><%
                                                for(int j = 0 ; j < cols ; j++)
                                                {
                                                %><td id="R_<%=(i+1)%>_C_<%=(j+1)%>" style="border: 2px solid #FFC706; background: #CCCCFF; width:10px; height: 40px;" >R: <%=(i+1)%> <br> C: <%=(j+1)%> </td><%
                                                }
                                                %></tr><tr><td style="width:10px; height: 40px;"></td></tr><%
                                            }
                                            
                                            for( int i = 0 ; i < rows ; i++ )
                                            {
                                                for( int j = 0 ; j < cols ; j++ )
                                                {
                                                    CharSequence cs = ";["+(i+1)+","+(j+1)+"];";
                                                    if( invalid_seats.contains( cs ) )
                                                    {
                                                        %>
                                                            <script type="text/javascript">
                                                                document.getElementById('R_<%=(i+1)%>_C_<%=(j+1)%>').style.background = 'rgb(120, 120, 120)';
                                                            </script>
                                                        <%
                                                    }
                                                    else if( selected_seats.contains( cs ) )
                                                    {
                                                        %>
                                                            <script type="text/javascript">
                                                                document.getElementById('R_<%=(i+1)%>_C_<%=(j+1)%>').style.background = 'rgb(255, 0, 0)';
                                                            </script>
                                                        <%
                                                    }
                                                    else
                                                    {
                                                        
                                                        %>
                                                            <script type="text/javascript">
                                                                
                                                                
                                                                document.getElementById('R_<%=(i+1)%>_C_<%=(j+1)%>').addEventListener('click',function()
                                                                {
                                                                    //alert( document.getElementById('R_<%=(i+1)%>_C_<%=(j+1)%>').style.backgroundColor );
                                                                    if( document.getElementById('R_<%=(i+1)%>_C_<%=(j+1)%>').style.backgroundColor=='rgb(204, 204, 255)' )
                                                                    {
                                                                        document.getElementById('selected_seats').value += ';[<%=(i+1)%>,<%=(j+1)%>];';
                                                                        document.getElementById('selected_seats_count').value = parseInt(document.getElementById('selected_seats_count').value) + 1;
                                                                        document.getElementById('R_<%=(i+1)%>_C_<%=(j+1)%>').style.background='rgb(154, 255, 154)';
                                                                    }
                                                                    else
                                                                    {
                                                                        document.getElementById('selected_seats').value = document.getElementById('selected_seats').value.replace( ';[<%=(i+1)%>,<%=(j+1)%>];' , '' );
                                                                        document.getElementById('selected_seats_count').value = parseInt(document.getElementById('selected_seats_count').value) - 1;
                                                                        document.getElementById('R_<%=(i+1)%>_C_<%=(j+1)%>').style.background='rgb(204, 204, 255)';
                                                                    }
                                                                    
                                                                    //alert( document.getElementById('selected_seats').value );
                                                                });
                                                            </script>
                                                        <%
                                                        
                                                    }
                                                    
                                                    
                                                }
                                            }
                                        %>
                                        
                                        
                                    </table>
                                    </center>
                                    
                                        <tr>
                                            <td style="border: 2px solid #FFC706; background: #CCCCFF;" colspan="5" >Snack Selection</td>
                                        </tr>
                                        <tr>
                                            <td style="border: 2px solid #FFC706;" colspan="5" >
                                            
                                                <table style="border: 2px solid #FFC706; font-weight: bold; font-size: 20px; background: #FFFFFF; color: #000000; width: 100%; text-align: center; border-spacing: 0; padding: 50px; border-radius: 40px; box-shadow: 0px 0px 16px #000000;">
                                                    <%
                                                        String snack[] = snacks.split(",");
                                                        
                                                        for( String x : snack )
                                                        {
                                                            %>
                                                            <tr>
                                                                <input type="hidden" value="<%=x%>" name="booking"/>
                                                                <td><%=x%></td>
                                                                <input type="hidden" value="0" id="<%=x%>" name="booking"/>
                                                                <td>
                                                                    <select id="snack_<%=x%>" onchange="document.getElementById('<%=x%>').value = document.getElementById('snack_<%=x%>').value;" style="border: 2px solid #FFC706; font-weight: bold; font-size: 20px; background: #FFFFFF; color: #000000; width: 50%; text-align: center; border-spacing: 0;">
                                                                        <option>0</option>
                                                                        <option>1</option>
                                                                        <option>2</option>
                                                                        <option>3</option>
                                                                        <option>4</option>
                                                                        <option>5</option>
                                                                    </select>
                                                                </td>
                                                            </tr>
                                                            <%
                                                        }
                                                        
                                                    %>
                                                </table>
                                                
                                            </td>
                                        </tr>
                                    </table>
                                    </center>
                                                </form>
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
