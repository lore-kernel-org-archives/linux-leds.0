From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [patch] leds: tca6507: silence an uninitialized variable warning
Date: Thu, 14 Apr 2016 12:36:16 +0300
Message-ID: <20160414093616.GH16549@mwanda>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-kernel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
To: Richard Purdie <rpurdie@rpsys.net>
Cc: Jacek Anaszewski <j.anaszewski@samsung.com>, linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
List-Id: linux-leds@vger.kernel.org

If choose_times() returns -EINVAL that means "c1" and "c2" haven't been
initialized.  I've added a check for that.

Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

diff --git a/drivers/leds/leds-tca6507.c b/drivers/leds/leds-tca6507.c
index c548ea1..45222a7 100644
--- a/drivers/leds/leds-tca6507.c
+++ b/drivers/leds/leds-tca6507.c
@@ -327,6 +327,8 @@ static void set_times(struct tca6507_chip *tca, int bank)
 	int result;
 
 	result = choose_times(tca->bank[bank].ontime, &c1, &c2);
+	if (result < 0)
+		return;
 	dev_dbg(&tca->client->dev,
 		"Chose on  times %d(%d) %d(%d) for %dms\n",
 		c1, time_codes[c1],
