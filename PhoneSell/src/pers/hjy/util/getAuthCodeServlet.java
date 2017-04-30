package pers.hjy.util;

import java.awt.Color;
import java.awt.Font;
import java.awt.Graphics;
import java.awt.image.BufferedImage;
import java.io.IOException;
import java.util.Random;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/getAuthCodeServlet")
public class getAuthCodeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		getAuthCode(request,response);
	}
	private void getAuthCode(HttpServletRequest request,HttpServletResponse response) throws IOException {
		int width = 125;
		int height = 30;
		BufferedImage buffImg = new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);
		Graphics graphics = buffImg.getGraphics();
		graphics.setColor(Color.BLUE);
		graphics.drawRect(0, 0, width, height);
		graphics.setColor(Color.YELLOW);
		graphics.fillRect(1, 1, width-2, height-2);
		graphics.setColor(Color.GRAY);
		Random random = new Random();
		for(int i = 0; i < 15;i++){
		graphics.drawLine(random.nextInt(width), random.nextInt(height),
				random.nextInt(width), random.nextInt(height));
		}
		graphics.setColor(Color.MAGENTA);
		graphics.setFont(new Font("����", Font.BOLD|Font.ITALIC|Font.PLAIN, 20));
		int x = 18;
		String authLink = "";
		for(int i = 0;i < 4;i++){
			String auth = random.nextInt(10)+"";
			authLink = authLink+auth;
			graphics.drawString(auth, x, 20);
			x+=18;
		}
		request.getSession().setAttribute("authLink",authLink);
		ServletOutputStream out = response.getOutputStream();
		ImageIO.write(buffImg, "jpg", out);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
