Received: from mail-dl1-f67.google.com (mail-dl1-f67.google.com [74.125.82.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E5833F38B
	for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 22:42:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.67
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781131370; cv=none; b=CTLaWPYJQ/EpV6PA0hV85uhFVzcxzwarBXDmbecZKiNBVNX7t5ppGjbvAVFfSJ4sQCLTHJqcrcBTnnSP8apcp3AkvHFeS93A3JOpkE3pHkJjpLsJ3IYg0WGIcezcRcxLMEczbQHQQQSuYPP6ZRGZKZjVdRhxpZM5cM5HZoAkR0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781131370; c=relaxed/simple;
	bh=KGb2+RnBGqWGYJWr5yEi7yn5Go85cTY3qJrXW/hZZNs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GQQKpUigTYst+3NZ+9EwuEuW53lzKw8hbUz/A0MyPQlZ0+ugtAAm8P1G1MypCxfaWKs6vPFSYI5GDt++Bi1i8RFHvoT1b5AL+aDJAxILSy9zk0TmlB1WRjoIS5ayiO/oVppzR/JpLGgLLQ6F2YJrErGCY4tIRYdcB0xFm9m23aE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sB+HiCCJ; arc=none smtp.client-ip=74.125.82.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sB+HiCCJ"
Received: by mail-dl1-f67.google.com with SMTP id a92af1059eb24-138129a622dso6430012c88.0
        for <linux-leds@vger.kernel.org>; Wed, 10 Jun 2026 15:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781131368; x=1781736168; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mjxMs1UWDXcOR4Ip0bVRp20Hps+s1fUTy1xCBCJP+bE=;
        b=sB+HiCCJ42xJepSa1+Lo8D4DG+GF3uJ0fmFX54ym1FSMnxxjyHQ5iuX3skg5groNMf
         UjbvmV/6SA23UofdGFQkNBERjTfhxZuqc0F7hdmcpzAjunPLFN5UD1qzmSmAtzHWRrVb
         a2MCgwFCT2b5p21iiXjNjmATtMfo2hR1+OtWgEhKPd1RJuXg+iWPOO3z3G53Cn5NpiC8
         48MFr+7A63mCCkf16BvIPE3MY9k70aHcQqHTDv2LNLH/f3ws4DZB2VEC81xsGfpgAW/9
         Om5qPRSb+MI8BfWSQ/hvO89XeUI4WDKitHPLgoEfiAzJ4wobyfUOi5FvHZvaKlyUxX6+
         Hyqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781131368; x=1781736168;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mjxMs1UWDXcOR4Ip0bVRp20Hps+s1fUTy1xCBCJP+bE=;
        b=dhVXgslX924BKrVdD5X3nZxvRl8SlUg88d8cjpNVR9smgBMyfbdNixKOhgjpUx102F
         r2YNGJkn4rXLZDymljWOf6Mh8Ltxm68Mn/BakfqCAa+Yfp4KWyJlp67nEO+0vBjfDsz0
         fPH9obD8Xc/OQ9TP9+1oid9PTuyV7kyrS5WUEqQ1wVM36tq13wzJsVKoagaXaw2QAbTW
         8RioKIS81VoE/dV2p0QnB5q+occVaeOpYS5/aUUfGRfdCQdw7qODgtGM/oACdn7UOK1+
         HBRhkvw339hmU8gGPKxW5HKCDAUVsR5T9h04oV37qIVtV7gRPII8Q3Z+2w/OiQjVu4Hj
         BIYg==
X-Forwarded-Encrypted: i=1; AFNElJ/LftFIpJqZTZfvM6sHUE2nxZOFgU55JGSFhLrAHN6g1Wem3OlXDgfTrWqMZonHKAmNDm0xKTmO4W3W@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx91WlEtM9ISG5+7E6ZwCd/GTaz71x1Qkm9EZm9wgM17GSDCbW
	niadoUy3HyLdR2khxH4MJE3kohKFZunauQS3WRscAyOceegrG58Jh3Be
X-Gm-Gg: Acq92OF22ivvsuTSOq1ddEN+53BjycQFL4U77yynfoz8Gl+/kEM50dBPCZtqXVJczGC
	7scz8mQkeVh98PGb3OvuVRkhtiQq8yPLyxluyzRheJOgTvjqLsYh9kmGDqUEO7B9nFWB4o73/xY
	MTF3YcYhYd4eSOTtmhou3gOg8u0r8D/0qrbkuR7/BwDvconj5vD5Qvz9d6a+/KfZDeEVNTZikqT
	9IOt/X7AtussfuE7/8/cMpUOj9YB5kKKx/f7I/rpI//tPXvrFeQ9KNwbRERFIaGTw1fxCSlnW2C
	TrAG6oGcO8qm2nAJ3ePs6EcSpVHQienWgHyn7EJ/clFtdzluybO2Faq6nnXicG03ZC67kovhWj6
	+hAXnYxWSlRUV9HZxFdotpvkknYu2jyOJDWBUg2TORfsb4Dq+WQd6YbNf0rgA40kww9YMQv8b36
	aEJup9ERUlXl3YOzFehRAhQyitlr3RqavpLZOVFn0jBFWZWyd+rgKcZw7n56enqTsgnoFnDVVjL
	dSArhtMyDqMYcsNlXbeKX1z3BpdkHCLBR4HZQpu5tGbBGq/0NuHkP66aQMDi5qZk/Of3VlU6KmS
	KnKFWNFMa44T8fckuKxY6au3Jw3y
X-Received: by 2002:a05:7022:403:b0:138:11a:36f with SMTP id a92af1059eb24-138421600ddmr132935c88.1.1781131368427;
        Wed, 10 Jun 2026 15:42:48 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-137f5539432sm23652848c88.9.2026.06.10.15.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 15:42:48 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Lukas Timmermann <linux@timmermann.space>,
	linux-leds@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	stable@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>
Subject: [PATCH] leds: as3668: correct name of config option to match Makefile
Date: Wed, 10 Jun 2026 15:42:43 -0700
Message-ID: <20260610224244.128063-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Makefile for the AS3668 LED driver refers to CONFIG_LEDS_AS3668,
whereas the config file defines CONFIG_LEDS_OSRAM_AMS_AS3668. This
causes the driver to never be compiled. Correct the name in the Kconfig
file to match the Makefile. Doing the opposite would also have worked,
but the name in the Makefile better matches the format of other
drivers' options.

Fixes: c7dd343a3756 ("leds: as3668: Driver for the ams Osram 4-channel i2c LED driver")
Cc: stable@vger.kernel.org # 7.0+
Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 drivers/leds/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/Kconfig b/drivers/leds/Kconfig
index f4a0a3c8c870..5ac63cb59469 100644
--- a/drivers/leds/Kconfig
+++ b/drivers/leds/Kconfig
@@ -107,7 +107,7 @@ config LEDS_ARIEL
 
 	  Say Y to if your machine is a Dell Wyse 3020 thin client.
 
-config LEDS_OSRAM_AMS_AS3668
+config LEDS_AS3668
 	tristate "LED support for Osram AMS AS3668"
 	depends on LEDS_CLASS
 	depends on I2C
-- 
2.43.0

