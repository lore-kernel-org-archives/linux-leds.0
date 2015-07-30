From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH 23/27] leds: Export OF module alias information in missing drivers
Date: Thu, 30 Jul 2015 18:18:48 +0200
Message-ID: <1438273132-20926-24-git-send-email-javier@osg.samsung.com>
References: <1438273132-20926-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1438273132-20926-1-git-send-email-javier@osg.samsung.com>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Bryan Wu <cooloney@gmail.com>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

The I2C core always reports the MODALIAS uevent as "i2c:<client name"
regardless if the driver was matched using the I2C id_table or the
of_match_table. So technically there's no need for a driver to export
the OF table since currently it's not used.

In fact, the I2C device ID table is mandatory for I2C drivers since
a i2c_device_id is passed to the driver's probe function even if the
I2C core used the OF table to match the driver.

And since the I2C core uses different tables, OF-only drivers needs to
have duplicated data that has to be kept in sync and also the dev node
compatible manufacturer prefix is stripped when reporting the MODALIAS.

To avoid the above, the I2C core behavior may be changed in the future
to not require an I2C device table for OF-only drivers and report the
OF module alias. So, it's better to also export the OF table to prevent
breaking module autoloading if that happens.

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>

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
