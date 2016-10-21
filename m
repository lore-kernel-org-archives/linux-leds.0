From: Javier Martinez Canillas <javier@osg.samsung.com>
Subject: [PATCH] leds: netxbig: fix module autoload for OF registration
Date: Fri, 21 Oct 2016 12:52:05 -0300
Message-ID: <1477065125-20877-1-git-send-email-javier@osg.samsung.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: linux-kernel@vger.kernel.org
Cc: Javier Martinez Canillas <javier@osg.samsung.com>, Jacek Anaszewski <j.anaszewski@samsung.com>, Richard Purdie <rpurdie@rpsys.net>, linux-leds@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

If the driver is built as a module, autoload won't work because the module
alias information is not filled. So user-space can't match the registered
device with the corresponding module.

Export the module alias information using the MODULE_DEVICE_TABLE() macro.

Before this patch:

$ modinfo drivers/leds//leds-netxbig.ko | grep alias
alias:          platform:leds-netxbig

After this patch:

$ modinfo drivers/leds//leds-netxbig.ko | grep alias
alias:          platform:leds-netxbig
alias:          of:N*T*Clacie,netxbig-ledsC*
alias:          of:N*T*Clacie,netxbig-leds

Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
---

 drivers/leds/leds-netxbig.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/leds/leds-netxbig.c b/drivers/leds/leds-netxbig.c
index 4b88b93244be..f48b1aed9b4e 100644
--- a/drivers/leds/leds-netxbig.c
+++ b/drivers/leds/leds-netxbig.c
@@ -534,6 +534,7 @@ static const struct of_device_id of_netxbig_leds_match[] = {
 	{ .compatible = "lacie,netxbig-leds", },
 	{},
 };
+MODULE_DEVICE_TABLE(of, of_netxbig_leds_match);
 #else
 static inline int
 netxbig_leds_get_of_pdata(struct device *dev,
-- 
2.7.4
