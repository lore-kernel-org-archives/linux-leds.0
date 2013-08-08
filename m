From: Milo Kim <woogyom.kim@gmail.com>
Subject: [PATCH 08/10] leds: lp5523: remove unnecessary writing commands
Date: Thu,  8 Aug 2013 16:59:52 +0900
Message-ID: <1375948794-6286-9-git-send-email-milo.kim@ti.com>
References: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <1375948794-6286-1-git-send-email-milo.kim@ti.com>
Sender: linux-kernel-owner@vger.kernel.org
To: Bryan Wu <cooloney@gmail.com>
Cc: =?UTF-8?q?Pali=20Roh=C3=A1r?= <pali.rohar@gmail.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, Milo Kim <milo.kim@ti.com>
List-Id: linux-leds@vger.kernel.org

This patch reduces the number of programming commands.

(Count of sending commands)
Old code: 32 + program size (32 counts for clearing program memory)
New code: 32

Pattern buffer is initialized to 0 in this function.
Just update new program data and remaining buffers are filled with 0.
So it's needless to clear whole area.

Signed-off-by: Milo Kim <milo.kim@ti.com>
---
 drivers/leds/leds-lp5523.c |   14 +++-----------
 1 file changed, 3 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/leds-lp5523.c b/drivers/leds/leds-lp5523.c
index 9b8be6f6..fe3bcbb 100644
--- a/drivers/leds/leds-lp5523.c
+++ b/drivers/leds/leds-lp5523.c
@@ -312,17 +312,11 @@ static int lp5523_update_program_memory(struct lp55xx_chip *chip,
 	u8 pattern[LP5523_PROGRAM_LENGTH] = {0};
 	unsigned cmd;
 	char c[3];
-	int update_size;
 	int nrchars;
-	int offset = 0;
 	int ret;
-	int i;
-
-	/* clear program memory before updating */
-	for (i = 0; i < LP5523_PROGRAM_LENGTH; i++)
-		lp55xx_write(chip, LP5523_REG_PROG_MEM + i, 0);
+	int offset = 0;
+	int i = 0;
 
-	i = 0;
 	while ((offset < size - 1) && (i < LP5523_PROGRAM_LENGTH)) {
 		/* separate sscanfs because length is working only for %s */
 		ret = sscanf(data + offset, "%2s%n ", c, &nrchars);
@@ -342,11 +336,9 @@ static int lp5523_update_program_memory(struct lp55xx_chip *chip,
 	if (i % 2)
 		goto err;
 
-	update_size = i;
-
 	mutex_lock(&chip->lock);
 
-	for (i = 0; i < update_size; i++) {
+	for (i = 0; i < LP5523_PROGRAM_LENGTH; i++) {
 		ret = lp55xx_write(chip, LP5523_REG_PROG_MEM + i, pattern[i]);
 		if (ret) {
 			mutex_unlock(&chip->lock);
-- 
1.7.9.5
