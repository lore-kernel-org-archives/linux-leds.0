Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162277;
	b=Uu6ITSpzhbL2mNaINJeD/3pM2+5TytYuvvbqimPFUqQ9jmQjvXR4PGPrnPDHnOHOjfD3
	 tJhCSnJb9BMn1s0NGPcV+LPoxOBgX+Mu9f7mzzgQHfKSBEc2qWt5nbwD/TWBjunweAsJs
	 6xCEi8vSjLurnmCKnJx3M2HoBzWZ4KcVws7CoAkQMsiDV0Ysr1utS72bQ4NmJV1rEQdAS
	 daYsbgomfcVO2aUrsI9QQ0ZhGtdz8vI8D5+33gLk1MgeiPmty/YSDRQ44aT9PJRkuM/CT
	 4cKdyTU1Q/TmJ2pbskPR0EXTcb6GOAu2l2oCZPHcsNHDtSJ7fQCbdij+NfpPOEdLzTA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162277;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
	b=qSapKU/CpxcA8DdQfuagdNnbRUB3ZT4OSEV8fLdprRePDHXxnT/eNuOkW1iHhFyXdKSK
	 LaZSM1SIdv8Yqn1upxxbyQHkdPHbPmeVNFyw1vFiNcej8Kv/V8eOkf2+04SGIGz3ySTpk
	 V2r60rRb/5ydTTQk4CFthnJkLVeHT5djCcz8NPpMLYwfnujLshLZv+aaWzvGDyH8WQEF8
	 6703O6+DWg8a3Gi9lEagNnfbpw5Y4sUPuO4vNG3RBo2LST9dLfO+1zm9q4slA7K55Gt19
	 7eeFtbIbl8keYJfvNnjsE2q1pCo/eKAO5R7j6uYQkENF0YQ4xHFP3M+voJqSXVLlpiw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 351C560A2625
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:11:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 351C560A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=QlGQhOdb
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bfa65c8617so354906e87.0
        for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:11:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162275; x=1795767075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=QlGQhOdbE9NngEZTKzmX/WF1nHcSSb4OcwlQqHAtJIG9zxODsZO2QxDPtdr7iNgg/5
         +8ia7e6qh2p/ytD6nJf8fLUo+VM8LrevnzLN9NtX5Q+wn0tJhdzlozNcicBA6rNM5L9t
         16L1WWAN1Ot62Yc/7Yq1OzRx1Z47FOBaJEtf4we/quHuXyE4zOO1hX2qio8xM9WiuQUG
         oWwgJ/dUxqtloojIbri7GhnUkn1DkImLQ31ed4oep8DhBMY3kznEYn7T3l4bbunkOPET
         b0Yd7bXN2lVP1/9eE4iYNReoLbiy82IZJzIswPPJHQ+4M5tq0RSQlrBCjAgAWAziCJpI
         x6yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162275; x=1795767075;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=j38+nebZAxvGAf6Q1k2ptEhLWyWcl8T9jNyKUnfQvJk=;
        b=R9I5l7MeK/Glia+BHs6fqu20qcITyVpeOSTNcYwHoBAtk7gOLncIvxM5ZNEIlHHMHW
         VIAptQ7kGHIpHAMXx6HYO0U4CF85gXXm4zYGIxbQg36alrQSal/fekdrwo8WRYMw9X8v
         VMPZMMwozGfHJo21BQ+GDiNra6+8beDGaQxAkDZ4DcSBjLAgtLCyI0sZkXaPglIAoQUi
         r1QpRFKkMvJue+3Hv0iBMf6bF77zA33tik12y7oi8GQP+LSdrAA+N/lp2P45cdY031xu
         aB3Ov4J4DXjKyu80h8GIc2ZT6nGLy5mKnpYYKcAtk5mDojn9VMbtjJ4Q4orDQeLokiVs
         7E5g==
X-Forwarded-Encrypted: i=1; AL+hErEgicPDW3v38+KxTl607sM+a4bkr7w9pLd6ygM9imhFEl2BqFMzKPmXXkXfEfjhFljsfLUbA5e50sg2@vger.kernel.org
X-Gm-Message-State: APuU4Z+WMYfJ1cl7WavgzQQK6X9cj+b9ppBv1gdZGlaR43d1C49bMtC/
	iHaCEOdKYc6Ok4CELSNjKs5RcvOamQ7fq+vJIvwxlTjop8QzAU32l3og
X-Gm-Gg: AZFdTZephwEvzXXV3LIS5osqM3eXHqZ4U3cSDrdSMtB7NayAoLpxxSCTt0EEAKe7sx8
	i7TYJ06Y6O8BlSJ+nonnw3qfzYdUNEEUw75eZbjUvkvKPuebMqjoYDJaePt5/sKUWSXeu7OdECe
	neWARMqnqOx2cDu36vOy4k+IAudXg8DTAFwlf16VX1YA6d10a2KaCmXyg6Lyro9RlWqml3y+bYu
	LpmGF54sU8RVtZL/tCXDgQYfzazjWm61Wlrjg/rVbgmaqOze5laB1DRn8OVw08WflPh98yH5IZl
	qTss6bDGOYu55mKkfGXMEMAKtbOp2/GN27UdUOOQ86SvWLbnT7RhEF9EsuAlS1I52g/Bi+7/D0A
	2w7GFqWcUN0P6tqxU9clORBKsoZdZ0AHjq4ONJ9xQmxLq/o0NoQJeXuy9saPfvEL/iDwTlLp8fX
	Rv71KOW94tsXcIs2QXq10p7hmt/g7U3jjGnfFRrtLEdsfsgBiKXEK8nWBTQM9i/Er4NfAXufLZ4
	Q+tXdkpJxtjrASO0Qg7p4p7mWMv9Ev3iX3RNsRLXEyMlh7QgU13qj1VceGvsrzdtT7dfJFcxwmx
	QLs1LIgnJsYu4tyvFs6X+36muJUPF6Fqzxfsjukf6kmkXLs=
X-Received: by 2002:a05:6512:3503:b0:5c1:4a42:fb07 with SMTP id 2adb3069b0e04-5c1bc84b95fmr690376e87.64.1795162275265;
        Fri, 20 Nov 2026 00:11:15 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:14 -0800 (PST)
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
Subject: [PATCH net-next v3 3/4] net: phy: dap8211r: add extended register write helper
Date: Fri, 20 Nov 2026 11:11:01 +0300
Message-ID: <20261120081106.2919010-4-a.shimko.dev@gmail.com>
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

Add dap8211r_write_ext() to write extended registers via the indirect
access registers of the PHY.

This will be used to write extended registers of the DAP8211R.

Signed-off-by: Artem Shimko <a.shimko.dev@gmail.com>
Reviewed-by: Andrew Lunn <andrew@lunn.ch>
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

