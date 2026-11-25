Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596546;
	b=4lrySynP2mvnGg2fA9WjEqHRljLDE9de5VedvPKIbD9bkziledIt3T0PYYSkD1QLe1Sx
	 l+8LPL8vXPuq3pTUqPoqljih32NCiMlPC7pz5QP0hly8r6cQ+dgVxtFeieSI2HUL2euKq
	 xZrdrgjb7bFtM3aictwY7byToh1dakUo/tP8HUFl7EWxE3RKMjLaKoJU119e4YCzwryGA
	 1j4xBxsFSNHoXCdF1CLdL7wYUPVv/3iOIMgWoZjAl91ljrioc8hQf04kXrA93r86J9+/t
	 LGUaKTGGY9khSFWCacxk3L8lXYJn7I01IM0+iIHFw+A9e56H+HF7cdczF1gq5MCQ6vg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596546;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=ZH9Zcii4Ufv0oOYz5ijgMN+AjFd95SziDw7KuLJghzw=;
	b=rQKI/gRVGpoI35W61+Ks4ApmQjFLrXuTrlZ7dz1D1dfOc/wmDqWXeSa3ZPysSNrUce8b
	 tOfbhGXcif1RSOvKw5QIu3AGDwGpipEuuzVIz2d9F1eZq7+2afub8ZYrNWF/MfyzrLg/V
	 QVtyafRRG3QwDpsz0jaTsXV/9cio62IHhInY1n33gzsSISOFSVO/uCeNCN3k1RyxUT3OR
	 /DnwdlKstpDXHHlVaEmLh1n6IS99HFoUzB+3a9veXmX+s0FMiifavcY4NhaMh4LgppYtr
	 dMZABRhGCW7xbbUnD8Zkdap6/y9qCAbSBbfgOwoohs49VHsfPrXdOSgfwy7HG6LDOUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oC8bqpkt;
	arc=none smtp.remote-ip=74.125.229.7
Received: from mail-dy2-f7.google.com (mail-dy2-f7.google.com [74.125.229.7])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 117B2606A329
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 08:49:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 117B2606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=oC8bqpkt
Received: by mail-dy2-f7.google.com with SMTP id 5a478bee46e88-3869c1f4d19so1400213eec.0
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 00:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596545; x=1796201345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZH9Zcii4Ufv0oOYz5ijgMN+AjFd95SziDw7KuLJghzw=;
        b=oC8bqpktROIYUAvwf/LLQsgYplIxIgeO9Cj792jJsv+SJBvUa8camQuvaJylY2SHmr
         h7CYgmLVrHNGYIRey70F7SO0S8XtiBsJ3vyXzr8gfh+8po+FB65En/8RV4U5g0EjuNbs
         Cksg/M2xjsGtjJX6FtBWA+d1FNid6oJgOH7oD6WZWb7aC6N+iv5vphyqUqqgIVCXEFAS
         u3kNlG76zyO1CjQ6RVkWRgPv6KO+QtT2f9NStinnY6XOXCJIBcXV7gZ4HiuDaWQsrLy0
         TuDtuPOa97Eru4BRPmSCvY8U9tSDlaWI6e0SY2LnAzvhNd7k0XuTzZ2/rYJIW1h0z9nG
         Q2MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596545; x=1796201345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZH9Zcii4Ufv0oOYz5ijgMN+AjFd95SziDw7KuLJghzw=;
        b=EwUM6yYsgO+ric4UXlAXyOyrCjpbM0EO8dCIhUtU75XxNm8/sHzAdiIJy5BDTvS0yv
         n4KYQo1JkAMwR8bJP1LHYwzaA/gbPT+4eQKXDOi33huWi8bMm6W5z013WU1zlRaO0l2m
         LXjzrTcxIvIg/AkhXVDWE4KXrL+/45eiPhvI/nsb5jdX29J9gN0kC41z/bk+q1cyjvxd
         p2txs4RN/bczNdVqbf4w1LDJEr4TcS+pfwA2HP0S9JIgeq5Tq/iDG14oDYLfr41J/ZHv
         zZRKp3xNP53NnxJrsVfFNsUApVxMq7eBnzDPLPy65nJF8vUeZSXaKC+yFLZ3XNGzf5//
         qD/w==
X-Forwarded-Encrypted: i=1; AL+hErEJ14xGx7e0yKfitzE9apga3UhhN36F7sA937TJuM8Jo0T6quQ9KfMF56Z1hbm8vJhZl+GxyKldo1mV@vger.kernel.org
X-Gm-Message-State: APuU4Z+jEq++HNDQpCg0b4AE90RyJiEnDVaEJY9Hdq89Xg0pzXwJXaL0
	uTG8tWo0x3+uulwke2zl5/HoEZ8ri9SiJyaE6mAz9q+phakE1n52lPn7
