Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9498AC43467
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 581312087D
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:36:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="TQyVEyQ9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726416AbgIQWgi (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:36:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgIQWeA (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 17 Sep 2020 18:34:00 -0400
Received: from mail.nic.cz (mail.nic.cz [IPv6:2001:1488:800:400::400])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4147EC061788;
        Thu, 17 Sep 2020 15:33:57 -0700 (PDT)
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 2BC7A140A99;
        Fri, 18 Sep 2020 00:33:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382035; bh=+88acRR0+nXsF9fnBxrJpJncykP+3DoAY9pr6KLSxqU=;
        h=From:To:Date;
        b=TQyVEyQ9xHjvjhDvc2Wf8JKCLVxe937HqxfmLUM6f6LSxIkbUML6PAA66/f/KcNGH
         YbXh5Vi7qUYN/TdUj7E2qvlOSEUYOm4eY9Zwrv6E900ag5O7R9yhT9oYmijFAL7wvV
         NYz0g3zhIfHoMM7ANpnFxzw+Td2TNQasmw277RDo=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        =?UTF-8?q?=C3=81lvaro=20Fern=C3=A1ndez=20Rojas?= 
        <noltari@gmail.com>, Kevin Cernekee <cernekee@gmail.com>,
        Jaedon Shin <jaedon.shin@gmail.com>
Subject: [PATCH leds v2 11/50] leds: bcm6328, bcm6358: use struct led_init_data when registering
Date:   Fri, 18 Sep 2020 00:32:59 +0200
Message-Id: <20200917223338.14164-12-marek.behun@nic.cz>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20200917223338.14164-1-marek.behun@nic.cz>
References: <20200917223338.14164-1-marek.behun@nic.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Spamd-Bar: /
X-Virus-Scanned: clamav-milter 0.102.2 at mail
X-Virus-Status: Clean
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

By using struct led_init_data when registering we do not need to parse
`label` DT property. Moreover `label` is deprecated and if it is not
present but `color` and `function` are, LED core will compose a name
from these properties instead.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Álvaro Fernández Rojas <noltari@gmail.com>
Cc: Kevin Cernekee <cernekee@gmail.com>
Cc: Jaedon Shin <jaedon.shin@gmail.com>
---
 drivers/leds/leds-bcm6328.c | 5 +++--
 drivers/leds/leds-bcm6358.c | 5 +++--
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/leds-bcm6328.c b/drivers/leds/leds-bcm6328.c
index b3cf84a3eb150..c72b0842e8151 100644
--- a/drivers/leds/leds-bcm6328.c
+++ b/drivers/leds/leds-bcm6328.c
@@ -328,6 +328,7 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 		       void __iomem *mem, spinlock_t *lock,
 		       unsigned long *blink_leds, unsigned long *blink_delay)
 {
+	struct led_init_data init_data = {};
 	struct bcm6328_led *led;
 	const char *state;
 	int rc;
@@ -345,7 +346,6 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 	if (of_property_read_bool(nc, "active-low"))
 		led->active_low = true;
 
-	led->cdev.name = of_get_property(nc, "label", NULL) ? : nc->name;
 	led->cdev.default_trigger = of_get_property(nc,
 						    "linux,default-trigger",
 						    NULL);
@@ -382,8 +382,9 @@ static int bcm6328_led(struct device *dev, struct device_node *nc, u32 reg,
 
 	led->cdev.brightness_set = bcm6328_led_set;
 	led->cdev.blink_set = bcm6328_blink_set;
+	init_data.fwnode = of_fwnode_handle(nc);
 
-	rc = devm_led_classdev_register(dev, &led->cdev);
+	rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (rc < 0)
 		return rc;
 
diff --git a/drivers/leds/leds-bcm6358.c b/drivers/leds/leds-bcm6358.c
index 99dbf62aa6222..49f703c59ecdc 100644
--- a/drivers/leds/leds-bcm6358.c
+++ b/drivers/leds/leds-bcm6358.c
@@ -94,6 +94,7 @@ static void bcm6358_led_set(struct led_classdev *led_cdev,
 static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 		       void __iomem *mem, spinlock_t *lock)
 {
+	struct led_init_data init_data = {};
 	struct bcm6358_led *led;
 	const char *state;
 	int rc;
@@ -109,7 +110,6 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 	if (of_property_read_bool(nc, "active-low"))
 		led->active_low = true;
 
-	led->cdev.name = of_get_property(nc, "label", NULL) ? : nc->name;
 	led->cdev.default_trigger = of_get_property(nc,
 						    "linux,default-trigger",
 						    NULL);
@@ -136,8 +136,9 @@ static int bcm6358_led(struct device *dev, struct device_node *nc, u32 reg,
 	bcm6358_led_set(&led->cdev, led->cdev.brightness);
 
 	led->cdev.brightness_set = bcm6358_led_set;
+	init_data.fwnode = of_fwnode_handle(nc);
 
-	rc = devm_led_classdev_register(dev, &led->cdev);
+	rc = devm_led_classdev_register_ext(dev, &led->cdev, &init_data);
 	if (rc < 0)
 		return rc;
 
-- 
2.26.2

