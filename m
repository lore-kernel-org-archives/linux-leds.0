Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2A33E4C98
	for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 16:15:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784736953; cv=none; b=rVF6BJj9RGtmg1S4sKxS8yG+GsyV2xpkw7ggfHdavb4Ftna+13A1HsrrheQs9mTysFWjR9EfLOnFi3MPOm/Xbvj3aRbBN1qYZs6vQeW/lI7jvH/zqD1RqQBGyeDz/xWX1uctUU72x1gLKbeNpqEmf53A2HGmfnnkoHwNLxinA2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784736953; c=relaxed/simple;
	bh=/AWH4TVkzjZlmGyul2I4eG0vLDHnmIL4x+qTUTM31ZY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bAOJ53YsYs9CPTMrmN1U/ThgLutEwsTdAWQ60F+eyHkL48rc1hOEJFQemYvbRQnV/9pkRkTjUf7T8oDh3FQDvtMrbtl4/DnnbCU3Mofd1Z8cB73v3hJXVbhb4BOW77izK5vbTmcfUPZ6VcIDYU93VpcNj0Sc/fYpsKTtGYBPWEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWbV94Tz; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWbV94Tz"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ce98cb8165so69369685ad.1
        for <linux-leds@vger.kernel.org>; Wed, 22 Jul 2026 09:15:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784736951; x=1785341751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=C4eG33ks6I0ktj16HGNoVGjOMuTcAcc6qdfPtWq1IkM=;
        b=QWbV94Tz2+K9Ceug2wHEZy4FXtC6OVaHztFjH4jXD3gxFux2qlAyw1KUFxUQ1QVjW0
         3gYP9qAu/9j4vNxOjjnSVodAw+2YdWKKNTloiLfN50xyDUxAO6Z8rfWXoq1Tq//6pSI1
         myk1WdnsH+YiBnxGe9yb9mUhxVLYcIqR4ut01e5BOM/mid7H2aR+6wmsSpBGK5GuRd0g
         uJ2SGJnW6DTIONyQG88SCS8r9chAcZA0ZF96KhvWZgYNsTHuyk7fD59lDsP4qXhRddC3
         eRHU9wOFE7IHwrLIMtPSznsllVVqsfQEvtuWxwR0MCUKkGo0Mu5XE+hL4TqAGVQHCZ8r
         fbGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784736951; x=1785341751;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=C4eG33ks6I0ktj16HGNoVGjOMuTcAcc6qdfPtWq1IkM=;
        b=hz8ibD9NP9DjFscRiplRd0ESAu5fr3PwcK+oOaWAyXUljPto+YX9do+8tyUq9tK7qO
         jQxqo/drlw5dn9nyimrOuqHhAa7YIYtIs0CG02Aav5EupHFquHT8upmcz5ovhQDqr1K1
         HWoxTLXTlLUpIcCQ67N2j49fe5LD5fgGzyEbVYjw/5WqjLiOgT1hO2tcqMwvgob7N4O4
         Pqlf/7Luc2HNtFeZyGQrckS0aWy1V7o5gWBy/S5bDEIW7CU90wsdNzY1Mc2x9qzjGORw
         zC36JwdLq/F+paQBHXrgnE9YDHtL6TLvH8lJ0w8YY9A6OR7qtjLiSFiRqay+Ntxyk819
         rjqA==
X-Forwarded-Encrypted: i=1; AHgh+RogbV2+Jk5QrVC/jM5Yo28k2wgE5trM+/t6YaAEayP89cVBd4LUGpsMZGusGxGrMoTb3krgnffq2tpu@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+LVMRWr2Ng8t38hOSZRr3Z0us/u41EHtMnYOU8pzCuR+fkUy7
	tyf5hb2S8mOYTPjDePzADWWqMwfMUaTrGW6Z/8xCRhI5x85SRMBRV+o=
