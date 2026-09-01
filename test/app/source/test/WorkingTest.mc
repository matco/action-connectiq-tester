import Toybox.Graphics;
import Toybox.Lang;
import Toybox.Test;

module WorkingTest {

	(:test)
	function testFirstSuccess(logger as Logger) as Boolean {
		Test.assertEqualMessage(1, 1, "1 is equal to 1");
		return true;
	}

	(:test)
	function testSecondSuccess(logger as Logger) as Boolean {
		Test.assertNotEqualMessage(1, -1, "1 is not equal to -1");
		return true;
	}

	//the simulator can only rasterize text if the device fonts are available in ~/.Garmin/ConnectIQ/Fonts, otherwise it fails with "Invalid Font Specified"
	(:test)
	function testDrawText(logger as Logger) as Boolean {
		var text = "Test application";
		var font = Graphics.FONT_MEDIUM;

		var buffer = new Graphics.BufferedBitmap({:width => 100, :height => 100});
		var dc = buffer.getDc();
		dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_BLACK);
		dc.clear();
		dc.drawText(50, 50, font, text, Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);

		var dimensions = dc.getTextDimensions(text, font);
		logger.debug("Text drawn with a size of " + dimensions[0] + "x" + dimensions[1]);
		Test.assertMessage(dimensions[0] > 0 && dimensions[1] > 0, "Drawn text has a size");
		return true;
	}
}
