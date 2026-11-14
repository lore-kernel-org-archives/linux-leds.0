Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678988;
	b=ea8sQ+T5RNNbwatXoUHEXhqc8uxdoGJvFZejEOeZ97/aMk2+HTxNfS4/4yRbaHXQgcRn
	 i586HUStTgicP5mhcLrKvlPvBwU+IDEbx/jf1Aqih6CcIkUrHx1qKT85D2XuXmYJHGe6k
	 I1wSOi4YvXlKrD8X07UXi81aWrc3S8XdqM4IoR5TTCUEwhawMaMpBESsFmrFmU5Xoz4FM
	 eLSXOPAP+G56Vu3bMzev80DU5yYXaEvr+hY2KJbtcl9z14ttwQeWe+RNxFTu3yz18ZiED
	 5WL8hlukAdyHlkPzOEVRWMJvFsZGkjRau28JIYT/sV1CDyKbaVFRnxJbAtikSi35+1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678988;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
	b=PTvOS7pY2dC7XfIIjCUgpk7WJgFAyHVkhUPyGz1MWsYFWBxPrBSQFu9PTbd+F5u+8ffc
	 T2Zyo3yJAI6lYd2dMAtbZ7Rko433tzj6VlO9dTydojJTienWqw/vq0t0SwnHVwEL8qzdy
	 EFmqfcNRrjVIsDPOIv6MXIMj1ndVN0IvfoKSm0ErJjl2uuXqL47MZl+TeRxFOcxbITOz8
	 DGMeBlCY2XnoYc9cPl5FNWern6l51Tkkjul4zY4G0J+XdYDhlflvpFSz3m5OS1e9OJAO0
	 HmbooVQ1wihOET7KNY3XRgNRh7z4L8s9rcfVM5Y5wOOHKN9+Ksi8Ypn9JxqnePlw6aA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWETsPea;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79DB6606A32E
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:56:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79DB6606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HWETsPea
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b1478f06e3so456012a91.0
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 09:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678988; x=1795283788; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
        b=HWETsPeag+bFtE+dRjzmPX4oXUDvXcr1yPp6iuiC2K9aRI90hNzOpKjddkBhlmGFU5
         IfW3DrJ3cMFK+1y4ggpGyIyyk6xDe7id+7rgJ0YMcchbzOSL+GGQ2E653jcFq7oMLpTP
         BPMZ/yTMr60Q1mY0x2oKj5i8cmpm8mFaSozBSsdr2BRosfeLuw+NqrvbJSu75HKngLyA
         X4w2NbMkx63qiAteY+gaY0QwxJ1QAfQnzO79DPaSpJ948IOpAMjOv1M50AumrisJQuTN
         MJGiQPy5t8ns7SuIIVyZC5ed2I9+b0aA2KkxnoyeSTEGNwmkp3esqZszJg+faGLFp5zs
         Vq1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678988; x=1795283788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=i710EDxhs1HHbZwQVt63v1uAh/hL+lpRmvt+Vbo8iM8=;
        b=1ta0lssCZQhKcsvCtiQuXeUGVelkjByFirc7CZLpvIdeUvN4511rWu3tND5FNuxYwK
         ir9zFOXfzc1RJ84WFTZWZZaXEVdb7vqYAyIfJkKR+useZ64iH5N23cdu0FBCF2IOvOE2
         c+AtgwQP0J68wO4ZllHArE3R7MpMUWpJpvNL23YR5/yulN5/B6bsf8PEVdpYrc2dUAUl
         LHXvLzXr33PHNyVTKCdIyR9gMgZyN4OHA3wisXMTdrF4o1Zbt0fyhbKj6L+C22uoNAKs
         kuAhGStrBCHog8hfnyJa+rfb2b2vJYtJ9VMW/bWev6HRPltlhqUFDVrwqwdoLrkRauoQ
         EKww==
X-Forwarded-Encrypted: i=1; AL+hErExntjHAXJZi/ylR88b55yA5oN2hqKRnQvY1aS8ymgk5NVIzM3vQXPpHwWA0PpTv0rQS9vvYDJ9QXON@vger.kernel.org
X-Gm-Message-State: APuU4Z+jLLcow3M9bKgXWjTUnVD2y5c3YqTlk4JQch3LR35r+8A9hMJb
	gVmHTp9sKQtsTSlSg4stEzAeakos+SzIAGA0wdvPGgEiaDhYB7Sn7+TJ
