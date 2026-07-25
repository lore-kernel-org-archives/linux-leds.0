Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925BB37A83B
	for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 08:14:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784967254; cv=none; b=gr4sjWdCD7bMKZ4KaUEwbqvKaKWeFaQ83YnfOPTfyC3+en9Ph2OvQ+wdVIeEBW/4Xqnn1knUCnKADsN7LCVHT91sXyTKc/s2fhKc5irvSPu9TE47w/leWW8/Ys87dRN6CcA2JzMBO8XX3RfgIYiqD+3AiI6CyWgulVvvqxtkGhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784967254; c=relaxed/simple;
	bh=SxMJKKHIjLot1MKxc4madisP7myfnRxTH7Li813XyLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=KcG3mOFzBPnaf4VZYKtwzNRDiG4ZH+swa/zNC3zE3C4WgRQeOdRV7iMvs2USFE2uWoVNWMpcE1vEop/Oq2oNH40/XWqxQFScTfOwT4G360bbG8ePBxIy3ISwHPwQhddGdJ9XWGhPY3TE4uNv7ZLQTFofpk7Rv2pTTZXq3XhjqYM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OYouOvbI; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OYouOvbI"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so856165a12.0
        for <linux-leds@vger.kernel.org>; Sat, 25 Jul 2026 01:14:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784967253; x=1785572053; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqS6+/NhYi/kkkz81wwm8hdbXSRvuTlEop7nHW08UoA=;
        b=OYouOvbITg36qidUzvYoDhr1LM56eYiiN1NGoUIAAXs0NVFiuPxvfcpjyaJhVyrOxG
         9PAc8lkYfhr8AG4J2e90/dsLBJ2kxmtQQ8iMUJreracYrmk4y87Olf+f6sg6p2QAfQe1
         UPcgBy4BP7bLz+mQICQjAchQj+coDWW0zTZ2rW5BMfXPmm5KIwj3jxvpd8Jn/En0YmUQ
         JD4ZfBjTHlTwZy2+zz1S7EmG6eAVE8KTzau/eOpBgWiwqhOIkwwQMIxgGdiz+f2I6knD
         n0vfMkPw2ykWzpAOjoWX2LTvWRNu95zmcpusG859Su58czHXQUW/YlrYtXbgPVukKbP1
         C77A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784967253; x=1785572053;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqS6+/NhYi/kkkz81wwm8hdbXSRvuTlEop7nHW08UoA=;
        b=USn3+QF4/6IUDLQAdj8RLpq8XdfIqbvoncSfXH0deg44VUrlI9PL+fdM4Deix0Xo75
         CGSphci12yWgx/fwXuYy/ImXo2K8W4rP+4MiG9wzr8uvJ2ofz4S+sZBDPFovu9ec2cjm
         5YwT5cc5JxijT9NeQ+oThVdQ1g/1A4DaQ4hFlbA3NKeyYc83U1nKGSwDcF8wsGCII5Iq
         /09hxzQuOY348Qn7uJoSn2W+rI+hPdatG1PvWb68KJOSgNyIKUgMWh7eMmjVWokepbbL
         dK8r26AdC7cbmZSsGPJswERbQhTRsOnkfA+aujys5DRg/Lw3uzuU/pxDXskTEeY2+mUF
         jBQQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp0MGYDwx3XwsG0lRCTgfZzBLAST+/EGpB46Gntt0ZMMwcU89yWrMiYdrfeZzk1d0yrpkEdYjVbVhcK@vger.kernel.org
X-Gm-Message-State: AOJu0YyfXV+2u3n6PCUeIsmsDORJIBZRyQFtfk6609iCdmC/a0uP96oc
	IBJtesRpEG7Dx1tqQU+OvrQvCS4OCt1nAkU4bw+yZHfLlqIMZnil8Vg+
