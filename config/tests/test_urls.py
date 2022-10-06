from django.test.testcases import TestCase


class TestURLPatterns(TestCase):

    TARGET_URL = ""

    def test_root(self):
        response = self.client.get(self.TARGET_URL)

        self.assertEqual(response.status_code, 200)
        self.assertContains(response, text="Cache backend")
        self.assertContains(response, text="DatabaseBackend")
        self.assertContains(response, text="DefaultFileStorageHealthCheck")
        self.assertContains(response, text="DiskUsage")
        self.assertContains(response, text="MemoryUsage", html=True)
        self.assertContains(response, text="MigrationsHealthCheck")

    def test_root__for_json_format(self):
        response = self.client.get(f"{self.TARGET_URL}?format=json")

        self.assertEqual(response.status_code, 200)
        expected_json_dict = {
            "Cache backend: default": "working",
            "DatabaseBackend": "working",
            "DefaultFileStorageHealthCheck": "working",
            "DiskUsage": "working",
            "MemoryUsage": "working",
            "MigrationsHealthCheck": "working",
        }
        self.assertJSONEqual(response.content, expected_json_dict)
