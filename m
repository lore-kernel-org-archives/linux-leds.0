Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 160D5C433F5
	for <linux-leds@archiver.kernel.org>; Thu,  5 May 2022 08:07:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346380AbiEEIKk (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Thu, 5 May 2022 04:10:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43356 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346334AbiEEIKj (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Thu, 5 May 2022 04:10:39 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3877633E89;
        Thu,  5 May 2022 01:07:01 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id E182EB82BC9;
        Thu,  5 May 2022 08:06:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89BE0C385A4;
        Thu,  5 May 2022 08:06:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1651738018;
        bh=UNwgFxzOyBVqYbS3oWBRtI1/gUf7FweC/XLn5kiiO0k=;
        h=From:To:Cc:Subject:Date:From;
        b=P2ISyc72rtdI5UOj6t6FmX205voGerlKmzkyqq70JcvMTgEa0gdjjQeBa0hMHFxwE
         HoAsJ+fe8olWrJxMDTZDP6ZOgi1C4bWzFeCTe/hIqH2vr1rGtgrVR1HtdK8IZIBwL8
         xcyBBTvASnpvIfdjDxVc7QL7WEP0/+EJVHpuIfWpVVoJviYjf72LubQ4DQa3r16HS0
         P/YLPz5qr1uJpFEcwcGQWxXNTH4MRHr473h82ZeJMpkenvEOy3zYwSSr2MpXooAbco
         ZRTri52R5cdVTWdKmrjnYsz6T1Jow+lgveg+YqNlCX6SEhXYM/40YqiOZafpvhNmgJ
         OgFoj/Qwrs1wg==
Received: from johan by xi.lan with local (Exim 4.94.2)
        (envelope-from <johan+linaro@kernel.org>)
        id 1nmWVl-0003Dh-Qb; Thu, 05 May 2022 10:06:58 +0200
From:   Johan Hovold <johan+linaro@kernel.org>
To:     Pavel Machek <pavel@ucw.cz>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org,
        Johan Hovold <johan+linaro@kernel.org>
Subject: [PATCH] leds: qcom-lpg: add missing PWM dependency
Date:   Thu,  5 May 2022 10:03:58 +0200
Message-Id: <20220505080358.12288-1-johan+linaro@kernel.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

The Qualcomm LPG driver fails to probe unless PWM support is enabled so
add the missing Kconfig dependency.

Fixes: 24e2d05d1b68 ("leds: Add driver for Qualcomm LPG")
Signed-off-by: Johan Hovold <johan+linaro@kernel.org>
---
 drivers/leds/rgb/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/rgb/Kconfig b/drivers/leds/rgb/Kconfig
index 5dd27ad80856..1e35433d061a 100644
--- a/drivers/leds/rgb/Kconfig
+++ b/drivers/leds/rgb/Kconfig
@@ -5,6 +5,7 @@ if LEDS_CLASS_MULTICOLOR
 config LEDS_QCOM_LPG
 	tristate "LED support for Qualcomm LPG"
 	depends on OF
+	depends on PWM
 	depends on SPMI
 	help
 	  This option enables support for the Light Pulse Generator found in a
-- 
2.35.1

