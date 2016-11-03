package checks.whitespace;

import checkstyle.checks.whitespace.SpacingCheck;
import checkstyle.checks.Directive;

class SpacingCheckTest extends CheckTestCase<SpacingCheckTests> {

	public function testIfShouldContainSpace() {
		assertMsg(new SpacingCheck(), TEST1A, 'No space between "if" and "("');
		assertMsg(new SpacingCheck(), TEST1C, 'No space between "if" and "("');
		assertNoMsg(new SpacingCheck(), TEST1B);
		assertNoMsg(new SpacingCheck(), TEST1D);
	}

	public function testIfShouldNotContainSpace() {
		var check = new SpacingCheck();
		check.spaceIfCondition = Directive.SHOULD_NOT;

		assertMsg(check, TEST1B, 'Space between "if" and "("');
		assertMsg(check, TEST1D, 'Space between "if" and "("');
		assertNoMsg(check, TEST1A);
		assertNoMsg(check, TEST1D);
	}

	public function testBinaryOperator() {
		assertMsg(new SpacingCheck(), TEST2, 'No space around "+"');
	}

	public function testUnaryOperator() {
		assertMsg(new SpacingCheck(), TEST3, 'Space around "++"');
	}

	public function testForShouldContainSpace() {
		assertMsg(new SpacingCheck(), TEST4A, 'No space between "for" and "("');
		assertNoMsg(new SpacingCheck(), TEST4B);
	}

	public function testForShouldNotContainSpace() {
		var check = new SpacingCheck();
		check.spaceForLoop = Directive.SHOULD_NOT;

		assertMsg(check, TEST4B, 'Space between "for" and "("');
		assertNoMsg(check, TEST4A);
	}

	public function testWhileShouldContainSpace() {
		assertMsg(new SpacingCheck(), TEST5A, 'No space between "while" and "("');
		assertNoMsg(new SpacingCheck(), TEST5B);
	}

	public function testWhileShouldNotContainSpace() {
		var check = new SpacingCheck();
		check.spaceWhileLoop = Directive.SHOULD_NOT;

		assertMsg(check, TEST5B, 'Space between "while" and "("');
		assertNoMsg(check, TEST5A);
	}

	public function testSwitchShouldContainSpace() {
		assertMsg(new SpacingCheck(), TEST6A, 'No space between "switch" and "("');
		assertNoMsg(new SpacingCheck(), TEST6B);
	}

	public function testSwitchShouldNotContainSpace() {
		var check = new SpacingCheck();
		check.spaceSwitchCase = Directive.SHOULD_NOT;

		assertMsg(check, TEST6B, 'Space between "switch" and "("');
		assertNoMsg(check, TEST6A);
	}

	public function testCatchShouldContainSpace() {
		assertMsg(new SpacingCheck(), TEST7A, 'No space between "catch" and "("');
		assertNoMsg(new SpacingCheck(), TEST7B);
	}

	public function testCatchShouldNotContainSpace() {
		var check = new SpacingCheck();
		check.spaceCatch = Directive.SHOULD_NOT;

		assertMsg(check, TEST7B, 'Space between "catch" and "("');
		assertNoMsg(check, TEST7A);
	}
}

@:enum
abstract SpacingCheckTests(String) to String {
	var TEST1A = "
	class Test {
		public function test() {
			if(true) {}
		}
	}";

	var TEST1B = "
	class Test {
		public function test() {
			if (true) {}
		}
	}";

	var TEST1C = "
	class Test {
		public function test() {
			if(
				true
				&& true
				|| false
			) {}
		}
	}";

	var TEST1D = "
	class Test {
		public function test() {
			if (
				true
				&& true
				|| false
			) {}
		}
	}";


	var TEST2 =
	"class Test {
		public function test() {
			var a = a+1;
		}
	}";

	var TEST3 =
	"class Test {
		public function test() {
			var a = a ++;
		}
	}";

	var TEST4A =
	"class Test {
		public function test() {
			for(i in 0...10) {

			}
		}
	}";

	var TEST4B =
	"class Test {
		public function test() {
			for (i in 0...10) {

			}
		}
	}";

	var TEST5A =
	"class Test {
		public function test() {
			while(true) {}
		}
	}";

	var TEST5B =
	"class Test {
		public function test() {
			while (true) {}
		}
	}";

	var TEST6A =
	"class Test {
		public function test() {
			switch(0) {
				case 1:
				case _:
			}
		}
	}";

	var TEST6B =
	"class Test {
		public function test() {
			switch (0) {
				case 1:
				case _:
			}
		}
	}";

	var TEST7A =
	"class Test {
		public function test() {
			try {}
			catch(e:Dynamic) {}
		}
	}";

	var TEST7B =
	"class Test {
		public function test() {
			try {}
			catch (e:Dynamic) {}
		}
	}";
}