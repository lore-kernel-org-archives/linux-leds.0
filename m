Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F00541E6A2
	for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 18:23:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784226204; cv=none; b=JJnKidBosW43HVgp8JfYrdwdCJ7NpAWK6HObdd0F6PIWMhVtQqZ3i3WJ0Z+MO/bCcTgSNE9B5T+XSI2EBgVWLVNRiDmg+2RZHCUSfaFclKEJUts/884pibtUS6ZIwsWydbDhWJdBXOq39dZ8Fl58YQ0PF5rsSj0cU5/qvX575R4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784226204; c=relaxed/simple;
	bh=SxMJKKHIjLot1MKxc4madisP7myfnRxTH7Li813XyLI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=c8CzawwU6Bgwv0qLaWd4xxs3i7nINW5yx3LhS8bBFT7N/klSY4tKOuO+D7L0w7Grs3lrdJA3iPV9aHIdvFJlia8guUjAvmJFewmefQs92qVbpsRWAr8tpD+zEovb24RYyKauHCVGz/Q8yCsGu/owtFDtJQvWhQTKwynrji6zboY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alUmGiWS; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alUmGiWS"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38759bcd877so6086277a91.2
        for <linux-leds@vger.kernel.org>; Thu, 16 Jul 2026 11:23:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784226195; x=1784830995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqS6+/NhYi/kkkz81wwm8hdbXSRvuTlEop7nHW08UoA=;
        b=alUmGiWSRW1YfLVPZxWgmCZmSA4yf6nxGrFKzE9ACZQMvRw0zBkeyFOlRFtuHyFRCA
         qcs8f+ldtXy762zDZFZEQ8X+Pg6bbqcAmzaKo8VBeS4Y/eM3savr6/6hvqMF5/d1x48u
         yK9LE2vl2EPJ8OozKTYartdHAPZcPT8ehdUwSNNZJ+3wvXju39z14vFC7ypzyXQVQlHp
         8rIM9v/UYVIZn4ehU2JH6LJoXejfv9PRNd1rV5xnBbkF6bRGrgoT/ZD5My3Iqsfl/1HA
         VEdVX15zECtlXQ8BRXeidbWmVXpuaRH5zo81WR35fHs75R67rmKr6Ckq6mT8CE9ISQA1
         2knA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784226195; x=1784830995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqS6+/NhYi/kkkz81wwm8hdbXSRvuTlEop7nHW08UoA=;
        b=JvPx4xHI6tFsBpxK5zXhTWH9MmLKrR3J1X8H9WFfTKWhiIwP9gLOh34OX8tA7KgUJ8
         DrBIlFn9190gLksjxdgm3zQyZyqhODsbLtTWRN/pC/iSkDtOLwSAEx5CsuELx1HylIWS
         f7xjCB7riNmLjq83wxS9iemHyuCuznk3/hN9pGEsStA7J0L7AHBZVaHKc1A6cIby7ekk
         6F5cx4Rd0sVTu76vyCFeB72tPaN15D8NxsFNPxM86tcaCHND8A5nnUDaBfz2bX4oprq/
         tP6WrB7RAMne1bWjxv2NtDPHKe6o6NpQYV+1TuPjFgSRv8jMGDsfnRk06rjHPrPkGslf
         YTlw==
X-Gm-Message-State: AOJu0YwDS0zPkBkjSgdyhyGpRbaIYHF6sxb58Q3XC96ubWQ4uUd4UeRZ
	iz1vf6lKrA1PGyeB6Zw8miRFrQ6kQdJQBp9fcE5t5UJpJbrsUpaOxZQs
X-Gm-Gg: AfdE7cnIpgvfWGsWtRktDlqBYeElw4MY1QiQIzk/wr0n79UQtxCsNz1J019m6dt89YN
	XmEOhlF+oZ9XL6rj6qG1e+b6/gdhoKCvRpMTpFJHvVXi6hwIwGHOItpK7oCDOir5iMEI5akTxnm
	q1zIGNQC6la9l28yhJ9647IJyX+Xt/1PMpwDiWYXbXSJ2Rh0lGi7ImYVNPczmwEdw/LXE/ONN9P
	wt+Eb+V8Yj1BRoEyLa81uPmXkOZHDXAZsDHNPqNOB9UNnHyELd5D239JyR92cOo+0qh+i7g7KnK
	tZQwRD7L/S7PuVjd2dr2gdS+ai6JznGYdWT7raqtq5oJfvhkPiBamj1ANM8w1jvl9Jg3SgTQCpp
	hb/h32jc26+Xd6020GArbwzPX35kgNtzu5ylnQkg3xiyoORN6jNuVLXMAkPqWX0kLhGddBu9dhU
	l8GbO8jr5bDAWgUGt0rvTI8/I=
X-Received: by 2002:a17:90b:3f84:b0:37f:e326:6559 with SMTP id 98e67ed59e1d1-38e2a0c3460mr7581581a91.22.1784226195108;
        Thu, 16 Jul 2026 11:23:15 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:321c:1213:a9ae:1111:f32a:a657])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3140e6f0dcdsm12137148eec.31.2026.07.16.11.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 11:23:14 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH 4/4] leds: 88pm860x: convert to dev_err_probe()
Date: Thu, 16 Jul 2026 23:53:03 +0530
Message-Id: <20260716182303.9467-1-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
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

