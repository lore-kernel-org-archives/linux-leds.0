From: Rasmus Villemoes <linux@rasmusvillemoes.dk>
Subject: [RFC 3/7] leds: avoid fragile sprintf use
Date: Tue,  8 Mar 2016 21:40:50 +0100
Message-ID: <1457469654-17059-4-git-send-email-linux@rasmusvillemoes.dk>
References: <CAGXu5jJ-NApCpANjfz+bAEfwZJ8xizkM-jDHVhOPCzhxV-aqdA@mail.gmail.com>
 <1457469654-17059-1-git-send-email-linux@rasmusvillemoes.dk>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1457469654-17059-1-git-send-email-linux@rasmusvillemoes.dk>
Sender: linux-kernel-owner@vger.kernel.org
To: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Richard Purdie <rpurdie@rpsys.net>, Jacek Anaszewski <j.anaszewski@samsung.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

Passing overlapping src and dst buffers to sprintf is fragile (and
undefined behaviour). So while this may seem like a clever way of
appending a newline and obtaining the length of the resulting string
at the same time, we might as well use that pbuf points to the current
end of string and do the same thing with an assignment, increment and
pointer subtraction.

Signed-off-by: Rasmus Villemoes <linux@rasmusvillemoes.dk>
---
 drivers/leds/led-class-flash.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index cf398275a53c..4fae548a7822 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -212,7 +212,8 @@ static ssize_t flash_fault_show(struct device *dev,
 		mask <<= 1;
 	}
 
-	return sprintf(buf, "%s\n", buf);
+	*pbuf++ = '\n';
+	return pbuf - buf;
 }
 static DEVICE_ATTR_RO(flash_fault);
 
-- 
2.1.4
