Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795193557;
	b=t7fJty48JV8yPHGgfO2wWCvpH0xxfMe08WVJpXicd3giH7AgiNBfK4Tqwu5BtCrXZr18
	 ScGw4R4pFwNsO/atyAjK4EUVru2aHgset11boFG+GJaW8g248xbnz5uppfBY8llohltaV
	 F20bRCmJ8WGTljKFo+7NvZAzBIz+EmfXrjylcd25lLH5pUm9i5bXZjt/Io2xCcEmgntkk
	 oY7l8e8na9bxTcaf9D5MC0PSngXPuVCP3brkZV/t1LprZsAY+HNJzmyU6Y1Amuw/+QGsk
	 Xw1gpoTY2CatJd96aRp/0NcJ5nbE88a964iK4YJCB4JKPV7vNr7kLCcbjFrBJpUyMoA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795193557;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Rp7eyI3MK6PiOiIqXkCi6ZJ+PbVMvtLByPRKSVlrZcg=;
	b=yu0VNKvSaA9xjeZux+QZCI0hOKNEpHb3RBuKMTUcq5iqeTKcCtlNugmlBFx7K2BnKXmV
	 D2g4hJIhqZkbnd2FdZFfN5gPdyTZDqjDKukIBaHRxnFyWF6cdbtBG1WDjaPFbR4bVVxcL
	 9KBi5hyUCQ9umD/xt/ynacGgD+WBe4y+ml82FpWSBeWT10WczOkVpILTB2z1cNgnJzYXr
	 M1j/lg20oPOaqxtrKOOwQQaOBVhw5HbbOvpgAJbndm8a/L83cJGZDraeTGas7Irfhw0qS
	 klEu7sMe1grxunpOrh1+5ojKwfVGp45azEbVLGZi0JW9r31YR0qs5ZyLYgZQkJvEEFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMrA9tLa;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED666606A337;
	Fri, 20 Nov 2026 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=HMrA9tLa
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795193556;
	b=gAbacFtniajifytESPCXXCTzxBUNThTckNR3FJjvzf2iZkRIwTJwQvJL3S3unhFBTy51
	 qkzs9fjYTLMiQsxFjDqarlluqjyL5t5iR3bCWhXe7qLtX5SJ+qUmWKKSakrrQo04P3U1r
	 +WFl8glpdIRoYl+pqx6P5Wj1Kh2Sm9CuoEfdFRb9evwCDgA8WbIHdpW3eNdARK8Dvjo1D
	 B0lNmi8QeLnz+EheL/hMCbAi2oL8Hj9/BlZ1eNZN/WI5QklVp7lj+dchUz+Ku8NgU1qN9
	 +egWCPXJIfmN0mmNqKsIcE5VuIOdY1Kpm4XuujiEj2pCSkp6kkInCw8uFvyTqDkKjHA==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795193556;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=Rp7eyI3MK6PiOiIqXkCi6ZJ+PbVMvtLByPRKSVlrZcg=;
	b=hWnDUb/F6K77z/euPC8FZygrkkQrbyvUjUnNm/W28kutng5b3rJ8d28HwxFHHp5PSgAL
	 /EDGLkuzMBjbK1tYuDBp2QkHl8sa5ObNo0AgM4Bkj7Fy8YsnJcjPV1i2Edo28PgLogVEg
	 tLGy0DGtDF6HUty0Nsd4/pfjNHp1Gy3R9Vu2u34v6JMpEHSgZSE4gw3yZzXNCqOAoCfgz
	 MNPvSVJLotys4vpWRcQ6m5bPnh19Ddp2rLMP84tcHPiOVw9RWRdI/onjvGCv3RtBBY4ec
	 319YHGNRplOy2cMd4IjiTU8/NKRe68bL0iAJ4qN5618A7VN7c91E5xSXjKZK52Vfzhw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 6AB751F000CA;
	Fri, 20 Nov 2026 16:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795193556;
	bh=Rp7eyI3MK6PiOiIqXkCi6ZJ+PbVMvtLByPRKSVlrZcg=;
	h=From:Date:Subject:To:Cc:Reply-To;
	b=HMrA9tLawUagHckZ7gYJ1q2FwM31IRQpONnh+Lm//RRfICYHOQYx+EuClmbz+aHWQ
	 jmNYkshPxFZ4by2bVpmE+epkXbiyU4GLET1fhJWyL+zQcc+iVSe79DnTdugJQ8AYxm
	 os1K8hXWZeijLnm3fIlNphrMutwur1yfmKf5N/UqTAQ3mi33Q0tH4GW0MbV6r48WN7
	 g6J8Nia5JNH7GbBNM5E1hW/y9iPTJZyGc5bzyEPdjUZQ04N3kKWXwYc4roSQ5gHz0K
	 hQNJcZwZEFraJuYmKMeGu5XsLs1BeoSMtw87BuRMlKrjTENS41svlK+4/sdwGqxi2P
	 eaLyZHY3r0N7Q==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id EF12849969;
	Fri, 20 Nov 2026 16:52:29 +0000 (UTC)
