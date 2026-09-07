Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C768D3ECBE5
	for <linux-leds@vger.kernel.org>; Mon,  7 Sep 2026 20:19:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788812386; cv=none; b=KVpA8e6PFNpOUqWAqY+k6AL6Fy68umocRhB37jHBWBEae9YoylEWzw2DeGdc2l+9qj424oAhvKzkILG53yBKDsVnuXMeSGnk2t0Ono99sfiEMkE9TO6v0bMDxvAHwWemf4Togiqd5N5PPTR9Qd7tZrff4LI6k2SqpF8Uj4D5MG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788812386; c=relaxed/simple;
	bh=ibfSzuvEqAX4vqhVzf0MhyB9RVT64f5Zvs5HA/q3DxI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MYapG6tQVgMXHTpmhIg6lwk65nY/XuoBX9KsKFuy/cIozX2NmgA0osmVe7IfuzwmuQtZtYSmc9Xv0T/4lPy9TYmuGYec6gjpLVrE43PCnD+0eWKJopmVfkpBkctLzO9YZMAHcnfujOqQ83flbJwlUoAl7sJdKXGQCU+oT296/ZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OEdGhvpw; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OEdGhvpw"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2d71ae3455aso58852405ad.1
        for <linux-leds@vger.kernel.org>; Mon, 07 Sep 2026 13:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788812383; x=1789417183; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XqM7CNcQIe0bZF2r0IXx9E1bi6r31mjO2/QDFutoPOg=;
        b=OEdGhvpwwtWyTvG4DRd2e/4cuMe1a5sMjOVqLLGRJWDe4Y6/ERT7ooEWpNRBeH43r2
         +DsaQSj6ZyZ5vrIxFkOTsZa1QF9hQdVdfGgX5/NtUE/eOfKnaHl2tDAM1SUVF8xnI9TN
         nDBxYEoDXg38ldHXROAz4ZdRiUkIg5Y9/0XcKw8BYF5lI5MCYT+c89F+rIV4l5i9zh/7
         kcF7dttrfS/2cYuqoClbSCDo+4PtOSQrs1liijwugSThQpz0gZ704HqTcl2oJr3o7L17
         m8pLVX9oCXIsPjx5G1LLnGY9Xuj26K3b9Yp4sZWVzFTpFRABlmYkfdrJW7HYMxAx8S62
         LaBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788812383; x=1789417183;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XqM7CNcQIe0bZF2r0IXx9E1bi6r31mjO2/QDFutoPOg=;
        b=WgLlb8x9ydSVXOWf1em8WcFFesYuJqwI5HASitLAqZBNYxUs05Ve2lr3RBPkNlRyXE
         0IZ19WpOddEIzUVJvBL9jfLojFxvY2endGbqEuGs84BNZdJLCv870bUMlo+HcuycfHgQ
         +zuBNi90D2mpD3hXxa3bbRz1XG23VKwGEftuPZ/5JDUBM/G4BAMS+IVbHljmMc4WmARi
         1HtKJ/eJFPUa67+lYrcobPQu1Y1ZFDVaTWEijqhI2p5AYs9KWbc4MZrHRL5Le6FUzspF
         ftEbk2R3wYgsOVaVk4ksCl5NMyx84MgT/WfRbX0mT8su7vQHwSFHnV+TrOohEyQjqQ7z
         WJfg==
X-Gm-Message-State: AFuF++k51kXwKXg9mwX/VfrfXjHNhLVN09Iw7qcZbXIXUiRPrYDl4QK0
	d35mUyR+Y0pss6m/H0Ht0yquYxPx9rtJMzcgzVZQ1F9DYCngkzTEy2+BeVGZJw==
X-Gm-Gg: AYBFou1HVczFLGUH0ik5d4BTjSCNhHM/j7/JIOWmXxoyeYMeLvZT/shDqqgI2zxNzrK
	SQibkiYh4rCYM/4UiR689GWh/Tn5NfQaNXOvE3lIuIwFPh6B6/nhc7g1DF1yDsDyWIj67SMo1uW
	Qcq4BijSykEneNaHp2kwA2903WgIegr+Hixv7syN3Tw8Uuwa0C1pvhtlFUkqX/CJQAinXKOtGhQ
	NA3kzoiMgsJ+iAfuZZVXGlkVQSsE3510Ms8t3JHurnEWMstQpbJR3Ll2txZa8jFT+RLWbTomDb7
	oNAXESgYrC6kzblUQtY47LvbeBzThc7ZX/EWFBiDeoI/p28aufhBDAjFEx8fAReUZTgDflekxjM
	m1FQyZNcLTIzc2HZ9diUDkGHpfdWpx8crOJaiUxqTb36NLLziK4ipWzl+Arocz3sBYf5jHIOCf2
	cur5fsfDBKDAXHEzPeeRWzfox4CgIFoObRfBpq6iJkZD8jQ+sEWbMzl/TZ/TjpbJ/XHfqalCaH1
	UEQzFe4wPV2Fl9GDEZx1XFuPl1CfojTXxJ5b6EkG1o2/EGo+z2TtzSKrleDSFLde7I1Sl1f/yya
	OiBk9b356uNTKncYpFOtPQxXg3O/RZzmAUkHDg==
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr36621766a91.18.1788812383036;
        Mon, 07 Sep 2026 13:19:43 -0700 (PDT)
