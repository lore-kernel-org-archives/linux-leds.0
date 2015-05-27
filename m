From: Pavel Machek <pavel@ucw.cz>
Subject: CPU LED trigger: add hooks to generic code so that it works on x86
Date: Wed, 27 May 2015 08:57:12 +0200
Message-ID: <20150527065712.GA4415@amd>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:38332 "EHLO
	atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750812AbbE0G5O (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 27 May 2015 02:57:14 -0400
Content-Disposition: inline
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: mingo@redhat.com, peterz@infradead.org, linux-kernel@vger.kernel.org, cooloney@gmail.com, rpurdie@rpsys.net, j.anaszewski@samsung.com, linux-leds@vger.kernel.org


CPU LED trigger hooks are currently hidden in arm-specific code, which
means that this trigger only works on arm. Add it to the generic
code, so that it works on x86, too.

Signed-off-by: Pavel Machek <pavel@ucw.cz>

diff --git a/kernel/sched/idle.c b/kernel/sched/idle.c
index fefcb1f..087acd6 100644
--- a/kernel/sched/idle.c
+++ b/kernel/sched/idle.c
@@ -8,6 +8,7 @@
 #include <linux/mm.h>
 #include <linux/stackprotector.h>
 #include <linux/suspend.h>
+#include <linux/leds.h>
 
 #include <asm/tlb.h>
 
@@ -232,6 +233,7 @@ static void cpu_idle_loop(void)
 			}
 
 			local_irq_disable();
+			ledtrig_cpu(CPU_LED_IDLE_START);
 			arch_cpu_idle_enter();
 
 			/*
@@ -249,6 +251,7 @@ static void cpu_idle_loop(void)
 				cpuidle_idle_call();
 
 			arch_cpu_idle_exit();
+			ledtrig_cpu(CPU_LED_IDLE_END);
 		}
 
 		/*

-- 
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html
