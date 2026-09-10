Received: from mail-oo2-f42.google.com (mail-oo2-f42.google.com [74.125.231.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75F039022B
	for <linux-leds@vger.kernel.org>; Thu, 10 Sep 2026 03:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789010494; cv=none; b=iZTH2tN1apsrt76WArCUh+xR/pnLCqQ8kzklmQNHOhoT4xqHEZWBEk2RjoR46DtbxrMgxJjSRiiYe0Z+m+eMX0Osd3cGfcHbcKRBpQZ2+OyDLTd9LIEl1To9F5VBqSSkPBhdmcm6SW1se3LZrLnPu60/9z0a8VQDO/dV1UNIQFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789010494; c=relaxed/simple;
	bh=jHHrb1gkKCrQofVQkjlJcoMNCA+FXIvxVOvLoWJQF5s=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=dsBAQoY0oou5gMFzh5WIbig5LLJ8SRyl8BLjtRnmQOAoRqv9hiLNSDWanYTfxMjCwXIFI9M119pOxpNZS8cH0Y8zXTuh92bQu//j5/d3ItDC9MDlWWLT55TgcklyImlQRfo42siDwU/Ff3HkU3lZ1fFx/5mcEWKLz/M8Fw0iUAo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tAlfqRO+; arc=none smtp.client-ip=74.125.231.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tAlfqRO+"
Received: by mail-oo2-f42.google.com with SMTP id 46e09a7af769-801d2f7a00eso164342a34.0
        for <linux-leds@vger.kernel.org>; Wed, 09 Sep 2026 20:21:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789010491; x=1789615291; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CrGYYRXsocnHt4R7I9PwAhwsbtA+DaKDKrj9nTvfp+g=;
        b=tAlfqRO+dj20/CslGq/8CS4REHc87cHhZWBpneqL8yMS2KHPSlExi9EXp5TlN1rrRS
         PX2OyQ1DtohPQQRFc67f0x0miEKxBTChmN2ULNPoLG+UR6mtijVXO/Va6ldkadtre3u7
         oMRlBYfJU943iYcE4k9P3m+E2EFUhvBm7Y23tLy36EPqHRY9bPlOizI+APFjlzqhqbYn
         s6KDyttuSzqf2WTx38JEeNET3x/CNTWy3FSl/5K+UyQ2+GQpJqGlOuNToXSzPLRYhX71
         jCp95ltzfAc1quD8WprcCOWNBZ06nDx/xd0PnTndPeemFPlMUngikvyLvvCtAGfl37lU
         tMAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789010491; x=1789615291;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CrGYYRXsocnHt4R7I9PwAhwsbtA+DaKDKrj9nTvfp+g=;
        b=KYszYWopbNNMrOOHxFHNiq+nD+BY+2N/1mBwyyNWe/AsRsHtZsRfKzOm3lPzS2aB/4
         STTAjvw+LH5QKkKQU96XURgNPKg0H9wTF7xE66L2Ikv83yoX4RSKpvuAGkhxOdJWHe8z
         RizJAKKxSHgUDqmTvdgVD1zHAdFh7vIAqJUatK9AfMV1xa+ycdNIKHfpePDxtBqEqiEa
         NHeerUXVv7JPi3xggJUF0VWasdFAbvLkh7GTFqxf8psv7YBiobFOmhMM+pvV5w4m3Na7
         gf2XtFMC92IFnr2SBmBSWr2DtmCg+ue1mfVEqQpGzpIkxrNVOcmRni5aQyA0IjeQH97M
         0ONQ==
X-Forwarded-Encrypted: i=1; AKwUvBww17atDOwJ0+EYIjnUkLxqZGfNy1JdXUL4PiHfj+6jGhTB8M30UZuF8H806LL+cFxY3JoUM4zNFTDv@vger.kernel.org
X-Gm-Message-State: AFuF++kepjJy7s34CZOzyrdhtFt97WwJEMLENOxgTDvishlfLQXhqxCF
	UQ5W63rFvdJfz1kqNdzOrgCKhjtFSjadyMqhNMuAdFGIH4ZojBEYKLlj
X-Gm-Gg: AYBFou0kGmR8x7vz3urU3xBS6tQ/nNhwh2DjdIsrUGoMecj9NOz90ZAAELvIc6vSOvL
	Ox+e5Jdm9Jq88u5fd4O2V88G1sFvRJfeyCuqQGHI+4Z7OlTMDewavdOQHpqt2Tlgc06jOFAvv4T
	bCrA1pZ5yNV8WwksEv9sf+iZwA8hHh3/lkJt0I7Qerb9vHUwTvPP/KwSIZQte09vyhaBWflPrmK
	g/qs56aHZlYA3t9q7h1Ka45RtmZaAIgMlY74r3ed+hLY/Yo6uCmspZ7M6jSswpPy5s+Sih53Qwr
	dk33QU4PZ2cWYhQzUTpvfWs+0KBOCgMqykGnCM3jeLwDkJ+EytK1lcQ3dilcTpeSrJghJZwgV1F
	iDMFCDTaMrei4468BIxjjnwKawtIuohWvTMLktf5QURH9H7eUfsDOzvE0Bny1XzZmzMwWBPfMJ2
	ZWq0JPxU37sf4uVy/KHDmtMgxk1AC00AaCSndTzFqv6GSWdvmr+0PTvusxyGC4rhzF0Ve54kWxB
	oPEFMD7jbheVoouW2yDaWSR5ZjU/m/UwNBlJsQOdEMafCq+SIZjp74=
X-Received: by 2002:a05:6830:3495:b0:801:b3e8:25ab with SMTP id 46e09a7af769-801b3e8a6c8mr4013717a34.2.1789010490678;
        Wed, 09 Sep 2026 20:21:30 -0700 (PDT)
Received: from localhost ([76.187.192.44])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f9f6da9a49sm19758315a34.13.2026.09.09.20.21.29
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 09 Sep 2026 20:21:30 -0700 (PDT)
From: Andrei Aldea <andrei1998@gmail.com>
To: Jiri Kosina <jikos@kernel.org>,
	Benjamin Tissoires <bentiss@kernel.org>,
	"Derek J. Clark" <derekjohn.clark@gmail.com>
Cc: linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	linux-leds@vger.kernel.org
Subject: [PATCH 03/15] HID: hid-oxp: retain fractional brightness when reading RGB status
Date: Wed,  9 Sep 2026 22:21:03 -0500
Message-ID: <20260910032115.28669-4-andrei1998@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260910032115.28669-1-andrei1998@gmail.com>
References: <20260910032115.28669-1-andrei1998@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Multiply the hardware brightness level by the LED brightness range before
dividing by four. Dividing first reported every intermediate hardware
level as zero instead of 25, 50 or 75 percent.

Fixes: 84910c459d65 ("HID: hid-oxp: Add OneXPlayer configuration driver")
Assisted-by: LLM
Reviewed-by: Derek J. Clark <derekjohn.clark@gmail.com>
Signed-off-by: Andrei Aldea <andrei1998@gmail.com>
---
 drivers/hid/hid-oxp.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/hid/hid-oxp.c b/drivers/hid/hid-oxp.c
index 0c895bd..86a559c 100644
--- a/drivers/hid/hid-oxp.c
+++ b/drivers/hid/hid-oxp.c
@@ -334,8 +334,8 @@ static int oxp_hid_raw_event_gen_1(struct hid_device *hdev,
 	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
 						 OXP_FEAT_ENABLED;
 	drvdata.rgb_brightness = rgb_rep->brightness;
-	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
-				      led_mc->led_cdev.max_brightness;
+	led_mc->led_cdev.brightness = rgb_rep->brightness *
+				      led_mc->led_cdev.max_brightness / 4;
 	/* If monocolor had less than 100% brightness on the previous boot,
 	 * there will be no reliable way to determine the real intensity.
 	 * Since intensity scaling is used with a hardware brightness set at max,
@@ -423,8 +423,8 @@ static int oxp_hid_raw_event_gen_2(struct hid_device *hdev,
 	drvdata.rgb_en = rgb_rep->enabled == 0 ? OXP_FEAT_DISABLED :
 						 OXP_FEAT_ENABLED;
 	drvdata.rgb_brightness = rgb_rep->brightness;
-	led_mc->led_cdev.brightness = rgb_rep->brightness / 4 *
-				      led_mc->led_cdev.max_brightness;
+	led_mc->led_cdev.brightness = rgb_rep->brightness *
+				      led_mc->led_cdev.max_brightness / 4;
 	/* If monocolor had less than 100% brightness on the previous boot,
 	 * there will be no reliable way to determine the real intensity.
 	 * Since intensity scaling is used with a hardware brightness set at max,
