From: Anders Roxell <anders.roxell@linaro.org>
Subject: [PATCH] leds: lp55xx: fix warning unused label 'out'
Date: Thu, 14 Feb 2019 21:58:12 +0100
Message-ID: <20190214205812.7311-1-anders.roxell@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-kernel-owner@vger.kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
To: jacek.anaszewski@gmail.com, pavel@ucw.cz
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Anders Roxell <anders.roxell@linaro.org>
List-Id: linux-leds@vger.kernel.org

When building leds lp55xx a waring about label 'out' defined but not used.

drivers/leds/leds-lp55xx-common.c: In function ‘lp55xx_firmware_loaded’:
drivers/leds/leds-lp55xx-common.c:217:1: warning: label ‘out’ defined but not used [-Wunused-label]
 out:
 ^~~

Rework current code to remove the label 'out'.

905c2157dd19 ("leds: lp55xx: fix null deref on firmware load failure")
Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
---
 drivers/leds/leds-lp55xx-common.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/leds/leds-lp55xx-common.c b/drivers/leds/leds-lp55xx-common.c
index 64986f0fd367..723f2f17497a 100644
--- a/drivers/leds/leds-lp55xx-common.c
+++ b/drivers/leds/leds-lp55xx-common.c
@@ -214,7 +214,6 @@ static void lp55xx_firmware_loaded(const struct firmware *fw, void *context)
 
 	mutex_unlock(&chip->lock);
 
-out:
 	/* firmware should be released for other channel use */
 	release_firmware(chip->fw);
 	chip->fw = NULL;
-- 
2.19.2
