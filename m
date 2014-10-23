From: Ralf Baechle <ralf@linux-mips.org>
Subject: [PATCH 2/3] MIPS: SEAD3: Collect LED platform device registration in
 a single file.
Date: Fri, 24 Oct 2014 01:32:25 +0200
Message-ID: <39436040d9c938c22506f2ed15d88fa1d174af04.1414108953.git.ralf@linux-mips.org>
References: <20141023235416.GA7529@linux-mips.org>
Return-path: <linux-mips-bounce@linux-mips.org>
In-Reply-To: <20141023235416.GA7529@linux-mips.org>
Sender: linux-mips-bounce@linux-mips.org
Errors-to: linux-mips-bounce@linux-mips.org
List-help: <mailto:ecartis@linux-mips.org?Subject=help>
List-unsubscribe: <mailto:ecartis@linux-mips.org?subject=unsubscribe%20linux-mips>
List-software: Ecartis version 1.0.0
List-subscribe: <mailto:ecartis@linux-mips.org?subject=subscribe%20linux-mips>
List-owner: <mailto:ralf@linux-mips.org>
List-post: <mailto:linux-mips@linux-mips.org>
List-archive: <http://www.linux-mips.org/archives/linux-mips/>
To: Markos Chandras <markos.chandras@imgtec.com>, linux-mips@linux-mips.org, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Signed-off-by: Ralf Baechle <ralf@linux-mips.org>
---
 arch/mips/mti-sead3/leds-sead3.c | 19 +------------------
 arch/mips/mti-sead3/sead3-leds.c | 18 ++++++++++++++----
 2 files changed, 15 insertions(+), 22 deletions(-)

diff --git a/arch/mips/mti-sead3/leds-sead3.c b/arch/mips/mti-sead3/leds-sead3.c
index 0a168c9..e5632e6 100644
--- a/arch/mips/mti-sead3/leds-sead3.c
+++ b/arch/mips/mti-sead3/leds-sead3.c
@@ -15,8 +15,6 @@
 
 #define DRVNAME "sead3-led"
 
-static struct platform_device *pdev;
-
 static void sead3_pled_set(struct led_classdev *led_cdev,
 		enum led_brightness value)
 {
@@ -76,26 +74,11 @@ static struct platform_driver sead3_led_driver = {
 
 static int __init sead3_led_init(void)
 {
-	int ret;
-
-	ret = platform_driver_register(&sead3_led_driver);
-	if (ret < 0)
-		goto out;
-
-	pdev = platform_device_register_simple(DRVNAME, -1, NULL, 0);
-	if (IS_ERR(pdev)) {
-		ret = PTR_ERR(pdev);
-		platform_driver_unregister(&sead3_led_driver);
-		goto out;
-	}
-
-out:
-	return ret;
+	return platform_driver_register(&sead3_led_driver);
 }
 
 static void __exit sead3_led_exit(void)
 {
-	platform_device_unregister(pdev);
 	platform_driver_unregister(&sead3_led_driver);
 }
 
diff --git a/arch/mips/mti-sead3/sead3-leds.c b/arch/mips/mti-sead3/sead3-leds.c
index c427c57..c6fa3e4 100644
--- a/arch/mips/mti-sead3/sead3-leds.c
+++ b/arch/mips/mti-sead3/sead3-leds.c
@@ -70,10 +70,20 @@ static struct platform_device fled_device = {
 	.resource		= fled_resources
 };
 
-static int __init led_init(void)
+static struct platform_device sead3_led_device = {
+        .name   = "sead3-led",
+        .id     = -1,
+};
+
+struct platform_device *sead3_led_devices[] = {
+	&pled_device,
+	&fled_device,
+	&sead3_led_device,
+};
+
+static int __init sead3_led_init(void)
 {
-	platform_device_register(&pled_device);
-	return platform_device_register(&fled_device);
+	return platform_add_devices(sead3_led_devices, ARRAY_SIZE(sead3_led_devices));
 }
 
-device_initcall(led_init);
+device_initcall(sead3_led_init);
-- 
1.9.3
