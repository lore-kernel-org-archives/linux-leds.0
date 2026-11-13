Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567956;
	b=FTl4Gz+idjUCM+FANp8aediPY30XT3cgjvGzFsJlnKwzWymdb7IYQX1Daty59DUTTrJ7
	 RSjqse7ij+hru/vq5eB65R7KHwstKihxwJ3s8z35wrerg2mnffM+iXuV57X0cVeVAk3gs
	 xobVBwIZrGgDGF2QR5KIhtBUDaGfFnM9n5bKDqM4xMlYXqqtQZIIhGtRGQ6dmFURChNOy
	 UGsd7cBjV+DpF4KeVzbHmJIYwv6p3+bSryxOKMd6kpcKyvK1RtWg8yPziY3B3e11fx3y+
	 ubRUZcVgxqwpRRToMP55TRVOzN1Q/LNW7HTTeQt3YiR2NBN+LnxiV1DqYnLXZ0OXDnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567956;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
	b=B4IMRLo2PxCS6dM06kwyc5hR5Hu648V+kca/dZ9i7gKqLxF3kCBxzFB795PuTRYlryMi
	 RwIN4ivIz0GiJljgrIgA9miaZSsKd9d3jTL7whHruWLBum765zqyE4WyoyWd5CvIAIosU
	 KT4P3nvgiqSv7W8Fusn2cM+OEJC14aoUtH1PgEbWRFGJcAsn63Qwg2B+JZdEhsNF8U7wE
	 spb1+Rrvf/6TBRSuRWmM1+FVfabfA1n/NUbGt+0YnLgKzLK8sqKD44E3XgeUPCaQeN+T/
	 yHMWqfWHKuBSUK9S5Hw07UN5NHk4EuCRYbLpt47oc6HwX3vC1/9MAWl0g+0VC5exR2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jo+ONOyC;
	arc=none smtp.remote-ip=209.85.167.50
Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C88360A2613
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 11:05:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C88360A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jo+ONOyC
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5bfa7c09c9eso996191e87.2
        for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 03:05:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567955; x=1795172755; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
        b=jo+ONOyCKDe8UX+n1zi00jnNg9W+sqeTQgmGfNxc8ZvZG9lJQrQIxOxdmEH69xpvFc
         qQD2rOGrv2xNeW2DkLhpbBF1D3SgefvWfrLN2fusVXfW3PT7wuHTpbkpbCOQiN1eMTjn
         IoO5c6VmKi/Lw17SHc58MGSL1JJdUWhL7Rn+Z2it220v4DkWlL/96LVdyZCIteof3BfI
         RzAvber7p1RZyS0cuD9zfNr74B0PrH7YWHfrbCfqOFv96Agu8z5yLQyBjXRX2VT++5+6
         mB3glPsueqCs7cQpeu2P1GVFDXTZpTbXXII2NF9gUCP7FwO23Xq4hf42x16FgN7Ke+tI
         Hs4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567955; x=1795172755;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OAMFRA4MILVUay22QJQKSMwjrT+qbjZ4D1oCAQSCI+c=;
        b=ZCk7RT39VGocc9v+98YXmMHztWaunDLAdcnzCLLv9gGq8b5XNqIawhyLs5Xm4jUOJ5
         Kkiem2iOO7kWhoKYaiH1zHQ/DN945Y4jWq2aHbniL46XqWnXiA5jB+S/U9ilr/4HSiIo
         ETCHR+5s2p4i9o7T+tDSYbBjg9P3jFC4VSmDYnndAoKNKiZOQyDx640ACZmbGXPBLS2q
         Uq7j42wGdDD18lCToYt8VU7ghQLU1rNXc6Nsgsh2dm7/Zwcd3uNjssjFpjifile1z/0l
         BcZo5S/3bmhKSqSVzMEAqe0gXdTK3dVukgcBUsqd4T2hYmMe+axrQg86VfhKl+98LR5i
         2BUA==