X-Gm-Gg: AR+sD12LTmM4DKu7+bLzQecgTZKc81TAXFNYGGngGgSKM06KIQOAJEJBbNG82JLoAwo
	djvnQX71xVELeVjV9CC43/tJtJHGSS5FFuSMHncONHtf9dxgDxHl31C4Wa4/QUvDx94p5mty/Za
	+n1otM0JxrGvhxrYzg+gVw2NcT8kafcD2d+f62zZbWDjEpmGClW5zEIjfyOKN5/gQI7XZIAfMoT
	rR85ut99sBaJ4WM2BRNjN38ArT7pjk6x4MOAicyX74XNQsyNfqiql4ftCOCDy1GSIUcCQdOo+W+
	oMq/kB5ld2uMKR7uJEAyxee7VpScpVv/arZv5tFiFtECmgQDd0SsJG3WbdO7VBg2dVEnFqei3aR
	EL6HruY6+gybT5IBBY9qeeRNEJ4hjbWxDJyXYvEMK2l80AHyaQzThwf723lY3+dne7k5Nzb+EfX
	80tWTsjdrZFlU3nyzZ+S2M
X-Received: by 2002:a05:6a21:2d4b:b0:3bf:a517:cdcd with SMTP id adf61e73a8af0-3c6723e0acbmr3711886637.12.1784967252641;
        Sat, 25 Jul 2026 01:14:12 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:79f:1f48:d3f7:8b5a:7633:b67])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d13003f12sm56487293c88.2.2026.07.25.01.14.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 01:14:12 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v3 4/4] leds: 88pm860x: Convert to dev_err_probe()
Date: Sat, 25 Jul 2026 13:43:49 +0530
Message-Id: <20260725081349.8556-4-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260725081349.8556-1-arun07172003@gmail.com>
References: <20260725081349.8556-1-arun07172003@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace open-coded dev_err() + return patterns with dev_err_probe(),
which also handles -EPROBE_DEFER correctly.

Signed-off-by: Arunachalam <arun07172003@gmail.com>
---
 drivers/leds/leds-88pm860x.c | 18 ++++++------------
 1 file changed, 6 insertions(+), 12 deletions(-)

diff --git a/drivers/leds/leds-88pm860x.c b/drivers/leds/leds-88pm860x.c
index ef5c6c466..65f2af134 100644
--- a/drivers/leds/leds-88pm860x.c
+++ b/drivers/leds/leds-88pm860x.c
@@ -152,16 +152,12 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	if (data == NULL)
 		return -ENOMEM;
 	res = platform_get_resource_byname(pdev, IORESOURCE_REG, "control");
-	if (!res) {
-		dev_err(&pdev->dev, "No REG resource for control\n");
-		return -ENXIO;
-	}
+	if (!res)
+		return dev_err_probe(&pdev->dev, -ENXIO, "No REG resource for control\n");
 	data->reg_control = res->start;
 	res = platform_get_resource_byname(pdev, IORESOURCE_REG, "blink");
-	if (!res) {
-		dev_err(&pdev->dev, "No REG resource for blink\n");
-		return -ENXIO;
-	}
+	if (!res)
+		return dev_err_probe(&pdev->dev, -ENXIO, "No REG resource for blink\n");
 	data->reg_blink = res->start;
 	memset(data->name, 0, MFD_NAME_SIZE);
 	switch (pdev->id) {
@@ -203,10 +199,8 @@ static int pm860x_led_probe(struct platform_device *pdev)
 	mutex_init(&data->lock);
 
 	ret = led_classdev_register(chip->dev, &data->cdev);
-	if (ret < 0) {
-		dev_err(&pdev->dev, "Failed to register LED: %d\n", ret);
-		return ret;
-	}
+	if (ret < 0)
+		return dev_err_probe(&pdev->dev, ret, "Failed to register LED\n");
 	pm860x_led_set(&data->cdev, 0);
 
 	platform_set_drvdata(pdev, data);
-- 
2.39.5

