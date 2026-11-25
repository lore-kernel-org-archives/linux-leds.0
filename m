Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596538;
	b=Cnvni7CrxRZk6b/TuANhqL+sVejYdXbVrRmAWV6EuMd/DesUOPe69GZNhVqakhpBZVhf
	 bp+K5KI4K766soZ8YGjV6/4YEQzqx8GPKm0L/yjiVqvB3X2iZnbTfCfYwXfreXiSpx/o+
	 N//uh4oxxBnnAhISEvGswXKEjAh0f5B9P4H093+T6wzYK2003eLQ9s9C7Flcr+4rez3lF
	 qYDfx9QM/7iMJpYcuLEua2nsD0BXZHSlj4/yJ1otINODcb/5ThzRfPNmwtB/2dDQUe8hT
	 wVsSNb9zQ5P20N4M32YAL/+W9CAuHzHjYLKeO8ovlVlTs9ZFNzYV418Q2h/TEgOj0ig==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596538;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
	b=NAOawTx690+dDyf3LgA1iBeGyR3VL2yt2dTpeymnlMHm136VZFPhR/TZHKWxg2zu/HA9
	 dfalZDuAw2TRftHNc4lfP6inYhHV2lRtkOUyGqQkFoT/f6QZIA9F82qd6kP3qiiT2dAeg
	 HxBJhGipzFR+cvXXtgOJ3N4VNSPsTm0FnuHrAXVWxdD65nMFg+wawi0MB1A27Tuj8+6Hk
	 WjPCxPMc1wL88JWV19vrN1X/2rbe1OjJcjcuUOrJHGZSLbLEg7FtFJ9nIOP5lE8+mDeQ2
	 TCOB3fvHwH/Qj331zrGL/MoWufvBxWAnJ85dkT+U8C5k2YPkbIVxboIP37Xl4L5BgrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="OEn/KbW5";
	arc=none smtp.remote-ip=74.125.229.8
Received: from mail-dy2-f8.google.com (mail-dy2-f8.google.com [74.125.229.8])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF600606A329
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 08:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CF600606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OEn/KbW5
Received: by mail-dy2-f8.google.com with SMTP id 5a478bee46e88-382afece6d8so1097641eec.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 00:48:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596537; x=1796201337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
        b=OEn/KbW5jpAo+41iRtKb1w9uUHwteSvs6/MPi9hNvFMG7O9KHOXJWPZZqbSgMDWRFk
         8+C4gN4GnxsqYK5YWtogGjhuDz8sAqz2Ksq2fEfNY8egzqlX++bR1ZHiwi2HZ20z9B7f
         lZ89cMvxdMGjPRi5bqQIquHuOOa98bkxrtIKT8uax933U70r7CRgc5iRLf9qXbAoosPw
         QKuINJaaFA59jsb+kjcPuDOqAzKetTTaNi47f9EvChflPiI4V6lEoyPhVLG+1LnCA3zd
         Y++V3HjA82QB/2rutvHyv2do69KEavmqC3nrCCI1c6WVKrAy6ICvtX8vcl/N9x7ucDSG
         mWXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596537; x=1796201337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yJT1/+IdhoDhu7NfM3kA57WDlfCrtbwZwKhYF0N2rZM=;
        b=g2Jw0PjownUCPufJ/WJV0lur9yYkXK/a9ANhLTNLNI+/yhGlOkA6KGnICuQDuTwdQY
         aiTI+9NR4zuYoX4EuFnUV8CGTUm/SUGSj62BjuJjvpesw/YhnXGaoyvC8oGFd+Rbal0Z
         473HNMdFsmUUMRg77IuUKey+radkmhkcfeYbmtNhDUMYDo5xI83iVYibqubzLSVQUKaC
         wsXQ1XDSxEMAT8JiW5qZXPzl5KntF9RM984SbxVKOsE1akCJ9qWO7YFkZQ2Y/S1CuaAL
         ZpUWgJ55dfH8XxlKRAZWr9j5t+JwSym7KbTLG+OE5qkmgYwnntNpscy6tpSH1/5OUc/b
         ZINw==
X-Forwarded-Encrypted: i=1; AL+hErHTva4xJNEznrVuasdHf05Dh/6/lzE8jXpoSYWu3Sd7Hu8bpwuBs2NmZbRji/cHekk8TXvQSdFrr0m1@vger.kernel.org
X-Gm-Message-State: APuU4Z9m7fk/E6MHHEX3y8/s2eknSaDpn16Dw6F/6w5ZvHnyWtvMrTIM
	akjGrHjlGIM/vgDkDEf7JAyZEL+nb+hiI0jXDCf5pUxdsj5II3p7M8IT
