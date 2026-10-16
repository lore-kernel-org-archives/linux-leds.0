Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8B093955EF;
	Fri, 16 Oct 2026 10:05:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792145159; cv=none; b=PXpmK055xJXDN9iII6uMoS1e7oaA9F/H5e5R16Mov3wrC04zH8QjqKO5xoeWNgzOzN0/CjVu+1bthHhf0TpAtBaxkz/K7IFh34w1ylbF28yXE0n90lsNzmEM8D7re26HJiFd3zFFqyQqXzTHNjqX/TmPv3by1WTl+W7lq/UqwlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792145159; c=relaxed/simple;
	bh=jMP9xWVP3MTXKZSoK8lHLONBBSINFKbVc9BDHQs01h0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NpYNqMyeRsLoUQHA+J/u0ZXsD7jhP3BByRkVM0CPsHhW6BbmFJRUNlFDFuTebPia85rddH4QgkEre4ZJmQLbQHT6M5jL+zFMIusuWxfy5jqA9mJDTTfUHpNdiwak5uiUZnxtBkuSk5sGVbmstUC6c52KbH0E6wDWx08RPIuMfdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=I3S6G4wx; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="I3S6G4wx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=Wi
	8S1+LriFyZhbXGD1m1JtXH0VoUOQZRUBcuqbclCls=; b=I3S6G4wxUoUQwR2+jq
	1fkhjsbuGsOjjemD/A6LDsVpvDvpvVT+EDhMO4J8oPDQW+PgbVZ/QHQhR62POWSR
	Wd+bBWg3EmeS3gSxaLaI0QB/lI9PQ82su5+bH1ZtOEssD5gDkNerl67mxjKeWPSW
	7LL1Fp+nu4eu8T+D1Q7BR7qNs=
Received: from pc.localdomain (unknown [])
	by gzga-smtp-mtada-g1-4 (Coremail) with SMTP id _____wD332+29tFqQfLjAA--.14422S3;
	Fri, 16 Oct 2026 18:04:41 +0800 (CST)
From: Jiale Yao <yaojiale02@163.com>
To: Matthias Fend <matthias.fend@emfend.at>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Jiale Yao <yaojiale02@163.com>
Subject: [PATCH 1/2] leds: tps6131x: queue torch refresh work on freezable workqueue
Date: Fri, 16 Oct 2026 18:04:34 +0800
Message-Id: <20261016100435.2581303-2-yaojiale02@163.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261016100435.2581303-1-yaojiale02@163.com>
References: <20261016100435.2581303-1-yaojiale02@163.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:_____wD332+29tFqQfLjAA--.14422S3
X-Coremail-Antispam: 1Uf129KBjvJXoW7Ar15Cw4fuw17XrWfGrWUXFb_yoW8Zry7pF
	Z0yr4jkr4ktFZ2qa9IvF4kWryaganFy34kKr97K34UZw1rAF1FqFyrur15JF1vyrW8uw18
	Kr4fXr97XF4Yyr7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0pEt80JUUUUU=
X-CM-SenderInfo: x1dryxhdohiji6rwjhhfrp/xtbCzh-7NmrR9r-hegAA31

The torch watchdog refresh work performs I2C register writes and
reschedules itself every ten seconds while the torch is enabled. Since
schedule_delayed_work() uses the non-freezable system workqueue, the
callback can run after the I2C adapter has been suspended.

Queue the refresh on system_freezable_wq so it is frozen before devices
are suspended and resumed only after they become available again.

Signed-off-by: Jiale Yao <yaojiale02@163.com>
---
 drivers/leds/flash/leds-tps6131x.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/leds/flash/leds-tps6131x.c b/drivers/leds/flash/leds-tps6131x.c
index 5c9a5af5af05..841a6538e75e 100644
--- a/drivers/leds/flash/leds-tps6131x.c
+++ b/drivers/leds/flash/leds-tps6131x.c
@@ -11,6 +11,7 @@
 #include <linux/leds.h>
 #include <linux/module.h>
 #include <linux/regmap.h>
+#include <linux/workqueue.h>
 #include <media/v4l2-flash-led-class.h>
 
 #define TPS6131X_REG_0				0x00
@@ -307,8 +308,9 @@ static void tps6131x_torch_refresh_handler(struct work_struct *work)
 		return;
 	}
 
-	schedule_delayed_work(&tps6131x->torch_refresh_work,
-			      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
+	queue_delayed_work(system_freezable_wq,
+			   &tps6131x->torch_refresh_work,
+			   TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
 }
 
 static int tps6131x_brightness_set(struct led_classdev *cdev, enum led_brightness brightness)
@@ -367,8 +369,9 @@ static int tps6131x_brightness_set(struct led_classdev *cdev, enum led_brightnes
 	 * To prevent this, the mode must be refreshed within the watchdog timeout.
 	 */
 	if (brightness)
-		schedule_delayed_work(&tps6131x->torch_refresh_work,
-				      TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
+		queue_delayed_work(system_freezable_wq,
+				   &tps6131x->torch_refresh_work,
+				   TPS6131X_TORCH_REFRESH_INTERVAL_JIFFIES);
 
 	return 0;
 }
-- 
2.34.1

