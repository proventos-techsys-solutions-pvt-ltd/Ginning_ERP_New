package com.prov.servlets;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ImageServlet")
public class ImageServlet extends HttpServlet {

    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException
    {
		String filename = request.getParameter("imageName");
		/*
		 * System.out.println(filename); File imageFile = new File(filename);
		 * BufferedImage image = ImageIO.read(imageFile); ImageIO.write(image,
		 * "image/png", response.getOutputStream());
		 */
		
		FileInputStream fis = new FileInputStream(filename);

		int b = 0;
		while ((b = fis.read()) != -1) {
		        response.getOutputStream().write(b);
		}
		fis.close();
		
    }

}