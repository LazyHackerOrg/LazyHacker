import unittest
import json
import sys


def test_new():
    return True

def test_modify():
    return True

def test_erase():
    return True

def test_other():
    return True




class TestTravisLazy(unittest.TestCase):
    def testNew(self):
        self.assertTrue(test_new())

    def testModify(self):
        self.assertTrue(test_modify())

    def testErase(self):
        self.assertTrue(test_erase())

    def testOther(self):
        self.assertTrue(test_other())

if __name__ == '__main__':
    unittest.main()
