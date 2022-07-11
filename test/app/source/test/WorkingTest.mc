using Toybox.Test;

module WorkingTest {

	(:test)
	function testFirstSuccess(logger) {
		Test.assertEqualMessage(1, 1, "1 is equal to 1");
		return true;
	}

	(:test)
	function testSecondSuccess(logger) {
		Test.assertNotEqualMessage(1, -1, "1 is not equal to -1");
		return true;
	}
}
