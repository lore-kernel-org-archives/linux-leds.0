Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793632423;
	b=JnDlLBsBjQL4a4pfPW8YyfxQ9iwsZn8v817d2+4OVDAygEsnKnwFukH/8lJXsywkphAr
	 E42pPSQ0zHkDLtFivi6YJUSqxulljCWbqNJqQo2Sk/WwcnyXO4cZ/LC9/OADf63Z/9t9o
	 mu/8PKPyn/sPSj05+TgNkdgrqcAewViIbDcO9ODL6wPYwKnu2lVAtPu0HQYurkucOO92h
	 j97uTEGkvTi+Pw78eT1MVSPwlBL0Rji7T0m9DaFhtuY6cSeL7pDHueKW/EnrbfS94nSn/
	 K5vwxumnJQCi+TeE1x1WMdb93ggYD01I2XDRGttf0zZbC5X0M7PX4KuMIs6hsRrb33Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793632423;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
	b=wMI6GexMMkEPFMbD46PwFv6OTRsncmNPCCn2X19T4CRuZIkLsUTPEX7Y+4gq+QfSoJGS
	 abw6L0NaWe/5mJxgDMI1t9gvfdte3n98bJTC6CX9JqbUW5cahj9p5PL+V+bjKFffMf2h3
	 kiWPcqDnGcWwV4J+xBovgOIZZrdXzbzh5YHGiOehpexzyDj1AipT+RhVIyNUyy/R1103O
	 QTGzOiJzw/kcwDtTK5uRWGLbI0PcMPRmjrBhN6Wf3oQnMhp6Z9GAJ8iuQRaZZEKKD+HUF
	 1AvTNDYkD2MA99k9bmknZ2gM5kzisJstBRsS/wU34hOkoEoh9sjZ3QA76LyoB/xBlyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HShl6aUg;
	arc=none smtp.remote-ip=74.125.227.133
Received: from mail-pj2-f5.google.com (mail-pj2-f5.google.com [74.125.227.133])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A42F6091CA2
	for <linux-leds@vger.kernel.org>; Mon,  2 Nov 2026 15:13:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A42F6091CA2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=HShl6aUg
Received: by mail-pj2-f5.google.com with SMTP id d9443c01a7336-2eb0c699769so10624325ad.1
        for <linux-leds@vger.kernel.org>; Mon, 02 Nov 2026 07:13:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793632422; x=1794237222; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
        b=HShl6aUgVwrE59N6fYNuPaLhljDz5RBWdUG0z8ZGXIScUNFAPcqvIiSX+RDT5CkC6p
         xwbK7hFveHiKl5bchzg5pSDGwriUIdGlB6SGyilI9GriHdVIJJrE3CoClQ8T0OaNodp/
         LZ6RLj3Z5EJ61EFXgCwYmzUw60uR0kkePsX9zth7cqPQ4rYI8TD7hw5pJGw0m7EquCBX
         OQ9KVxH61w8rw+OUfpPPiS1KKnFzek5pHZuNHx/wC7TrMl7AKf+C0hWZgvNokJcz1zeN
         HG48roWZXt2TyscMS3NrLBruVnwhMQK0tESLiOFiF2YUMPwgAukoTDc3NWxt4ubcKBZg
         ZCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793632422; x=1794237222;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=DRu5y9IEIWHGb7/eSUxJjK+SiC3Y8A9DyNTgcIJk/P8=;
        b=ox+WoPNx/4zFtFu9OfH8Qvx/uWSUjlpxxYL0ikgB5r+8URRXwhqmwrmnzvcJ9k8jJ7
         wlNCb/KMOhEcfH4C8hcabRCKUp0AqfHXQ2E7vqw8Mm9wF3Bg0PyAbIZRi7zn7RgPMrgj
         mA44K0YM9dLkvyj0ZkPFQUqJBTvsePI0xC+ufA2cpWISCvTgdrntau0H8vWlKWulfzkI
         GLnqhk2WhWBgXwZQ90k8TBxplnn3oxVTrnGm0RvVfCPKNn4ZISoZ7fc1mCXKtlH6iVsM
         W/SIk24QymGxnQpzPTRDyb1InZ6sKVuT6fMoqtNjV9HhyThuw1Ux8j37MMU9cb9xRCIU
         jGig==
X-Forwarded-Encrypted: i=1; AKwUvBzcAq+iIpg0WvCJQtFl+VQlydh1v8efRXtHRt3rDlPJ4lsc5z3sqvlh1fAToabAiq7ATmxcGsfJyD0C@vger.kernel.org
X-Gm-Message-State: APuU4Z9TeYDSFICpRNLGnPxZLVVSzlMwri4ukXrhecHeGkxQBzRE11MH
	HZI8tBjkIgibSGkojNnICdTbqidFvHi7wHiOqLiVnOuS8MN/34C+gckz
