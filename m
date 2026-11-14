Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678973;
	b=cAMdtXA0iooUVQ9d75UfWb/XdWmEU0Ph0A/+8RElli2M9phkRha1njZ2gEou1+kQZYlG
	 23gxDhPnOwKICCToNt38TBiUV7ELBqJLfwP4MF2yG4Gd1d+qlA1fTRCZXbHP5GrmQvesm
	 Jlbsra9/AN33zuihQxU0XXk7M8nmugxUkxdnNORIYR7SEwZ5oTiNEHwd1Y/ItPp1i/JcD
	 r5Q+tzgvTjD/C2GDT80fcV9vJdHqZI0V0bMB7eh+Vi3M4KkqdGVuAhxiWgeGI1uyRYpK8
	 o+roJB9gjUytbuQkCPTEelNzMv8CvsQbEXEd6bKi+DNbj/5ToqmVjUyIB3ptVHGOGQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678973;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
	b=u9t9cYCdo4w2cu+L/iDF8QsRsn417v3Y3ej71jWv2DHyS8gayFwUzLc8ZODReulSxtP9
	 eD3u7Kr6Jh++dQuzmey0OtlR5+HX618FuSFimB4tFRtEWKCjtuBc+DZ4zGstM9qNUBmsI
	 x4xy2VJoa4rMjcX1TGiresbayRwRz+ZebCNKhMcd4hKHcQu0IqAx5AbPVRmpVIu+hzd6X
	 SRys8PKEz2mevWdrTdse9Y7TgBhbY8pqK3il8uMghCayLKQIgyTLZ+oZepn2ZUBn9EEnQ
	 ZCdI9HhVwvuFtedMpgzMeN8ak32u9ag4+EK+wQsnE9qqs4gp0daYH9c4Hbw3fhPGiug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Apu20ChO;
	arc=none smtp.remote-ip=74.125.227.137
Received: from mail-pj2-f9.google.com (mail-pj2-f9.google.com [74.125.227.137])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C33606A32D
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:56:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83C33606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Apu20ChO
Received: by mail-pj2-f9.google.com with SMTP id 98e67ed59e1d1-3b18c01238eso541626a91.1
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 09:56:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678972; x=1795283772; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
        b=Apu20ChOFv2qZwX/V1h/s55KMW9ThG/rNwR6dD60Pv7Z/D8MksZ/3qEL8w18TIsw3u
         Nb9qmnoKkNNw4J/g4L3dxxJdmBCsdDllF9wAeV6Zdd+iDecquyZHCAs+todRo/V+2YDM
         /261WLUuhu8j07gRH555XiVmAbgyIXZc5aSfEuTpcnH8b/I23Lfa06YwzW0zi4bl3QRL
         OtmX+hWcZiC6FvJdbterzs3vmLHDCE80dLRaPTNMmaQ741wRTn850pzRhGHGGPPNCJkF
         HZykVJAqMiBKfBc7oXupBP0ayU1zWSE22NuJ0U8eays8pc7aB6oWAYZt37UfVEzqxZLT
         WrYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678972; x=1795283772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=kIKHVOEd3tU00uERKFZyOFTP43KxgnJgprh9ek+lcMA=;
        b=eRysJpgY4+mLwDfN4MtsNMjklTkClcUG4Y7mAu/rDQOpF+7yd8cV91ZYY0FfwgrPj4
         DKvoW7ujraTfr3sxLKBf6OuFLi8mxmLCs5qzO51xb1rQFxp0gDDrxNe0WDMCzJg/JM14
         xzYTlMPtTUFvGMKUeS9xzmOJ6pLWEY0sDA0vUHGKJrASYweedKfxvC+eVjeDXaPT3RD0
         fCrkGtGKTllCpseF9DxC6Vams7SCoQ3p3zt7s4jVMXWfVzZovcz/y7UVVSJnPnfQouG9
         OiFaZTo4UddzExgiKa4KEHHCwCSbAs5KwUMILTC+QX68YbgU3Fqf+m1eGVAhGkpNQOo7
         0vng==
X-Forwarded-Encrypted: i=1; AL+hErF8YTxvbrl33UO8jqIqTnKVzaxag7Svu79nlrxHccHAmN59AVBtWMyTR5nPGaZhUEkUQxqCnkT7znJC@vger.kernel.org
X-Gm-Message-State: APuU4Z9Uh3f2WUbG4x9RznGPrdKmiaCkvTHi8qIeppgczz7DUITz4lSU
	sl/55xheJw07yYWSz6z0rmL/+fk/0xk9vopsweT3nL73bbkjRVpdrmOf
