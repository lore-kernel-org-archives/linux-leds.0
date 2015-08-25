From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [RESEND PATCH 6/7] leds: Export OF module alias information in missing drivers
Date: Tue, 25 Aug 2015 08:31:16 +0200
Message-ID: <1440484277-32675-7-git-send-email-javier@osg.samsung.com>
References: <1440484277-32675-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1440484277-32675-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Bryan Wu <cooloney@gmail.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The I2C core always reports the MODALIAS uevent as "i2c:<modalias>"
regardless of the mechanism that was used to register the device
(i.e: OF or board code) and the table that is used later to match
the driver with the device (i.e: I2C id table or OF match table).

So drivers needs to export the I2C id table and this be built into
the module or udev won't have the necessary information to autoload
the needed driver module when the device is added.

But this means that OF-only drivers needs to have both OF and I2C id
tables that have to be kept in sync and also the dev node compatible
manufacturer prefix is stripped when reporting the MODALIAS. Which can
lead to issues if two vendors use the same I2C device name for example.

To avoid the above, the I2C core behavior may be changed in the future
to not require an SPI device table for OF-only drivers and report the
OF module alias. So, it's better to also export the OF table even when
is unused now to prevent breaking module loading when the core changes.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
Acked-by: Jacek Anaszewski <j.anaszewski@samsung.com>

---

 drivers/leds/leds-pca963x.c | 1 +
 drivers/leds/leds-tca6507.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/leds/leds-pca963x.c b/drivers/leds/leds-pca963x.c
index 3f63a1bfdc4f..41f269fe0920 100644
--- a/drivers/leds/leds-pca963x.c
+++ b/drivers/leds/leds-pca963x.c
@@ -332,6 +332,7 @@ static const struct of_device_id of_pca963x_match[] = {
 	{ .compatible = "nxp,pca9635", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, of_pca963x_match);
 #else
 static struct pca963x_platform_data *
 pca963x_dt_init(struct i2c_client *client, struct pca963x_chipdef *chip)
diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index c1f910981781..edbecc4ca2da 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -735,6 +735,7 @@ static const struct of_device_id of_tca6507_leds_match[] = {
 	{ .compatible = "ti,tca6507", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, of_tca6507_leds_match);
 
 #else
 static struct tca6507_platform_data *
-- 
2.4.3
