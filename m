Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61FBF4C0426
	for <linux-leds@vger.kernel.org>; Mon,  5 Oct 2026 15:29:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791214145; cv=none; b=Jcyd4ERm/Mc5yXXxSk1HX4QfPhOgu5dzaEHrZzO4m9agKD7Cvu81rgvRdgwJPXZFRdo+TIc8Bpu3UsCLSlot8WmlY8S/l+UMzRbykU6LCtdh8o+HssW97UWyvoWqFQaRmLVVuv1Fa1N8lBeJgR1QDqK77zhWkGZLYLH2rt+aaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791214145; c=relaxed/simple;
	bh=kXuHXeDWt1EqIQaBTiupiYjz7DvChsgSn2tgrUKotRk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=csmlTZ9F9EtYS0o/iKftjTxP8um2KVK9FiDqobAH0klGe1HL+koFUaTTfdP9uyyJq+2wiJfbwFOiFporp3EEIO6TvpljS60cNUMPRY/nfi65clEtwHqtMwy/sEZ5CW9XrAbt/VU15ZGQ5as1Ao1+a98ZpKmxX0GPeNz0BKI1oYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TCGEvQ7E; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TCGEvQ7E"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cbee846deecso1423291a12.1
        for <linux-leds@vger.kernel.org>; Mon, 05 Oct 2026 08:29:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791214144; x=1791818944; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XlX6EAWXxvgk9C24SGy6DSB5gv6jzR9mIfykYwRHX30=;
        b=TCGEvQ7E/7twlJDrcXtSAXn2Migfw64qa0+rQgEN81TeIkULqIZl6Jx4drVlWbHmZK
         Xf8buenI8RolWAYrmYIA1ldhwSiDbAHulzYxC075mCAlA5ef5SYFPJTxs42raIWd01DH
         o43Bmci570id0hmwKaeZZh6z6XZj4SA1WnQL5rNbzmlywj3tLY1L7qyrq0ZTqnAx05wF
         gf70LHUKX+8dW91mptGuV7l2ZHxKHxKohT15FlMO/wJoOEEOakhIvqTbzB2M4E/SYp5U
         vpDYejkkw5uCf8aCMJGVfF0Xr5PpD2aminpeECaHdTJXck+oUwsDApbdDhn+tZFGKzcE
         CEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791214144; x=1791818944;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XlX6EAWXxvgk9C24SGy6DSB5gv6jzR9mIfykYwRHX30=;
        b=oR3WDO54hlSP6Cf7yBSTTA6v2kYBThydfhtCt5KwBmgkWM52NsOcJTBaaNPqPpEsd1
         M+nBEdgMSQFyXBnfBbp8rJLKaW6F0g6FF/pZ8ezWBMHZLfkrZhrqKOjY+RwyiUC2wiUP
         n/JVT368AE9YOrFaPBu8U/vtiMYNmXvzZh92dyHhgWQGMC0pF+/LABc377MotcDlflcz
         +7cMbktoEEkihIqKSw5OFFp2eyLX2p+OtdFwfWcv8N4oa7ItzgbIyjnzr9MHSkmnIPAb
         RbM7nxm9Ec2TGbR8PB/ARiM+DwphzUPM/ac+9VkBgAXnjiS0MYH4uiXyQtwccHPGaSUk
         HozQ==
X-Gm-Message-State: AFq9FYJL3PylSBccaXEH8uzkC44uLIuJgfv6tJkFsQtqt9i2OzRBr0zb
	U6FRDjn2AYl9EtQwZ4EdIHWJWdVPx5tdvvI4+K491BvFvfHN/p69XIpHx8Fqsc9w