X-Gm-Gg: AYBFou2SQVuyoeq4dsQzAtK/QigoPLsoVlmQzdk0M81Qxno+LCgZKleJIGEhvQJRev7
	2B+3b3XSgfsHspz6/0CeFUujub58s3h99Brqi/U4YK3UW2cMvpl3HKZ+i/5rlznZK/cPl0qY7yx
	A/PisTW7yXkCNFsj1FH8sQQIbm/vxn1sTYkOf7mged3ZR4PjzWsaJ7ImqfV5njrGw6R2IRaJvLT
	BcUwMpJW/w4M41UJq0NGAwiFQT4torX2ZU/y+iRUMTWfptr57FseZAj44IIcz5QLzs2KxnJgGmP
	CfPzdCAyNYsGHmdkX5nLvyPvvsK5e8+NCWqHW0mrYiM0JGjS8ZQFPLKQSmoVaZw9oa/5SACUE9I
	uZTaywOs9lAmqT79IW7JAGyB+1QltnGa7f1jr8poQIyLaqrLGqA3izNQqwupQnOuQHv5VyO+vJO
	NcjcHi81h409jWbxMM9L2d8Z+vs+fa/9wir/iXtkmdCe7L3Jtvbh50YPcsls69h8QojdejZgOAz
	yonMlaJ9pwCPNufk40tgDbFCWnYF6AjY9uKwRQMv53SxTSOrvQsPeA3yljy2aQ+5WNObZ1zYO7S
	bL5abzKx0wwVmN31YMKhTf0QEcp8pQ==
X-Received: by 2002:a17:90b:54cb:b0:3b0:ce1c:e74f with SMTP id 98e67ed59e1d1-3b1b0a3a251mr5483199a91.27.1794678972435;
        Sat, 14 Nov 2026 09:56:12 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.56.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:56:12 -0800 (PST)
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
Subject: [PATCH v3 2/7] platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helpers
Date: Sun, 15 Nov 2026 01:48:09 +0800
Message-ID: <20261114174814.62153-3-kmatzkaczor244@gmail.com>
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

TP_HKEY_EV_KBD_LIGHT handling in tpacpi_driver_event() reads back the EC
level, updates the cached brightness and notifies the LED core inline.
Extract this block into separate kbdlight_notify_level() and
kbdlight_notify_change() helpers, in preparation for reusing the former
when writing a level through the proc interface in a subsequent change.

kbdlight_notify_level() expects the caller to hold kbdlight_mutex;
kbdlight_notify_change() queries the EC and notifies under the same
mutex, like the original inline code did.

No functional change intended.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 40 +++++++++++++--------
 1 file changed, 26 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 2c3f8cf32..c8098f317 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5317,6 +5317,31 @@ static void kbdlight_resume(void)
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
+/*
+ * Caller must hold kbdlight_mutex.
+ */
+static void kbdlight_notify_level(int level)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+
+	/*
+	 * Check the brightness actually changed, setting the brightness
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	if (level == kbdlight_brightness)
+		return;
+
+	kbdlight_brightness = level;
+	led_classdev_notify_brightness_hw_changed(led_cdev, level);
+}
+
+static void kbdlight_notify_change(void)
+{
+	guard(mutex)(&kbdlight_mutex);
+
+	kbdlight_notify_level(kbdlight_sysfs_get(NULL));
+}
+
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
@@ -11586,20 +11611,7 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		return false;
 	case TP_HKEY_EV_KBD_LIGHT:
 		if (tp_features.kbdlight) {
-			enum led_brightness brightness;
-
-			guard(mutex)(&kbdlight_mutex);
-
-			/*
-			 * Check the brightness actually changed, setting the brightness
-			 * through kbdlight_set_level() also triggers this event.
-			 */
-			brightness = kbdlight_sysfs_get(NULL);
-			if (kbdlight_brightness != brightness) {
-				kbdlight_brightness = brightness;
-				led_classdev_notify_brightness_hw_changed(
-					&tpacpi_led_kbdlight.led_classdev, brightness);
-			}
+			kbdlight_notify_change();
 		}
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
-- 
2.56.1

