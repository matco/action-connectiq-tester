using Toybox.Test;

module NotWorkingTest {

	(:test)
	function testSuccess(logger) {
		Test.assertEqualMessage(1, 1, "1 is equal to 1");
		return true;
	}

	(:test)
	function testFailure(logger) {
		Test.assertEqualMessage(1, -1, "1 is equal to -1");
		return true;
	}
}
