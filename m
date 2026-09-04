Received: from forward101b.mail.yandex.net (forward101b.mail.yandex.net [178.154.239.148])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AA3C3C73C1
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 05:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.148
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788500693; cv=none; b=uYFov1Tot+W1YbDRz8dR9JTyu7ieU2Go+u+Vphln8FDiNbYHn4trOsIRqeu05dSekcUSnDCh4RcwfGaFbISn2v/qj9im1N/99oLA2VSPTlen9CNq7qokNYkLDUkn6AIM85V/6vAaX1rb5WCAhe8gGvMCTtRpmugKgl3/rxTI/jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788500693; c=relaxed/simple;
	bh=/HEdfZPKDQNsTPH/ppOzeJkZMXt9rPUa4YXI9pZOZgE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bedlaI2mFddhCnxb8FEz8366Q1/K4aDPJl1/JBIDGiGt6bBDguY+eYtAJBfx7amSCzzN/2xWZ8tq0CVCVquqfK2iI1BePQBEc/rkJ5TDlNBVLbMoIW7rDPgA1pFuKXE7nj5CITQCOyuVgsYsFYnRXafDbDDHstHZVIfF6spAbmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=ck7c8EsL; arc=none smtp.client-ip=178.154.239.148
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="ck7c8EsL"
Received: from mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net [IPv6:2a02:6b8:c16:161c:0:640:b95e:0])
	by forward101b.mail.yandex.net (postfix) with ESMTPS id B20B3C0073;
	Fri, 04 Sep 2026 08:44:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net (smtp) with ESMTPSA id ciB9N3ggCGk0-mvPJsmEK;
	Fri, 04 Sep 2026 08:44:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1788500680; bh=WnfnIAHR0NZoaZrFJ4603V8pUipGBfkh42RonJ0nFxI=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=ck7c8EsL9WamAIYFrs+TCCT878HIW60ZdxJ32n5vTX1GGWEaSAvPwuzWnOnuA68vv
	 zdzg9ISC5xIhr+CWYyfnLGW3ZjWBEN4K3YIxy46oJbIdgiyQ1fcio5veUcyNxfXTgQ
	 KMkom4usFMaBeoTvo4kEiou89dgJxIq1jdNXMjxI=
Authentication-Results: mail-nwsmtp-smtp-production-main-91.sas.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH] leds: flash: simplify flash_fault_show()
Date: Fri,  4 Sep 2026 08:44:37 +0300
Message-ID: <20260904054437.461706-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Do not emit extra trailing space and prefer direct pointer
ops over strcat() and strlen() calls in flash_fault_show().

Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
 drivers/leds/led-class-flash.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 165035a8826c..1e878baff041 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -189,24 +189,22 @@ static ssize_t flash_fault_show(struct device *dev,
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	u32 fault, mask = 0x1;
 	char *pbuf = buf;
-	int i, ret, buf_len;
+	int i, ret;
 
 	ret = led_get_flash_fault(fled_cdev, &fault);
 	if (ret < 0)
 		return -EINVAL;
 
-	*buf = '\0';
-
 	for (i = 0; i < LED_NUM_FLASH_FAULTS; ++i) {
-		if (fault & mask) {
-			buf_len = sprintf(pbuf, "%s ",
-					  led_flash_fault_names[i]);
-			pbuf += buf_len;
-		}
+		if (fault & mask)
+			pbuf += sprintf(pbuf, "%s%s",
+					(pbuf == buf ? "" : " "),
+					led_flash_fault_names[i]);
 		mask <<= 1;
 	}
-
-	return strlen(strcat(buf, "\n"));
+	*pbuf++ = '\n';
+	*pbuf = '\0';
+	return pbuf - buf;
 }
 static DEVICE_ATTR_RO(flash_fault);
 
-- 
2.55.0

