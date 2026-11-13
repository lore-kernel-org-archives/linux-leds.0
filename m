Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794567953;
	b=tqTTRbImOjQ0/hhNKF2gyp/7B/bWRpcbM29LQzsGp1Ov+9h9i/bF+/nSofgvJvAz99Wt
	 WQdsEvgQTix6TDMWPHMDwpbVumhe8Eza0TA7BaOeLK4p29kYScuMV53iihbMCAgm+Lf+T
	 0xxDt8auQnbEEbxgt5gBkUkOMQTXRx4B/gs/03f+vcVvm6pnzgxynjp3HhICLp2qpLJum
	 JjK/hLs/taptbjr2u4997G3H2QNq178ez2wIMaQHlqF74sDS5FkWWcfrNhE0lUQmVxHmt
	 cOBSWNoFqP7MO01lL3Ah8ScaXVHs59cnM9q7Pz3lFizxlmOdOeQWv++02osRg/UMXFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794567953;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
	b=RUxoaDkUYWK9BFvaNCcsLw9pgLnudECJCj9KKavl4oj0mWWkIsOe83PJhuArh4jJ5wL8
	 qBQOU7n34gRLPZ17EmLO2An1Dx0i5X8/m+xN0U/VBU1pEaK/4IyyhXggbP5uEV1JFXmRs
	 jstD7kEFe1/s2uzJ5ZFr0aCjBmXjT6V7rnT5xodDuqJFXU2KsyMBjN3IM6lQ8AhZtJDpG
	 uS6+TKDLZ6IN9n6bhM2kr5SFYZRjKg6jKkUiRZfy95i9kQTROJ1jCDChLDQNq52VyrOpH
	 xKAkVQfZQ+iptHPJ9MTY8C4SX7c9w2pDCHYjkfto2gJ3tNJ7w0U+pZohFBELehL6NAw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTrJM5N5;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD37C606A327
	for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 11:05:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD37C606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=pTrJM5N5
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5be53e5fce1so1154072e87.1
        for <linux-leds@vger.kernel.org>; Fri, 13 Nov 2026 03:05:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794567951; x=1795172751; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
        b=pTrJM5N56JwLitY8jMA6aeAQED3ILcDksDAzVeMg7z+Pb40AzV+vriwY9m1oXzTIDg
         HNnq0dE5w0sV94AlLlGZeS5rvx7HDP/f0LVqvKamh98XrWMprTEwjX+FNwspkbByavRc
         VHNqX30dBy8VBpRBqCNrRrhomiwHGXmk21ItMlOhyqFAvs6h6JA3oGaCb2NUWj++a27I
         0JMty6SVln9aWctIzGZK0N2Iwlt0dx4U1x9y9pR6oI8+unczMJ6TLxZ+KsIdTTFwDElH
         j9Q/OYNf3v4Ga04FaKONKLv0jy8CY9tYUsp+hst2Eldnf370JJRGKTolOANfYza5osym
         UBtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794567951; x=1795172751;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sIczx4EcJP0tNqiNCagmfdESXjTqKCY2sjQfBlgdqoY=;
        b=24NkL761AWyuytu11cg4IlGI8PpLyH5xSTtUDbEeuzV4VxRWLOwPfFFRBsC9BijWdm
         MLKR9INvAPZOjzRq8LLGy0u6QPNsk0yg/eTwyVCgbG5LEayQuGuXZ6ucuxNeczQArZss
         gQIKzNlhtQ/Roh+4+9tZmxLjCguvdcANyUZkZi3UwlW3C2LF0lsRT6iJueJHok0AUfta
         0sZW7xPEWQS97bkZtuGdeAXjUQu/uE2xqGHG/0v2Ldz1OSUOPm8+4iarBOmgT7fXz1OJ
         ncfnw8M1IG+NmolGOwjxesSpg7ZFPc7YUpq4KylSgXOWxjNQgjCkyaAnqSwzxUQ4n+hP
         ZFqQ==
X-Forwarded-Encrypted: i=1; AL+hErHYa23OF2dPtoA1RsaYsUel2OCoAKxdBf3l3OnJGcp+2Mj4Xi3F7SoywFccNubFGAEAbM2ykTCDmfI7@vger.kernel.org
X-Gm-Message-State: APuU4Z84jJgNx9RWuh1TF2GsjuIsfZBBTKcXZN3Xq2IXEEOcFcNXxw6J
	mtIH+f9/JjdM/eH5IGZCaENqxbZ7j7ScEVvV2BxA99xvKd7bbayzTEKq
X-Gm-Gg: AYBFou2AmdhG72YSV2aCkPmyBmS7kvk2zkSFEiYHnzaO607LbcHc01cie4bC2hqUpNO
	elA+0trBoQp4aZxToWer/XQOyBQFvAG6JR4L9azwAEgiYgePERAeAJLMHkcAGQ9VJTgQ9t8FeVO
	6gw1AkAAVng3OHizjIBoMDUi+IjMABZiMbTZ/36awI2d7d+GGFXBmQpCrCkmZNgxzLyIrrSInb3
	tild4Z45avoT66UrKwGv1RQMGK6HQnZox1oBLo02iFauWjWWe6pAylKFIvhRTbENLKkP6IZH2i5
	8dtbb4tIpQpCp1cXbSdZFNvstIdPDf5/XVCJ0BS3AI8Kvms4OQLvNMo31ML1gfD0Ur/8aB3DRbC
	2qXQZr0RmaacByOEo7txWW37s078/Wo7MfiAxmj91mHmh+mbwjOsM8odTXvB5+zli8HWypBDf+J
	OwhDIeXDWWuHsjfCzNbveHSEoGOuC5gEVh2Sj9Opqkz1SmRhX3kcziZoKb7WczytWckYmdddj+0
	aZU+VqsfjWDu6aPsNa18vOAVARPm1gqiJ522ArFugSE0ALOLQAOSTcTkd4Q43skcjgFyuJM31I0
	fhFdOt463iKzoX2kTvAMyYgvkJibanjYewCZZToUZK6w9Rs=
X-Received: by 2002:a05:6512:15a8:b0:5c0:ca1:46c3 with SMTP id 2adb3069b0e04-5c170b1c76fmr842803e87.22.1794567950691;
        Fri, 13 Nov 2026 03:05:50 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c17133371asm610997e87.21.2026.11.13.03.05.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 03:05:49 -0800 (PST)
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
Subject: [PATCH net-next 0/3] net: phy: dap8211r: add LED hardware control
Date: Fri, 13 Nov 2026 14:05:42 +0300
Message-ID: <20261113110546.173624-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
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

Hello,

This series adds support for hardware-controlled LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch documents the optional "leds" node in the Device Tree
binding. The second patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. The third patch implements the three LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded

$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

--
Best regards,
artem shimko

Artem Shimko (3):
  dt-bindings: net: dptel,dap8211r: add led nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add led hardware control support

 .../bindings/net/dptel,dap8211r.yaml          |  38 ++++
 drivers/net/phy/dap8211r.c                    | 207 ++++++++++++++++++
 2 files changed, 245 insertions(+)

-- 
2.43.0

