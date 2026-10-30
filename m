Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793324387;
	b=tkrpy5wkHnAzdH+4LKyLW9538rjG8MpCOC0a4iND4CvWzy6LGJHRGsJukT3b9bYLa/GE
	 RGd1jCCPHIG/fEZmBFKDdwxIj6Bvg6QyEnuIRD9m+uSTlVNYTgjOmXvQVb6eGJAJkQ8U4
	 NjFXDKxTcmGC0gGRUyVSod9kmZaxbSuh9iJPMlp93yaQuAVCuQXq2/xt6LSXJ5fc9wqEf
	 7hV5dNXBIftt2BC11P5MjPSgj48+lbTDGK2zNPpCrxrltS0Jy4Mm6uzfzbazeK8vWQG0w
	 VJP9bzY3PqlSZ4sd//2sCNLOoNGGCBBcA2n/Z7Ap92HPdBqZoVFhkYAteLHzZb+SD/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793324387;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=skxcpPsBeTV6ryw50kturftxInkxS+Kf6PxuE2pqHOk=;
	b=XeKB4ihRDKOkiS4152j6M/3ARrpBpHa6V0Crx0j3jOJAswYxlDG40WyHQWwWFhypKz+A
	 xZxBZK/VnXl+NYxcLbn5JfaLTXbXtQ8VJovlNU+/lcWwPnbtryl1+3JFyMVgFlpk6pqra
	 uuVCsMXeDNhzhBfFF/0LvChONjyEyNm6Bk9Dq12O40UOJKLKzxBIVOHPn3s2LsPiBBVat
	 5uAHSO3HCYB5tAf0KlNqiJcJA1cn/WGUrYlLvLQFCnLbY9nDky3ShZ04PDXA3nbv8CM9J
	 RRAFOuoUn4qCQ23GotqqP0GWMGZ0QWEyNOlIQfMfGM9hfWEjzQlM1mYSBscXKrRhZsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xweoJmGd;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9B4606A31A
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 01:39:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E9B4606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xweoJmGd
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so382859eec.0
        for <linux-leds@vger.kernel.org>; Thu, 29 Oct 2026 18:39:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793324386; x=1793929186; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=skxcpPsBeTV6ryw50kturftxInkxS+Kf6PxuE2pqHOk=;
        b=xweoJmGdu90CB8eP6J3RyMpLDHXOxQgOqBakF0y8/Ha12qCltrdngB1kBhfDF5NSn+
         L10eMX+fQGaoFfl/4ZJN4rNl6Tcu2XG6c1im60xqkiuqRXuhWK0y6cxWu5Oxa1hxlIqj
         A4OEkOlhVYmpttwuorY0ugQ3oqQn/jEMRhp+huXvc/dI9YXAOn7DE+eGvOtyVx2eGOe2
         3LTl1CqQMAi/tcYL7Ve3x2yKtkfMZELh8zxxN379aSlmGO0D8huQoGsUfBACf8EP6sG8
         //0MCKLOk+AL/+LU4GDlIkCMXKPa1cHE6AIPHZ7G3n+IpkXJ90cYFggEGcs8LpBKGQ9w
         A8Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793324386; x=1793929186;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=skxcpPsBeTV6ryw50kturftxInkxS+Kf6PxuE2pqHOk=;
        b=XQe0gTU5YHFqEsExu6etLewE5p1pE9vTAcehgcMRwisXIhpF/Cxh6oXAgJkF1iQUPo
         GB+x4z5j6H5QQNqGWQO0qz4Dq6vgJxJZWNGNNFjZOl21e3k2u14PipZOXRo6h0Un3hG0
         Q8ULJVfiIwXoJWVBCCyrGkllvVhkPz+PY5olQ4OxyEp3uDQlGHtnqlikAH3d+3n2gX7o
         n5nIYkHqbAE5tZC9LfFr/siwGSsBltPiC4YLK/+JGPZQP+sZptUwORZsazyvwgOk0r0R
         2lAfHs1YnQ2Aqb2bJw8MA19daUaPEYjFBQI4p9k+KO0JqMX8rVOMY7WeUUE9NJs5wEG3
         DFYw==