X-Gm-Gg: AYBFou1FqXZtuFBMn6ula2x1bCUSKkh4FxmUoi0PYExuGrsQU1B6ox4jzHqOKnVJpPB
	iVt0d+kj9hGWQgUK1cioZknfshUlwMJp3ixGQF8kc4Mj/jSV0L/DSIaQKIi8Jt/JWQl7D2VV9sP
	x+XrQHTizG5DPYLpeUe9QkEYLJKqSiwD+nWeQesN3Ib/nDnIrGlnWJOo6N+rOardfhoGtsNqddG
	Sqhh0PF1Lxa26O10J3nREYY7pv7+rJsJ1UyfdjWmlnp339WbmyIXyyEwg3pjjXCQOPqTwgo9KOb
	HW7457+v37cm9vOVm+0/E9jxVry0rvBm85YxqimWH1f2D573P6mHJUGz4omUo2mLRK20JrM6I4M
	WZDzZ0T/cTyowZcxGNSkHGQBACOtVqmcA1W8VmP0G18XW4VXAenm+Kl7W948SLsRt39XHsFjSGQ
	ssB5Rm6CwS3ytt1ox1OXUPX8pcSSDx2fXDVGvfVyxSVFIMAnPniwPyyoOpcj9LjPjbJEJuCKLZQ
	4PWyVsiZTzvaEilgDZRr3iLwYkOM1tRADBdEti81kOfEHcpECyT8/51Bi9yLAQ1u67m03widw+G
	L7roo7ESqcxTXxpMgJHU31+xPXxI
X-Received: by 2002:a17:90b:5608:b0:3ac:adce:60a9 with SMTP id 98e67ed59e1d1-3b1b07ef0camr5928750a91.9.1794678987564;
        Sat, 14 Nov 2026 09:56:27 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:27 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	platform-driver-x86@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [PATCH v3 3/7] platform/x86: thinkpad_acpi: Sync LED core state on level writes
Date: Sun, 15 Nov 2026 01:48:10 +0800
Message-ID: <20261114174814.62153-4-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261114174814.62153-1-kmatzkaczor244@gmail.com>
References: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
 <20261114174814.62153-1-kmatzkaczor244@gmail.com>
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

kbdlight_set_level_and_update() pokes the led_classdev brightness cache
directly after writing the new EC level, without notifying userspace and
without any locking.  Commit 06da5325d02e ("platform/x86: thinkpad_acpi:
Stop setting led_classdev brightness directly") already removed this
pattern from the sysfs path but had to keep it for the proc interface,
which has no LED core path of its own.

Move the LED core state update into kbdlight_notify_level(): stop
updating the cached level in kbdlight_set_level() and have both the
sysfs and the proc write paths go through kbdlight_set_level_and_update(),
which writes the EC level and updates the cache under kbdlight_mutex,
and reports the new level through the LED core, like commit
07f48f668fac ("platform/x86: ideapad-laptop: add FnLock LED class
device") did for the ideapad FnLock LED.

As a result, writing a level through either interface now emits a
brightness_hw_changed notification, so userspace listeners see level
changes from both of them.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 23 +++++++++++++--------
 1 file changed, 14 insertions(+), 9 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index c8098f317..657a19d11 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5108,17 +5108,17 @@ static struct ibm_struct video_driver_data = {
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
+/*
+ * Caller must hold kbdlight_mutex.
+ */
 static int kbdlight_set_level(int level)
 {
 	if (!hkey_handle)
 		return -ENXIO;
 
-	guard(mutex)(&kbdlight_mutex);
-
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
 		return -EIO;
 
-	kbdlight_brightness = level;
 	return 0;
 }
 
@@ -5183,10 +5183,12 @@ static bool kbdlight_is_supported(void)
 	return status & BIT(9);
 }
 
+static int kbdlight_set_level_and_update(int level);
+
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	return kbdlight_set_level(brightness);
+	return kbdlight_set_level_and_update(brightness);
 }
 
 static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
@@ -5245,18 +5247,21 @@ static void kbdlight_exit(void)
 	led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
 }
 
+static void kbdlight_notify_level(int level);
+
 static int kbdlight_set_level_and_update(int level)
 {
 	int ret;
-	struct led_classdev *led_cdev;
+
+	guard(mutex)(&kbdlight_mutex);
 
 	ret = kbdlight_set_level(level);
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	if (ret)
+		return ret;
 
-	if (ret == 0 && !(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness = level;
+	kbdlight_notify_level(level);
 
-	return ret;
+	return 0;
 }
 
 static int kbdlight_read(struct seq_file *m)
-- 
2.56.1

