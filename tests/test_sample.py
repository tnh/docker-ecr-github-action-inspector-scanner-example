import unittest

class TestSample(unittest.TestCase):
    def setUp(self):
        """Set up test fixtures before each test method."""
        self.test_value = 10
        
    def tearDown(self):
        """Clean up test fixtures after each test method."""
        pass

    def test_addition(self):
        """Test basic addition."""
        self.assertEqual(1 + 1, 2)
        
    def test_multiplication(self):
        """Test basic multiplication."""
        self.assertEqual(2 * 3, 6)
        
    def test_string_concatenation(self):
        """Test string concatenation."""
        self.assertEqual("Hello " + "World", "Hello World")
        
    def test_list_operations(self):
        """Test list operations."""
        test_list = [1, 2, 3]
        test_list.append(4)
        self.assertEqual(len(test_list), 4)
        self.assertIn(4, test_list)
        
    def test_value_from_setup(self):
        """Test using value from setUp."""
        self.assertEqual(self.test_value, 10)
        self.assertGreater(self.test_value, 5)

if __name__ == '__main__':
    unittest.main()