X-Gm-Message-State: AFq9FYLuNt0p63Kkp6Hr3sfiQ56dZIvnUHejpQ1dcS0VaOa+Oq4phgMI
	5d5MO67TduQ5Z4v1+YM8G/L8jvhixhwZdMOvzpgDjHhYNbKUMmXntrjI+jTK3eY=
X-Gm-Gg: AYBFou1BHkQerEg3y0hzzHg2b4ZxXhiqw+S9xfwmwsycBNJTE24uJbK18uSCn/qmbiJ
	DK9WKqiifPjRo9V0u9fN9HF8Po5EX5ka/Zc//D2rNR0O9kS0s/UNtcWgtLzDYPvYjRyyUHQha0X
	URBRyT7dUPuKRxHXRy6sOgySIEhryFyRqvPxG8naaFg8d+kN3iPkBWiVhAFVUlpE55VJTWjZexv
	L7pLts+DmXlwNvMDhdz2D5eOg+0MXeTocZPbL+cN0A2x5ymHObwpKqWdTJ+2Ggg6+tw2Bw5QuJr
	qhiret5tNipEbG85MvWmJ3htJoWvjUTw4drqyeOmlPsxeSapsuRzu/h7mc/IGqs7nC8brolQjm5
	l3yhRXd8ZelUo9HIREqbrb5uMyj+k5x03BBzfgsTpZHLlXg65bgtJTeooeH6+TsCTYOEnFz1BBe
	lQ6ESGeMzk74rYkTq/m4p1hHRivCSDZ/YdHkMtk3WzcyoUPbmeSgEvA1WfldWIiCJxv05NrJ0q1
	z/hW6OLpg1Mf/FLy8krECgI0jnDLCds6picM1x67iBDjSRyU/lEaVIrPna2Q3uTumxXCNrWslY7
	4pGPX4rPiJmoFc2teahkgxYs/IQdHrxt7kNHSzdDs338A8ke3jhvPCT/OjNJZQ5fGutD
X-Received: by 2002:a05:7022:b05a:b0:19c:c396:37aa with SMTP id a92af1059eb24-1ac5d1d058amr1084996c88.22.1793324384575;
        Thu, 29 Oct 2026 18:39:44 -0700 (PDT)
Received: from localhost.localdomain ([2406:3003:2002:639c:61c8:985e:fbe6:4d1e])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm2860630c88.16.2026.10.29.18.39.42
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 18:39:44 -0700 (PDT)
From: Yige Jiang <yigejiang86@gmail.com>
To: linux-leds@vger.kernel.org
Cc: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Griffin Kroah-Hartman <griffin@kroah.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: pwm-multicolor: manage the multi-led node reference
Date: Fri, 30 Oct 2026 09:39:37 +0800
Message-ID: <rc-review-20261029-ai27-27-2c77ed65cec2@gmail.com>
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
or probe failure. Remove the explicit error-path put to avoid
releasing the reference twice.

Fixes: 9fa2762110dd ("leds: Add PWM multicolor driver")
Assisted-by: LLM
Signed-off-by: Yige Jiang <yigejiang86@gmail.com>
---
Based on linux-next next-20261016 (2efb7a11f1aa).
Compile-tested: arm64, GCC 14.2.0, W=1, CONFIG_OF_DYNAMIC=y.
COMPILE_TEST=y.
The object was built from this exact base with the patch applied.
No full kernel or module-link, hardware or runtime test was performed.

 drivers/leds/rgb/leds-pwm-multicolor.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/rgb/leds-pwm-multicolor.c b/drivers/leds/rgb/leds-pwm-multicolor.c
index 6365459ec27f17187804153cde6cb1805eca33e9..0ccf6839bc65f282f7c821e9fe7a50f431cc0d71 100644
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
@@ -121,6 +126,10 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, -ENODEV,
 				     "expected multi-led node\n");
 
+	ret = devm_add_action_or_reset(&pdev->dev, led_pwm_mc_put_node, mcnode);
+	if (ret)
+		return ret;
+
 	/* count the nodes inside the multi-led node */
 	count = fwnode_get_child_node_count(mcnode);
 
@@ -174,7 +183,6 @@ static int led_pwm_mc_probe(struct platform_device *pdev)
 	return 0;
 
 release_mcnode:
-	fwnode_handle_put(mcnode);
 	return ret;
 }
 

base-commit: 2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
