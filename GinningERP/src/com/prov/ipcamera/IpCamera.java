package com.prov.ipcamera;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;

import javax.imageio.ImageIO;
import com.googlecode.javacv.cpp.*;
import com.googlecode.javacv.cpp.opencv_core.*;
import com.googlecode.javacv.CanvasFrame;
import com.googlecode.javacv.FrameGrabber.Exception;
import com.googlecode.javacv.OpenCVFrameGrabber;
import com.googlecode.javacv.cpp.opencv_core.IplImage;
import org.opencv.core.*;

public class IpCamera {
	public static void getVehiclePhoto(String ip, String fileName) throws Exception, IOException {
		OpenCVFrameGrabber frameGrabber = new OpenCVFrameGrabber(ip); 
		IplImage iPimg;
		CanvasFrame canvasFrame = new CanvasFrame("Camera");
		canvasFrame.setCanvasSize(600, 600);
		if(true) {
			 	frameGrabber.start();
			 	 iPimg = frameGrabber.grab();
			 	 BufferedImage bufferedImage = new BufferedImage(iPimg.width(), iPimg.height(), BufferedImage.TYPE_INT_RGB);
			 	 iPimg.copyTo(bufferedImage);
			 	 File file = new File("C://TEMP/"+fileName);
			     ImageIO.write(bufferedImage, "png", file);
		    	 canvasFrame.showImage(iPimg);
		    	 frameGrabber.stop();
		}
	}
}