X-Forwarded-Encrypted: i=1; AL+hErGWaqx2PTTPcu4T2OU61/eZkNGh7q/wypzsgfe78+pRX/9XzHYRrVcti87JybDk/dXcTCoHsGwYdiQd@vger.kernel.org
X-Gm-Message-State: APuU4Z9YmOOvBE0qTdvbxmVRsjHuUTEZ9Dyk1ON5fNU+rjxTj4Lk2cN7
	ZawZBU54fYjzbUrMnACbVzOaheZsKq3dYD2XgIRw9EHcXssbfcCxVIWU
X-Gm-Gg: AYBFou32Jpj5nR0ngLbG0kYvvszFfLlVmoYKO49hN5NtRI9WVcrXdMMMTzvcKbjKRGs
	4/Hpg6j/jyQRiR1FAY8OMa2zgIjUcZiHfpoSSeJ8xHqD3kh+TrPv0mmVaLyVwo29Ws7cYRv4sD0
	FPtL7PkefmFAUqY1P74ajUer0XzCsiExBqVovWLMIdLmpOqDy4X/8EaYc7F6+P569VTbJdcdplJ
	uXYqqHGLPu6L/gokZX/ILsYuVeHepYgmaZ0rjh487w8bvdzKuFUX+ZNYv/91224lZ6DFa+UD6he
	z6IkNa+LZCccBb1gD9KS4VZwfzCraUMogPDju+fFbHzf7uaDxIGfv1exkVhmRekANlhmxRSlT5z
	mUm4jJ9Nv5k70wt/7t8614pHBbYoRaUeuyQnHX2d+KDdZqDfUJHel+hw3v8+uAnRmUnDSXZbADm
	d7DsNfCMiE+aNWBuQDWWPG/K0gVGEMGU9DM6SWV8RmVUuFDbTsB8zz1FJzbA9ymU7xo7ZzZ7X6u
	IZiOno+f5MhtyOqInX7AidkrF8PkVAHq3TjE4wwhTYzgjVyfyOXJBhFiAiRycpecoJ6gASuxK1M
	klaGFHUhTV7dcDw22Kwdsqe5fRKYRGoLks+9f6Hpm0mR+ho=
X-Received: by 2002:a05:6512:31c3:b0:5c1:4f6f:564c with SMTP id 2adb3069b0e04-5c1709c5b64mr825566e87.39.1794567954595;
        Fri, 13 Nov 2026 03:05:54 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:54 -0800 (PST)
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
	pavel@ucw.cz,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-leds@vger.kernel.org
Cc: Artem Shimko <a.shimko.dev@gmail.com>,
	netdev@vger.kernel.org
Subject: [PATCH net-next 2/3] net: phy: dap8211r: add extended register write helper
Date: Fri, 13 Nov 2026 14:05:44 +0300
Message-ID: <20261113110546.173624-3-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261113110546.173624-1-a.shimko.dev@gmail.com>
References: <20261113110546.173624-1-a.shimko.dev@gmail.com>
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
access registers of the phy.

This will be used to write extended registers of the dap8211r.

No functional change.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
---
 drivers/net/phy/dap8211r.c | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/drivers/net/phy/dap8211r.c b/drivers/net/phy/dap8211r.c
index 0bf770f8ebbb..4eb50c26397f 100644
--- a/drivers/net/phy/dap8211r.c
+++ b/drivers/net/phy/dap8211r.c
@@ -88,6 +88,32 @@ static int dap8211r_read_ext(struct phy_device *phydev, u16 reg)
 	return ret;
 }
 
+/**
+ * dap8211r_write_ext() - Write extended register
+ * @phydev: PHY device structure
+ * @reg: Extended register address
+ * @data: Data to write
+ *
+ * Writes a PHY extended register using the indirect access method.
+ * The caller must hold the MDIO bus lock.
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