From: Peter LaDow via B4 Relay <devnull+pladow.gmail.com@kernel.org>
Date: Fri, 20 Nov 2026 08:52:25 -0800
Subject: [PATCH] leds: lp5860: Add I2C interface support
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261120-add-i2c-support-for-lp5860-v1-1-30bc97dcbf78@gmail.com>
X-B4-Tracking: v=1; b=H4sIAMh6AGsC/yXMwQrCMAwA0F8ZORtoI87pr4iHtU01ImtJNhHG/
 t2qx3d5KxirsMG5W0H5JSZlavC7DuJ9nG6MkpqBHPXek8MxJRSKaEutRWfMRfFZD0Pv8HTM+yE
 QB/YRWlCVs7x/+eX6ty3hwXH+jrBtHxco5Cp+AAAA
X-Change-ID: 20261120-add-i2c-support-for-lp5860-97f38b2ebe1c
To: Nam Tran <trannamatk@gmail.com>, Lee Jones <lee@kernel.org>, 
 Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman <griffin@kroah.com>
Cc: linux-kernel@vger.kernel.org, linux-leds@vger.kernel.org, 
 Peter LaDow <pladow@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795193549; l=6530;
 i=pladow@gmail.com; s=20261120; h=from:subject:message-id;
 bh=WYeX7Dr68OiZme4pornFR+sF3AnsOda9svE1CKz58RI=;
 b=hVFHNJ0BORNibfo9AMK6B3bmn8cIlFNYdnhaZ7YahevywvWu9diIBhs5OoFqDugMcll+F6usS
 G0iXzqDl/8IADm32WZYx2P3VLzIpixE6Rxib6vrrLm32KyfistXB8zZ
X-Developer-Key: i=pladow@gmail.com; a=ed25519;
 pk=GEdL9uXOAV0PnykeFpXX87oqKs0/Ac0qAUc4Oow7WN4=
X-Endpoint-Received: by B4 Relay for pladow@gmail.com/20261120 with
 auth_id=1585
X-Original-From: Peter LaDow <pladow@gmail.com>
Reply-To: pladow@gmail.com
Content-Transfer-Encoding: 7bit

From: Peter LaDow <pladow@gmail.com>

This patch adds I2C bus support to the Texas Instruments LP5860 RGB LED
matrix driver.

The LP5860 supports both SPI and I2C interfaces depending on the hardware
IFS pin configuration, but the existing driver only implements the SPI
bus interface (leds-lp5860-spi).

Changes include:
- Adding the leds-lp5860-i2c bus driver module to handle the LP5860's
  10-bit register addressing scheme over I2C.
- Updating Kconfig and Makefile so I2C and SPI bus support can be built
  independently or together.

Tested on ZymqMP (ZU3) with an LP5860 connected over an AXI IIC at
base address 0x40 (A1=0, A0=0) at 400kHz.

