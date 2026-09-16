Received: from forward100a.mail.yandex.net (forward100a.mail.yandex.net [178.154.239.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44EDA51357D
	for <linux-leds@vger.kernel.org>; Wed, 16 Sep 2026 16:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.154.239.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789575411; cv=none; b=POjL8xddG0TdMuK/Lg0kLIM2avaoJhMAiLj67508mHMT7EdF8eaymjsDjpnGdga7gYdAQt35iYsvqPux35BbYgVsoLIBUo/bWi1mSZl43eGezKKqS49DOyrEibD/GMIJ+ZbTcaP/yAQZ+wWQHL/0znRtIpc/1OYsHB9Vyt17MJA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789575411; c=relaxed/simple;
	bh=7qzLYqxZ8PaX21xq9iolAYlRyfUqvV9jBEBgOCNQ9fo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=X5SqJaAUhp2YbBMmq6P7QmRflFDcRr5nUdSlhc6S0u6krN/WSDsx384JqzcTAqoTSGC/7HIZjxVVaKxYqlt6NBtkaXeVgkS3p/I8eExAzk42Ifzao86omtNbVW0FVFMdRmUsEeuVRouqiUh85QZSpSXiz4uypsqSBEkjmbRXnRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru; spf=pass smtp.mailfrom=yandex.ru; dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b=HHEFeOHZ; arc=none smtp.client-ip=178.154.239.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=yandex.ru
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=yandex.ru
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=yandex.ru header.i=@yandex.ru header.b="HHEFeOHZ"
Received: from mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net [IPv6:2a02:6b8:c0f:39a:0:640:15c4:0])
	by forward100a.mail.yandex.net (postfix) with ESMTPS id DE388C03C1;
	Wed, 16 Sep 2026 19:16:40 +0300 (MSK)
Received: by mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net (smtp) with ESMTPSA id eGYnMNEdBa60-uZKxCP48;
	Wed, 16 Sep 2026 19:16:40 +0300
X-Yandex-Fwd: 1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yandex.ru; s=mail;
	t=1789575400; bh=xR6vB1L4LquCuRCnrYDsg+fQEh2rwqt87gn/qxUClnk=;
	h=Message-ID:Date:Cc:Subject:To:From;
	b=HHEFeOHZpCN80NacJAal5mYLqwTqYUsVQAKCxYMF30oX62hD6VuPLq4Is+0mhntpF
	 GzpwvAd1z5hNOINA1zHDn8f4xOzmq+0doDBCa6vR8C5Fey965iZgBMGecmAmzN3Da1
	 wfXfJAyuuH9SYdecWzHay7BBFo5+iejVQGI77U2o=
Authentication-Results: mail-nwsmtp-smtp-production-main-84.vla.yp-c.yandex.net; dkim=pass header.i=@yandex.ru
From: Dmitry Antipov <dmantipov@yandex.ru>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	Dmitry Antipov <dmantipov@yandex.ru>,
	sashiko-bot@kernel.org
Subject: [PATCH v3 1/2] leds: flash: Prevent using uninitialized variable in flash_fault_show()
Date: Wed, 16 Sep 2026 19:16:06 +0300
Message-ID: <20260916161607.90106-1-dmantipov@yandex.ru>
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
v3: unchanged since v2
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

