From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] leds: lp3952: Export I2C module alias information for module autoload
Date: Fri, 14 Oct 2016 09:23:34 -0300
Message-ID: <1476447814-7996-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

If the driver is built as a module, I2C module alias information is not
filled so the module won't be autoloaded if the device isn't registered
over ACPI. Export the I2C device table alias with MODULE_DEVICE_TABLE()
macro so the information is exported in the module.

Before this patch:

$ modinfo drivers/leds/leds-lp3952.ko | grep alias
alias:          acpi*:TXNW3952:*

After this patch:

$ modinfo drivers/leds/leds-lp3952.ko | grep alias
alias:          i2c:lp3952
alias:          acpi*:TXNW3952:*

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/leds/leds-lp3952.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-lp3952.c b/drivers/leds/leds-lp3952.c
index a73c8ff08530..4847e89883a7 100644
--- a/drivers/leds/leds-lp3952.c
+++ b/drivers/leds/leds-lp3952.c
@@ -274,6 +274,7 @@ static const struct i2c_device_id lp3952_id[] = {
 	{LP3952_NAME, 0},
 	{}
 };
+MODULE_DEVICE_TABLE(i2c, lp3952_id);
 
 #ifdef CONFIG_ACPI
 static const struct acpi_device_id lp3952_acpi_match[] = {
-- 
2.7.4
