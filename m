Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCCB38F95A
	for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 16:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784825206; cv=none; b=EBlpDbiOyOYTPExrBJEpwV7uDzusHvzuf+uFzBceWF1mlFq1G/Ak6njcAVu5E4nm2nweEYK8DsVYNfGoC1uWAJ+eQfEPmHOnqykDxrvB//NusFCqMNEru0Gw7/6qZdz/ezEhRRqtUM4k2yZjisTOePOpz5NaflTPHDick0h2iH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784825206; c=relaxed/simple;
	bh=SxMJKKHIjLot1MKxc4madisP7myfnRxTH7Li813XyLI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=f+mRc0XCoKqgg50ZzjTZye7TK3czmhZ6CSOJm9n720ayBNQkthVDd2nwc7NeONIutkP2n196Y5AaT0gBHnazh9rWeZ7JEnfeSP/KuVQR8CvgJM2ZKWqAy1yibEqRF62gMpFrmH1cvg9xb5Xluoh7G6dfHo6eGABNYAhOrZE8HhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gJ7PsDhv; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gJ7PsDhv"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c981c2c37cbso743416a12.0
        for <linux-leds@vger.kernel.org>; Thu, 23 Jul 2026 09:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784825205; x=1785430005; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YqS6+/NhYi/kkkz81wwm8hdbXSRvuTlEop7nHW08UoA=;
        b=gJ7PsDhvMHvTV9Jh9xzmDDSrDu4KshRwT3KjViwxQhD7LUqEctd1p6U4omVGRm4WPr
         mwf0fnRto3kMvEUTZxpwH6pi0mp/QC4g/Q/73QCp7lFdfn43X3+V9cBy+7EiCzhYMKAT
         kk3zCkfKfy5ULPA1fVbKCN0M043x3ypgGMNMQBTkR2GWEwLmATbJOzKenNo26oLSAuo3
         bmZjs+FB7+lldKho52Eijo/qQJgxNCmCETrEW2+2b2OPrVhKIEH2ubqn7KTs4tEmhDBX
         XNFdpTc472luYi7ug2iuDiaqbv293S6AMHfJT4bteYTAUjhM1JF43LfHnqY3XFhGDUss
         rgew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784825205; x=1785430005;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=YqS6+/NhYi/kkkz81wwm8hdbXSRvuTlEop7nHW08UoA=;
        b=eSHQgkZIbd8rf7GfsbNDWrQpeObhBblnLrmfUIqD4xKs9yphdOUO7AKGUHoBXPayX/
         rXZlRhNExP67mGPtLE9H99teIKbf3Rn3553/oESpqBKEjATW/9vG3YHY3+iSEMLuO0lv
         f+LNWiSyTQTRJZzG9ftT9gj5PkllJZNKfrYVfkASfJue1VJz1CWbE6PcqoWg8iQ3QO2h
         ccxRZUGprxGD7/cQbxxJJZluZTkX5fpknU8cr0/OlIy6c1s3TFEWV+DBbmE7qT94Dpdl
         e77Q0dv5acuHjl2OgsCsiI4XTCK8pwXihYtE90Wyh1233khPRxuyyfmQ+A0GWHGxubM4
         hvhg==
X-Forwarded-Encrypted: i=1; AHgh+RocHA6hlsA7o3jwcxU4XC9utxNVZWo6SaCRhs2ZpWZJtquwQPUTRqroLD+FPqKMpkC3g2B7Fi17dh45@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7yft9Hu3sBaVY+oxcGWQN8sfdRz7VLW76kw0ITf01pDqfxjjG
	vweSP6aN749W5s1gb4GIAFt3FLxfM6167m2yWHm1WbQ9CGA/W7Ud0OuB
X-Gm-Gg: AR+sD132tnbTFvJWkxoIvjTtQAc+8YIa8rKLZu20YjbWTE/doecVVMNd+wrOcPOQnpT
	85lyULUjlh5Jyb1BR9b7uWAHzhhPIdrSU/xIZ88yGRyxKzWndBB2BRDxunE3Nehxd7r+KhwLkCR
	pldC9TXPQD+iwdZ0LxMyfYjhfvT1NbriJ1+onHDapj3dKfYT2Smox4vbh9z75mhkmkB4EIo4fYW
	O5W2b+zJrXoUN0ZKLDwBqgjpsa1JiLhNJp+Rz4SUqoYB4YvEBJz94F7zvdfOVOVI+ejorylh9c3
	e2JshsqJwNrVKczxiZIXRdoHES7wSIRJxLUYfTlpLARYqwJikVk5/ESwGw3tQwQrm1u+yJSEj4O
	6xiOSdYlh7LSQPWBuU3HvgmOgBUI1Y4xKzumUCEKYeO0QNtj2mrKRIDt+76NPSmMb85rOeIDQ17
	snMA3TL5tEg+fzliWVZjJB70iaC1n16ct4Iw==
X-Received: by 2002:a05:6a20:a114:b0:3c3:791e:5e12 with SMTP id adf61e73a8af0-3c44b274079mr4537153637.72.1784825204462;
        Thu, 23 Jul 2026 09:46:44 -0700 (PDT)
Received: from localhost.localdomain ([2409:408d:1ec6:c93a:535d:aab6:428f:bd63])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc1a67esm22274061eec.2.2026.07.23.09.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 09:46:43 -0700 (PDT)
From: Arunachalam <arun07172003@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Andreas Werner <andreas.werner@men.de>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Arunachalam <arun07172003@gmail.com>
Subject: [PATCH v2 4/4] leds: 88pm860x: convert to dev_err_probe()
Date: Thu, 23 Jul 2026 22:16:12 +0530
Message-Id: <20260723164612.3146-4-arun07172003@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260723164612.3146-1-arun07172003@gmail.com>
References: <20260723164612.3146-1-arun07172003@gmail.com>
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