Signed-off-by: Peter LaDow <pladow@gmail.com>
---
 drivers/leds/rgb/Kconfig           |  12 ++++
 drivers/leds/rgb/Makefile          |   1 +
 drivers/leds/rgb/leds-lp5860-i2c.c | 139 +++++++++++++++++++++++++++++++++++++
 3 files changed, 152 insertions(+)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 3f6786616a7d..5dfca8949464 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -78,6 +78,18 @@ config LEDS_LP5860_SPI
 	  To compile this driver as a module, choose M here: the
 	  module will be called leds-lp5860-spi.
 
+config LEDS_LP5860_I2C
+	tristate "LED Support for TI LP5860 I2C LED driver chip"
+	depends on I2C
+	depends on OF
+	select LEDS_LP5860_CORE
+	help
+	  If you say yes here you get support for the Texas Instruments
+	  LP5860 LED driver for I2C bus connections.
+
+	  To compile this driver as a module, choose M here: the
+	  module will be called leds-lp5860-i2c.
+
 config LEDS_NCP5623
 	tristate "LED support for NCP5623"
 	depends on I2C
diff --git a/drivers/leds/rgb/Makefile b/drivers/leds/rgb/Makefile
index a59c13396a22..0e35bf16d615 100644
--- a/drivers/leds/rgb/Makefile
+++ b/drivers/leds/rgb/Makefile
@@ -6,6 +6,7 @@ obj-$(CONFIG_LEDS_KTD202X)		+= leds-ktd202x.o
 obj-$(CONFIG_LEDS_LP5812)		+= leds-lp5812.o
 obj-$(CONFIG_LEDS_LP5860_CORE)		+= leds-lp5860-core.o
 obj-$(CONFIG_LEDS_LP5860_SPI)		+= leds-lp5860-spi.o
+obj-$(CONFIG_LEDS_LP5860_I2C)		+= leds-lp5860-i2c.o
 obj-$(CONFIG_LEDS_NCP5623)		+= leds-ncp5623.o
 obj-$(CONFIG_LEDS_PWM_MULTICOLOR)	+= leds-pwm-multicolor.o
 obj-$(CONFIG_LEDS_QCOM_LPG)		+= leds-qcom-lpg.o
