Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795614023;
	b=1w6W0uGrCVC8r0AzSB40HR8C5ZEPiGcWa/8JHZdRghrE2VtY16qhL+gCj5BXKEhvElhV
	 OrmbGr7W+qr77AC4TL0fFgG9zuNozNOcpR3lfaqxu64buXj+E2ESYVMKhUnOc2Tr+BM3g
	 um3Fz7vzKKr9jcgXaeQQwUDZLiWKmmSjL8NmwndCOYqBdoLxCJHSituKR46puMT7DDA7Y
	 I/bXMsMLyzziJCDo+HaVncRa9A5jrCp9czucGthbdxU3nhTqTuB2TRkVpqS50s63cOKbn
	 VRa9MuPBmaadEBbXv8TVr5imdw9muwpT08xjMsMM103aJQy7yseOInkzZTkMU48Jypg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795614023;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=JB8xYtba48EdonovEH96/gnrjsat71I+BpeZ0UxS0NM=;
	b=vFOJdC3fmj5qWir9zMHVIc8+nvDAgdbqy2luDDbVc5qt+uG1OR8rdq7u7xpzw5wCk94M
	 a8OJ4G1wUj2y6b333OSdkYpKgO8HFM72tZWT9Pk5/OKiJ413EIFsmKmu9nkgwdq4qG3wD
	 GRLQE/HA+B8bkRAaQjWKu35NP3c+y9Ylld1vjLL/rYLwZtyOx0yb1JsZLqjqtfbRooruu
	 NLbcnd5o8RW6KCTVp16oEsKfTscQeHCW+10fISwbipxXDw7D1s/UgmRudnTo77b+QE/uY
	 bQKmU4T8j80dDDhLRlXXzeBOLxovRWqfwL/2KdHhoYj51sVWw3Sf2dANUCrlK0Qyscw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExbJpLiT;
	arc=none smtp.remote-ip=74.125.82.54
Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB2E606A31E
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 13:40:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB2E606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ExbJpLiT
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-1b50a4bd2f3so3392742c88.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 05:40:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795614022; x=1796218822; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JB8xYtba48EdonovEH96/gnrjsat71I+BpeZ0UxS0NM=;
        b=ExbJpLiTwp8PXqLdPNTio4e+83foQx5U7PYRqrLMzEDMYkXhXZyYuWrN2bvf/c7eNi
         49N768n3Xi2RC12UuVuk18uxbZMC1FOKJTLCYzLQc43E43OavFo6EyLXmI3shbDRkuV0
         sZ+KxuN2KBuzW3Sa1CC2clLskQHqN/TYggmHO5oUO4WAdhbrK8bAU+nNk1sJolSmL35V
         l3FN/+EqO06ar0tqrJOYeo8g0ULTvRXcdrD44GKC5z+YE2wE11aC5qupFkWChc9LPvT+
         0Hvg1niGOV7Te7tF7o676PRVOfdSSr/oVkWxe3ksot4f+Gwhru/QF3Gix757Vupqf2pB
         teVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795614022; x=1796218822;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JB8xYtba48EdonovEH96/gnrjsat71I+BpeZ0UxS0NM=;
        b=u2qIB2zOVjqYDp3F9Lf3N9UcUrFUeNENiHz7W3BqmZu3YYPSlkyP9s0q6RNKmdnzCd
         Hrsj8RZCw5hWlyZnUW6XCqlFBnVCyTpy1LaDhLaAzl0y9gihTDPldHWCLdVW3Bkkw8px
         4ZdPm+0s4cQBOAQgcDNaJpT3NRE7WWYO8l74o1ISDE0///3zwo8EalSY0rwRoq9kbzGu
         b0cWzAUIYbn31/0+rBvvD9zNm8NYyfm7wgBjitmBW9AHLsBIUJBK3Pk1sBIEUfuZbkjQ
         hRlGuuG1zHvRmMouKeGJ1dstWIDdQVxezGf7QkLCFlPwgWR/JRbvAU4xMa26n6oqhzUR
         p7Eg==