Received: from ryzen.lan ([2601:644:8000:7a86::e34])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b26123c99sm22082690a91.11.2026.09.07.13.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Sep 2026 13:19:42 -0700 (PDT)
From: Rosen Penev <rosenp@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] leds: is31fl32xx: Use fwnode/device property APIs
Date: Mon,  7 Sep 2026 13:19:40 -0700
Message-ID: <20260907201940.40524-1-rosenp@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert the DT-specific helpers in is31fl32xx_parse_dt() and
is31fl32xx_parse_child_dt() to their fwnode/device equivalents.
Behaviour is unchanged for device tree: device_property_read_bool(),
device_for_each_child_node_scoped() and device_get_child_node_count()
operate on the same nodes and keep the skip of unavailable children.

Use the %pfwP format specifier in error messages, as child is now a
struct fwnode_handle and %pOF would misread it as a device_node.

Assisted-by: opencode:deepseek-v4-flash-free
Signed-off-by: Rosen Penev <rosenp@gmail.com>
---
 drivers/leds/leds-is31fl32xx.c | 20 ++++++++++----------
 1 file changed, 10 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/leds-is31fl32xx.c b/drivers/leds/leds-is31fl32xx.c
index 6c8d6b833260..285085d27453 100644
--- a/drivers/leds/leds-is31fl32xx.c
+++ b/drivers/leds/leds-is31fl32xx.c
@@ -378,23 +378,23 @@ static int is31fl32xx_init_regs(struct is31fl32xx_priv *priv)
 }
 
 static int is31fl32xx_parse_child_dt(const struct device *dev,
-				     const struct device_node *child,
+				     const struct fwnode_handle *child,
 				     struct is31fl32xx_led_data *led_data)
 {
 	struct led_classdev *cdev = &led_data->cdev;
 	int ret = 0;
 	u32 reg;
 
-	ret = of_property_read_u32(child, "reg", &reg);
+	ret = fwnode_property_read_u32(child, "reg", &reg);
 	if (ret || reg < 1 || reg > led_data->priv->cdef->channels) {
 		dev_err(dev,
-			"Child node %pOF does not have a valid reg property\n",
+			"Child node %pfwP does not have a valid reg property\n",
 			child);
 		return -EINVAL;
 	}
 	led_data->channel = reg;
 
-	of_property_read_u32(child, "led-max-microamp", &led_data->max_microamp);
+	fwnode_property_read_u32(child, "led-max-microamp", &led_data->max_microamp);
 
 	cdev->brightness_set_blocking = is31fl32xx_brightness_set;
 
@@ -422,7 +422,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 	int ret = 0;
 
 	if ((cdef->output_frequency_setting_reg != IS31FL32XX_REG_NONE) &&
-	    of_property_read_bool(dev_of_node(dev), "issi,22khz-pwm")) {
+	    device_property_read_bool(dev, "issi,22khz-pwm")) {
 
 		ret = is31fl32xx_write(priv, cdef->output_frequency_setting_reg,
 				       IS31FL32XX_PWM_FREQUENCY_22KHZ);
@@ -433,7 +433,7 @@ static int is31fl32xx_parse_dt(struct device *dev,
 		}
 	}
 
-	for_each_available_child_of_node_scoped(dev_of_node(dev), child) {
+	device_for_each_child_node_scoped(dev, child) {
 		struct led_init_data init_data = {};
 		struct is31fl32xx_led_data *led_data =
 			&priv->leds[priv->num_leds];
@@ -451,17 +451,17 @@ static int is31fl32xx_parse_dt(struct device *dev,
 							  led_data->channel);
 		if (other_led_data) {
 			dev_err(dev,
-				"Node %pOF 'reg' conflicts with another LED\n",
+				"Node %pfwP 'reg' conflicts with another LED\n",
 				child);
 			return -EINVAL;
 		}
 
-		init_data.fwnode = of_fwnode_handle(child);
+		init_data.fwnode = child;
 
 		ret = devm_led_classdev_register_ext(dev, &led_data->cdev,
 						     &init_data);
 		if (ret) {
-			dev_err(dev, "Failed to register LED for %pOF: %d\n",
+			dev_err(dev, "Failed to register LED for %pfwP: %d\n",
 				child, ret);
 			return ret;
 		}
@@ -576,7 +576,7 @@ static int is31fl32xx_probe(struct i2c_client *client)
 
 	cdef = device_get_match_data(dev);
 
-	count = of_get_available_child_count(dev_of_node(dev));
+	count = device_get_child_node_count(dev);
 	if (!count)
 		return -EINVAL;
 
-- 
2.55.0

