Received: from forward205a.mail.yandex.net (forward205a.mail.yandex.net [178.154.239.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A385C4CEE40
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 16:16:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.88
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575423; cv=none; b=neAJqxKBgNLUJPYXCz7RQZtpHxgzHyjsdl4EYGqtUrR6G9NUZ+vnoUIiSyEbIs5BFQIxNHy1nnSDry/4xec1Ld+7g6q2H9+74qrGUMUdRqMnbetzQOkdJTChyJGUGj7J380Y2DE9vVX/U8cR1ui2sCC5MdWhqzGDjCMhB5v6jts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575423; c=relaxed/simple;
	bh=hDr5yqOhCoZbEgQwZhB5jp3f9d8rjk8617IXdiJWcZc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y8XNpDWgt/QdWHoKLbSxI1Yb2p3tZM3q8rL3zH0Vk2xNoaX0U9o40vnSgaU0W5JgoxfOQsv6rP9U8nziDKuCLKcPKsosrGnZtnTyVlRNQSUTSCnogMXUenk/Jwu5dnw+OpBZpi7C3V5ABcFEPIrpaQ/iaAy8lmB8fS5q8VUILC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=jwXqx9sa; arc=none smtp.client-ip=178.154.239.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="jwXqx9sa"
Received: from forward102a.mail.yandex.net (forward102a.mail.yandex.net [IPv6:2a02:6b8:c0e:500:1:45:d181:d102])
	by forward205a.mail.yandex.net (postfix) with ESMTPS id 15E38C9B54
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 19:16:51 +0300 (MSK)
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:39a:0:640:15c4:0])
	by forward102a.mail.yandex.net (postfix) with ESMTPS id 55F96C0053;
	Wed, 16 Sep 2026 19:16:43 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (smtp) with ESMTPSA id eGYnMNEdBa60-rgCezTnW;
	Wed, 16 Sep 2026 19:16:41 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1789575401; bh=79P4DBjnuAY1cOgRRq3OJbAXV/K267HtX5akj8TniKw=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=jwXqx9sa631n7KFx2UiqmwVOTQbTZfJeOm8E92vKLIQW3uGryRl2Ux2XuRVKN/R5F
	 VD81fXEpUB5q6H/mnkFBwum61jzYApxIFbxCiZdMKkEemCTcs5xraFSjCPac8Wyowd
	 qyVHiBrhUYtrCV7G4HWPsCuii4OJjscVSU0Hxumk=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v3 2/2] leds: flash: Simplify flash_fault_show()
Date: Wed, 16 Sep 2026 19:16:07 +0300
Message-ID: <20260916161607.90106-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260916161607.90106-1-dmantipov@yandex.ru>
References: <20260916161607.90106-1-dmantipov@yandex.ru>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not emit extra trailing space and use sysfs_emit_at()
over sprintf()/strcat()/strlen() in flash_fault_show().

Suggested-by: Lee Jones <lee@kernel.org>
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v3: use sysfs_emit_at() as suggested by Lee
v2: capitalize commit title
---
 drivers/leds/led-class-flash.c | 19 ++++++++-----------
 1 file changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 3bb90823de1a..181dfd49c6ad 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -188,25 +188,22 @@ static ssize_t flash_fault_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	u32 fault = 0, mask = 0x1;
-	char *pbuf = buf;
-	int i, ret, buf_len;
+	int i, ret;
 
 	ret = led_get_flash_fault(fled_cdev, &fault);
 	if (ret < 0)
 		return -EINVAL;
 
-	*buf = '\0';
-
-	for (i = 0; i < LED_NUM_FLASH_FAULTS; ++i) {
-		if (fault & mask) {
-			buf_len = sprintf(pbuf, "%s ",
-					  led_flash_fault_names[i]);
-			pbuf += buf_len;
-		}
+	for (ret = 0, i = 0; i < LED_NUM_FLASH_FAULTS; ++i) {
+		if (fault & mask)
+			ret += sysfs_emit_at(buf, ret, "%s%s",
+					     (ret ? " " : ""),
+					     led_flash_fault_names[i]);
 		mask <<= 1;
 	}
 
-	return strlen(strcat(buf, "\n"));
+	ret += sysfs_emit_at(buf, ret, "\n");
+	return ret;
 }
 static DEVICE_ATTR_RO(flash_fault);
 
-- 
2.55.0

