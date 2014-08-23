From: Michal Sojka <sojka@merica.cz>
Subject: [PATCH v2 1/3] usb: Add missing #include
Date: Sat, 23 Aug 2014 02:08:20 +0200
Message-ID: <1408752502-4162-2-git-send-email-sojka@merica.cz>
References: <87ha149j2z.fsf@steelpick.2x.cz>
 <1408752502-4162-1-git-send-email-sojka@merica.cz>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1408752502-4162-1-git-send-email-sojka@merica.cz>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-usb@vger.kernel.org
Cc: Michal Sojka <sojka@merica.cz>, Bryan Wu <cooloney@gmail.com>, Felipe Balbi <balbi@ti.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux LED Subsystem <linux-leds@vger.kernel.org>, linux-kernel@vger.kernel.org, michal.vokac@comap.cz
List-Id: linux-leds@vger.kernel.org

linux/usb/hcd.h needs the definition of struct usb_bus.

Signed-off-by: Michal Sojka <sojka@merica.cz>
---
 include/linux/usb/hcd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/usb/hcd.h b/include/linux/usb/hcd.h
index 485cd5e..b43f0fe 100644
--- a/include/linux/usb/hcd.h
+++ b/include/linux/usb/hcd.h
@@ -23,6 +23,7 @@
 
 #include <linux/rwsem.h>
 #include <linux/interrupt.h>
+#include <linux/usb.h>
 
 #define MAX_TOPO_LEVEL		6
 
-- 
2.1.0