X-Gm-Gg: AYBFou238xHIAc0xcdiOp+rbhQswSxoiElql4KBd1JmNXKDOCFZhtH/Ui7UPWGXui+G
	D1kzmcjcf0ZinSrIq0RblpAvPDj6YfJDdfu1cn0LS57bVhUtTT/Ead1SHiYlf36wU87sL0ISHnd
	Ili4HHjlYcD5JAXq36EixwdJqmhLMCaxUzZUaCWoKgqrmbPqSRb8P7StLCoqm62n81/nvodb3dD
	RkJANjS+aUjYknWWy6kdGBamqNP5haLDqcNc1O3hiSZDvZXzzGIvUNKTeP32FAjwjTvUISZBl8B
	LFR+bEw9imQPoGBiPllq1FWAjvX8OGwRB+8hNzsgYgRYiuU39N3790iwXlPoEPRV20w29tzwft7
	f4pyuORpFefjS2ZwLBs2Y5rczHmvk2+UcjOpp0bi09DJdUQ8EpluxXkRcKSo1XBLytFRO/xyFRS
	9YnHb8rQ17RAppn9LOS3yfPYVbwBBr11SquzBbAB0RXYh5vbCwyYUjHKWL68UhqiOidMeBvFqGS
	rhI52acWh9gmfTk+GWcNjPCjtB8LoOr0NG08It4vpdUTt4NcRcUwqiEndnyz/gNeOjcZj0BcEUe
	mf4UHySrgZJ5osX3ePWy
X-Received: by 2002:a17:90b:2752:b0:3a4:b0b9:6b3e with SMTP id 98e67ed59e1d1-3a7873d9565mr6440021a91.36.1791214142784;
        Mon, 05 Oct 2026 08:29:02 -0700 (PDT)
Received: from 1.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.0.ip6.arpa ([119.14.238.184])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a851630206sm29127a91.0.2026.10.05.08.29.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 Oct 2026 08:29:02 -0700 (PDT)
From: Wayne Ho <wayneho219@gmail.com>
Date: Mon, 05 Oct 2026 23:27:46 +0800
Subject: [PATCH v2 1/2] Documentation: ABI: leds: Drop stale gpio trigger
 reference for inverted
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261005-docs-leds-abi-trigger-attrs-v2-1-c5f8970b1b42@gmail.com>
References: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
In-Reply-To: <20261005-docs-leds-abi-trigger-attrs-v2-0-c5f8970b1b42@gmail.com>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Griffin Kroah-Hartman <griffin@kroah.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791214138; l=1320;
 i=wayneho219@gmail.com; s=20261001; h=from:subject:message-id;
 bh=kXuHXeDWt1EqIQaBTiupiYjz7DvChsgSn2tgrUKotRk=;
 b=EHqb+cnox+l/QvnE/UAX27xBYKy7KN/8FyUtNhM+neZM9iAqgCp26VNDo3F6xRBp4BuXEdAHJ
 2idqfCa+mZECT7EupENrC32IWGo88lOVPYt3EFJdFb/0iMDJPopjFCN
X-Developer-Key: i=wayneho219@gmail.com; a=ed25519;
 pk=j25LRSikYRlv0PpovZSgSrCQwsy7WDzIYum/mydUa3A=

The description of the inverted attribute says it is specific to the
gpio and backlight triggers, but commit 4a11dbf04f31 ("leds: triggers:
gpio: Rewrite to use trigger-sources") removed it from the gpio trigger,
which now only provides desired_brightness. Only the backlight trigger
creates the inverted attribute today.

Drop the reference to the gpio trigger.

Fixes: 4a11dbf04f31 ("leds: triggers: gpio: Rewrite to use trigger-sources")
Signed-off-by: Wayne Ho <wayneho219@gmail.com>
---
 Documentation/ABI/testing/sysfs-class-led | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-class-led b/Documentation/ABI/testing/sysfs-class-led
index d4c918cc..c72cb1e0 100644
--- a/Documentation/ABI/testing/sysfs-class-led
+++ b/Documentation/ABI/testing/sysfs-class-led
@@ -84,6 +84,5 @@ KernelVersion:	2.6.38
 Contact:	Richard Purdie <rpurdie@rpsys.net>
 Description:
 		Invert the LED on/off state. This parameter is specific to
-		gpio and backlight triggers. In case of the backlight trigger,
-		it is useful when driving a LED which is intended to indicate
-		a device in a standby like state.
+		the backlight trigger. It is useful when driving a LED which
+		is intended to indicate a device in a standby like state.

-- 
Git-155)

