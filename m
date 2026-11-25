Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795596521;
	b=5VR64zrx3fBUHZiIw3FwDQvP85pyAePzAdiUhmGfwYAkSf4z/ErM/9Fp217bx9dWu7Ak
	 QUorwkVB8VWBBAaFUcLk57HQMT+5YsVDTZvLpHC/7qmkV8e64mF8056gwT28iDLZKDnLn
	 K+sHA4IGSSkhrr7uih8xWcx/zJwS4ljFztZBFGsmkwQAosKgSM1C2wu0Lo3Wka8bobyN8
	 mRWmPtgyFCl3tf8HWpPsAjboN9vWfqDRxOGhJJiyCR+mQHiL3yi8lv9peamdxxKxzJL2k
	 PP/CuSoI3dG+3WFdHm4b4LdEPgqLIfsVcYWAs2Q2PIT7RoXt+5fFvK6+OWR77v3e5zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795596521;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
	b=ratRTcEX7t6TdCsZ5QasI4T8Bjuwmv9EdLRFtoAo3j4I5BXZQf7SbJ6l2MS+72XP+5wS
	 /E5nPMmI2eeLWjPzIRsne+h+rnx2/lkMHGPJR9yXDVliRBR90UTy3TxH33MYf517rWjVf
	 t9YLGnvIxQ+YVgeO2ZkycnrlgLSJ++DwCokH65ZO1fDRCw20dakVe55EquHEXB+wTXnQh
	 crhe2N9Ly9Zc+Yrfbfyd0sKG8qWHfM5jFs/Iw/tZOZs3lg2PmBGfq+5whdNiyMNJ9Wr5k
	 RWytu8CELNfdlc9nSZn8ImIzbgag900fXBwJ3IK1osJbZ89dbNQJffY4gLNjF6fABKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="RYMn/SoQ";
	arc=none smtp.remote-ip=74.125.229.4
Received: from mail-dy2-f4.google.com (mail-dy2-f4.google.com [74.125.229.4])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 193DE606A326
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 08:48:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 193DE606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RYMn/SoQ
Received: by mail-dy2-f4.google.com with SMTP id 5a478bee46e88-36f2f262b19so2020738eec.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 00:48:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795596520; x=1796201320; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
        b=RYMn/SoQcx7Wdjnvdd1EPOCTHZ/QS6ZqKmnjEg9C7Gkwnemv1AZtInz9AH1DeL0C78
         4cYjAQE9JMzqNo/aJGHpD1YpTTkbr4QNcNy+6I4v7UEsRWrKYBwG2nY8MIapgtyrhq+J
         DRh9yTGf8RiHae9Oa5bhBFQhQcafPHm7B9w8wQaplQ1dA2p55c68uLZ7+h8fInuqY6aK
         PhSnu1cooMe3qksY0t+GB+lzhtEOz//5kiBAc6uVGUvLxWUamSd2LSHrK6GmbXI18/ny
         evTL8ldRhykDqEt2VNdVFPKYlzgpt4UjeGVCPqqAepEdwvFEKHgIZm6wFDdhgJBaILo6
         EshQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795596520; x=1796201320;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=P+wd9JyZvI+Ds8ItKadr6A0TrwDEYi2YNevvWKQHylE=;
        b=cSo+Dfe9C8/8Q8qbi6RslRhL6RhqyI5YmTaMzwjprYoAohYx7/3+uDlBiIcHK7V72Q
         HOJR1HzYfrwXSkPAB2+ffenFtszYpa1vorHuVsMeQ035Qs0j/1+5xHE4IdrjdtGeb3Ga
         K1UpS/JN4Rfc51oB0vX1VJ911EWUxSq2Pje4wha6RqNeuuMFh4lDShcZpJnLR/97AvxU
         YLQxxDrCGrWFX0M6qUdXE1IKfOmUq7j8vK4vgSBDDe+x7c+f4bwWQWZWp7kZOvqPOn+A
         atHGRBuVgk2XmTY+d8Gm4wueXHIaom1U40ui0rNUhYLOi7rBXKwtgOST+FxuiN+ZYpZg
         anWA==
X-Forwarded-Encrypted: i=1; AL+hErFPeRYiVpPmJWRE0qnxw5OEAce9dS1+ojdvsmtzqLOmfXOgeXHDozd6oCzrz74SYry5K/oDQB5wBl9b@vger.kernel.org
X-Gm-Message-State: APuU4Z+SRddFQxVriH0tYDiodS53PzLFRqjCvTWKCd9ilHzWzYrkIe3H
	WqGaEC/i+ZmuJL2JMA4OWLiqzKudu/WzpoFyNh9nWBpszc7zmie/2Jle
