Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7EB0426408
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505697; cv=none; b=ijGD1g0RgQ54nPqCRASpeAhbzGTHn0LufYKKi/ytxmGsZRi4dWbXS/Le2r0XIj/UnWHNgh/WicLkpHDI6lBxYiMR/eByFHstt/x9ckTBSSlCmGT/dWc1sGt8ZEKZgMMoijuhd6yiJMNOZS61SgK1pNlw0USsXBxpUf68RybSbAM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505697; c=relaxed/simple;
	bh=J0KWUQQ+1PBOoBetuoBx5rafzqo9LWBXcY5k/PT5B2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gy2ZztML672gxPoBIZXWJrs1OvlOfFdOP0bolwh6IWCTGOJXwymeWqO3v7SAXN3VzHipjNyeUsHA0bbA4QNT6QgHMbgKeTM20JmqDAwZDdWbOWAU9HIvwYfBocQCpxfSaL6SKawHGHXQgM44dEDb3J+LjadJTDrJxlzaDftEMEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=lB622IIe; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="lB622IIe"
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:20:0:640:25ef:0])
	by forward101d.mail.yandex.net (postfix) with ESMTPS id E8704C011E;
	Fri, 04 Sep 2026 10:08:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp) with ESMTPSA id 98DOqufe0Gk0-EKlsUFZb;
	Fri, 04 Sep 2026 10:08:11 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1788505691; bh=kjlrV2pDjuz6jS9vXB7FdtLfNSZ5pXoVQ23RB1P6iAA=;
	h=Message-ID:Date:In-Reply-To:Cc:Subject:References:To:From;
	b=lB622IIen6WwJivlbVY7KkJBqXqmufIUmeeD68b88AihWo6HwxaD3iNWHuoaECzUN
	 po0EJZn2aS9FOxlDzDxyhRP/GbzShtiZqbvq5cLERg1102WBRczt7QHBrqno+rLj2N
	 vk7R5sgwptdeBIblRFF6p07Z/n7r7wO76Kq4yw+I=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>
Subject: [PATCH v2 2/2] leds: flash: Simplify flash_fault_show()
Date: Fri,  4 Sep 2026 10:08:06 +0300
Message-ID: <20260904070806.19125-2-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260904070806.19125-1-dmantipov@yandex.ru>
References: <20260904070806.19125-1-dmantipov@yandex.ru>
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
v2: capitalize commit title
---
 drivers/leds/led-class-flash.c | 18 ++++++++----------
 1 file changed, 8 insertions(+), 10 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 3bb90823de1a..d09c71fcd2b3 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -189,24 +189,22 @@ static ssize_t flash_fault_show(struct device *dev,
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 	u32 fault = 0, mask = 0x1;
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

