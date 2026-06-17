Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82BF83CE0AE
	for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 08:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781683255; cv=none; b=PC9dUtGx7kp7cFjU0/p1mg2/M4fl5CQVQWfSsnFJK/QgtL9pQjnEYx7v9JNsplbDowV1tW9i+dro0f87mRdap7gIkpRONBcUhHglXTsXV3E2up8ekMXiL+osaTLC4ohAy+0V+VyE04RoVzZsTYjne/zFAoepczqF2EfTGRxdm64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781683255; c=relaxed/simple;
	bh=HAi2lFG9zciTmNwzjiMeaJhfR/QYxc38dcz+eeM5v3Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nW1mmdoV0FkZrjNnN2b9wK2aSsGbkf+cAlMyyTSUQ4jgsZgy4RocsFxGS18WeZXNQQ/gU2PPcuAMzM4wuhpTlBrKIVmCUL598mn1BlaPZSrt8SUX2W2Bp7SGcl1A3pnrD9vCwFSOoo58/+4roaPCbjhD7WHmxlV6may9OC7I6Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OUdfElxr; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OUdfElxr"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-bef47b1ac01so812827366b.2
        for <linux-leds@vger.kernel.org>; Wed, 17 Jun 2026 01:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781683248; x=1782288048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=unbaKaB/vtuL7mVbcw6i8cWTUClKXSp2jofrc/k4FUs=;
        b=OUdfElxrVRVvBJaKiqMN4D6jqwSn4vOV4hkds1oDsnPTwrGiG6i4lGtznIXXvn2bLl
         jQv5TalctKgzKPyUr7dVLp+49u8/U80PnsgOG0NmfmEKEut3WYdjXghOiYkcPNCHTJ9K
         HHZ2CJiIWsG3x/5FgON8LfF4Ph4nr46hMuF2+wyAG15e8qrj3EPuIPN+orwu9TYT90d/
         v3BPRci/SlVEOH4IqhaIXLfTsLuAak5aOPDSZhrVsVdfB3uYgCQq2ojsWvMISRnPU8f8
         J8J64VlIlmv13keHaqYDHJQvc4TKYgfGYjmbnzi+TtJ4mULpSTsXwAuuA5sEfZbxsooA
         xaew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781683248; x=1782288048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=unbaKaB/vtuL7mVbcw6i8cWTUClKXSp2jofrc/k4FUs=;
        b=JmNR5RNv/p1LgZ60SSjFN9nu0Pqb4pd6D6HZTfmpYQc3AQ3JKLHpOaj+pqqYkYHzel
         a2SbSnxajfBl0RGe3mCesffZvLQhwKDLLC37mZOzzEOR/y5LuIz/tDmC9gC7Dxpl2iM6
         OFcwdwWqk0FsEc0VmLqtmuNN865ES5gCe5468AUtHvXL6gSBgaIoqv2u2HeFk3ml0ZQc
         RYJrgXF6nPyvMT6NSgYFGsughrAThjP9DA+cnLAmhWIH7SZCu5IEYqJRjNJ3SkItDe9H
         IEmtW3qxvpPBCjYHEnBWj1eS/LBa/VAZId15VPYM0bmHfyb3bjn3GxdpaAVvdWQ3avwo
         jnpw==
X-Forwarded-Encrypted: i=1; AFNElJ+QYIGfWKZ7tTK7riGxoXOyQf4fJ+fcz6aG8/aEYqsQHblxFOcGnBFgk8WIzMmpiZ7qvDSOjRgasRX4@vger.kernel.org
X-Gm-Message-State: AOJu0YwJHXYFWS6VgXXSshtECQ80QVIoiJQJC9EDO5FJoYErgEiyOWEx
	PlQjqaNf6fLN6edhyfFG0l5COQFbShw5trrmVxqaY3lVpZrJJxwPXnyJ
X-Gm-Gg: Acq92OHPZR+ALXk0IRaQpVYWqovGleEQ3zAPKLF1kLciblK0ykbv33aNSnOafzDbcUo
	WGn+MoymkuGmVHNDhLnyP/JOy2/9LEAYsT3ouRwWJ5rOvweNV4LmGVc0ugKOAvs+b3tdYALN1Yl
	Q2xhUwA04Qpi98fFBTSI5abAYeUtXiU7fpdwBse7cc6QIGRxx3jiunrRGnu/GtI8PIvFmN0dznw
	IOWUW71WnroSI7cRJYgHZYEeczAJQHe0FOI0iNN3xvfOmlpIujEGl1sY2kYRrKDxPLf4qHY4Qe/
	OoMDP9rZxjb46RaO92mrBeiyOcHOom9ZhnmbNt2wwIF6IqvUddxgwp9Pifg5sfTMrq/QSLZgqQi
	lPDVRckPT7yA3gv5gTfZzQtLLkbuN3S0Auc7i20AdYMh4Avfb/VFNnWPOBV4NBJhZV2SF1JJeE7
	DgxQ==
X-Received: by 2002:a17:907:97c6:b0:bee:ac9b:9abc with SMTP id a640c23a62f3a-c05a6ed1a53mr193361766b.22.1781683246256;
        Wed, 17 Jun 2026 01:00:46 -0700 (PDT)
Received: from xeon ([188.163.112.61])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bfdb058fa59sm755339766b.0.2026.06.17.01.00.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 01:00:45 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	Jingoo Han <jingoohan1@gmail.com>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Helge Deller <deller@gmx.de>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: Johan Hovold <johan@kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-iio@vger.kernel.org,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v5 03/14] mfd: lm3533: Remove extern from shared functions in the header
Date: Wed, 17 Jun 2026 11:00:20 +0300
Message-ID: <20260617080031.99156-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260617080031.99156-1-clamor95@gmail.com>
References: <20260617080031.99156-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Using 'extern' is not required, drop them.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@intel.com>
---
 include/linux/mfd/lm3533.h | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/include/linux/mfd/lm3533.h b/include/linux/mfd/lm3533.h
index 3463b164d0c1..c4c38876c09b 100644
--- a/include/linux/mfd/lm3533.h
+++ b/include/linux/mfd/lm3533.h
@@ -82,13 +82,13 @@ struct lm3533_platform_data {
 	int num_leds;
 };
 
-extern int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
-extern int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
-
-extern int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
-extern int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
-extern int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
-extern int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_enable(struct lm3533_ctrlbank *cb);
+int lm3533_ctrlbank_disable(struct lm3533_ctrlbank *cb);
+
+int lm3533_ctrlbank_set_brightness(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_brightness(struct lm3533_ctrlbank *cb, u32 *val);
+int lm3533_ctrlbank_set_max_current(struct lm3533_ctrlbank *cb, u32 imax);
+int lm3533_ctrlbank_set_pwm(struct lm3533_ctrlbank *cb, u32 val);
+int lm3533_ctrlbank_get_pwm(struct lm3533_ctrlbank *cb, u32 *val);
 
 #endif	/* __LINUX_MFD_LM3533_H */
-- 
2.53.0

