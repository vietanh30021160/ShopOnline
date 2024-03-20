/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

package controller;

import dal.DAO;
import dal.ProductDAO;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.SQLException;
import java.util.Vector;
import model.Category;
import model.Product;

/**
 *
 * @author ADMIN
 */
@WebServlet(name="ShopHomeServlet", urlPatterns={"/shophome"})
public class ShopHomeServlet extends HttpServlet {
   
    /** 
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code> methods.
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
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet ShopHomeServlet</title>");  
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet ShopHomeServlet at " + request.getContextPath () + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    } 

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /** 
     * Handles the HTTP <code>GET</code> method.
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String choice = request.getParameter("sortbyday");
        String when = null ;
        if(choice == null){
        choice = "today";
        when ="Today";
        }
        
        DAO d = new DAO();
        Vector<Category> list = d.getAll();
        request.setAttribute("categories", list);

        Vector<Product> top;
//         feature part
        ProductDAO p = new ProductDAO();
        try {
            Vector<Product> listQuantity = null;
            Vector<Product> listRevenue = null;
            switch (choice) {
                case "today":
                    listQuantity = (Vector<Product>) p.mostSoldInXDay(0);
                    listRevenue = (Vector<Product>) p.mostRevenueInXDay(0);
                    when = "Today";
                    break;

                case "3dayslast":
                    listQuantity = (Vector<Product>) p.mostSoldInXDay(2);
                    listRevenue = (Vector<Product>) p.mostRevenueInXDay(2);
                    when = "Last 3 days";
                    break;
                case "7dayslast":
                    listQuantity = (Vector<Product>) p.mostSoldInXDay(6);
                    listRevenue = (Vector<Product>) p.mostRevenueInXDay(6);
                    when = "Last 7 days";
                    break;
                case "all":
                    listQuantity = (Vector<Product>) p.mostSold();
                    listRevenue = (Vector<Product>) p.topFeature();
                    when = "All";
                    break;
//                default:
//                    listQuantity = (ArrayVector<Product>) p.mostSold();
//                    listRevenue = (ArrayVector<Product>) p.topFeature();
//                    break;

            }
            top = p.topNew();
            request.setAttribute("newp", top);
            request.setAttribute("prodQuantity", listQuantity);
            request.setAttribute("prodRevenue", listRevenue);
        } catch (SQLException e) {

        }
        request.setAttribute("sortby", when);
        request.getRequestDispatcher("sorthome.jsp").forward(request, response);
    } 

    /** 
     * Handles the HTTP <code>POST</code> method.
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
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
