Return-Path: <SRS0=BIkm=DD=vger.kernel.org=linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDCCFC2D0A8
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 19:50:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D9EB2072E
	for <linux-leds@archiver.kernel.org>; Sat, 26 Sep 2020 19:50:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601149831;
	bh=sexwHAmbXBj5gr8F/Q86j8G4tIxPIfgsajWcWYMe5Ws=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=JWFrQNKmWICs6ynxP2bfj51t6oN0DK7eIKBTfARjrzBq1jJsjBtmaVkWCPNTNMb07
	 jVlsOvfUaBeKMqUlRHFRyB82Jx3jyEZ9BQ5/qLgVKUJZxsb6vfCBsUV/vYqKWDnQ31
	 C/z2rZhWEuhAGzAOAFpqRORdHAke0rzFm4JRdqLs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726382AbgIZTub (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Sat, 26 Sep 2020 15:50:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:43178 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726311AbgIZTub (ORCPT <rfc822;linux-leds@vger.kernel.org>);
        Sat, 26 Sep 2020 15:50:31 -0400
Received: from dellmb.labs.office.nic.cz (nat-1.nic.cz [217.31.205.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 70CE6206BE;
        Sat, 26 Sep 2020 19:43:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601149387;
        bh=sexwHAmbXBj5gr8F/Q86j8G4tIxPIfgsajWcWYMe5Ws=;
        h=From:To:Cc:Subject:Date:From;
        b=vmi9d6Vttho1fRphfTiEUuchP91jF6tSApI8POBq+nM+1nXg4su2/lwCMVX2XInxh
         Ks7H4SbPFUGRG4XS3NWnYmVSm4fJfMfSR3WPs3lG0Qsj153ipTgsYjOyiNaCV1xYGt
         3UHonSkI4Od1Gymk6hqzxBKkMk02dg6pNWZDECV0=
From:   =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>
To:     linux-leds@vger.kernel.org
Cc:     Pavel Machek <pavel@ucw.cz>, dmurphy@ti.com,
        =?UTF-8?q?Marek=20Beh=C3=BAn?= <kabel@kernel.org>,
        kernel test robot <lkp@intel.com>,
        Dan Carpenter <dan.carpenter@oracle.com>
Subject: [PATCH leds] leds: tca6507: fix potential zero passed to ERR_PTR
Date:   Sat, 26 Sep 2020 21:43:02 +0200
Message-Id: <20200926194302.22003-1-kabel@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Fix potential ERR_PTR(0).

Signed-off-by: Marek Behún <kabel@kernel.org>
Fixes: d78b10f5713d9 ("leds: tca6507: use fwnode API instead of OF")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
---
 drivers/leds/leds-tca6507.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index 4b10ef9ae221..d589c89930fd 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -727,7 +727,7 @@ tca6507_led_dt_init(struct i2c_client *client)
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret || reg >= NUM_LEDS) {
 			fwnode_handle_put(child);
-			return ERR_PTR(ret);
+			return ERR_PTR(ret ? : -EINVAL);
 		}
 
 		tca_leds[reg] = led;
-- 
2.26.2

