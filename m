Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4CEA7C433FE
	for <linux-leds@archiver.kernel.org>; Thu,  3 Nov 2022 02:14:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230214AbiKCCOl (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Wed, 2 Nov 2022 22:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbiKCCOj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Wed, 2 Nov 2022 22:14:39 -0400
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50B3C6377
        for <linux-leds@vger.kernel.org>; Wed,  2 Nov 2022 19:14:39 -0700 (PDT)
Received: from dggpemm500021.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4N2nPk2qxdzHvKF;
        Thu,  3 Nov 2022 10:14:18 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500021.china.huawei.com (7.185.36.109) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Thu, 3 Nov 2022 10:14:37 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Thu, 3 Nov
 2022 10:14:37 +0800
From:   Yang Yingliang <yangyingliang@huawei.com>
To:     <linux-leds@vger.kernel.org>
CC:     <pavel@ucw.cz>, <corbet@lwn.net>, <yangyingliang@huawei.com>
Subject: [PATCH] Documentation: devres: add missing LED helpers
Date:   Thu, 3 Nov 2022 10:13:31 +0800
Message-ID: <20221103021331.1007699-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Content-Type:   text/plain; charset=US-ASCII
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add some missing device-managed helpers of led to devres.rst.

devm_led_classdev_register_ext() is introduced by commit b2b998c0f944 ("leds:
class: Improve LED and LED flash class registration API").

devm_led_trigger_register() is introduced by commit 9534cc31dda2 ("leds: core:
add managed version of led_trigger_register").

devm_of_led_get() is introduced by commit e389240ad992 ("leds: Add managed
API to get a LED from a device driver").

Fixes: b2b998c0f944 ("leds: class: Improve LED and LED flash class registration API")
Fixes: 9534cc31dda2 ("leds: core: add managed version of led_trigger_register")
Fixes: e389240ad992 ("leds: Add managed API to get a LED from a device driver")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 Documentation/driver-api/driver-model/devres.rst | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 08e5ba810eb0..e0cb7df0f782 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -339,7 +339,10 @@ IRQ
 
 LED
   devm_led_classdev_register()
+  devm_led_classdev_register_ext()
   devm_led_classdev_unregister()
+  devm_led_trigger_register()
+  devm_of_led_get()
 
 MDIO
   devm_mdiobus_alloc()
-- 
2.25.1