diff --git a/drivers/leds/rgb/leds-lp5860-i2c.c b/drivers/leds/rgb/leds-lp5860-i2c.c
new file mode 100644
index 000000000000..2744ac325862
--- /dev/null
+++ b/drivers/leds/rgb/leds-lp5860-i2c.c
@@ -0,0 +1,139 @@
+// SPDX-License-Identifier: GPL-2.0-only
+
+#include <linux/i2c.h>
+#include <linux/module.h>
+#include <linux/mutex.h>
+#include <linux/of.h>
+#include <linux/property.h>
+#include <linux/regmap.h>
+#include <linux/slab.h>
+
+#include "leds-lp5860.h"
+
+#define LP5860_I2C_NUM_PAGES	4
+
+struct lp5860_i2c {
+	struct i2c_client *clients[LP5860_I2C_NUM_PAGES];
+};
+
+static int lp5860_i2c_reg_read(void *context, unsigned int reg, unsigned int *val)
+{
+	struct lp5860_i2c *i2c = context;
+	int ret;
+
+	ret = i2c_smbus_read_byte_data(i2c->clients[reg >> 8], reg & 0xff);
+	if (ret < 0)
+		return ret;
+
+	*val = ret;
+	return 0;
+}
+
+static int lp5860_i2c_reg_write(void *context, unsigned int reg, unsigned int val)
+{
+	struct lp5860_i2c *i2c = context;
+
+	return i2c_smbus_write_byte_data(i2c->clients[reg >> 8], reg & 0xff, val);
+}
+
+static const struct regmap_bus lp5860_i2c_regmap_bus = {
+	.reg_read = lp5860_i2c_reg_read,
+	.reg_write = lp5860_i2c_reg_write,
+};
+
+static const struct regmap_config lp5860_i2c_regmap_config = {
+	.name = "lp5860",
+	.reg_bits = 16,
+	.val_bits = 8,
+	.max_register = LP5860_MAX_REG,
+};
+
+static int lp5860_i2c_probe(struct i2c_client *client)
+{
+	struct device *dev = &client->dev;
+	struct lp5860_i2c *i2c;
+	struct lp5860 *lp5860;
+	unsigned int multi_leds;
+	unsigned int page;
+	int ret;
+
+	if ((client->flags & I2C_CLIENT_TEN) ||
+	    client->addr < 0x40 || client->addr > 0x4c || (client->addr & 0x03))
+		return dev_err_probe(dev, -EINVAL,
+				     "Use the page-zero I2C address (0x40, 0x44, 0x48 or 0x4c).\n");
+
+	if (!i2c_check_functionality(client->adapter, I2C_FUNC_SMBUS_BYTE_DATA))
+		return dev_err_probe(dev, -EOPNOTSUPP,
+				     "SMBus byte-data transactions are not supported.\n");
+
+	multi_leds = device_get_child_node_count(dev);
+	if (!multi_leds)
+		return dev_err_probe(dev, -ENODEV, "LEDs are not defined in Device Tree!\n");
+
+	if (multi_leds > LP5860_MAX_LED)
+		return dev_err_probe(dev, -EINVAL, "Too many LEDs specified.\n");
+
+	lp5860 = devm_kzalloc(dev, struct_size(lp5860, leds, multi_leds), GFP_KERNEL);
+	if (!lp5860)
+		return -ENOMEM;
+
+	i2c = devm_kzalloc(dev, sizeof(*i2c), GFP_KERNEL);
+	if (!i2c)
+		return -ENOMEM;
+
+	i2c->clients[0] = client;
+	for (page = 1; page < LP5860_I2C_NUM_PAGES; page++) {
+		i2c->clients[page] = devm_i2c_new_dummy_device(dev, client->adapter,
+							       client->addr | page);
+		if (IS_ERR(i2c->clients[page]))
+			return dev_err_probe(dev, PTR_ERR(i2c->clients[page]),
+					     "Failed to reserve I2C register page %u.\n", page);
+	}
+
+	lp5860->regmap = devm_regmap_init(dev, &lp5860_i2c_regmap_bus, i2c,
+					  &lp5860_i2c_regmap_config);
+	if (IS_ERR(lp5860->regmap))
+		return dev_err_probe(dev, PTR_ERR(lp5860->regmap),
+				     "Failed to initialise Regmap.\n");
+
+	lp5860->dev = dev;
+
+	ret = devm_mutex_init(dev, &lp5860->lock);
+	if (ret)
+		return ret;
+
+	i2c_set_clientdata(client, lp5860);
+
+	return lp5860_device_init(dev);
+}
+
+static void lp5860_i2c_remove(struct i2c_client *client)
+{
+	lp5860_device_remove(&client->dev);
+}
+
+static const struct of_device_id lp5860_i2c_of_match[] = {
+	{ .compatible = "ti,lp5860" },
+	{}
+};
+MODULE_DEVICE_TABLE(of, lp5860_i2c_of_match);
+
+static const struct i2c_device_id lp5860_i2c_ids[] = {
+	{ "lp5860" },
+	{}
+};
+MODULE_DEVICE_TABLE(i2c, lp5860_i2c_ids);
+
+static struct i2c_driver lp5860_i2c_driver = {
+	.driver = {
+		.name = "lp5860-i2c",
+		.of_match_table = lp5860_i2c_of_match,
+	},
+	.probe = lp5860_i2c_probe,
+	.remove = lp5860_i2c_remove,
+	.id_table = lp5860_i2c_ids,
+};
+module_i2c_driver(lp5860_i2c_driver);
+
+MODULE_DESCRIPTION("TI LP5860 RGB LED I2C driver");
+MODULE_LICENSE("GPL");

---
base-commit: c016466c8c8b01af27ac66d97b64fa9c9e431a3d
change-id: 20261120-add-i2c-support-for-lp5860-97f38b2ebe1c

Best regards,
--  
Peter LaDow <pladow@gmail.com>


