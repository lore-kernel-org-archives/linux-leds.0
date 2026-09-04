Received: from forward101d.mail.yandex.net (forward101d.mail.yandex.net [178.154.239.212])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7F5A426693
	for <linux-leds@vger.kernel.org>; Fri,  4 Sep 2026 07:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.212
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788505697; cv=none; b=O+d7DPIQLhJENqajg1WILp6XnFJtFcTqpej/lfo18LQPKQ+GHSE3EjiP3I+dznQ/oTiWF19kFhcPLA4hZz6z0yEDaQ/kcBVdanXWTeMiZbYezPcoCu4ifil4fsIcPcrbJxaqbdNShy6Wa5XWrowYqCklToBCxVvsmYqVAuR1rNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788505697; c=relaxed/simple;
	bh=6sD3d2kv0ReDwMfiCelKvRcSCkSZQB+u1mK+NM6w5JM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F8gUValqxipiCeyIXT5iQsApsfkx0c+vFVhtaRH3wPDZ959eHfmcKQ+CZNdTitZ1PvnRqWcTfog7c/XLl1EnQv9sGpv3TvpzEIVqZ9dKMevsX3dpfv14ZamrOZmbZxDoKoaeIpW9BkVXMpmHa0EBLuSpFAih62hZD8v9//UMxxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=TaCEqoAb; arc=none smtp.client-ip=178.154.239.212
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="TaCEqoAb"
Received: from mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net [IPv6:2a02:6b8:c43:20:0:640:25ef:0])
	by forward101d.mail.yandex.net (postfix) with ESMTPS id 69C66C00C1;
	Fri, 04 Sep 2026 10:08:11 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net (smtp) with ESMTPSA id 98DOqufe0Gk0-UCSaBBFL;
	Fri, 04 Sep 2026 10:08:10 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1788505690; bh=SL4f9PRRdLVOQNmw8PxDoKNPJIgIXph+IyqqhG8JKC0=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=TaCEqoAbjeUXn3QLdC5+CfmElbRnREwRedZa2DuzCPALrlgwo5ariR6ly2B9BYdcx
	 nHZR6a3tKDT9yzdEEEyYCGmZyfmJ+LJ8ULZ6iQph6dkGTIu7wmGcAK6N2U8oscWVsG
	 6CloG6fsrkyaYjKCPYodQcGhY6nC/U5H9ARPvOvk=
Authentication-Results: mail-nwsmtp-smtp-production-main-72.klg.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	sashiko-bot@kernel.org
Subject: [PATCH v2 1/2] leds: flash: Prevent using uninitialized variable in flash_fault_show()
Date: Fri,  4 Sep 2026 10:08:05 +0300
Message-ID: <20260904070806.19125-1-dmantipov@yandex.ru>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In flash_fault_show(), address of uninitialized 'fault' variable is
passed to device-specific .fault_get callbacks. This is not a problem
if such a callback directly assigns the value like rt4505_fault_get(),
but results in an undefined behavior if callback just performs bitwise
ORs like as3645a_get_fault(). So just initialize 'fault' with zero.

Reported-by: sashiko-bot@kernel.org
Closes: https://sashiko.dev/#/patchset/20260904054437.461706-1-dmantipov@yandex.ru?part=1
Fixes: 7aea8389a77ab ("leds: Add LED Flash class extension to the LED subsystem")
Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
---
v2: initial version to join the series
---
 drivers/leds/led-class-flash.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 165035a8826c..3bb90823de1a 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -187,7 +187,7 @@ static ssize_t flash_fault_show(struct device *dev,
 {
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
-	u32 fault, mask = 0x1;
+	u32 fault = 0, mask = 0x1;
 	char *pbuf = buf;
 	int i, ret, buf_len;
 
-- 
2.55.0

