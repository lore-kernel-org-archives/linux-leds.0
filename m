From: Evan McClain <aeroevan@gmail.com>
Subject: [PATCH 2/2] leds: leds-chromeos-keyboard: Add ACPI _HID probing
Date: Wed, 13 Jan 2016 21:23:12 -0500
Message-ID: <1452738192-3496-1-git-send-email-aeroevan@gmail.com>
References: <1452625899-13306-1-git-send-email-sque@chromium.org>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-qg0-f67.google.com ([209.85.192.67]:36081 "EHLO
	mail-qg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751078AbcANCX1 (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 13 Jan 2016 21:23:27 -0500
Received: by mail-qg0-f67.google.com with SMTP id 6so49223865qgy.3
        for <linux-leds@vger.kernel.org>; Wed, 13 Jan 2016 18:23:27 -0800 (PST)
In-Reply-To: <1452625899-13306-1-git-send-email-sque@chromium.org>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, Simon Que <sque@chromium.org>
Cc: Duncan Laurie <dlaurie@chromium.org>, Evan McClain <aeroevan@gmail.com>

From: Duncan Laurie <dlaurie@chromium.org>

Add an ACPI ID to probe the keyboard backlight driver without
needing a platform level driver to force it on.

Signed-off-by: Duncan Laurie <dlaurie@chromium.org>
Signed-off-by: Evan McClain <aeroevan@gmail.com>
---
 drivers/leds/leds-chromeos-keyboard.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/leds/leds-chromeos-keyboard.c b/drivers/leds/leds-chromeos-keyboard.c
index 32d70c0..6a6ff75 100644
--- a/drivers/leds/leds-chromeos-keyboard.c
+++ b/drivers/leds/leds-chromeos-keyboard.c
@@ -98,10 +98,17 @@ static int keyboard_led_remove(struct platform_device *pdev)
 	return 0;
 }
 
+static const struct acpi_device_id keyboard_led_id[] = {
+	{ "GOOG0002", 0 },
+	{ }
+};
+MODULE_DEVICE_TABLE(acpi, keyboard_led_id);
+
 static struct platform_driver keyboard_led_driver = {
 	.driver		= {
 		.name	= "chromeos-keyboard-leds",
 		.owner	= THIS_MODULE,
+		.acpi_match_table = ACPI_PTR(keyboard_led_id),
 	},
 	.probe		= keyboard_led_probe,
 	.remove		= keyboard_led_remove,
-- 
2.5.0
