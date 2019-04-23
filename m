From: Dan Murphy <dmurphy@ti.com>
Subject: [PATCH] MAINTAINERS: LEDs: Add designated reviewer for LED subsystem
Date: Tue, 23 Apr 2019 15:00:24 -0500
Message-ID: <20190423200024.29538-1-dmurphy@ti.com>
Mime-Version: 1.0
Content-Type: text/plain
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, Dan Murphy <dmurphy@ti.com>
List-Id: linux-leds@vger.kernel.org

Add a designated reviewer for the LED subsystem as there
are already two maintainers assigned.

Signed-off-by: Dan Murphy <dmurphy@ti.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3671fdea5010..ee0b10484194 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8708,6 +8708,7 @@ F:	scripts/leaking_addresses.pl
 LED SUBSYSTEM
 M:	Jacek Anaszewski <jacek.anaszewski@gmail.com>
 M:	Pavel Machek <pavel@ucw.cz>
+R:	Dan Murphy <dmurphy@ti.com>
 L:	linux-leds@vger.kernel.org
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 S:	Maintained
-- 
2.21.0.5.gaeb582a983
