Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20A7B399342
	for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 11:42:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776426171; cv=none; b=WCHPki0fb/UPKE1jzoqqOU24V4ahRHkNdmVS2FjfugV7sRzCXST+/FafjTb9gpHTCA0ys3fiZDrEVrLGPdc+/MT7ZPl0N9bhfAKeKfRGt53vYu9xiIXptgI7o/QaNfaTXdGji5/FdT+YOI52f4VJSP4XGNZhRfXND+Mszt6igrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776426171; c=relaxed/simple;
	bh=yufkXp8REa55nKKKY25mbUUOR8zHhW1MM+JCVxnj/xY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EdZBJcRNriqckLNrVmEnvvvke+8YybjGS9fPYWvQ26dJMCIqC5nHeCdQvLynuYvhAkjPmKPxDeR3iDooCN8NAMGDaGOhYgVvjhRksGrPjGO6GavUYkgseZCoxEjRmfPVCbBjKYFtL7iAzPwEC2VjbLPPNMQWM42pgnxpfeTKgTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QL7va/kr; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QL7va/kr"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dcdf60427so547627e87.3
        for <linux-leds@vger.kernel.org>; Fri, 17 Apr 2026 04:42:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776426168; x=1777030968; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hquw2DNWZgZvIoiMcHg+A2Rmxt4zwGE02aJk3heXeoY=;
        b=QL7va/krtQNJk1DjGFC5lXHZBtn/jVXUB4eP0KicKoEyd6/KdFJuX1mFYA+P7PnWbH
         0iH4b7W7FXqLkgID6w0iNKNYcUgxNbnE8eX26Z+xERVS1ZY54eo9GmPZRdxmOr6FneVV
         33Ze0ON74xlX5mt2UCO99XU6oQBnvgzNtaRBiBUINBEIDoEiwGOvnCskHk16K82vfHqy
         jlOripN24y8ldhQEgdKr7hmeMHqB0ipXkQ3Y66tWSZU+ojJVObtSB+jbR/4uO09PK8Qa
         17eHp7ryZLCP6ZGCJaA7eKGmoptcxUkmihxdEDFmmAP5nJHA4v+DWm3mrFPyKNQTj3Oe
         2l9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776426168; x=1777030968;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hquw2DNWZgZvIoiMcHg+A2Rmxt4zwGE02aJk3heXeoY=;
        b=k1GZtqfa1c/ybZSH5cvGGOnPvV+oISXz0X0LQsYT60ZiY7Q3PStLlrZNS1rYKFUz3Z
         iYWl3KZobNypM4tH+nBdVPPCaZ1yGj5SkPYeDf/z+DDMTp+5YV2wUA0VhnpNj1SZ80Aq
         FH18/XxaIqCr5T7vM0qjzrDLFGpXMDqpNAlKFaNsOvafXjkNFgVw4KmAyjcTqif5NnhW
         cVZiVQBOJU/1TFWKHOLo3CfDm4Ur2swFCfPlYPe6/avdzHvXfXrZnp2CvOGUikbmDIsb
         rjcqxSkYzKVsPDrp07WQwBC71BkvMJCR4ER+3MKvnOqL/b8YqaoCPxgMgCt9HoG8ZkiN
         PBKw==
X-Gm-Message-State: AOJu0Yyb40bVXR5jGLza8rOXPjAXy45aWoBQcJvRbBghX6TykC1bEA9e
	dEwg3Q0/ZQDzJ57FV2efuSEisSWv5fumd2+G6BQgHj/rGhW7TrBYMrSg
X-Gm-Gg: AeBDietkCOajKiRHoOVF0Mi9/rcG8Wz/0aNyuyMXehd1hiPC6VB64py1F4k8UYXUaml
	RYw0q8BSWzn6BMcLURJFKhqMTa5eeN9lbepcurJZdn5yk5QlDFu9lfzdLL4M3i4Ft+Q9cWM++rn
	5MlJbY2+NB2dtZYXy01OJ/BLF81OXTh7Qe3a+/vczF3oezoP6TMtoiQj3vQm+oeXpB431uu7auj
	nW3ON4jTHK/hWDCrhJ2HkjO0UXSl9wCBDUWk3Ps2nutBx4on9ZmSCCzmfcIwFCq+d7HqQ3T0FfY
	g7XJSTHo2HDaKZ0X4F2tis0LoCHiwdpMzVabfra+K7kt+YouAhKIrBOzQD3toYoaaafeqsm320/
	bgwbiYkTZy/OSFOsybRjj53ofi1+fPYOyqshkK0u73yXVSK4r3xvAyeQcteP9aN+h1IPOCHNy9F
	mxxn42sxcWuYmOl0N75D+1dvB0A2E/qOCcdQ==
X-Received: by 2002:a05:6512:108d:b0:5a3:ffc0:7882 with SMTP id 2adb3069b0e04-5a4172fc0b6mr706909e87.45.1776426168032;
        Fri, 17 Apr 2026 04:42:48 -0700 (PDT)
Received: from xeon ([188.163.112.56])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5a4185bc672sm338636e87.34.2026.04.17.04.42.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 04:42:47 -0700 (PDT)
From: Svyatoslav Ryhel <clamor95@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Svyatoslav Ryhel <clamor95@gmail.com>
Cc: linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org
Subject: [PATCH v1 3/5] media: lm3560: Fix v4l2 subdev registration
Date: Fri, 17 Apr 2026 14:42:24 +0300
Message-ID: <20260417114226.100033-4-clamor95@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260417114226.100033-1-clamor95@gmail.com>
References: <20260417114226.100033-1-clamor95@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The existing driver does not call media subdev registration, making it
invisible to the media framework. Since the LM3560 supports two
independent LEDs, register each LED as a separate media entity.

Signed-off-by: Svyatoslav Ryhel <clamor95@gmail.com>
---
 drivers/media/i2c/lm3560.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/media/i2c/lm3560.c b/drivers/media/i2c/lm3560.c
index a2674af6c9fb..bee1681a1603 100644
--- a/drivers/media/i2c/lm3560.c
+++ b/drivers/media/i2c/lm3560.c
@@ -368,10 +368,16 @@ static int lm3560_subdev_init(struct lm3560_flash *flash,
 		goto err_out;
 	flash->subdev_led[led_no].entity.function = MEDIA_ENT_F_FLASH;
 
+	rval = v4l2_async_register_subdev(&flash->subdev_led[led_no]);
+	if (rval < 0)
+		goto err_out;
+
 	return rval;
 
 err_out:
 	v4l2_ctrl_handler_free(&flash->ctrls_led[led_no]);
+	media_entity_cleanup(&flash->subdev_led[led_no].entity);
+
 	return rval;
 }
 
-- 
2.51.0

