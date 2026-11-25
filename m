Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631871;
	b=aHcr6eND4VkBdoD7xwXRfj3jRRXObdmwTtr0StEBkekKo9kXGaCCWNA+9Rp65060rfdJ
	 zQJWRPK8fPD1GfRMgszPvY0nOBceJqHPSkt9P5FNInKGSeQKwWQJT5HhLuuc+REZ3lK0G
	 /DpwihdugP99gQHFjret4YAxN7rqmXnRFsxBsALs9BOoE9iwXO9Jtyzh2yszBpiK8W9bV
	 MK0T9PV3etzvMPfNPvuZIHdssF78Kv9zqaf8B/F3EwmD1Z4XD3e80hSCdHGx3tYFWwaG9
	 QrQhjloNrzJjiIYZUN9qjq5d7Sa3SJx3/DKouPpVd5BGwrS3f9QWeMGqHJuc9pqtbEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
	b=N26IentW3rieYz6hY5BovSLTgoQjhNH3Ep0blqP1UqLm8bNPJ3InBd8eurOc1Z0kfWa+
	 Lw7qfLyUSsZpRxS0OymQZbUtrQIVHHnlfQTb6NT1OicBs+kElrvrRsEECVo3Nb/E6dc09
	 7aDizEZE5Yzbo9sheqNSrZLuNbk/EfyI+mlWItzvYl3CqMm8xjkwY4fXwkx+5dX0aHghp
	 PwYbGx4abKTmvjH1GJaeW+2JDrjp15qizex+o7taQXobIlovMRWDgnaFseaV0NyWtGPf6
	 n7mZ+Tv3mPKHKokNIoEH0cgkOcuTrfilpgCumqB8ysMt0sO0Bbh42FQptvVEc09swUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB;
	arc=none smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CBE606A681
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 18:37:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CBE606A681
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=IB9x4XiB
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c14f3dab0cso3478656e87.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 10:37:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631869; x=1796236669; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=IB9x4XiBn42WWx+a0IBFuOzPdoDFdOA9Q77g7vg5kei7js7nO/TgRpsHZWTHGqJDGh
         lqDcuMbNXTNwIpYOPoQT4UpO4L7/bfYHXWwh6CJadd1zKFSOPi2A1B7Jgf63XAun17UU
         d8yPhsGID7+V4GH7ujTExMUsBR/5DbEMAJUSG3ojSiPT4Lwv6tWBubT4BqG/nPqJrbiM
         uhLLg15uderoCOhiArWZKExx/On0zEzZiW/G+hEvORcpjMDWfI1GeKzcutweF9kwZjHy
         uyO1j8XKq/GE2cRDEEJe7kbr6YBH+3hotZH/RzHZ9BG212rd4H+/lZgfAJL9s/tMxC4G
         enzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631869; x=1796236669;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bsh30DvD4dl6hdEqW7rttLHSnbuBwkW1mxeTuDyZlIY=;
        b=25+Nyz1RSrUVapJmjIAptpuiZbdBeEJADAjZivKY1la+OjTD8MonY/a50VBTBSDbP3
         eg1TEhX4bR1vyGOyKFEoKYnUSftZCWbPYhQM5B1JBUJdn3uL+9Nuh//gnQ0I/Lhq028+
         wCtq27b+j+1XqQTanr1Gc5nbGoSfmJv97eFka0R3MiF8rU46FtwgTqv5VS52iHFI2A4h
         WvWMBQvBNUDlhPYgqW1PCJCsO15fP2JXLnlXh3CvgsA08GIak1WWQgXexq3S7KpDiabu
         SqukSpWDpSEQk20i8kNc90bPQHC+07twHKa1MSFPtAZ0DhD1jZgsYZloylowugVDpx7q
         uNEg==
X-Forwarded-Encrypted: i=1; AL+hErFx7JRcIIf8l99p+zL20EMHJLitkjsBrI59/vPcOoICLuxJY6wQOlNCZU6Vd3c/9I/K0kY7Zi+0f6C8@vger.kernel.org
X-Gm-Message-State: APuU4Z+k9tlMwMAz0I3cSW4YWTKOg4L8ceRV1dXex4wolJti7equdQqf
	yvNGvUI1cb8YWOAWrmPUur4WCAdqHqwb3NigR4g+FBNmq5DskQvpsjTE
X-Gm-Gg: AZFdTZc93D8lTes2rs8fmVv7y302w6PVLhRmMhdwd+tqDkIaqdRWT3yAqobXvoEhhDO
	kffpjM/2rK8YH8fWeon6lmY1KkFQu4NVaLBlJ1ebhRAXcNNUoTIgGY3UAdaOHmbxB6Munq7RNcb
	WcQ1hnKh1nmXRD2pBdqI1KqjPQhr5B2OJQe0fEX77a1oVaHo+uMeg0w5J0+QdqN3el/kMFrb8hb
	2KQA2SkgggFgacdERlomJsg/d9ugZ4VmN062vahqhMA/BwIFhg/3+8qrBt1nnina1gVPn3t6tgQ
	sHZvQYK6KwRihEniPE2pS3dW9WvjVD4IByoa+TCFm2zCmCNrt4wdE1US4bgUFMS9MqMYJNLesDU
	aW6CnCewAKav4MgPNwnrGatsyI38DhlMsdJp7C++Emt2P9I6XjO8zbVkt/+G9bjqxj2+leOUA1K
	Htn+D3DVRa2IFd6XACZKAUxfsOXuZcbDK5Dx9aQQX5kie1ied+hq7Qd/+zCzlR8em/7QsThfJbh
	68eadMc0FRZ5HuUhOnjgC4HC5waba60X6JEO9koO2eC76pLVdk1W8cCkbl0v5rKZH8jL0eYnaua
	f6DAAWVM+hhVGasrLgItmRNe8PdT4WjhrrX2/PwOWUuzt+AOgMsVbz1MB9M0n47u8v5LPw==
X-Received: by 2002:a05:6512:104d:b0:5c1:5a83:2fd7 with SMTP id 2adb3069b0e04-5c1bc907072mr5651830e87.66.1795631868971;
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:48 -0800 (PST)
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
Subject: [PATCH net-next v6 1/3] net: phy: dap8211r: fix kernel-doc comments for extended register helpers
Date: Wed, 25 Nov 2026 21:37:36 +0300
Message-ID: <20261125183742.3039752-2-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
References: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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

