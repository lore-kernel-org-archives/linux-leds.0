From: Jingoo Han <jg1.han@samsung.com>
Subject: [PATCH 2/2] leds: clevo-mail: remove unnecessary __initdata marker
Date: Fri, 28 Feb 2014 16:26:08 +0900
Message-ID: <001101cf3456$593bd940$0bb38bc0$%han@samsung.com>
References: <000c01cf3456$34b8ecc0$9e2ac640$%han@samsung.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <linux-leds-owner@vger.kernel.org>
Received: from mailout3.samsung.com ([203.254.224.33]:35859 "EHLO
	mailout3.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751157AbaB1H0K convert rfc822-to-8bit (ORCPT
	<rfc822;linux-leds@vger.kernel.org>); Fri, 28 Feb 2014 02:26:10 -0500
Received: from epcpsbgr1.samsung.com
 (u141.gpu120.samsung.co.kr [203.254.230.141])
 by mailout3.samsung.com (Oracle Communications Messaging Server 7u4-24.01
 (7.0.4.24.0) 64bit (built Nov 17 2011))
 with ESMTP id <0N1P00DLK3BLFYB0@mailout3.samsung.com> for
 linux-leds@vger.kernel.org; Fri, 28 Feb 2014 16:26:09 +0900 (KST)
In-reply-to: <000c01cf3456$34b8ecc0$9e2ac640$%han@samsung.com>
Content-language: ko
Sender: linux-leds-owner@vger.kernel.org
List-Id: linux-leds@vger.kernel.org
To: 'Bryan Wu' <cooloney@gmail.com>
Cc: linux-leds@vger.kernel.org, 'Richard Purdie' <rpurdie@rpsys.net>, 'Jingoo Han' <jg1.han@samsung.com>, =?ISO-8859-1?Q?'M=E1rton_N=E9meth'?= <nm127@freemail.hu>, =?ISO-8859-1?Q?'Uwe_Kleine-K=F6nig'?= <u.kleine-koenig@pengutronix.de>, 'Ondrej Zary' <linux@rainbow-software.org>

Remove unnecessary __initdata marker, because it is not right
for a module parameter. It may make the kernel oops problem.

Signed-off-by: Jingoo Han <jg1.han@samsung.com>
---
 drivers/leds/leds-clevo-mail.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/leds-clevo-mail.c b/drivers/leds/leds-clevo-m=
ail.c
index d93e245..19202f5 100644
--- a/drivers/leds/leds-clevo-mail.c
+++ b/drivers/leds/leds-clevo-mail.c
@@ -19,7 +19,7 @@ MODULE_AUTHOR("M=E1rton N=E9meth <nm127@freemail.hu>"=
);
 MODULE_DESCRIPTION("Clevo mail LED driver");
 MODULE_LICENSE("GPL");
=20
-static bool __initdata nodetect;
+static bool nodetect;
 module_param_named(nodetect, nodetect, bool, 0);
 MODULE_PARM_DESC(nodetect, "Skip DMI hardware detection");
=20
--=20
1.7.10.4
