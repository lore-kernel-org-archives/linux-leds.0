Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793504038;
	b=0y8C77mnFmDveh+t1cM+bEGdHa0BRS9uZ9vWRCZ812tJyCVSIiXHxHgAHHuntwxo9eJD
	 1J9NNKgu3wn9CuVYjLu23287GAKrEW0wVjGpBRO8tlYXGRq/cr6uYvRlBng5xWC8m5Dn3
	 Dh+sAgP6ooS39KHQ+7gdGVR3O1ui8KC/G39OnxI9ugA9puhbMdsCV5ouNdB8eh/gYsGz5
	 L655EY2jrrnpTm/P+YVnxObm6i1gMJoiqyjXTjkJXoG0eEtiOG4tRF8pI6+Da1CrjFYAs
	 zeFXk4ucsCICvE4B+uqJBGHPHRRDTGPoWmi7sMZfG3eZM0tN67djH7VmN7fAaPgoncA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793504038;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Q2OCBr9ePU4KjYZvGBV1w7V+MKN0AZH7BV6n3kb8ObM=;
	b=TkrpmhwntRdQTzS7ojUWgVgGVF0G0vA2HAGfsBFtLeLp8fs6lUOQj45zo5OBy5rhIpV2
	 VHLqjCTw6fDhshxKKhe+wZyrz6YVMmW1RW95TIqrT2tB0thSk8Y/a9Sx/mwuPxOyM+0br
	 GkyxNE+KtIy9OvLKkm+bhPGAJmp6SLEwKzlUQMN9zNuwoqLphQ3lJsscAW/dgKryXMt4p
	 plJoN78XTULIJ8TpdVn/E38sf0tu8WYnJl9LvlPTqYjsiR6fr4S3B3ghJIX3EWEcljPhj
	 n2MzYP0idLf5+S5IQ4kV9aLlkk+sZEXDncr5W5bSsO7OCSs0BzIYhRXPdWzh+KlrV2g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQESkylB;
	arc=none smtp.remote-ip=74.125.82.176
Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C6B6606A325
	for <linux-leds@vger.kernel.org>; Sun,  1 Nov 2026 03:33:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C6B6606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SQESkylB
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-3535a54bed9so2954529eec.1
        for <linux-leds@vger.kernel.org>; Sat, 31 Oct 2026 20:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793504037; x=1794108837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Q2OCBr9ePU4KjYZvGBV1w7V+MKN0AZH7BV6n3kb8ObM=;
        b=SQESkylBMjK20XVQFW0H/wphPMhUgfgfgxrMne2n7F3px41nA6gQnmiBf4yj0yEaTj
         3wm5JBP5iNCqwrvgC6FMswh7RHB3dOjoa/r25kcFhEk7hxS16BFd0sK/g39it4EWOuNv
         MrGEiVVghp9q9oSWe+UMwwYDFRg4H8uwP+Hbl5Br5IW8paUI6CQtBA9XkVOfJBhyy4bD
         tIv1aF53e8oTJzpbOoqUYuvwax/5A/ieQsmzZp9N6yRXAPoQ0p1yaMpBZVwAI67MLrbi
         JzmPQmJPu3atgupnZfmX7oz64g0Tb5gqHRrFIfOIJZr7bNJgBgWiRsdrAkkJXfFUljW0
         tnOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793504037; x=1794108837;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Q2OCBr9ePU4KjYZvGBV1w7V+MKN0AZH7BV6n3kb8ObM=;
        b=SuH1xJlko2FpMYUD707eFVHhJ654KmTXX9nEKcKyi70P5h2mcyK7da/jubwkqIgTL8
         OFNHm3ZJ5flCepjIPBhkoAu68A+sYPDrydnxzikrYn7YoFyLbAW9Q2JzMvNLFyNMDhit
         TXg/wVuIp4C5+NX0Uphi5mUii7wxl7Bf5F1Ez0NFnOO5PMK9Gnbm1a4uGrmloUYf7ULo
         l5LbfbHAl/yREa3v81YX0sZGuEX822jG8S5yn8WFj+coKC4a4qrr2oXBE9QqVZbqbUk6
         9uxSHtyS9C+msxMiYWSoDDQ/ZbLY9wAxYDjaFtVrm6rso1sEAB9iZ3gPBkkkPrO8Nbzv
         tVUA==
X-Forwarded-Encrypted: i=1; AKwUvBzF6+QuC6RjA4Bx9dnSd33kwdn95KOdX3quae3x/Qfc3hVHwIcnTfa2APFPgCzGu6D0BYvHGO15quvA@vger.kernel.org
X-Gm-Message-State: APuU4Z+xo36Tqzg9BL1vOgSe9MEYBl0AyQLuOtKVWdYqyJK4O04Tn4Qk
	TOOwzG8Fmin6TC9nGgN44Zn4CoUAygOqEW9EBFkkXEUWJGvHJPTkSCOegf+CtGnx
