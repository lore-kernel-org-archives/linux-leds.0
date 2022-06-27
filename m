Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DD9C433EF
	for <linux-leds@archiver.kernel.org>; Mon, 27 Jun 2022 13:31:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235866AbiF0Nbl (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Mon, 27 Jun 2022 09:31:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235896AbiF0Nbi (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Mon, 27 Jun 2022 09:31:38 -0400
Received: from mail.schwermer.no (mail.schwermer.no [49.12.228.226])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCC9464C3
        for <linux-leds@vger.kernel.org>; Mon, 27 Jun 2022 06:31:36 -0700 (PDT)
X-Virus-Scanned: Yes
From:   Sven Schwermer <sven@svenschwermer.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=svenschwermer.de;
        s=mail; t=1656336692;
        bh=xp7razw0uPvC8xFIGGr8I3jFQ4nfElAHDfBd4aGLeSI=;
        h=From:To:Cc:Subject;
        b=GWdXnCdI/+iXntNIoiY/jjvLBaTgbHxlFKlRfeJenhOguwfM+4D2acga7X1eQTU8z
         dvHMhioObXuVBbzjbghdjIr9YLI4KnISMR73Xp1OsLC3xulQcQ+dLTymz5zbN1SvIA
         RukA/jQO6X4Ks3ErhYAb8qR2UV4KoxfVi31c6EEzzWFjhXTzURQFbMmulNVttFLD6t
         RbNoSoehN8N19vrUkaMk1wZwtwRFHwZ+WRXQ6aDJm+B2F0lFNPp7q/FQcVWzTeMKXM
         LZtButqJ93GdOBe3PlShjqba/yevSjOzZTcFfDvTAUuXuhwoVY9lyQ5WN1eJVhmT6t
         7HUM/csMa4Vaw==
To:     linux-leds@vger.kernel.org
Cc:     Sven Schwermer <sven.schwermer@disruptive-technologies.com>,
        jacek.anaszewski@gmail.com, schuchmann@schleissheimer.de,
        pavel@ucw.cz
Subject: [PATCH RESEND v2] led: multicolor: Fix intensity setting while SW blinking
Date:   Mon, 27 Jun 2022 15:31:10 +0200
Message-Id: <20220627133110.271455-1-sven@svenschwermer.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

From: Sven Schwermer <sven.schwermer@disruptive-technologies.com>

When writing to the multi_intensity file, don't unconditionally call
led_set_brightness. By only doing this if blinking is inactive we
prevent blinking from stopping if the blinking is in its off phase while
the file is written.

Instead, if blinking is active, the changed intensity values are applied
upon the next blink. This is consistent with changing the brightness on
monochrome LEDs with active blinking.

Suggested-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Tested-by: Sven Schuchmann <schuchmann@schleissheimer.de>
Acked-by: Jacek Anaszewski <jacek.anaszewski@gmail.com>
Signed-off-by: Sven Schwermer <sven.schwermer@disruptive-technologies.com>
---

Notes:
    V1->V2: Change title, add tags

 drivers/leds/led-class-multicolor.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-multicolor.c b/drivers/leds/led-class-multicolor.c
index e317408583df..5b1479b5d32c 100644
--- a/drivers/leds/led-class-multicolor.c
+++ b/drivers/leds/led-class-multicolor.c
@@ -59,7 +59,8 @@ static ssize_t multi_intensity_store(struct device *dev,
 	for (i = 0; i < mcled_cdev->num_colors; i++)
 		mcled_cdev->subled_info[i].intensity = intensity_value[i];
 
-	led_set_brightness(led_cdev, led_cdev->brightness);
+	if (!test_bit(LED_BLINK_SW, &led_cdev->work_flags))
+		led_set_brightness(led_cdev, led_cdev->brightness);
 	ret = size;
 err_out:
 	mutex_unlock(&led_cdev->led_access);

base-commit: 210e04ff768142b96452030c4c2627512b30ad95
-- 
2.36.1

