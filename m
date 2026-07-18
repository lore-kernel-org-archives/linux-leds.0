Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6A52379ED2
	for <linux-leds@vger.kernel.org>; Sat, 18 Jul 2026 21:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784411818; cv=none; b=G3XhHNV3Ex+x4bF2rG+irkSlkY+7MikqTYfGH5a7jvVf7k44R/jJHxwMsLBP3DZDKVn/N6NRnYESW7KGcL7nhf0Hw0tMqAGFAfRrcEUi0hNCbXOVMKrIjxeNLILN9AN6xzd1DYNT24qISBg4ZEFIvIQ1+FFfHYGUvemN9cpms7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784411818; c=relaxed/simple;
	bh=o2glR0HHqR0WEABSYUab9f3puWpFplzNf7xndkCI/0Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfL0+VRJ+qUy/5yU+LQRFYRK7HUusG7uk2B4Q5IsuQX9M0zyxQgLUXrmIlw3VCM7gKIuuV9WeDw0tXd2kTwH71j8iUlPVhvKljfwMwotC0KxisAhR7YqMady9Q24LzEpS3+3sNuW2YXGQ0L9DJlkDYrk8dXCCCOWMbJMVtq/Uz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JKSdsx4/; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JKSdsx4/"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954a2e73a9so10762005e9.3
        for <linux-leds@vger.kernel.org>; Sat, 18 Jul 2026 14:56:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784411815; x=1785016615; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ix301uMLUVdMn58C2UIAphmLJhOXCWVoJrX02MWxSZA=;
        b=JKSdsx4/MgULp/4uvVEMDlllpZlYlEnk+Uwj5u0UmLK3x/toEaoUlexRhLR3Fu4Ajr
         z7kCnE28qZQ5t6QVsI91+1wzH2xqkDw6qjCKNwC22AB1RDNXoY4vuojDQa1yCQhkDmRM
         3Ky7YUYYT/DU5jCFABQ72dEUEaqbMf39JBlrBCZpEvdMuKdinWWEXuP7NayBBAvAoxXO
         DW932m3lTOXlTPjSIw6xkatqAg52NBPEjEsYaggbDo+/wU/GzLGF0Fjlc1+UowIS7Isy
         HlgUi4a7qgnepn7G4w9eMAd1FzIBI+78x7LIxHCwnqmEcicZeSSBgnmPwIQUpsL1f2pI
         9Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784411815; x=1785016615;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ix301uMLUVdMn58C2UIAphmLJhOXCWVoJrX02MWxSZA=;
        b=F9ThsVlgIJHffdGbvblfJ+i73uekNwZU/WF6AfKK86bVh2l3l0xU3zF9+FEjxlDln+
         PrmJlOxo/2Eq1SM8oDSuYXHrV8NccareNgbn15bWy9UTt4F8VpnpGO0WMroRRT8GVSZr
         34LJK0EkCuZxVDybTMp0pej0LgnDO7yYow4xbDrkSBwrDQuhmBAWAHUWt9mav38Bf/Qe
         mhnpRr0cNafH9U8twJW+22nwDCPNOTFflCHZ5oG3sMVxmttLJW7uZn4k36fbYcYNHCT0
         G7LuM9ZqNdVJyhcjvWPQWJpfnMwIwmgY4ojlVcrvOCokobGwIq/oiI3PtSGAzghjIMCt
         PMfQ==
X-Forwarded-Encrypted: i=1; AHgh+RpjffLOB+upme4HtS5WS8WQmPKpwD0m4t0TjaG5+hwA67Ogq82TfTLnhGHA/QhH0BAf7ArevTUfSqth@vger.kernel.org
X-Gm-Message-State: AOJu0YwvoYeaTSpTYMMmWWZ9wdPkKyt+ZVIABArDtX0yIrsYbJWpHh8S
	7qz3Bdf90OqboGjtCSY598K+6VE2CGl0OqMNPw10ROCdH3U6eLuxiaoJ
X-Gm-Gg: AfdE7ckMuvBCgy8X2q+IvFi47nkW0jLULim3GD4X9h2lpof66uvx7Md31Oi1o+Tflsc
	VC0NUB80EKo3daRA5I/u23WapVPxJ/BY6ZNbKZuw42E0H1CMlYkBkBhqnJydMDVAjxSdNSEWsVV
	YGBQVgryIh2d4AfDIYKUuMC0ocJGQr8alBWRmjWj+QrzpW1L2GeZq928/W1rc/Xx3NWnH5U4fAe
	2mLzVfgVyxZ3rxf4nP3s7Qu0uPlVYpxa9BoYkRNMaYl2byUEu8rjWX296EAVt+4jqItLC9S3Zbo
	vv2Dj8kp5fhq98fY3Qx42KTcgspUnDOzDeeP+2EfDAsCy0RG9llsDnTSNQvWirVB8X4uLZ6Ov8h
	mExUpNx4wQLPprlLjJM5+9OBtCKB9d2x7FySG+c+4u+8BVXI5QROtDFueGAfh68L0r5vqpCMbMs
	1iyPxu8knLyjJ+cqLML97UqyeRloGkKyu8zmpz9ZGBaQCl
X-Received: by 2002:a05:600c:4e86:b0:495:3b8a:5e17 with SMTP id 5b1f17b1804b1-4954a3e41d5mr90987515e9.16.1784411815010;
        Sat, 18 Jul 2026 14:56:55 -0700 (PDT)
Received: from localhost.localdomain ([188.26.50.240])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4954c0a81f7sm101199835e9.1.2026.07.18.14.56.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jul 2026 14:56:54 -0700 (PDT)
From: Eduard Bostina <egbostina@gmail.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Conor Dooley <conor+dt@kernel.org>,
	Daniel Thompson <danielt@kernel.org>,
	devicetree@vger.kernel.org,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	dri-devel@lists.freedesktop.org,
	Eduard Bostina <egbostina@gmail.com>,
	Jingoo Han <jingoohan1@gmail.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Lee Jones <lee@kernel.org>,
	linux-input@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-leds@vger.kernel.org,
	linux-omap@vger.kernel.org,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Roger Quadros <rogerq@kernel.org>,
	Tony Lindgren <tony@atomide.com>
Cc: daniel.baluta@nxp.com,
	simona.toaca@nxp.com,
	goledhruva@gmail.com,
	m-chawdhry@ti.com
Subject: [PATCH v2 1/3] ARM: dts: ti: am335x-guardian: Drop unused isink-en property
Date: Sat, 18 Jul 2026 21:56:30 +0000
Message-ID: <20260718215632.3295049-2-egbostina@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260718215632.3295049-1-egbostina@gmail.com>
References: <20260718215632.3295049-1-egbostina@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The 'isink-en' property is not read by any driver, so remove it from the
TPS65217 backlight node.

Signed-off-by: Eduard Bostina <egbostina@gmail.com>
---
 arch/arm/boot/dts/ti/omap/am335x-guardian.dts | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
index 6ce3a2d029ee..d595e79d6b05 100644
--- a/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
+++ b/arch/arm/boot/dts/ti/omap/am335x-guardian.dts
@@ -320,9 +320,6 @@ backlight {
 		isel = <1>;  /* 1 - ISET1, 2 ISET2 */
 		fdim = <500>; /* TPS65217_BL_FDIM_500HZ */
 		default-brightness = <50>;
-		/* 1(on) - enable current sink, while initialization */
-		/* 0(off) - disable current sink, while initialization */
-		isink-en = <1>;
 	};
 
 	regulators {
-- 
2.43.0

