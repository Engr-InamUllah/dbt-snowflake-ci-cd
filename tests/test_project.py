import unittest
from pathlib import Path
class DbtProjectTest(unittest.TestCase):
 def test_models_reference_sources(self):self.assertIn("source('raw','orders')",Path("models/staging/stg_orders.sql").read_text())
 def test_mart_uses_ref(self):self.assertIn("ref('stg_orders')",Path("models/marts/dim_customer_value.sql").read_text())
if __name__=="__main__":unittest.main()