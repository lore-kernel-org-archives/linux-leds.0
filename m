From: Amitesh Singh <singh.amitesh@gmail.com>
Subject: [PATCH] leds: oneshot - Allow default delay to be passed as an
 argument
Date: Sat, 3 Sep 2016 14:09:25 +0530
Message-ID: <20160903083921.GA15049@ami-desktop>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mail-pf0-f196.google.com ([209.85.192.196]:36227 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751360AbcICIjh (ORCPT
        <rfc822;linux-leds@vger.kernel.org>); Sat, 3 Sep 2016 04:39:37 -0400
Received: by mail-pf0-f196.google.com with SMTP id a143so3517728pfa.3
        for <linux-leds@vger.kernel.org>; Sat, 03 Sep 2016 01:39:30 -0700 (PDT)
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>, acek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org

This patch facilates the blink delay to be passed as
an argument at the time of module loading.
e.g.
insmod ledtrigg-oneshot.ko default_delay=100
---
 drivers/leds/trigger/ledtrig-oneshot.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/leds/trigger/ledtrig-oneshot.c b/drivers/leds/trigger/ledtrig-oneshot.c
index b8ea9f0..accb241 100644
--- a/drivers/leds/trigger/ledtrig-oneshot.c
+++ b/drivers/leds/trigger/ledtrig-oneshot.c
@@ -22,6 +22,9 @@
 
 #define DEFAULT_DELAY 100
 
+static unsigned long default_delay = DEFAULT_DELAY;
+module_param(default_delay, ulong, S_IRUGO|S_IWUSR);
+
 struct oneshot_trig_data {
 	unsigned int invert;
 };
-- 
2.7.4

This patch facilates the blink delay to be passed as
    an argument at the time of module loading.
    e.g.
    insmod ledtrigg-oneshot.ko default_delay=100