X-Gm-Gg: AR+sD10mWbCvM5u3CvhL9aP3qPEzqpWfgk/G91EqfUZdLLnCJW0saOyVysUopEduOy9
	J/jLKWR7fp2F2p5icCBduuNy3bynNJZZAXK12484KXBc71HGfNDNd7FeQiqK3RXGy58MHoeSvLd
	ReQE6nsiMJwT4JrbflI+W0632mHq/5/bDb3fq0Rrwaisn0GrlHXgmqR74qbNGcUiQUdjvuNHF3n
	334WftF7X65QYfn4EIJrbP+hWvZ6z3DZrBqImME2m7i8YkwbMgudu7O6VmSTPfayApAu+YwSIxA
	Lr4gj9kBeRnKnnVabiRBEAZ+b14U7tZGLcaDITYSTrzu79+73wdT+9/idCcb4qamczXRDWyR3qB
	cg/G/fcSIYf0HK+Tnq6tX7OOXEyTP/ifK8bWHSRbJp8ztLob/GRtTQYdAoAwWNesgYo84749wTX
	qUDNgEP5Ba3vMSxiEIJJCbQSn/NiGh1KJzZ2nM
X-Received: by 2002:a17:903:384d:b0:2cc:10c1:352e with SMTP id d9443c01a7336-2cf8ddae3camr44679535ad.21.1784736951332;
        Wed, 22 Jul 2026 09:15:51 -0700 (PDT)
Received: from t-rex ([2401:4900:c212:546e:3d3e:f0d9:52c0:8a0])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147dc193f8sm21024650eec.1.2026.07.22.09.15.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:15:50 -0700 (PDT)
From: kr494167@gmail.com
To: lee@kernel.org,
	pavel@kernel.org
Cc: kauschluss@disroot.org,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Surendra <kr494167@gmail.com>
Subject: [PATCH v2 2/2] leds: flash: s2m: Wire up of_match_table in platform driver
Date: Wed, 22 Jul 2026 21:45:19 +0530
Message-ID: <20260722161519.9610-3-kr494167@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722161519.9610-1-kr494167@gmail.com>
References: <20260722161519.9610-1-kr494167@gmail.com>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Surendra <kr494167@gmail.com>

The driver defines and registers s2m_fled_of_match_table via
MODULE_DEVICE_TABLE(of, ...) but never assigns it to the platform
driver's .of_match_table field. As a result, the kernel never matches
this driver against a DT node with compatible "samsung,s2mu005-flash",
making the MODULE_DEVICE_TABLE entry dead code.

Wire the table up so that DT-based probing and module auto-loading
work as intended. In addition, validate dev->parent in s2m_fled_probe()
to prevent a NULL pointer dereference if probed without parent driver data.

Fixes: 02149db273a9 ("leds: flash: Add support for Samsung S2M series PMIC flash LED device")
Signed-off-by: Surendra <kr494167@gmail.com>
---
 drivers/leds/flash/leds-s2m-flash.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-s2m-flash.c b/drivers/leds/flash/leds-s2m-flash.c
index 6ee8db094611..6097c75b681b 100644
--- a/drivers/leds/flash/leds-s2m-flash.c
+++ b/drivers/leds/flash/leds-s2m-flash.c
@@ -279,10 +279,17 @@ static int s2mu005_fled_init_channel(struct s2m_led *led, struct device *dev,
 static int s2m_fled_probe(struct platform_device *pdev)
 {
 	struct device *dev = &pdev->dev;
-	struct sec_pmic_dev *ddata = dev_get_drvdata(dev->parent);
+	struct sec_pmic_dev *ddata;
 	struct s2m_led *led;
 	int ret;
 
+	if (!dev->parent)
+		return -ENODEV;
+
+	ddata = dev_get_drvdata(dev->parent);
+	if (!ddata)
+		return -ENODEV;
+
 	led = devm_kzalloc(dev, sizeof(*led) * MAX_CHANNELS, GFP_KERNEL);
 	if (!led)
 		return -ENOMEM;
@@ -339,6 +346,7 @@ MODULE_DEVICE_TABLE(of, s2m_fled_of_match_table);
 static struct platform_driver s2m_fled_driver = {
 	.driver = {
 		.name = "s2m-flash",
+		.of_match_table = s2m_fled_of_match_table,
 	},
 	.probe = s2m_fled_probe,
 	.id_table = s2m_fled_id_table,
-- 
2.55.0

