Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795513766;
	b=IulwP0A4r722ZF7fTL4/nyZL9q1mLNYQLUSa8v1l24UUBlbUeG4NCGlHWx9qmU1DMuKw
	 dwhAa8hf4Aen+tZd/eSNX5kqlhHdj6lpV1BugUn++v8EOlrVXzqbfPAYictBlxMs//vbq
	 Rkewtw3LoP3T5hZd9jFcEBlbYFNoK68cPsdm/LThlLCBN3Gvf0fpMpWpKpWCnUEy6O7Ew
	 pR5c6TEatjWNmSwZ4Vz+HMYs5vWg+4O44muyxWlajmRnZ3GPy+bPF8xLw3PtOu6eKCF6b
	 7axcFwHrsT/n0Fr51aeBKrtnWsv0bnvC4HZgxjS6h3R2qx+5bjYPYXsydjqdzms4Wgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795513766;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=o4FMzwQyhdky+IGOXuPU4jceraeLccnYg4m5VANZUpgJ8be0aPRXq9DNt8iwWNWZY12a
	 jX/rs6n5Ga8KGpyAqOd/tXy+E95v76GKB/qK/xaaYnpVTL7SiMf3mKAff0yoVsaKmfP9u
	 qx5AjpTZhhwtV7VPQYd6EY45BubFuxyCYs4HdSI7C1arz3HsW02pp0oGESRG2H5iu9+hI
	 720p69knSOpiQjqlCod6XeN4h2e0X9vHcSSvfAuB/kVGg1dO8FfcUt+U9i5NN5e+IlxP7
	 WMldz6FrObizFsQt8E8USswQWERc9hiRnZ/AjnmNzrlJ6bPhPTHNQ39SiJ9eMLmOu6Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D147B606A85F
	for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 09:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D147B606A85F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vra8ahew
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3acc7a0b558so42360681fa.3
        for <linux-leds@vger.kernel.org>; Tue, 24 Nov 2026 01:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795513760; x=1796118560; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=Vra8ahew6DCh+xOD3B9GVIIHTWftq7Q5Qh7dUmEvAMzOoV55LkwToKUZBLTG1gL5cz
         zIOdB95FAKOrUv9f8QxF6VCY0l9NqwLtppZdhJTkmZoTMQV7xAY0euFq//1pewgqhecn
         po9Dm2dVl9z31VrI21h1TuBn8VZEz6nZNh7cEnPDz8TNbitavR91C/z8Q6k9eATDavVM
         LA9SgmWNB+wDn8RA6EwLRxadydgqeVAyYHTMnZ23YoXee1W0n8isAaVPgOn20V4i/Egd
         hgFUp+cmqgTN2/nLV0MFuNzrfoSAKtcl4Awjy7NJhzulPebr3aMxeSmGZmhVaB8qteNV
         o+YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795513760; x=1796118560;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=aztZ5CyyzJ0Lru9/YDn7Y4lFp5Y/7ZeF2aTNS8Zo8648V+gE4dhDEzTXEZAnz+l5CF
         kWimxSf5U9VP3hhjs15KQBa+1mLPUVO5XXNntK80pZM3jB1P0UiGKzo3HeBd66X4tq2S
         w6PkQ5jm0vPfqbXwhJP2vC9ieZAfa716SqHvF65GMKfw5cQ7NYQzwPW/CJa6h1wTdOMI
         JgrztzEs3Yk9z7oGYl5Es/ISrWHOzxTp4IT5jJDYv5EzxxuGM/Rfn92PqlWLNjzJKGPK
         KtgSEtuW+Ibc4bDx5IzerTmhjipZwqh58nSD9WyulpWhVCrnNkb2LN6Fapsf6GONkL2q
         aL4Q==
X-Forwarded-Encrypted: i=1; AL+hErE9VK2B5ZS3yK98wQsn0FykifyxYlWnUOK/p6OYl2nnJsSZyBOtHtnJm+xs07QezUmn9fZ9eKnhhJoh@vger.kernel.org
X-Gm-Message-State: APuU4Z9aBnt7b1ulQieYWzU/sBhxki2YkdM4wqv2sfY5f+hbk3H8XZvF
	EK8L0uD7SiyzRxtJgOOQ9KZEDsigfebjVHLAFsFoQFmd6E5xbmpP/YGY
X-Gm-Gg: AZFdTZdE5MUZAYuQGbTa9PDrKQPCeoHeysLyo70orUxmKfMd5M8uaiqkgEZtNth1EAN
	cLikJs4TFhDbQTB+xtnEKdpXpjx5KNNo9DJxHYWuwniCYcukA/+nzodss6XWvy9ioSt097X2ACm
	nVPOLNecj855BRFmgZyh3yUot2x0uQ+KEIQWUmx+sHGP2Rp/3udczEWcrQMw6BPb+/WMRqHEOOV
	f/OB5HdHcDNteuYmnTR598oAXLYslHEv+8i3At0UDvdS7O8S/QIQdtlvQ8c+kx1CcKQpgEJFFZA
	ywUfFhUPzNI5kQcRVchpY5/bLzJ0Yeb4yWR/+ZGm7Dd/+/G3qcTKFGMbRbbVrTGsKGVZ/9/FW4a
	kenUL6ELBzIhm82OT0gC6XfqAkwpiwODZBGDG2CyVkYsIAe8z9yubPM03tj0esK9lKYyxdxYv4v
	8s13DH8iQxXwZQQA6//wWkzuZxCeFgz4+BaeK5k/gc/+jSWinU0kbcjpugtCJS+hhSdXBa7chaY
	/vfkzZQaoGFqJlqJ3Xb2AWbR54sMLgRmSWGGND85UI2LAppQthyzSEhB45GJSubtMvQa9rfWVDC
	sBlLPpCRWv/JucYpcxu3ypXR8IOpP3ENKh+GYl+Hr+c+Ci0=
X-Received: by 2002:a05:6512:3a94:b0:5be:5222:5611 with SMTP id 2adb3069b0e04-5c1bc86cfe7mr3678861e87.39.1795513759856;
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae8051bfbfsm38756431fa.20.2026.11.24.01.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 01:49:19 -0800 (PST)
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
Subject: [PATCH net-next v5 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Tue, 24 Nov 2026 12:49:10 +0300
Message-ID: <20261124094914.2993988-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
References: <20261124094914.2993988-1-a.shimko.dev@gmail.com>
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

