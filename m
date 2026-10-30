Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793325930;
	b=2PPIUZ8bpi2fyCPAq2jFwG5f7HXCBtj5MqNJnyYJWtQDI/9Yzp47lXaBWnZAcMVA60HX
	 vAQfL4TszyoOTm+Bc9kTUm82UnW6uf9HMvF4MwAg/SAMVVtX0rP0dBA7QIoySQgbPp+Oe
	 gIWhdI+jwuvf/fSIzIWid3NWOp2YgC/NvOsgQZnMFPyLhNXTTQIyMWe2gYpFFxP5LNXX9
	 I/6z9iKgI1Sk7bxjd+kAa7PhKyXtGyeHzAZjZIABZs2kDK3sowNNMeKb6zD+nZUtGFpcT
	 3iqF3ItovhBBk3BthHyvkdlM060zlMIQAYOl1x8M41oHJ3t2c/Se9IvTBImXMHkeolg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793325930;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=biXKHJPN3s+hXC12si4pB6yD5k6wJNz5r1iCKuyz1ww=;
	b=nfK2p5+qXdy/q2LU3CpNLsvrdYTL083yFVwsoZc0GzFF70cWjqi8A+iqfnzUcrBux2c2
	 rZQ9jvcCToIBB/0CYvrWq5E1IhxfwQhBZJ60eUDSiLsMviA7HpjSiN4okOfXYxx/MTD8p
	 EmBF6FFKJzt+7Zkq2ll1RHz5OfACN3mtrmCDaDZLaRnNBkYha9i9OJguyJ3F3HQ6iktHB
	 7XW8TGDsXpk5hBS/qMJgXaaPHPeTVz1aVcpam2m7AeHgGnFtSPzzAatLm6SpeNt3dio5b
	 IwEbYf2hQu7uGRCDkA1y8mckfkqAWOpvYpPYv4uLUsxojkCHH0HQsud1paqfr5GqNhA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wv2rEWuD;
	arc=none smtp.remote-ip=74.125.82.173
Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 760DA606A330
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 02:05:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 760DA606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Wv2rEWuD
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-3282db206d3so567143eec.0
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2026 19:05:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793325930; x=1793930730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=biXKHJPN3s+hXC12si4pB6yD5k6wJNz5r1iCKuyz1ww=;
        b=Wv2rEWuD/OxoX8s4TfBvBoUm9E3gIKYlI4zXJ2k7xhtqtie5iSj2iEGHXWhy4+p0su
         OvEcRY9DnUqeAtFr78vIcvfeo+l473etW2jLCD26i+Ahscr7lzauSFlXP06z+fQoOCKu
         kN9rNs9QDCVerSCY2wllrE1f3v637QBN+aMO6PZU3GzPK2fdKmNciKb+7ekGUX9pDpO/
         NEkbUgrPPhuJAb1sshz/DmQ2auZf6UCkaHmMZZNMX9Gsz01wtJSdGPaaSlCdr9WrJgvW
         AbVm19T4jgH0rgOT8m+qePGFMsrSkierRWqL7Z+mE+vv1sAUeCFvr2g/m83pMYppPOKB
         yWzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793325930; x=1793930730;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=biXKHJPN3s+hXC12si4pB6yD5k6wJNz5r1iCKuyz1ww=;
        b=w2s8Khe23ZWHcGK4bP71a23zfKWd6jHyLRpuiqXXHY3leZD2wMoLRE9JkL2nOFvCKX
         5wSVSqqQEKB4733BIeuuiV2/ePWfa5Gns6rkvZcovTDnWHrHcAAj4ZFx7b6GkXabstX7
         E681+L1MjMNlIzWT2/OVECdnhI1jWqqrFfYXwwY30Dd5EDSFXLYZSXLqSQ5ob/2Q7G8T
         SC08Bu/7ws6NqwMpb4sY7DENW5ye2tZI2cKnNJ51JuRIA6lfeP39BIurg4znZb0ixi9C
         U2tkrHapcLGpwQWX3XQthrC3GOlAWJW1ceILAV+AQB0qlRUzCrtyQZNPv8deG+myBGgZ
         By4g==
X-Gm-Message-State: AFq9FYJk9nhKGTh9VrzdZfarXl4L3o3Hz4KJmMq380AXGfVogR36lLEB
	BxEPGqccYVv73MP49ZAnvy8TsDdSyxTl0NhFwST1CyX/N7o//VSfMoLkAxG96KY=
