using Toybox.Application;
using Toybox.System;

class TestApp extends Application.AppBase {

	function initialize() {
		AppBase.initialize();
		System.println("Starting test application");
	}

	function getInitialView() {
		return [new MainView()];
	}
}
