Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62176ECAAD5
	for <linux-leds@archiver.kernel.org>; Sat, 10 Sep 2022 08:58:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229562AbiIJI64 (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 10 Sep 2022 04:58:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229498AbiIJI6y (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 10 Sep 2022 04:58:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D12026E
        for <linux-leds@vger.kernel.org>; Sat, 10 Sep 2022 01:58:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1662800330;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=h1ev4Iq5srlCtFJJFo0aMKoiZxUim5Hk4htJzlg+ByI=;
        b=GgZNfqQ6c5ZnLW2XSTgd4RSmjSxrnCiqIBFDlQuzN0ng/RdbtKTp/tjfGBlMYVSRHmvi0C
        2LBqhrJyDU9QCXK54MbA3NOlsaPx6uAc+Dm8PVOcux0qMS+V6TecL+/bgi+6aBwHYDVU5W
        MpvzirhKTNuMdbO5isoPbWWxhopblyI=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-562-RubJx-UXNAaH4vIOkQ4Ifw-1; Sat, 10 Sep 2022 04:58:46 -0400
X-MC-Unique: RubJx-UXNAaH4vIOkQ4Ifw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 505F38037AF;
        Sat, 10 Sep 2022 08:58:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.59])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4C43F2026D4C;
        Sat, 10 Sep 2022 08:58:45 +0000 (UTC)
From:   Hans de Goede <hdegoede@redhat.com>
To:     Pavel Machek <pavel@ucw.cz>,
        Henning Schild <henning.schild@siemens.com>
Cc:     Hans de Goede <hdegoede@redhat.com>,
        platform-driver-x86@vger.kernel.org, linux-leds@vger.kernel.org,
        kernel test robot <lkp@intel.com>
Subject: [PATCH] leds: simatic-ipc-leds-gpio: Make simatic_ipc_led_gpio_table static
Date:   Sat, 10 Sep 2022 10:58:36 +0200
Message-Id: <20220910085836.84962-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

simatic_ipc_led_gpio_table is only used inside simatic-ipc-leds-gpio.c,
make it static.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
Note since this is a fix to a patch which I merged through the pdx86
tree I plan to merge this today through the pdx86 tree as well.
---
 drivers/leds/simple/simatic-ipc-leds-gpio.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/simple/simatic-ipc-leds-gpio.c b/drivers/leds/simple/simatic-ipc-leds-gpio.c
index 0d73dcbeec2d..b9eeb8702df0 100644
--- a/drivers/leds/simple/simatic-ipc-leds-gpio.c
+++ b/drivers/leds/simple/simatic-ipc-leds-gpio.c
@@ -15,7 +15,7 @@
 #include <linux/platform_device.h>
 #include <linux/platform_data/x86/simatic-ipc-base.h>
 
-struct gpiod_lookup_table *simatic_ipc_led_gpio_table;
+static struct gpiod_lookup_table *simatic_ipc_led_gpio_table;
 
 static struct gpiod_lookup_table simatic_ipc_led_gpio_table_127e = {
 	.dev_id = "leds-gpio",
-- 
2.37.2

