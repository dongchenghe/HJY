package pers.hjy.util;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

/**
 * Application Lifecycle Listener implementation class ContexListener
 *
 */
@WebListener
public class ContexListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public ContexListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent e)  { 
        String url = e.getServletContext().getInitParameter("url");
        String pwd = e.getServletContext().getInitParameter("pwd");
        String driver = e.getServletContext().getInitParameter("driver");
        String user = e.getServletContext().getInitParameter("user");
        DBUtils.init(url, user, pwd, driver);
    }
}
