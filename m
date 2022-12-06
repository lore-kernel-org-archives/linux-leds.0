Return-Path: <linux-leds-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96FF9C352A1
	for <linux-leds@archiver.kernel.org>; Tue,  6 Dec 2022 10:45:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234126AbiLFKpd (ORCPT <rfc822;linux-leds@archiver.kernel.org>);
        Tue, 6 Dec 2022 05:45:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41468 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234051AbiLFKpc (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Tue, 6 Dec 2022 05:45:32 -0500
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7EA610B51
        for <linux-leds@vger.kernel.org>; Tue,  6 Dec 2022 02:45:31 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 6289CB818EF
        for <linux-leds@vger.kernel.org>; Tue,  6 Dec 2022 10:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 902FCC433C1;
        Tue,  6 Dec 2022 10:45:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1670323529;
        bh=fXRaOV6zUmUR5p2JRVhzmKwuhABkVFz/he3+DaUgoCI=;
        h=From:To:Cc:Subject:Date:From;
        b=Qee/yAFHD48qAyc/Bo6Bdc85B7G+8mTRc4fVl2o2WNQ4PezpqWU8ICqJRtXKHlZCn
         JrWO8jQmLMVAHGbGOJmYWNqmrImONNQ8lbU3od6PGf1y39QbfpIsxKYkVGH8kXL1hn
         ZCPn4rpvAr5RJLlbR1TPGuMz4TnTPeZpsVqxyQptHiU6kQb3icAgN4XjHVoBVj7TE2
         xFj6b4zwzD0WaTYhRohnie4vjdhPsPCPh4hIFnMplv4YkTTvNIi/Gn6ch0RR7ozeea
         jCHvyI9P56q6FpKAIdT5GGH2TfH72aXbYwsJ8A849yvl1pr9udddFXAUNRMT9Y7HNz
         5jfmfweCFQt1Q==
From:   Lee Jones <lee@kernel.org>
To:     pavel@ucw.cz
Cc:     andriy.shevchenko@linux.intel.com, krzysztof.kozlowski@linaro.org,
        gregkh@linuxfoundation.org, linux-leds@vger.kernel.org,
        Lee Jones <lee@kernel.org>
Subject: [PATCH 1/1] MAINTAINERS: Add additional co-maintainer to LEDs
Date:   Tue,  6 Dec 2022 10:45:10 +0000
Message-Id: <20221206104510.123817-1-lee@kernel.org>
X-Mailer: git-send-email 2.39.0.rc0.267.gcb52ba06e7-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-leds.vger.kernel.org>
X-Mailing-List: linux-leds@vger.kernel.org

Add myself as co-maintainer for the LED subsystem,
in support of Pavel during busy times.

Suggested-by: Pavel Machek <pavel@ucw.cz>
Signed-off-by: Lee Jones <lee@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8bea25ac61964..6591462661d6c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11701,6 +11701,7 @@ F:	scripts/leaking_addresses.pl
 
 LED SUBSYSTEM
 M:	Pavel Machek <pavel@ucw.cz>
+M:	Lee Jones <lee@kernel.org>
 L:	linux-leds@vger.kernel.org
 S:	Maintained
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pavel/linux-leds.git
-- 
2.39.0.rc0.267.gcb52ba06e7-goog

