Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.128
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794678930;
	b=voY3lPF5W12sXva21lqwEEvFvZIEO1pniasi9LfgnaZg2htDPKVvv4pjDT3vooZMhZhe
	 ky5t2we8+6rZNSb5cz28bpzfWaU0eFSbiwXCRStxI+9AN8AmBWaVv70R3KPjppUUDct8k
	 a0e7N1ivRolNBGe+PTN3RMHuZ8c0Ij87r5SvpsVWnl80tSVVTc7iPkyL81iaQ8WUeH15t
	 1dl5lFtzpddohT9PCFew6AU6knsj+UIKW0DWlqlzEhIKiRyM+UjFB6WyGjOtFfBksFW99
	 2b77GJkoNoQnSN/VBayDLRGLr7tY0ba0teiIoKobH0rY4JDWsrfp6dFUxgSn4FEx1YQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794678930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
	b=aR2PXm/ytjMeMzlbPd75t43QNeu6XnswYb8K9qwijmEsAPQbY/7bJjFZHavhQEELvX/a
	 y49Kn1dkUgXLFo/BnEyXclpMecVmALhf4bbUAfA7DCz1djsYm+td+HQB/AivnXL6d7GGQ
	 Q0l8nluIv2fsPXY9sIsSYWh69067jOzKaiBoSiY5zvwRMIYiELBqJp9RLkC1wGGf2V2lN
	 BlXbtsg7GSfcFjsew6M18nIZQbQAQjYaTwq/3B4z6GP2MfwO0XkM0xLohmN5k0gx7ktmj
	 rA65NOw+49qiJdCK7dIF47/9EbiEoDbtA8sEpkfDGhINmWKr4MJEDE1F7L05fOK1Mig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiM13zK0;
	arc=none smtp.remote-ip=74.125.227.128
Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C18606A329
	for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 17:55:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 17C18606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fiM13zK0
Received: by mail-pj2-f0.google.com with SMTP id 98e67ed59e1d1-3b139f8515dso587382a91.0
        for <linux-leds@vger.kernel.org>; Sat, 14 Nov 2026 09:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794678929; x=1795283729; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
        b=fiM13zK0DL/FdZuhzfWqUQ9xC5yOmnRfrBTlGDXRkL0eH0ShXWM1kNISd32sNJK11M
         EBivrGtddVHeC7bE0RelcKO56Az/DRdWpcVC1OihoMK679fbkrsIFFJwkNrhpxlf9SjR
         s6Sc2M3USl+Pz42a1HV9v85kpXO1rMxXjZF/PDbKxyIEqG3y9TiL/Ole9CcXxRecjI/N
         zhzsQ517jvvYIn70Pgn3YViNDh+D/aoB+6x19NZpFDYM9omDMGRFS6q+SMzvdaZgcAGZ
         2k7jGeynjw9ewaoRwMxyMJ6aGSSEH/xbyPDxbtDhP9GIC9ECBKkIO2sWBique9Rxinqg
         sOkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794678929; x=1795283729;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vUdHoaBVYZmPnE/s62HT4yYg3gzMJTqDR+eMVLrtAyE=;
        b=FiSeWxSf34MMsJv/UNk7S12JSZi9DAv+/O/P5txIojICP+2lJDJK8lCiAFvTGsdgRJ
         eN2+1BPWsjydqRXfwS10vgyXwOwJW1v9WbAw/6xrYa4b8CsQoDcmU29qCNa3Z6Z3U4Lj
         Oo4nFosTtYesTM8ZxIZrdqfKFJoOTn2+vzZG7ye6adb7UP/va9H8i0wIdcLAoLdInksE
         5EO9ffvItI8RNkVipQAUi3XooFipyqo6IilmL3wZAS30JJngCqgpPQVMqn1PjXKCo71q
         0g+kJbElpmeGMyuYeneMzXbWxxBwp9qk8etJoM3x4Lhn5oSYNLogKBnlEaWByKLD5qfh
         pafQ==
X-Forwarded-Encrypted: i=1; AL+hErHVFnrQgsUFPQ5Un/vjphGBkGN66JRsVZcVTvPdh53/vAKRl9Xa4GE0dLETs3rT6mgwKrh5168gb2XF@vger.kernel.org
X-Gm-Message-State: APuU4Z/zscA2d0iXRvtZlTp4ly6ttFR6Il8rL66hD2Zsms8NBQfQK6dz
	LuWS+NLQmg6X/E+Tf44YYO6rB6uOJ4LdCfpxonZo9SswwGgecDPPGm6J
