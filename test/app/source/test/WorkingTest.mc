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
}