X-Gm-Gg: AZFdTZfv0uBn4yp5026GYe8M5jNqXWwOyWlukC+TjIXJSU7mcILyZPBRscnFRVM8xVW
	CYajguhvfBFTCvoPs4cwuPx2UurG8gdKx1kt8XTpRSOeHo7clLL8sfS1NSs5v+ccnXZ5Q9SRaLc
	DSxjeirUU2mnCl+JFZw5tbyAHIkLbRsTAvFvZgWB5SLD4ahWykB7MBL8XnsP4LhnyCYyulZSDI/
	YROApq6cb1zRyU76Zp/BjsteMKFDj0X4M5hiaAc8vhF8ah3mVXRS8YYghEbe3GdRhiWklaESSgd
	o7+Qdl3Zxhl/bgIIajdUSsFCkJKMunvKImD2T2E1x2mgsHz5WRS1IJmYWbognYcAIFGnDeNZx5D
	ywRg67c/YbECtg+4F83aEd/h/j+njhsWbSuqDtObCDpsppxMlQf9t/lO4xM9IzLYdWTlCf6YltC
	Zt5BZoLUSN25EOftfLDIekHcCQK00PsgL86CyijfGfA4+IqqUXI4eMYRJfWYph6Ovl0/oZktrBH
	WIORReGDJph9fF5RYl1zsnvgZkykOicj2XOJs5xKZQYEHGwqCGfw13Pg7q5cnaC7zSEWIUgfyP/
	5TxQ/eRlpSBO3zM9gzAR4bBsyCa4
X-Received: by 2002:a05:7301:259a:b0:36e:800a:71fe with SMTP id 5a478bee46e88-3856c4b844cmr17149965eec.1.1795596544846;
        Wed, 25 Nov 2026 00:49:04 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:49:04 -0800 (PST)
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
Subject: [PATCH v4 4/6] platform/x86: thinkpad_acpi: Restore keyboard backlight level ourselves
Date: Wed, 25 Nov 2026 16:46:41 +0800
Message-ID: <20261125084644.137506-5-kmatzkaczor244@gmail.com>
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

kbdlight_suspend() and kbdlight_resume() leave the keyboard backlight to
the LED core across sleep: the LED core caches the current brightness
and turns the backlight off on suspend, and writes that brightness back
on resume.

On a ThinkPad X1 Carbon Gen 14 with thinkpad_acpi unloaded, the firmware
turned the backlight off when entering both s2idle and hibernation.
After waking from s2idle the EC was back at its previous level, for each
of the four levels tested; after waking from hibernation it was at 0.

Drop kbdlight_suspend() and leave turning the backlight off to the
firmware.  On resume, write the cached level back to the EC on all
models, instead of relying on the LED core: this brings the backlight
back where the firmware came up with it off, and changes nothing
where the EC already has that level.  For this to hold for every
mode, have kbdlight_brightness track the EC level itself, 0 to 3,
rather than the brightness reported to the LED core, in which the auto
mode (level 3) shows up as 0; translate it only when reporting a
brightness.

Only s2idle and S4 were available on the test machine; S3-capable
models were not tested.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 38 +++++++++++----------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 16bf2267d..764b1efa6 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5105,7 +5105,12 @@ static struct ibm_struct video_driver_data = {
 /* EC level that selects the auto mode for the keyboard backlight */
 #define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
 
-static enum led_brightness kbdlight_brightness;
+/*
+ * Cached EC level, including TPACPI_KBD_LIGHT_AUTO_LEVEL.  All state
+ * tracking compares EC levels; the auto mode is translated to a
+ * brightness value only when reporting to the LED core.
+ */
+static int kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
 static int kbdlight_set_level(int level)
@@ -5247,7 +5252,10 @@ static int __init kbdlight_init(struct ibm_init_struct *iibm)
 		return -ENODEV;
 	}
 
-	kbdlight_brightness = kbdlight_sysfs_get(NULL);
+	kbdlight_brightness = kbdlight_get_level();
+	if (kbdlight_brightness < 0)
+		kbdlight_brightness = 0;
+
 	tp_features.kbdlight = 1;
 
 	rc = led_classdev_register(&tpacpi_pdev->dev,
@@ -5281,14 +5289,20 @@ static void kbdlight_notify_level(int level)
 		return;
 
 	kbdlight_brightness = level;
-	led_classdev_notify_brightness_hw_changed(led_cdev, level);
+	led_classdev_notify_brightness_hw_changed(led_cdev, kbdlight_level_to_brightness(level));
 }
 
 static void kbdlight_notify_change(void)
 {
+	int level;
+
 	guard(mutex)(&kbdlight_mutex);
 
-	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
+	level = kbdlight_get_level();
+	if (level < 0)
+		return;
+
+	kbdlight_notify_level(level);
 }
 
 static int kbdlight_read(struct seq_file *m)
@@ -5337,31 +5351,19 @@ static int kbdlight_write(char *buf)
 	return 0;
 }
 
-static void kbdlight_suspend(void)
-{
-	struct led_classdev *led_cdev;
-
-	if (!tp_features.kbdlight)
-		return;
-
-	led_cdev = &tpacpi_led_kbdlight.led_classdev;
-	led_update_brightness(led_cdev);
-	led_classdev_suspend(led_cdev);
-}
-
 static void kbdlight_resume(void)
 {
 	if (!tp_features.kbdlight)
 		return;
 
-	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
+	guard(mutex)(&kbdlight_mutex);
+	kbdlight_set_level(kbdlight_brightness);
 }
 
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
 	.write = kbdlight_write,
-	.suspend = kbdlight_suspend,
 	.resume = kbdlight_resume,
 	.exit = kbdlight_exit,
 };
-- 
2.56.1