X-Gm-Gg: AYBFou1xX0+lBn/z2tJU9nxnDc8jpk5g6E7zfGrQAiAF7WQQA09joKM3ptQXKAx9mx0
	Bkl+332s6Tu+nq83f1I7wLjc9g+ngfMAzPFRbbsX8E15VOH6flul4pq6N8bF4Q9sCJ20Dr6zHa3
	dXcjwpCDRNHzcsz/mOMotvIEJqh4Qr/ZAN/1ugBHGTDIfJXUFVspqDjgADG7LXERr62nhU1jr6X
	OKMmWEQ1VBTKSWlPiGblz7dfqWtgEj/VgvYseoSaAMDKAAW6bf4+fvj8DCGxcjjdQZwQdbSviMp
	i+lZLwEVoEZ86PK59CWMLTZpGDMdI+lRWv+sz6BLi00dp7L8Pe43bYQq0ZVYqAD/ss5Vb6Gc2eV
	WDONTKN/AFQSD554E3EV/PZ9JI77ic5d0uDFw4EWVMybjCdZGraBf9KyH4sQrC6iHVntT2tSmsf
	yVHQZRp7eR3SQTwjsklSvl14WIICl+8kcbgUTNCxZDckOLuYHhcxao3fHRiY3KjgfTy2MvzsRKA
	0tc5H6q9aCMKmr8cU/b27ioTv5ZKtWZQNZaWFnV8HocjihvmIw77KYsBw5idFGV03MGswDbGQ4q
	m0it7397cW06TtSKnuFstq5Ex0he
X-Received: by 2002:a17:90b:4ad0:b0:3b0:ada3:b505 with SMTP id 98e67ed59e1d1-3b1b09f3fa7mr6658391a91.19.1794678929303;
        Sat, 14 Nov 2026 09:55:29 -0800 (PST)
Received: from ThinkPad ([192.220.23.71])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197c6c9c5sm14569383a91.1.2026.11.14.09.55.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 09:55:28 -0800 (PST)
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
Subject: [PATCH v3 1/7] platform/x86: thinkpad_acpi: Report auto keyboard backlight mode as off
Date: Sun, 15 Nov 2026 01:48:08 +0800
Message-ID: <20261114174814.62153-2-kmatzkaczor244@gmail.com>
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

The EC keyboard backlight level 3, which selects the auto mode, is
passed to the LED classdev verbatim by kbdlight_sysfs_get().  The LED
then reports a brightness of 3 with max_brightness 2, both through the
brightness sysfs attribute and through brightness_hw_changed
notifications.

This is not only cosmetic: UPower 1.91.x treats the out-of-range value as
invalid and stops watching brightness_hw_changed altogether, so the desktop
stops following the Fn+Space hotkey once auto mode has been entered.

The auto mode is not a brightness level.  Map it to 0, the value it is
reported as most of the time anyway, in line with what ideapad-laptop
already does for its auto mode.

Fixes: bb28f3d51ff5 ("thinkpad_acpi: Add support for keyboard backlight")
Reported-by: Andrea Rabbaglietti <rabbagliettiandrea@gmail.com>
Closes: https://lore.kernel.org/r/CAENjc+w0Rqy=kDSew7XtNJCSvyPiXPJ5faWdmCr5RGYFhpunCA@mail.gmail.com
Cc: stable@vger.kernel.org
Signed-off-by: Qiling Zhu <kmatzkaczor244@gmail.com>
---
 drivers/platform/x86/lenovo/thinkpad_acpi.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/platform/x86/lenovo/thinkpad_acpi.c b/drivers/platform/x86/lenovo/thinkpad_acpi.c
index 4f81855ad..2c3f8cf32 100644
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
 
@@ -5191,7 +5194,8 @@ static enum led_brightness kbdlight_sysfs_get(struct led_classdev *led_cdev)
 	int level;
 
 	level = kbdlight_get_level();
-	if (level < 0)
+	/* Auto mode is not a brightness level; report it as off. */
+	if (level < 0 || level == TPACPI_KBD_LIGHT_AUTO_LEVEL)
 		return 0;
 
 	return level;
-- 
2.56.1

