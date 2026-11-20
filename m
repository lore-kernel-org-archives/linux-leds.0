Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162274;
	b=zZ6P9fnlw6FBComcOl8+TZDyfp+5WkfQFL97lqxLrHPEzUHTpH2qedw8s4uTJ0q2V5MV
	 RVIao8/ZQfHXgPLHUQuGO5HO3a7wTNA+arIuGkDdTBPGsBY9nMi7Y2kAouwdVUjoPhq2r
	 NaCE602qHvbWsVeFO5ujwHF49irE2rQd+cX/EYAvZzaoeqjgVqYiWKMe4rEW0fqSWt9Cf
	 oFROV5lIxR1hHLjecvTKDwuCYB27G9/cgnDUM3pKHYT1RNHzXXjWRWkbi4PgKWWDoHDsz
	 i6eW7MNfAaYF3OdyP7fi6pMABCwN7q/t7+3oFrXxxGt9c8FU/gLVgatBHYp52uU915Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=Ocf8GEOzFu0GQ6TV6ODZ354se49iTcyhKw2g6zTfT8u7v7RqIaDBbj5sYLn1p+RTln9G
	 4vHI78S8wmsjC7Ehnf5OruaMVtR8Rf2NcoUorTcNL5Pmjqfk0FT8rL4QLvmm9ww2tcWjs
	 5bztJFoZKWubJH/u/Onzz9m4/p3hY2jDM55LDthD2gwxiSacQh2Hm8pYJgFe/hL5wsiQf
	 x751d1P2v0+e0vGr0R9C+cYtwejD0Y9fl27D7g9+uXJf9umJwsy9xbEFGNeOIbIbQkdeZ
	 4VaKCiyCEJpzhzEkcNabUQ45zU8kiauWgwqRitP4IoXZ2b3h86p9AARLQ9bZWqOm/3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW;
	arc=none smtp.remote-ip=209.85.167.42
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7199F606A33E
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:11:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7199F606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=w2ATjdeW
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-5be3d5927ceso839237e87.3
        for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:11:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162271; x=1795767071; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=w2ATjdeWwzJcMVAzYw2sUM72zVRswVEaXN6KcBeMnv1a5wK4Bz/OGAV2d1vhDrzdR3
         XSaLtIToCMVx8rbKxIZp3xo9oXR5wQRcYGMIURqLx1iNDth4AfZzH6TweIcacdUY8HMk
         bJg+0v5lD/gv2HVUCWrGxTlEdcKEVe8gsGuxfgJOmRHLC3dVgHXJaHN102UgzjEyua9A
         FBJTTjkxchlJuSxcKoMy55A8+5xg80byQe4k5CIR/KAXWb7S3ATcYExMlw0amzQewHc7
         b/Rek8VGAOvZRuuQsRPk6XWPvbOPf2sRdTn1P2oWSbO2q6I5QcHBTfH7c286B3A70ChB
         EYMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162271; x=1795767071;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=j6RpvWy3rul7qgYw42oA7H+7NjdW24qW/rHiWLgKwODkAYtycMfXNA3qIlceVyM0rn
         di3GO4QciCAbhIyGL4Ijnwd8R+hnTHZu6zwtJW0PUoMkKxdhCljShzFidjmFXEuDx+f4
         bhE02lCHhDMswNA2BmpoH15lUZt6airJihOdwotTiyraIG3TpCfi8WM5ZokJzyetgcwg
         FYxTZ+XzpwNhbD1+bCJcCB+Y24BRjYP/hjpG3+WZK5a4Lztmv776HSYQl1GtUPnVUZA8
         IzRuLkPN33hV2tDtsFiRB5BNzWkP7js9e8vgJibORUnnmLkRsDh3qINBUV/n2UZtcBqY
         4jDw==
X-Forwarded-Encrypted: i=1; AL+hErG3P7FEBNnhHt6eRNQ5NHkDCBlz4RFihcGmy8noNvp/xNS5JldtQqBs9VSC2VDiOkHFExYZVPk0LnPd@vger.kernel.org
X-Gm-Message-State: APuU4Z/5n26pUDhqxjwjmt2FM3E96s7U4+F/3dP3Q2zZVcdEBVQuXnuV
	ZFRN+otZ6k/kdhWmFjgCwDMkuk2gDxPatd6/63YpJBPAZ0gvopBVM5M8
X-Gm-Gg: AZFdTZc9n/y2JoCf5A5yZZuoI+bAIoK/NwFODokLSx2V3kfm4USGBndocVyjey3i93B
	tmJ0CBDuGGRY2Gr49VuAHEKwI1NIhtNtnrq77SFtoSzATTYQemdYzZqBRjCj2RRV9WK0u8h2vx0
	e/X6yYfhWaUXXAf2u2YEFnDDUFk+EAWDHwFfLI/L5RcEsOXEhOfLbqMuA6CcRZQZ0IfStxG44rM
	qdA5XQMQk/RMTUpsEar7cPn/1ANaHexpZCpihf4fj2HvBxD9HPW8az0dqOXzTg2AbYTi7ZTMYrl
	c5jfeWQIB7SR9p5jPtCghMwzeeGKnQAzz9A0y1VRMHP8BSNynJ49z6aH9SYZi7GPzYxGf4QE5Zu
	/Ss5OxZsHPzRP4jT9Mjwy7V0SUKSJMtEIksPZTmCZN3YjOKCRqMfePiuIOtAPbjt7gHXQaurFff
	vV7HW4AOTa6mUsOIqjdaoY/BRD7thpAMTmFlVuLclv6249Mv3+iDNpDf7XVC6CI6EGm1+LEy9/q
	ufWEt0goM+wxWUHPGKACvghati+uMiNXPQlzC3wsapMi96/jWhueDtv/FP+NIW+9AHPVhM9TIxZ
	8IWl0ewIJYplGMds3cRKP2m3Y8bbs8wqnRe/lYaQw6QaK/0=
X-Received: by 2002:a05:6512:10c7:b0:5c0:d102:8374 with SMTP id 2adb3069b0e04-5c1bc7fbfafmr636017e87.17.1795162271379;
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:11 -0800 (PST)
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
Subject: [PATCH net-next v3 1/4] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Fri, 20 Nov 2026 11:10:59 +0300
Message-ID: <20261120081106.2919010-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
References: <y>
 <20261120081106.2919010-1-a.shimko.dev@gmail.com>
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