X-Gm-Gg: AYBFou2p/Tq+BqC4WwSYT/YU3dLEMRtHtcjP8XUNmWfeZ+Lrx7zbO7fn+dx5MJGQBnx
	9NRR/x4nsj0j4T2oYLoAqfNyqAv8JdEr/HHKefHJiqghoJn9FZAILMiGd38uzJSQRDTs1JDsIN7
	jGeReuUjMiAxzPh/dJl7DyrHD+xM7JW6O/c+NCKWRoakHRyDoiP1zxV9vnEwES0gDv/EjJsvFMn
	1Vc73YXkGJbl2NuqCP7G2ZKJR8yoxF5u8xNNmi1+w9PwzBEFJrPTP1qzjr5b1rxGgPkjtqlBkPG
	TC+PqWBnK86WrD/ADkix0sTe1nuUvP+Fwa7Gl/mUEVrs6L85jmzZQfBNXX+6gL/yyAWCL257sAt
	0Mj+5AFJH++ZiDEWC5f2aEWUkdQQKfD1MJMMcgnPBJDJdYxf2ZpmlcXVQzIBSp/Rg2jvSRafNPX
	R+UPniqjAjjAKb/QWEjhx3Z8MkSKaQfqhJFdHWIpWcSfD7N3uFxi9VwgWjNm/w0cFyPVv69iBYx
	9Igifg/18+jTAzjEJBElW58zUUOPSJz0OWH40f/hQ/dF9aXIVwsz47lufh4hSAnCtk4YKPDBqsB
	y1j0jGaX+MOqCqTDltxS2/PrIH2225DKG5N4DJXA3S3TmB+fjoRlrRQ=
X-Received: by 2002:a17:903:2f06:b0:2df:35f1:8771 with SMTP id d9443c01a7336-2eb3650da0cmr99597675ad.54.1793632421903;
        Mon, 02 Nov 2026 07:13:41 -0800 (PST)
Received: from ThinkPad ([240e:46e:8710:e4e:e10f:cd51:e533:58a5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3924c93fsm30567675ad.34.2026.11.02.07.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 07:13:41 -0800 (PST)
From: Qiling Zhu <kmatzkaczor244@gmail.com>
To: Mark Pearson <mpearson-lenovo@squebb.ca>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>,
	Rong Zhang <i@rong.moe>,
	Hans de Goede <hansg@kernel.org>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	Henrique de Moraes Holschuh <hmh@hmh.eng.br>
Cc: Griffin Kroah-Hartman <griffin@kroah.com>,
	ibm-acpi-devel@lists.sourceforge.net,
	Lee Jones <lee@kernel.org>,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	platform-driver-x86@vger.kernel.org,
	vishnuocv@gmail.com,
	vsankar@lenovo.com,
	Qiling Zhu <kmatzkaczor244@gmail.com>
Subject: [RFC PATCH v2 1/2] platform/x86: thinkpad_acpi: Extract kbdlight_notify_change() helper
Date: Mon,  2 Nov 2026 23:10:18 +0800
Message-ID: <20261102151211.40701-2-kmatzkaczor244@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261102151211.40701-1-kmatzkaczor244@gmail.com>
References: <20261101100123.28749-1-kmatzkaczor244@gmail.com>
 <20261102151211.40701-1-kmatzkaczor244@gmail.com>
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
Extract this block into a separate kbdlight_notify_change() helper, in
preparation for reusing it in further changes.

No functional change intended.

Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 41 +++++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..3260eaa62 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5313,6 +5313,29 @@ static void kbdlight_resume(void)
 	led_classdev_resume(&tpacpi_led_kbdlight.led_classdev);
 }
 
+/*
+ * The EC cycles the keyboard backlight level itself on Fn+Space; check
+ * the current level and update the LED core state.
+ */
+static void kbdlight_notify_change(void)
+{
+	struct led_classdev *led_cdev = &tpacpi_led_kbdlight.led_classdev;
+	enum led_brightness brightness;
+
+	guard(mutex)(&kbdlight_mutex);
+
+	/*
+	 * Check the brightness actually changed, setting the brightness
+	 * through kbdlight_set_level() also triggers this event.
+	 */
+	brightness = kbdlight_sysfs_get(NULL);
+	if (kbdlight_brightness == brightness)
+		return;
+
+	kbdlight_brightness = brightness;
+	led_classdev_notify_brightness_hw_changed(led_cdev, brightness);
+}
+
 static struct ibm_struct kbdlight_driver_data = {
 	.name = "kbdlight",
 	.read = kbdlight_read,
@@ -11581,22 +11604,8 @@ static bool tpacpi_driver_event(const unsigned int hkey_event)
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_KBD_LIGHT:
-		if (tp_features.kbdlight) {
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
-		}
+		if (tp_features.kbdlight)
+			kbdlight_notify_change();
 		/* Key events are suppressed by default hotkey_user_mask */
 		return false;
 	case TP_HKEY_EV_DFR_CHANGE_ROW:
-- 
2.56.0