X-Gm-Gg: AZFdTZfdgba00swfEgvVexn7dPdBWfUTTjP/mJSaVSgAElJTWXBdpsjMdE6f6QoKgrq
	ZBLKLfux6uFMQdqTCp4b9MMUZNVNoS78d+RK2xBPamsrmgbmu7iJwWGp8pFG7NfTFpHXvhMmUdb
	Imz+rBxqxCiGOwSG8K/vOTc8pbZnkJXoySdhbmbaDs9WvTX6qrqL1My4jtJ/tWywBSrwRbVQ3Q+
	RmVCc3HA6bSuht8fPyvDbsUUzGcQ+cdGK5OVyQx676g+AdymX9J8d3Vy7qDA+RnvJhCuvC7qpWw
	6Ei1XCdC0Ta/+LLRYBTG//FrHj/1pock/793E/KItNeR6am7o9HaIgJfIYVjWyQSkTOiAEmFvE2
	s45o6EQGuy21Xj6XjsT17lEPsvbtTHTP7iqkFxBaBjhZxAdN4RfCouaM2ArtWfjot9idyex6asa
	zSsWs1lthJQpMgVPYSbovqS/rGbJo6afTkPu/EpyYcvCm8i9V9YkbrkpNH1DX365BStHguMGtsT
	vJBI6hbMdQcNXQTGCa1O1CKftggC8i2uLlWDQInYmoTkPUL9DHHr3xsi+8viRQNehwydWQD0h3i
	mwtMdK3pmksMZbowVnWcUZFmUXL/
X-Received: by 2002:a05:7300:ec8e:b0:386:a97c:f80d with SMTP id 5a478bee46e88-386ce3a8f03mr1873307eec.27.1795596520027;
        Wed, 25 Nov 2026 00:48:40 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-386b9bdafb5sm18879252eec.9.2026.11.25.00.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 00:48:39 -0800 (PST)
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
Subject: [PATCH v4 1/6] platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
Date: Wed, 25 Nov 2026 16:46:38 +0800
Message-ID: <20261125084644.137506-2-kmatzkaczor244@gmail.com>
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

The EC keyboard backlight level 3, which selects the auto mode, is
passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
then reports a brightness of 3 with max_brightness 2, both through the
brightness sysfs attribute and through brightness_hw_changed
notifications.

This is not only cosmetic.  According to a report on a ThinkPad X9-14
Gen 1, UPower 1.91.x treats the out-of-range value as invalid and stops
watching brightness_hw_changed, so the desktop no longer follows the
Fn+Space hotkey after auto mode has been entered.

The auto mode is not a brightness level.  Report it as 0, which is
within the exported brightness range, in a new helper,
kbdlight_level_to_brightness(), as ideapad-laptop does for its auto
mode.

Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
Reviewed-by: Rong Zhang <i@rong.moe>

---
Mark Pearson's Reviewed-by was given on the v3 version of this patch,
which did the mapping inline in kbdlight_sysfs_get().  The helper was
added at Rong's request, so the tag is not carried over.

With this patch on its own, on kernels that still use the LED core
suspend/resume path, a backlight that went to sleep in auto mode comes
back off after resume; before, it came back in auto mode, since that
path wrote the unmapped value back.  The rest of this series restores
the level the EC had.
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..31d3721bb 100644
--- a/drivers/platform/x86/lenovo/thinkpad_acpi.c
+++ b/drivers/platform/x86/lenovo/thinkpad_acpi.c
@@ -5102,6 +5102,9 @@ static struct ibm_struct video_driver_data = {
  * Keyboard backlight subdriver
  */
 
+/* EC level that selects the auto mode for the keyboard backlight */
+#define TPACPI_KBD_LIGHT_AUTO_LEVEL 3
+
 static enum led_brightness kbdlight_brightness;
 static DEFINE_MUTEX(kbdlight_mutex);
 
@@ -5135,6 +5138,15 @@ static int kbdlight_get_level(void)
 	return status & 0x3;
 }
 
+static int kbdlight_level_to_brightness(int level)
+{
+	/* Auto mode is not a brightness level; report it as off. */
+	if (level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
+		return 0;
+
+	return level;
+}
+
 static bool kbdlight_is_supported(void)
 {
 	int status = 0;
@@ -5194,7 +5206,7 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	if (level < 0)
 		return 0;
 
-	return level;
+	return kbdlight_level_to_brightness(level);
 }
 
 static struct tpacpi_led_classdev tpacpi_led_kbdlight = {
-- 
2.56.1

