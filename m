Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915886;
	b=DmWBKhaQiAyJ+28MH0eL59HD6a0tEJn1HDD0FLMsrmCCLcyxoQqel6x+276bQ4FLEUtX
	 uwFDDxunaSnwqSn7Wnco+SUyyZX8A9aN7fCfOKzstn5RfMrWDX9uKb7RILpGMEdJ0PaJE
	 +uSXzg8a/ozPH0juQnrOmI2Gn3cPqEEUNEj6R1bcUT0Qlov3NAOyFxDutoQ7svpF5oriB
	 wucDUM9QzMeHoS1AClDD6d5WElAEpIrWAAWUKZ3cyfYol6HeORDqa9SZk7fRMtjSDnCfe
	 /OZ+C3HFK5x4mCIezXpkwH8q0Q/Z1pb7T25KT4068XIe16+YYWMWcb1ySZ0t5qpeQeg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915886;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
	b=glf6A2nxbcwkwBtqpqMnakJ0LYOJJnLi+P3j04jNAz/O/weomAYkfoe00SvrlwK9Kf5b
	 313CC5tk38wBhDXD+oVD7vM/tGbGgXeH/msxR/CKJa4Ex2am65Z9QA2ALwwoLoUXpFAhZ
	 Gohiym9bBp+0Ifqp/u9fsIir+WT21dClf2Rl8q2unrvW62mPQM80uLGhun6KfzO50IDf3
	 n8Hix6lVZKEmei24v/E0+asQKgt4hRvvijjD9Q0hT3voWcJ1SwCbqZb6Ue4/URSF8Dgvo
	 9DSUPf9TCDDHfyQ0Vz146lmP3nZ5zY2ysPSgQOL0dZ/Tc5lz1aLAtQy5VKKk/hXCYmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW;
	arc=none smtp.remote-ip=209.85.208.174
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAB91606A89D
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:44:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAB91606A89D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=f7erzHrW
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3ab4354db11so46352551fa.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 03:44:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915884; x=1795520684; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=f7erzHrWDUVlSzQxnWriHFURIiNqowkSJORhhpLcTPt+vtcUeeOIpBgejK4l/YsU0J
         V4lzAkcmDs15Az5xGiXxSV1ceLSnjv1cN917v0Pmiczd1lOVrSNKun7URJ7Pk/f3jm0G
         cpnlKqlANYS3CqQJWmwjM2SRfwj8pc+KWvWifnd7HJLE3oKjETRb2EH5NQcEl5Ne8czV
         73p0nBib/73qaZ5dGTcVm2RLGrYqZG6iRoX//PwN9YJV43QF2uL6N/yA+Dz4QZRiUF4i
         nBQcKtGZ4e8vIJsS7MoT8ABh4KFz3CN6dP1hH3qVCcWyRx13d8LK6lFbYUDkME/+sBxd
         p5DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915884; x=1795520684;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RAzw2DoK3zpM8h/lV6B3tn+4/i58kkiuXf0DocFyWgY=;
        b=GDE9FDiyJzDRYuDAtBrJ03LjsEIBCfV3IDRmRQA/DUXngfFcy9QlT+lv8r1plwHQpk
         yhtDMCuU47C5BbLqDDDJIg610LTU9lc4Sbr9VsLVBtFmuO2IQBWDnyivETCwF68c8KCW
         1hI54Rb7BI2lDEnA8T0B4nMh3AA8PveJOoUJFx3LYAntIoW102GwAxfAyFXD9+v5N5Ws
         gD/anexkOmFbpLtQ1nHvVFGoJ+NOIM6S7CACLU8V2WcMqMdNcthQwRqkVc0wpRR9++xi
         DCcVOYMGg2DelOd3edMuk0senSZldtt2zEv9sp6Q3Spwv7GpPCNMP0EtjdOw9FLXHxR3
         rMXw==
X-Forwarded-Encrypted: i=1; AL+hErFs+d7U8KNxc47yj2ZGL+Wi8FAshGOa3Y+8IyjwObSUDfR+PZ7g0s9nHGJIRXhSgSA4fWbXZlyyJn/r@vger.kernel.org
X-Gm-Message-State: APuU4Z8NT//pdOBM5mse6RPrn9zGpX0CMXhd8deG6Si7qIQgDH2YJDRE
	W9QrlFdBJRSU7+SDf80Jcs4fSKPYPZqzIqq/PMOdNPkVeZduI3Wc4ijc
X-Gm-Gg: AYBFou0X2qtIzIBIA7RIRoneJsrlvynVOQu9XRlNWphkRT7gnZWhLUms0P+McF7cxno
	2uXyAYCDaAPG5Kn7DfhqO/lF1npmaQ9r4zIEMbU87UjObCi1bjSjcp879670uXylZQtymce8Wgz
	J0IZKkLNs/yJt+JmKCs4aPx5WVCOS2e8DAqNWHtbF97eQ9ASqZq8LFGK75w4sWiVpolAJbd4LvE
	Pe5OTaK74LOtQetKHgABez6RjyGiTMSyBiy+nSaKR+XWdqHlC3fcq2enhGz0ZK/oQU2D08bWwRS
	BisrQetcYtUFZXUFVaCWyxIeR6NPfOVTolZ1Ho6S2HVdeOlMsvNTK8KZUAzZAjny+xhwx5AJK1X
	pil5QzngFaI4bJB5xv2qwLGtXEZ8TDQIiVp3ldZ//C9RBsW9URgmEvFprHQvlk/Me1j+qm0ar8C
	fJYNVp2Wt9mjYql3kOE7WxWYVM7L/SgsIn9e33mHJ0An/Nz6jMx/568PyZjdzEjAkotVP2lDCnl
	uC1S7MHz7r8QMcFcTY3dKcVHj0GSpNs5/DVvrQvNaj8OG4zT5Wos3aJ2YRvZSXt5k3/i31xnjrN
	t/JyQPbLMezHWq11SLbVocbcjnOyzPR8jwAQ4qgkrqwtIG8=
X-Received: by 2002:a05:651c:2204:b0:3ad:f29c:e89f with SMTP id 38308e7fff4ca-3ae2b4e80e9mr39665131fa.17.1794915883850;
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:43 -0800 (PST)
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
Subject: [PATCH net-next v2 3/4] net: phy: dap8211r: add extended register write helper
Date: Tue, 17 Nov 2026 14:44:29 +0300
Message-ID: <20261117114432.2794961-4-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
References: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

Add dap8211r_write_ext() to write extended registers via the indirect
access registers of the PHY.

This will be used to write extended registers of the DAP8211R.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 1fe20efd394d..f626b43fdee1 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -87,6 +87,31 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ *
+ * Return: 0 on success, or negative error code
+ */
+static int dap8211r_write_ext(struct phy_device *phydev, u16 reg, u16 data)
+{
+	int ret;
+
+	phy_lock_mdio_bus(phydev);
+	ret = __phy_write(phydev, DAP8211R_EXT_ADD, reg);
+	if (ret < 0)
+		goto out;
+
+	ret = __phy_write(phydev, DAP8211R_EXT_DATA, data);
+out:
+	phy_unlock_mdio_bus(phydev);
+	return ret;
+}
+
 /**
  * dap8211r_modify_ext() - Modify extended register bits
  * @phydev: PHY device structure
-- 
2.43.0

