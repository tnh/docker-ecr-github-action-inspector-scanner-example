import unittest

class TestSample(unittest.TestCase):
    def setUp(self):
        """Set up test fixtures before each test method."""
        pass

    def tearDown(self):
        """Clean up test fixtures after each test method."""
        pass

    def test_sample(self):
        """Test case example."""
        self.assertEqual(1 + 1, 2)

if __name__ == '__main__':
    unittest.main()