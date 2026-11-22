Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353547;
	b=l5jcsjOL8rDb+HlyhWt0UsiY5cfaiqcgRciFjjWGeUPaaj8Zs+N1l9y4T6aN7r2OhLP7
	 aetkO2cD4gK0kBaddv0LNOorAIBO5ViGxSzbWfIjO4flEzIehW3LSfEmMChtdhBfaf/vR
	 JXo3XrsgzbfNkVvf4Y516XLX/vDGVX4w9JSJGQY5qeJpEDvj6WmIriS6GgmaUkBzCATkf
	 DvAHObfcSZTbkgbqCzjH1k5sc+fDU6g7Bz3vJHg9dDAapevBeT3LSL9qxUKb/iGY1DpD4
	 8mEOnqHsdD01dqLlerg2Kiium6wi+JY7+B0MbBzAw+7DhCTORoUCK0WsstkSVSlNKRw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353547;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=0i97q/HG37xLfoMPObQNvJqSn/t79dvM4+FY0IM0Duzf4HP7/gWjfnvWqKMj46I/JKp2
	 odwuVMoghav6GUpCjkfdUPZfadPApP5iWCtoY3YFLbN4cD60yxmNkUh2p6HhjuBQIsBnY
	 ou1bqp+7b0+ByDtrobEgMG+SbREQ6r8yH2ZSgeD3uRsDHCb+46JD+G2JDCJtCo8AvogFq
	 gvmmB/lar2HeJ6V8k79j5gnvg7w0kZXgvrf6UJgkFaL/KUOzRkK8fQ/m7Tfs62lryaGVu
	 rfyDFoW6en5uFYueDdOlNtMLNy3DRiF7OpNuvLU8xl/59UZnhEOvUnUihuNRAEe7InQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX;
	arc=none smtp.remote-ip=209.85.208.171
Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCE3606A684
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 13:19:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CCE3606A684
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zNnfJDZX
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-3ae0d0b9db2so22177491fa.1
        for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 05:19:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353545; x=1795958345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=zNnfJDZXicFiVo9E1HRD6Wgn97zHNLVg7Nrj2zO2yQK/+VeOM6+DTQoDas/laCrJAW
         khmwgB5guiv3XpWuY+JI2VHXZ2p46zCjMzWGu39MngWb2BqmLBcb/Nw0Tu9hTp0iG2CV
         MTH9BLuAMRV4+NwHNYp1j8bxaFtKoTbme/8i6vg8KOi46LFO++5AEdG3+ckRipbiHRDS
         Th8COKQwDZaerOq96OwJwdUR5kyN2+9sR3G3K2onV2dNJrmSCG4htbBssMuwhP5Lzk6u
         iJHzpYcf6xxzRD1ubSpYD4iS7R0+Zu7ACkYALBN9zDMR4lLFWlMqLcgx29nUwHCIHCAJ
         jW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353545; x=1795958345;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=u650pHSSC93CWHcz6wzDg6uILIpb1Am7Mg28dyUZSIPPjC3lHMr5ey1uTzFxk698aM
         voNknKONb3bnUJChR1mNeuQRO78NvOjrkQDwr+UjhU2FJDT3fMkxSOP1HRZcm9J6uZGE
         pTgSqgZtti4sgTXzRiE2XITItnukNYzWQkWorDajusKhtvOj3fAeI6i1BVoZ5wcx1v0D
         NITZdnwhnDHh8wdx41323SdJwqGKhmSSUf0inyK67v8Qfsq7Ppq74alFuiBlWsO+6vC4
         debYt4gauHR/yJ0uvR2rQaZ/t4SXgG79KUTUyjKBrPv7InO4IyfnEJI/OI5DNkXTfqV6
         HNmg==
X-Forwarded-Encrypted: i=1; AL+hErHGUBMTvcxFDlkvEiB/29pWoS/IahhLreUH+fwd+NIIG0Klp4JNK+ztk/qly4lSzQ3IlA8RupYImttl@vger.kernel.org
X-Gm-Message-State: APuU4Z+FGp5LWCAMHzkmFbH790d9ZAy45VlW61OA4uf32XMspyUsmGDg
	dSP8RWKB85DyPnZIpQuO+pZ1ZlyWUfdsI8f5+voPZXvkLpz6eOkPWwUc
X-Gm-Gg: AZFdTZd5GPMdrF3h9zBayu83IGlFGquCQxQEGVhLkTaQBm9S7ecqEm/kVMWE7/4tCX8
	SbIYOStEGYURe4+40JsyL/wavLVoVS6zMD2FPWHOOSXNE0YJ7kBRp7DseFZvuZoHFoUrwALhyhT
	FI9gHqYLcoHT0Dp/8OpR7NwS7uLhJzlS0z1/o89+bYuBBd7OTIg30pzJB0BbWJqQ++Jl2mvx0Fd
	6RPnQPsrvSxwDCQ1pKXfW8h1XI/9Syv0onvKVnH5QDgVWX0XhoMJzmIhb8pWKCnlc+nfjarX2aR
	j6DCFEAtx6Xl7/zGSCIolLJJwnf0exKwNzdbkHhlnyisZIB9EQbHNVOesEX9qWXAG0I7hw8xcuS
	OTlybPjR3IXjquZ4qtjGiCh8ztjLMizB+zXgflzj2dNLCQcRxZDuZp1jO4P4Hm9qyr+r85ntITj
	oZHrMN5+x0psBxGeJWnUQ/0tKbt1/aIPwoNqq6UQmiLVwa0Ajk/+ty05Kzte/W9wQPEy4qVVqNh
	BkZblhp1wYoD8gj+JVZQfY/rkaeLI6DVmnNSI88twFLI4n/xsQM3ZjVBK2TkUb96ikkXK8oZmhe
	vS7uz9KWZ5Zu9UZbxTL7FOoOKdXB0w==
X-Received: by 2002:a2e:a10d:0:b0:3ab:f43:a3ca with SMTP id 38308e7fff4ca-3ae7fa19f85mr20640791fa.16.1795353545402;
        Sun, 22 Nov 2026 05:19:05 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:04 -0800 (PST)
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
Subject: [PATCH net-next v4 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Sun, 22 Nov 2026 16:18:54 +0300
Message-ID: <20261122131900.2951586-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
References: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

