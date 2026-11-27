Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761442;
	b=dnahkuaEzMpY2tro+8ZW15pZNkcH6jIGS1sIcqLGlHi33M4S9mWzkVsMSZuHI+4xST7g
	 EQdEbbcpF8RRXfazG10Crt3qy1D02dFP+ncVMhSlwF0vk9hKS8A3HsO9xE1rzJI3no3dg
	 S0o07C6qS5Bd2WW++YW0m5AsbVjvUf1vklZ8/fKZzkupPQcHAGl1Xl+EUhsQrDEShxLfJ
	 wGBe5ntOX7l31Y8AZ6C2qmqyngweCgAatHzYo5DJmfSWLR61TcbZfMSIkYA9GTatzIb7d
	 ueQfRbN8R0AJV0YkDwqE3NL/7mBtGWNyep9ymbofv5P/hA2N2omr2qeBovJPNEHxFLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761442;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=Bp7sfKPW18CWeusdpm7ScoaNK9wSL347WVePmCGAN15KRsf5tRMqrfmAmrQ5n2EDKtts
	 KzaPdYS5p9TLycexLGvvGSZsz+aSF2OHKteH+D4rTzhoFakq+Le7ne+oLKzXgu/fi4wpX
	 GZiwZGSn5Z0UF3Kg0bR2SkMDoXyH6O09u7Fo02PBrH0Z9UiF6w3Mtnfd+pxYUs24wzizp
	 35ovLeCeMaM6EYfy6OEYuUOrl5cGIoBuwQ4f38rtSzA/oy6/tdcMQmBgQLoEv24PY2NC8
	 e1IRylXHOpNlua119Kut09b6tZj9MM08SZUxPLOJP6+jYnPlJL6KZjtlZTJQzK8zVyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="ucztA/QJ";
	arc=none smtp.remote-ip=209.85.208.170
Received: from mail-lj1-f170.google.com (mail-lj1-f170.google.com [209.85.208.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB15C606A31E
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 06:37:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB15C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ucztA/QJ
Received: by mail-lj1-f170.google.com with SMTP id 38308e7fff4ca-3ae854fd0f5so58397861fa.3
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 22:37:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761440; x=1796366240; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=ucztA/QJ143mwCYe3kf7A2RaycBZd2xoYXbvWqsW5cbri3/pQzV93kPcHYN9CCaW2l
         bnnQmXcGSWufUwLRWXIDFAM+WQkX6R5SuJomY1IMK3SQbYT/XVX/VcTCtiqRpPM4oVSR
         3r0Ax1FV8YKaxt+rwSQo8jYYBpMRb28Zt6Pz6uutC8KtVETt3fvPjcGdJVuf/uyWZRQV
         ML19RqqoRhgfjNVj+xSLTceTW5eOy3/VT5jUSlptVfHdtOdaZKYBdBV68si5wd8ViWCd
         iyM0U9S3MHMfjBoSum/p2e3pKQpX8IAChJUayLm/CwfyRn4+qsNlxaOdvUVImhb07gmI
         c32Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761440; x=1796366240;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=tj1AvHlUB5viMocpsTC+2zoSWQcdeCbha0vP3IMWWpN0uBtAuz2CGBiEWmLOyL9ubN
         FmRx5IrDg+qqoHb5gZdRkCZIEShkx5xxnXccvsRKv1te7Emq2VYfwNxZJC7surwEcb3E
         594sgg8/K2l0BGDZ7CbhylMR1+hHrdRDkaoZAt69u2HUgCzvC3FipUML3Fba5DA8FDs0
         rT8JehgbEzOMNPwpBJC6zaUe25R+90/bCiHPVNtpGojQm3IR8xhYhIsMGjMOMburDMxs
         WvM4HtxcG8DAFmRQmZcdh3vepLGItuYUlriACx/11GRIAZpYcjUHg86eSVYdp6wRRvL3
         Vc6Q==
X-Forwarded-Encrypted: i=1; AL+hErFMRgtPgzPZBnV+85ZvM7U2xdhF/GrzzhwkUYMpTNB/0MLriXk35Lb/TC3rvpvYimDx/DYci97naCaM@vger.kernel.org
X-Gm-Message-State: APuU4Z+udE0h7ENq/D4GXHFNe1gvtUUe8gwZCz0DXPmqmnKIK2dm7ASS
	DLLVRkrMcLxFP5g0w3ohzZox7G6TYZ0ZkZ6mCy4Sjb78zLCOqx3zaxDS
X-Gm-Gg: AZFdTZfmNGEGZ1Zi4iBvmGuhmkK0zbHCnflsf1QossCsGTS0tVygBqs9YL8OqlL0BZM
	4t3PoB/PI/OyIJkdHIn6tLVh5L4a0og7EwmNBbE5sVtg5WK5LPHRkuRzVP6vIj3T42U+/zhDU0/
	6SYC8+OPfrM7hijULBqx0Nek5yEgM6ukNqZ1ZPZ83r0o4QLSgLXwg9EFNPCvJ/2fBeL+JJP7nSF
	Q3hvjcEIpY+BQUXbXggxNJpDhCXrTx50mmW0pxqrrf28s/yViP9xa3zfG4Z/r2MbQOm6cHUzBDu
	9+SkQgujpu510ULDkQL8q1Kx+s1K9Tz5i2gMAj8LE4yAj8pZvsvYdyuN5fEjrU4rPgD5T7w44u4
	+HDi+MF7e21p0BwARz3xtnvmIj55QXqgTdwQbK1QX71XC1h+LQYk+L0efRSUyMu5zCWTy0wucwf
	esdl8H/ggb1U+L4tOJsCEmbiHd569NiOlOzEGUBTKu8hyIxj8Sn1ru0lovTgxi4W8sP+bwChsKd
	RklLEP/2JA+KipeMscl9eMLjLUCIn5tByWA3lAZSkfKnqKGDRigfYwl0ou+7v9eRikJG+P38+/l
	udLfZrfmO1T5S0TMxDCv1SyggCDAzQ==
X-Received: by 2002:a05:6512:2249:b0:5bf:cea4:b26a with SMTP id 2adb3069b0e04-5c1bc86048dmr6197622e87.48.1795761439922;
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:19 -0800 (PST)
From: Artem Shimko <a.shimko.dev@gmail.com>
To: andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	maxime.chevallier@bootlin.com,
	pavel@ucw.cz
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org,
	netdev@vger.kernel.org
Subject: [PATCH net-next v7 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 27 Nov 2026 09:37:03 +0300
Message-ID: <20261127063708.3074433-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
References: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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

The kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
incorrectly state that the caller must hold the MDIO bus lock.

Remove the misleading sentence from both comments since the functions
lock MDIO internally by themselves.

Fixes: d90265e75584d ("net: phy: add DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY driver")
Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
---
 drivers/net/phy/dap8211r.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..1fe20efd394d 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -69,7 +69,6 @@ static const int dap8211r_internal_delay[] = {0, 150, 300, 450, 600, 750, 900,
  * @reg: Extended register address
  *
  * Reads a PHY extended register using the indirect access method.
- * The caller must hold the MDIO bus lock.
  *
  * Return: Register value on success, or negative error code
  */
@@ -97,7 +96,6 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
  *
  * Modifies a PHY extended register using the indirect access method.
  * New value = (old value & ~mask) | set.
- * The caller must hold the MDIO bus lock.
  *
  * Return: 0 on success, or negative error code
  */
-- 
2.43.0

