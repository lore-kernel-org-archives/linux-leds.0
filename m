Return-Path: <linux-leds-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC95C0015E
	for <linux-leds@archiver.kernel.org>; Tue,  1 Aug 2023 15:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231994AbjHAPQa (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 1 Aug 2023 11:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41932 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230462AbjHAPQ3 (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 1 Aug 2023 11:16:29 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EBC38116
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 08:16:28 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 89F11615F0
        for <linux-leds@vger.kernel.org>; Tue,  1 Aug 2023 15:16:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1535C433C8;
        Tue,  1 Aug 2023 15:16:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690902988;
        bh=FH8rJp5R6yQK1ufrwsBfOUtDdA0L8GsMupAnotMfxr4=;
        h=From:To:Cc:Subject:Date:From;
        b=k39nJrJF/UfvfPhuGJKWcpn6aLIu4cCH+Qm7LrBrSXWC0SLQVv7uFx8MNqyBE9s18
         ubFl/MDVmOer7f+8UpiOGiPKcfrSeMQExo4iq6IZKqP5/QaoYfVU9GcykJdbe6RU8Y
         IslcpT32zWFVvzHAreJeY54XHDWJu0L8KDjlecXVQTAtx/zkarLbi0PDVSx7G0qtIw
         kiGigBngzPGTccbts1XwnCNM68kQjynJ9GdbiJ0wK+plT8r511piZyL4NeFDcw47c0
         M6+zjvenf8VDC0jGKjLhqjGtq1ELwVt62eG4YcW6oUY/XcSgks1/H8KCGeaTA2fr7V
         IkS8kHF/VIVgA==
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>, Lee Jones <lee@kernel.org>,
        linux-leds@vger.kernel.org
Cc:     =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
Subject: [PATCH] leds: Fix BUG_ON check for LED_COLOR_ID_MULTI that is always false
Date:   Tue,  1 Aug 2023 17:16:23 +0200
Message-ID: <20230801151623.30387-1-kabel@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

At the time we call
    BUG_ON(props.color == LED_COLOR_ID_MULTI);
the props variable is still initialized to zero.

Call the BUG_ON only after we parse fwnode into props.

Fixes: 77dce3a22e89 ("leds: disallow /sys/class/leds/*:multi:* for now")
Signed-off-by: Marek Behún <kabel@kernel.org>
---
 drivers/leds/led-core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/led-core.c b/drivers/leds/led-core.c
index b9b1295833c9..04f9ea675f2c 100644
--- a/drivers/leds/led-core.c
+++ b/drivers/leds/led-core.c
@@ -474,15 +474,15 @@ int led_compose_name(struct device *dev, struct led_init_data *init_data,
 	struct fwnode_handle *fwnode = init_data->fwnode;
 	const char *devicename = init_data->devicename;
 
-	/* We want to label LEDs that can produce full range of colors
-	 * as RGB, not multicolor */
-	BUG_ON(props.color == LED_COLOR_ID_MULTI);
-
 	if (!led_classdev_name)
 		return -EINVAL;
 
 	led_parse_fwnode_props(dev, fwnode, &props);
 
+	/* We want to label LEDs that can produce full range of colors
+	 * as RGB, not multicolor */
+	BUG_ON(props.color == LED_COLOR_ID_MULTI);
+
 	if (props.label) {
 		/*
 		 * If init_data.devicename is NULL, then it indicates that
-- 
2.41.0

