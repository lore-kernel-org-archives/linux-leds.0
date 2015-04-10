From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch 2/2 v2] leds: netxbig: silence a static checker warning
Date: Fri, 10 Apr 2015 11:30:41 +0300
Message-ID: <20150410083040.GA2189@mwanda>
References: <20150410002507.GF1509@kw.sim.vm.gnt>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:23026 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753995AbbDJIbG (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 10 Apr 2015 04:31:06 -0400
Content-Disposition: inline
In-Reply-To: <20150410002507.GF1509@kw.sim.vm.gnt>
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>, Simon Guinot <simon.guinot@sequanux.org>
Cc: Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org, kernel-janitors@vger.kernel.org

Static checkers complain that "timers[i].delay_on" is an unsigned long
but we're writing to only 32 bits of it.  The code works on 32 bit
systems and little endian 64 bit systems so it doesn't cause a problem
in practise but it's still better to silence the warning.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
---
v2: use a temporary variable

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 028686f2..6cb4537 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -444,12 +444,17 @@ static int netxbig_leds_get_of_pdata(struct device *dev,
 		if (!timers)
 			return -ENOMEM;
 		for (i = 0; i < num_timers; i++) {
+			u32 delay_on = 0;
+			u32 delay_off = 0;
+
 			of_property_read_u32_index(np, "timers", 3 * i,
 						&timers[i].mode);
 			of_property_read_u32_index(np, "timers", 3 * i + 1,
-						(u32 *) &timers[i].delay_on);
+						   &delay_on);
 			of_property_read_u32_index(np, "timers", 3 * i + 2,
-						(u32 *) &timers[i].delay_off);
+						   &delay_off);
+			timers[i].delay_on = delay_on;
+			timers[i].delay_off = delay_off;
 		}
 		pdata->timer = timers;
 		pdata->num_timer = num_timers;