X-Gm-Gg: AZFdTZeCrifuebwK1reGidpkd77Llvic/R3Lsb+7mxhu2U68zG4aFVoMM45iNM7gxIb
	GjS/AeqMYTZSlTo4UwJnDKsStybpI1fxdezBp1ctSbVk2c4n3zpWctjG/E75KLPkWqTeYHjX12S
	Lu4E0d6sGpnWSU1HNmHSgDIN7gUKy7s5xqCPq4ldPvN7cObRJxOwcHEdPuJOdyCfi4ExC2ZA0bn
	1Rz2Fnqc3Vi79glABnDd3P7i0idORpSM1Cc2jtymtwH01C9cbwUxtjdVdjSbEoLK/3NKSiNgoW2
	VdjYpgWVvAzqZd6HasMzn7P2eUxzj3VoPcrJXGI9an8iwePXF5WuGeY1N8NiHlqBg94o60qZ0Z2
	n3JmAyEomEep67jA43piFx04Ru1aWVWEtgkcRSVtaxosuet10c0cBC7uvWsz+UJa2QHgpX6wP3C
	soNBQdvE4fVhRy8RJkgkC40Z/p9U8QWA+69MYk0hte+g3Nt6HTQk2GDmtATw7GTeJfZx8CnMUzv
	qjqz5gFup12WwjL3Xyd+mrt+qPPXcIkpXwGKoZd7T6l3gLSCOob5XQX3fIXFCvpB6/jvkGX/eLe
	nx3csrNDBYnBtAUoE12kPtOvWfaBgw==
X-Received: by 2002:a05:693c:42da:b0:386:95e7:8497 with SMTP id 5a478bee46e88-38695e790e1mr13921792eec.28.1795596536872;
        Wed, 25 Nov 2026 00:48:56 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:56 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: platform-driver-x86@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-leds@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Subject: [PATCH v4 3/6] platform/x86: thinkpad_acpi: Don't poke keyboard backlight's LED core brightness
Date: Wed, 25 Nov 2026 16:46:40 +0800
Message-ID: <20261125084644.137506-4-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
References: <20261125084644.137506-1-kmatzkaczor244@gmail.com>
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

A write to /proc/acpi/ibm/kbdlight writes the EC level and updates the
cached level under kbdlight_mutex, but then assigns led_cdev->brightness
directly after releasing the lock, without telling the LED core.
Commit 06da5325d02e ("platform/x86: thinkpad_acpi: Stop setting
led_classdev brightness directly") already removed this pattern from the
sysfs path but had to keep it for the proc interface, which has no LED
core path of its own.

Stop writing to that cache.  kbdlight_set_level_and_update() now only
writes the EC level and updates the cached level, under kbdlight_mutex;
the sysfs path uses it, as a write that already goes through the LED core
does not need to be reported back to it.  The proc write path instead
calls kbdlight_notify_level(), which updates the cached level and reports
the new one through brightness_hw_changed, like commit 07f48f668fac
("platform/x86: ideapad-laptop: add FnLock LED class device") did for
the ideapad FnLock LED.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>

---
After a procfs write, led_cdev->brightness can retain its previous
value.  This is acceptable:

- Reading the brightness attribute calls brightness_get(), which reads
  the level back from the EC and refreshes the cache.
- At this point in the series, kbdlight_suspend() also refreshes the
  cache before suspend, so led_classdev_resume() does not write a stale
  value back.
- Software blinking may pick up the old value as its "on" level, as it
  can after a Fn+Space change.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 44 ++++++++++++---------
 1 file changed, 26 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index b4b3d7dcc..16bf2267d 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5113,12 +5113,11 @@ static int kbdlight_set_level(int level)
 	if (!hkey_handle)
 		return -ENXIO;
 
-	guard(mutex)(&kbdlight_mutex);
+	lockdep_assert_held(&kbdlight_mutex);
 
 	if (!acpi_evalf(hkey_handle, NULL, "MLCS", "dd", level))
 		return -EIO;
 
-	kbdlight_brightness = level;
 	return 0;
 }
 
@@ -5147,6 +5146,21 @@ static int kbdlight_level_to_brightness(int level)
 	return level;
 }
 
+static int kbdlight_set_level_and_update(int level)
+{
+	int ret;
+
+	guard(mutex)(&kbdlight_mutex);
+
+	ret = kbdlight_set_level(level);
+	if (ret)
+		return ret;
+
+	kbdlight_brightness = level;
+
+	return 0;
+}
+
 static bool kbdlight_is_supported(void)
 {
 	int status = 0;
@@ -5195,7 +5209,7 @@ static bool kbdlight_is_supported(void)
 static int kbdlight_sysfs_set(struct led_classdev *led_cdev,
 			enum led_brightness brightness)
 {
-	return kbdlight_set_level(brightness);
+	return kbdlight_set_level_and_update(brightness);
 }
 
 static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
@@ -5253,20 +5267,6 @@ static void kbdlight_exit(void)
 	led_classdev_unregister(&tpacpi_led_kbdlight.led_classdev);
 }
 
-static int kbdlight_set_level_and_update(int level)
-{
-	int ret;
-	struct led_classdev *led_cdev;
-
-	ret = kbdlight_set_level(level);
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
-
-	if (ret == 0 && !(led_cdev->flags & LED_SUSPENDED))
-		led_cdev->brightness = level;
-
-	return ret;
-}
-
 static void kbdlight_notify_level(int level)
 {
 	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
@@ -5326,7 +5326,15 @@ static int kbdlight_write(char *buf)
 	if (level >= 3 || level < 0)
 		return -EINVAL;
 
-	return kbdlight_set_level_and_update(level);
+	guard(mutex)(&kbdlight_mutex);
+
+	res = kbdlight_set_level(level);
+	if (res)
+		return res;
+
+	kbdlight_notify_level(level);
+
+	return 0;
 }
 
 static void kbdlight_suspend(void)
-- 
2.56.1