X-Forwarded-Encrypted: i=1; AL+hErEF3e+jc3m1epylZMmjMwJ5ld6qKmcIg/aOtKxxiVc00Clc6FBIVqx0jdm1iXMf5L0bVpdQl66GKqYg@vger.kernel.org
X-Gm-Message-State: APuU4Z93sqxodnd0h06TJh5i8dGUU20t1Vjc58piBad1eLmzlOsRz5bn
	rRv8Gs79PM5WN+GrX0TbGzNAH+ZY8v1p0seTes3w6+amiDY7RSWhbaAb
X-Gm-Gg: AZFdTZfKX3Drf4wLZwdnGohYmvjy8K1VjGQLS6gpKUzugcvka1gBbPhvzWPMU2d9RXc
	/icKA1TLgPaz4p4TCn0mVj3+SYS8vs/tEruyMVkLZVIsOGWPSmBF2KmV/l79vAIf0gE4+G70QUx
	OluesP80fF2jC4OM1qkG2jwEnvwjPklNh9ailbMqCMU9f6rf1eqgbmeeI/YTOwXKtNHcf5g/D6D
	sTMrW4SzyOucohdShpXxIya9sejG3aXq87tFx5d8KbJoSr7UHYInSo/FrXMIxr2fW+nDwIwmoOK
	ic/n1GEdPO7K2lcoY6bAUeZ1s2d411tR5U5bYNfECFOZP/ruOjsDVLHjrbIecyB1pkEZtUxttTI
	mYTozKBwzW3yp9UGuOqLJbb/Zu3ZMCacqepZ1J37CLXns24+PwNIFigNYY5F6UJHeZndxInOfpk
	aHh1rzTcQIJ6TJlHoNpVwkFWoQYr43ID3jvZEXGKtPPx9vWOR9WTVc5miMkT3vf+h86RGoKRpts
	rpMc7TaSRYo98gTf+tWZUQFBmHwXYP2g6x+pTSH04k+fVFWiFSeDc2jWxGoi41F0NuDcrKk5dYg
	JZgzx1qHWnhan1l8EESUQkmzbs83TUquB5Q7YmdJdGadeaQ=
X-Received: by 2002:a05:7023:a8b:b0:18c:e014:6f1d with SMTP id a92af1059eb24-1b5567ab595mr19131681c88.1.1795614021736;
        Wed, 25 Nov 2026 05:40:21 -0800 (PST)
Received: from SGN-LDSENG.tasernet.com ([2405:4800:5cc3:11a:1ac0:4dff:fe8b:4a69])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385666e7f59sm56251563eec.6.2026.11.25.05.40.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 05:40:21 -0800 (PST)
From: Cong Nguyen <congnt264@gmail.com>
To: Lee Jones <lee@kernel.org>,
	Pavel Machek <pavel@kernel.org>
Cc: Luca Weiss <luca@lucaweiss.eu>,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] leds: sgm3140: Put the child node reference on success
Date: Wed, 25 Nov 2026 20:40:13 +0700
Message-Id: <20261125134013.2692510-1-congnt264@gmail.com>
X-Mailer: git-send-email 2.25.1
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

sgm3140_probe() gets the LED child node with device_get_next_child_node(),
which returns it with its reference count raised. The error path puts the
reference, but a successful probe returns before reaching that code, so the
reference is never dropped. The v4l2 flash sub-device takes its own
reference on the node, and the LED class device only stores the pointer,
so nothing else needs the probe's reference after probe returns.

Put the reference before returning success.

Fixes: cef8ec8cbd21 ("leds: add sgm3140 driver")
Signed-off-by: Cong Nguyen <congnt264@gmail.com>
---
 drivers/leds/flash/leds-sgm3140.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/leds/flash/leds-sgm3140.c b/drivers/leds/flash/leds-sgm3140.c
index 107d02c3137f..5bc21b192d74 100644
--- a/drivers/leds/flash/leds-sgm3140.c
+++ b/drivers/leds/flash/leds-sgm3140.c
@@ -273,7 +273,8 @@ static int sgm3140_probe(struct platform_device *pdev)
 		goto err;
 	}
 
-	return ret;
+	fwnode_handle_put(child_node);
+	return 0;
 
 err:
 	fwnode_handle_put(child_node);
-- 
2.25.1