X-Gm-Gg: AYBFou14tVHHYGtNFpck7kE/rAKCr+GZU1CfAUVqz+KYy8xJa3d56j7AN/XJBQ4t+A5
	dyMo3fAi3juw4H8kajkL0q5rnqMnHLlLotgycZSzUYhv9NwaLmWO1dL7+nQ1Pfy/sBtIdb9C2je
	RsI1szAfNBiNIiXkJkUuSqGsvmDlHF4XYe69h+2pzM+Duf4HF27Peo8mdDyYtvcxpZGOgnEqUZ+
	foVPwwBMItbH6toSPWGtbH+8StNLMYxdlCFMZY0BtGgeeYcdMY7vL3N3wqofBSwGC8NU4K/FhvK
	2iR3pqYtq0jwBILM7AGj3acUwfoZm7+YmkGvPlRBKNIZXVBJ4HOuoz6pXCh/HzyRA2N12oZcXbD
	G9mZGNeKvoWmYGgRCb+6wYDYE0lOetDROKD4txA3AlNgEChARNqvIfFbKfPmu93ArOOyDZVnhd4
	xgRWEWnDDNSxflo2D/0Eiynwc0YgiulOWSyF7IidhCaPDg0a5C5W3ZVnk1ZwqPHEPPfzFCn2ztX
	coHKmEOH8+mtYEd/TbThyzCCM/Ml8HOrdmTaF73YYQfLo6zSbR3T55RUct8TeXU+rUhzHI2sJS9
	L0jb3dAsqqXMWQf4lIejinkNl8erAQoZ5cI1zjpDhGuF+yQdjnuULnSDr1UCjssQz8Bs
X-Received: by 2002:a05:7301:d198:b0:360:db68:3264 with SMTP id 5a478bee46e88-36a42340756mr1687219eec.6.1793325929228;
        Thu, 29 Oct 2026 19:05:29 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:61c8:985e:fbe6:4d1e])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a428af1easm2332068eec.5.2026.10.29.19.05.26
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 19:05:27 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] leds: pwm-multicolor: Manage the multi-led node reference
Date: Fri, 30 Oct 2026 10:05:20 +0800
Message-ID: <20261030020521.9399-1-yigejiang86@gmail.com>
X-Mailer: git-send-email 2.50.1
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

led_pwm_mc_probe() leaks the multi-led node reference on successful
probe and if the final PWM update fails. LED registration borrows
the node, so it must remain valid until the LED is unregistered.

Register a managed put action before LED registration. Reverse devres
order then unregisters the LED before releasing the node on unbind
or probe failure. Drop the manual error-path put and return directly
on probe errors, leaving the reference cleanup to devres.

Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Changes in v2:
- Capitalize the subject description to follow the LED subsystem style.
- Remove the redundant release_mcnode label and return directly from
  the probe error paths.

v1: https://lore.kernel.org/r/rc-review-20261029-ai27-27-2c77ed65cec2@gmail.com

Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was rebuilt from this exact base with v2 applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/leds/rgb/leds-pwm-multicolor.c | 31 +++++++++++++-------------
 1 file changed, 16 insertions(+), 15 deletions(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index 6365459ec27f17187804153cde6cb1805eca33e9..10527a64d1982733a43b76bd8bc123aba95b6f72 100644
--- a/drivers/leds/rgb/leds-pwm-multicolor.c
+++ b/drivers/leds/rgb/leds-pwm-multicolor.c
@@ -106,6 +106,11 @@ release_fwnode:
 	return ret;
 }
 
+static void led_pwm_mc_put_node(void *data)
+{
+	fwnode_handle_put(data);
+}
+
 static int led_pwm_mc_probe(struct platform_device *pdev)
 {
 	struct fwnode_handle *mcnode;
@@ -121,22 +126,22 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "expected multi-led node\n");
 
+	ret = devm_add_action_or_reset(&pdev->dev, led_pwm_mc_put_node, mcnode);
+	if (ret)
+		return ret;
+
 	/* count the nodes inside the multi-led node */
 	count = fwnode_get_child_node_count(mcnode);
 
 	priv = devm_kzalloc(&pdev->dev, struct_size(priv, leds, count),
 			    GFP_KERNEL);
-	if (!priv) {
-		ret = -ENOMEM;
-		goto release_mcnode;
-	}
+	if (!priv)
+		return -ENOMEM;
 	mutex_init(&priv->lock);
 
 	subled = devm_kcalloc(&pdev->dev, count, sizeof(*subled), GFP_KERNEL);
-	if (!subled) {
-		ret = -ENOMEM;
-		goto release_mcnode;
-	}
+	if (!subled)
+		return -ENOMEM;
 	priv->mc_cdev.subled_info = subled;
 
 	/* init the multicolor's LED class device */
@@ -144,14 +149,14 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 	ret = fwnode_property_read_u32(mcnode, "max-brightness",
 				 &cdev->max_brightness);
 	if (ret)
-		goto release_mcnode;
+		return ret;
 
 	cdev->flags = LED_CORE_SUSPENDRESUME;
 	cdev->brightness_set_blocking = led_pwm_mc_set;
 
 	ret = iterate_subleds(&pdev->dev, priv, mcnode);
 	if (ret)
-		goto release_mcnode;
+		return ret;
 
 	init_data.fwnode = mcnode;
 	ret = devm_led_classdev_multicolor_register_ext(&pdev->dev,
@@ -161,7 +166,7 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 		dev_err(&pdev->dev,
 			"failed to register multicolor PWM led for %s: %d\n",
 			cdev->name, ret);
-		goto release_mcnode;
+		return ret;
 	}
 
 	ret = led_pwm_mc_set(cdev, cdev->brightness);
@@ -172,10 +177,6 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 
 	platform_set_drvdata(pdev, priv);
 	return 0;
-
-release_mcnode:
-	fwnode_handle_put(mcnode);
-	return ret;
 }
 
 static const struct of_device_id of_pwm_leds_mc_match[] = {

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
