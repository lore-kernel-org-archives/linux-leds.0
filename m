Return-Path: <SRS0=SVrG=C2=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BD9CC43464
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:37:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6AF02214D8
	for <linux-leds@archiver.kernel.org>; Thu, 17 Sep 2020 22:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nic.cz header.i=@nic.cz header.b="CMNq3jgX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726906AbgIQWg6 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 17 Sep 2020 18:36:58 -0400
Received: from mail.nic.cz ([217.31.204.67]:35544 "EHLO mail.nic.cz"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726126AbgIQWd7 (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Thu, 17 Sep 2020 18:33:59 -0400
Received: from dellmb.labs.office.nic.cz (unknown [IPv6:2001:1488:fffe:6:cac7:3539:7f1f:463])
        by mail.nic.cz (Postfix) with ESMTP id 3D8E8140A85;
        Fri, 18 Sep 2020 00:33:54 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=nic.cz; s=default;
        t=1600382034; bh=w0VTf8xLT7i3JlWTDmTp8v8/O+TbzLFJV1MeEcUgegw=;
        h=From:To:Date;
        b=CMNq3jgXWbgNa+C7BlS2IwtRc6mGe5gwlTa6CDaePUn5+MH8CPj3EGdX4mVY4tCWe
         oNFOyBpXn9ZmsK1NXB7RQVDyplaeJYuGGxzIITB2mIA/6iki14ke46KjfIUq+qtzhi
         aBWb7bLwLBzn8MJ5DAd41oqCecHq6mUWsOyXwzI4=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, Dan Murphy <dmurphy@ti.com>,
        =?UTF-8?q?Ond=C5=99ej=20Jirman?= <megous@megous.com>,
        linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        devicetree@vger.kernel.org,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <marek.behun@nic.cz>,
        Daniel Mack <daniel@caiaq.de>
Subject: [PATCH leds v2 07/50] leds: lt3593: do not rewrite .of_node of new LED device to wrong value
Date:   Fri, 18 Sep 2020 00:32:55 +0200
Message-Id: <20200917223338.14164-8-marek.behun@nic.cz>
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

The devm_led_classdev_register_ext is given init_data with fwnode set,
so the LED core sets .of_node of the new LED classdev correctly.

Do not rewrite this value to parent of_node.

Signed-off-by: Marek Behún <marek.behun@nic.cz>
Cc: Daniel Mack <daniel@caiaq.de>
---
 drivers/leds/leds-lt3593.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-lt3593.c b/drivers/leds/leds-lt3593.c
index c2d7ffebacc56..061f02e3995ae 100644
--- a/drivers/leds/leds-lt3593.c
+++ b/drivers/leds/leds-lt3593.c
@@ -107,7 +107,6 @@ static int lt3593_led_probe(struct platform_device *pdev)
 		return ret;
 	}
 
-	led_data->cdev.dev->of_node = dev->of_node;
 	platform_set_drvdata(pdev, led_data);
 
 	return 0;
-- 
2.26.2