X-Gm-Gg: AYBFou3dUgc2Qyhw0VgKmcNDbnzxQ+RWE53KHB/oeamaXJ+QFLAl68XhoNVs1oFbQi8
	nKABALhoZ8cShLVnUM5kBT0A3pkyh5EnXzvbVBojkV98P+LN0r0APiFq8qZenGV3k8/qwR4TFbm
	e7C1nnAsEIBAQYB87ykHaWGFHkvdUvlzlwv0vglDAszFswHzmGwyWlG+YsKSyOzYA3LFWoL9T3A
	WpO9Ki3iCYZh2JsrFG+lc55BttEWXGp9CsEhxX42D0GQLpUhMMQySdOvYm2yaBNswKUIGo9wIOk
	s49wPKDO+iBhIgap90ITiiEs1x8cqGOIQbFO/JWhW8cFR+fGw2vtofU9VBjWgXlQgNpQlTXB+Sn
	E6J/x1vdED1jum8ceUQx9TkyDRCku93O41BeQtPxWaxA40u+lOh4nuCY5spn9QmpR55BLDqyAkQ
	IoaL9uiTyndAXMR2N/0NHW7QLwEOKnESwceK4fS/oDQs/qM/dejdZaJ3KUIZz6EzRNFdOS9MwI5
	mRZ8wbhv/d6HhL1XuuX2qKw2QWZcEODW4TjkAPv8nZzzWDCuRJ8rU8XyunpB1JOycfPgyBxYIyV
	9jMp0aeny7k+BNAGmLNLtfVS75S7D+aRNrzCHZ+TUjqGwPbAayKnEw==
X-Received: by 2002:a05:7300:6d22:b0:36a:13e1:c889 with SMTP id 5a478bee46e88-36a425e10f8mr15242134eec.36.1793504037532;
        Sat, 31 Oct 2026 20:33:57 -0700 (PDT)
Received: from LAPTOP-LJ15R92N.localdomain ([49.43.7.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a5fb97sm24731461eec.23.2026.10.31.20.33.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 31 Oct 2026 20:33:57 -0700 (PDT)
From: Akshat Rawat <akshatrawat095@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Akshat Rawat <akshatrawat095@gmail.com>
Subject: [PATCH] leds: class-flash: use sysfs_emit() instead of sprintf()
Date: Sun,  1 Nov 2026 03:34:27 +0000
Message-ID: <20261101033427.442-1-akshatrawat095@gmail.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Use sysfs_emit() instead of sprintf() in sysfs show callbacks
(flash_brightness_show, max_flash_brightness_show, flash_strobe_show,
flash_timeout_show, and max_flash_timeout_show) to conform to the
recommended sysfs attribute formatting guidelines in
Documentation/filesystems/sysfs.rst.

Signed-off-by: Akshat Rawat <akshatrawat095@gmail.com>
---
 drivers/leds/led-class-flash.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/leds/led-class-flash.c b/drivers/leds/led-class-flash.c
index 181dfd49c6ad..a1bf70d6e47c 100644
--- a/drivers/leds/led-class-flash.c
+++ b/drivers/leds/led-class-flash.c
@@ -71,7 +71,7 @@ static ssize_t flash_brightness_show(struct device *dev,
 	/* no lock needed for this */
 	led_update_flash_brightness(fled_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->brightness.val);
+	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.val);
 }
 static DEVICE_ATTR_RW(flash_brightness);
 
@@ -81,7 +81,7 @@ static ssize_t max_flash_brightness_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->brightness.max);
+	return sysfs_emit(buf, "%u\n", fled_cdev->brightness.max);
 }
 static DEVICE_ATTR_RO(max_flash_brightness);
 
@@ -129,7 +129,7 @@ static ssize_t flash_strobe_show(struct device *dev,
 	if (ret < 0)
 		return ret;
 
-	return sprintf(buf, "%u\n", state);
+	return sysfs_emit(buf, "%u\n", state);
 }
 static DEVICE_ATTR_RW(flash_strobe);
 
@@ -168,7 +168,7 @@ static ssize_t flash_timeout_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->timeout.val);
+	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.val);
 }
 static DEVICE_ATTR_RW(flash_timeout);
 
@@ -178,7 +178,7 @@ static ssize_t max_flash_timeout_show(struct device *dev,
 	struct led_classdev *led_cdev = dev_get_drvdata(dev);
 	struct led_classdev_flash *fled_cdev = lcdev_to_flcdev(led_cdev);
 
-	return sprintf(buf, "%u\n", fled_cdev->timeout.max);
+	return sysfs_emit(buf, "%u\n", fled_cdev->timeout.max);
 }
 static DEVICE_ATTR_RO(max_flash_timeout);
 
-- 
2.56.0.windows.4

