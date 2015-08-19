From: Jacek Anaszewski <j.anaszewski@samsung.com>
Subject: [PATCH] MAINTAINERS: Change LED subsystem git tree URL
Date: Wed, 19 Aug 2015 12:47:41 +0200
Message-ID: <1439981261-9786-1-git-send-email-j.anaszewski@samsung.com>
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:57743 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752047AbbHSKrx (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Wed, 19 Aug 2015 06:47:53 -0400
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, Bryan Wu <cooloney@gmail.com>, Richard Purdie <rpurdie@rpsys.net>

This patch removes Bryan Wu from the list of LED subsystem
maintainers and replaces related git tree URL with the one
maintained by Jacek Anaszewski.

Signed-off-by: Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Bryan Wu <cooloney@gmail.com>
Cc: Richard Purdie <rpurdie@rpsys.net>
---
 MAINTAINERS |    3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 569568f..f8ebbef 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -6040,11 +6040,10 @@ F:	Documentation/scsi/53c700.txt
 F:	drivers/scsi/53c700*
 
 LED SUBSYSTEM
-M:	Bryan Wu <cooloney@gmail.com>
 M:	Richard Purdie <rpurdie@rpsys.net>
 M:	Jacek Anaszewski <j.anaszewski@samsung.com>
 L:	linux-leds@vger.kernel.org
-T:	git git://git.kernel.org/pub/scm/linux/kernel/git/cooloney/linux-leds.git
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/j.anaszewski/linux-leds.git
 S:	Maintained
 F:	drivers/leds/
 F:	include/linux/leds.h
-- 
1.7.9.5
