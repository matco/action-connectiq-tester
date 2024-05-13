import Toybox.Lang;
import Toybox.Test;

module NotWorkingTest {

	(:test)
	function testSuccess(logger as Logger) as Boolean {
		Test.assertEqualMessage(1, 1, "1 is equal to 1");
		return true;
	}

	(:test)
	function testFailure(logger as Logger) as Boolean {
		Test.assertEqualMessage(1, -1, "1 is equal to -1");
		return true;
	}
}
