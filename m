Received: from cmccmta2.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3B196170A3E;
	Fri, 22 Nov 2024 06:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=111.22.67.137
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732257995; cv=none; b=uP6tDRJXa5V8IyjcQQthjgif+PvkR3SiZX/BCf+FbCVRqiuH8dL/kxuBiVCoHeHDSw6Pq6+PAYwXn1RjDhEmuw+SUwPHbPc9ewA2TzaANWfZPTSok9i3J77Ti0pa99LkqKJZvci3CD91uY0IhL2Gw+9vb8AhqQuYPnKXCsiO4/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732257995; c=relaxed/simple;
	bh=3I99lCGDgd5DvYWOxwiGxStPb4kwiHZnV+LH5iYyqCQ=;
	h=From:To:Cc:Subject:Date:Message-Id; b=ZXdohSQt+bwxyJKoCGRYiupo7pU/XZTkPw8Q0FK+OPAZXJx5kmkMv7FpaIbXQGnENPfxenSjlI3ivnEbi7GBEC+VMogcsfOQPwSYEb2IjVUmawF71RH3ZyA6reRF5VaShZK687TJgSw6qSkEP7r/U792RjqfShOpLF+vQ8H4eNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com; spf=pass smtp.mailfrom=cmss.chinamobile.com; arc=none smtp.client-ip=111.22.67.137
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee8674028c3db2-a0dfe;
	Fri, 22 Nov 2024 14:46:28 +0800 (CST)
X-RM-TRANSID:2ee8674028c3db2-a0dfe
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from ubuntu.localdomain (unknown[10.55.1.70])
	by rmsmtp-syy-appsvr06-12006 (RichMail) with SMTP id 2ee6674028c369b-2b812;
	Fri, 22 Nov 2024 14:46:27 +0800 (CST)
X-RM-TRANSID:2ee6674028c369b-2b812
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: pavel@ucw.cz
Cc: lee@kernel.org,
	zhujun2@cmss.chinamobile.com,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: ledtrig-activity: Fix the wrong format specifier
Date: Thu, 21 Nov 2024 22:46:26 -0800
Message-Id: <20241122064626.4680-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.17.1
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>

The format specifier of "signed int" in sprintf() should be "%d", not
"%u".

Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/leds/trigger/ledtrig-activity.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-activity.c b/drivers/leds/trigger/ledtrig-activity.c
index 33cbf8413..b3ee33aed 100644
--- a/drivers/leds/trigger/ledtrig-activity.c
+++ b/drivers/leds/trigger/ledtrig-activity.c
@@ -156,7 +156,7 @@ static ssize_t led_invert_show(struct device *dev,
 {
 	struct activity_data *activity_data = led_trigger_get_drvdata(dev);
 
-	return sprintf(buf, "%u\n", activity_data->invert);
+	return sprintf(buf, "%d\n", activity_data->invert);
 }
 
 static ssize_t led_invert_store(struct device *dev,
-- 
2.17.1



