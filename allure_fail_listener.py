# allure_fail_listener.py
from robot.api import logger
from robot.libraries.BuiltIn import BuiltIn
import allure
import os
import shutil

class AllureFailListener:
    ROBOT_LISTENER_API_VERSION = 3

    def __init__(self):
        # Robot Framework will replace this with actual output dir at runtime
        self.output_dir = BuiltIn().get_variable_value("${OUTPUT DIR}")
        self.allure_results_dir = os.path.join(self.output_dir, "allure")

    def end_test(self, data, result):
        if result.status == 'FAIL':
            try:
                seleniumlib = BuiltIn().get_library_instance('SeleniumLibrary')
                screenshot_path = seleniumlib.capture_page_screenshot()

                # Copy screenshot to allure results folder
                if not os.path.exists(self.allure_results_dir):
                    os.makedirs(self.allure_results_dir)
                screenshot_name = os.path.basename(screenshot_path)
                allure_screenshot_path = os.path.join(self.allure_results_dir, screenshot_name)
                shutil.copyfile(screenshot_path, allure_screenshot_path)

                # Attach screenshot to Allure
                with open(allure_screenshot_path, 'rb') as f:
                    allure.attach(
                        f.read(),
                        name="Failure Screenshot",
                        attachment_type=allure.attachment_type.PNG
                    )

                logger.info(f"Screenshot attached to Allure: {allure_screenshot_path}")
            except Exception as e:
                logger.error(f"Could not capture screenshot: {e}")
