/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import databasepack.Profiles;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.annotation.Resource;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.transaction.NotSupportedException;
import javax.transaction.SystemException;

/**
 *
 * @author Vasudev
 */
public class Registration extends HttpServlet {
    @PersistenceContext(unitName = "SoundAndStagePU")
    private EntityManager em;
    @Resource
    private javax.transaction.UserTransaction utx;

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            
            String values[] = request.getParameterValues("registration");
            
            if( em != null )
            {
                List res = em.createNamedQuery("Profiles.findByUsername").setParameter("username", values[0]).getResultList();
                    
                System.out.println(res);
                
                if( res.isEmpty() )
                {
                    request.setAttribute("dbcheck", "Already Exists");
                    
                    RequestDispatcher rd = request.getRequestDispatcher("Registration.jsp");
                    rd.forward(request, response);
                }
                else
                {
                    Profiles p = new Profiles();
                    
                    p.setUsername(values[0]);
                    p.setEmail(values[1]);
                    p.setPassword(values[2]);
                    p.setPhoneNo(values[4]);
                    p.setAddress(values[5]);
                    
                    try
                    {
                        utx.begin();
                        em.persist(p);
                        utx.commit();
                        
                        request.setAttribute("dbcheck", "Updated");
                    
                        RequestDispatcher rd = request.getRequestDispatcher("/Registration.jsp");
                        rd.forward(request, response);
                    }
                    catch (Exception ex)
                    {
                        request.setAttribute("dbcheck", "Failure");
                    
                        RequestDispatcher rd = request.getRequestDispatcher("/Registration.jsp");
                        rd.forward(request, response);
                        ex.printStackTrace();
                    }
                                        
                }
            }
            else
                System.out.println("nnn");
                    
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    public void persist(Object object) {
        try {
            utx.begin();
            em.persist(object);
            utx.commit();
        } catch (Exception e) {
            Logger.getLogger(getClass().getName()).log(Level.SEVERE, "exception caught", e);
            throw new RuntimeException(e);
        }
    }

}
