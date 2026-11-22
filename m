Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795353545;
	b=GUL1s4jH9XH7lyskDv2IGEYayl6Sugq1gPx7NOHsjQnFDG/9hNEQcrVr9eGzZJXkiEes
	 9W/uK/q0DXooMQVg8auDVME8T8RypUXTbIM1PVE+ZT0WaniKraCJxAW82yG/h2hr6CJO8
	 KqYwo7u/4fitfD3eCgJ/LrXU6NZ75aKDV8rMxaN7/5wVFx2iLcIg6NXXyRBY4ZlSqe06s
	 9AqJjwHszfKcJYpdxvrzFUTvvwCJBTXjk05r3q0Ok1hX3ayJFwES/gMnUkvDBKwQgJhiK
	 vKpEhmGAJ+W82ePd/2ndVRofloQRUvwRp6ss44lCpjpgW6lcfR96fMa1qLRgVSlsnOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795353545;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
	b=XmUWyOkYxwLGmSuEMBdU0S+c7ephE0UcggrqtOSt2mSaBr3i7RPQzpce1t1BqmbFDmPe
	 WMAcBxkkTdKdq+MiKVPFS79oCim3sWW/NeQjt5YNysLe8y1d0U0PYFogr088UGuUleHUo
	 eS3xyMzsSjyJ7/VGxcNOyobfW46ZinX+1HP+36QU9GqplrHHlNrNuqOPgmYMsIvmyCVS5
	 hzFYzoazjaUsKiplugQElSHfT+amtBnOiW4cBM5aBW0XokEEv7//2hUpOsL+GGphniFGL
	 /CVqH1wA2yVdx0lmAOLA/dqfB+4lnFL6l+SGNHKf4urxAGd5m/sOGf0JjjG/CcmQ01Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL;
	arc=none smtp.remote-ip=209.85.208.172
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69DDA606A32C
	for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 13:19:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69DDA606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=hVFVMHWL
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3ae85add4ceso15060961fa.0
        for <linux-leds@vger.kernel.org>; Sun, 22 Nov 2026 05:19:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795353544; x=1795958344; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=hVFVMHWLqX2IuGxnGPcTUcFvQXc3u3gzVUOHyRT6+uRwgnf+jlUlLRwhgwWNp33WZJ
         6ysfD6E0T6yGrY2xD0yhKSsPmTXQC2Muctoz41l7NxF2uUeOpJe5JduAul5xDvZ8f9t3
         jLNSHhH7x4AxrdnD+wUIyl1KCVSpyNp5HFVlZkPLaB3iIAteX0h1EbEIlPaJqnAp1OUq
         IIYAIPEE8uNeO9L8PIY55hTwMA2XKue7pEUkATtjvuFwfYSn5w4kNtW5CzDjEBClop9M
         IIhsdBxB/wLodKoJN7c5Kh4o2QywpbnAKpVEknheasWeEgteqhnqe8V4UE4PlmaprHnd
         qJyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795353544; x=1795958344;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NbzpJOvL0/pm2cNjHVYeGmydMLBh9zqnLRhzaAcHE3s=;
        b=wMym49yDE8tvXjVfzK1cR7VZl/xp/sV3cgYv3phYcqa669b/ah8pxammMwgSAusH3Y
         fuDILLgr72MrNiQLvVR3B12u8cYVRCdAjkHV81JbVQWM1MJIPP125T03+YEb5MspBLQm
         pVjl9Hdsnq704oNDG+GikosE/3S5l/FEFUI1sFhW2z6CkpEWeoxdmrCZaCofY04fG1d9
         uK+TFv3aZ20hto9oW+Pih6pGbhTQCi3sGCD08ZZtAP0wCdXDcWFkww7zO+SLQSe6x2pT
         A+OaF0D5TidoinOB/SZHMO74+sWAMdthxybCR/CyEZSoY3wKEaNl24si6m7GZWK+DREU
         +1pw==
X-Forwarded-Encrypted: i=1; AL+hErHCLj/7MxX1yqhNj7A7KLv3kserH2+ysg8apvKZqL1Cgi5ahAgkFi9R5QEy9ubFmE2VzgcgfhVoBkju@vger.kernel.org
X-Gm-Message-State: APuU4Z+ppmSMxiQ9GAdGp/3nNyXg2Qte5jzxG9O/UBJIpIYe9l0baTHQ
	1fFYGurMsQPVnzWD5WxJVfL452UgkuNoM+h+XL5q6PHq0rD6CgqA0Br/
X-Gm-Gg: AZFdTZcZlBHtrXcWm1+bj1N+nlFR+fvWaEstg/MLfbpj4gvzM/XbEMzQJ6OpFIU4HFw
	J1xr+FRG/IOEHR464sZ2xOc6iM8ytUKsCLFoydCjV/EUwN3qgs6ElM55pkX+a+zWQE7fUmWiTGb
	Fd4kHplZe6FOkMiJeMS6qEU6Mh7TSVnkN0DvFnyuKWmyhI72Mj2uEf+1Y4/+ORCC+CvxqDIO07o
	u7IrsTb2k1zRer/4lTHP8Q/ffb3TnV9mIwNB5mozfLSTBjGh0X2tzq6Bb8E8NBLPoWIndxDj1/4
	Bf/m042DWO85L5cjOFuCdjW4abbJBBAWWsAIsQegeG7l1cIYKKG7aUXIkePoYQmU5jgKkz+lyoV
	wTEQiwa71mYxTYGeHxpdaQeXQjY19lFOglepISY5WiuJ6l2APogIg+KTNtWTWY5Ct/rHuCdOXdI
	hLbl08FXuRYjWDk0+KBgw10Uba4BcnVSqQwWriZGh+lWI+U5HzQ+lAdXH4FGLo6bUCw5v5K0fVt
	h9qY3HwbrjnF9JzIPiClRF8nG8MMptGV4EzJsSIdyyB3LF0J3dnEpgqm/eqEizWspmknrEmOiHX
	nEPMON/1Z9xuP4voUrlG1ICsP3zy4g==
X-Received: by 2002:a05:651c:19a3:b0:3ac:e5ef:1b8c with SMTP id 38308e7fff4ca-3ae7f9de88bmr24914911fa.11.1795353543336;
        Sun, 22 Nov 2026 05:19:03 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ae804ef17dsm26038141fa.12.2026.11.22.05.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 05:19:02 -0800 (PST)
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
Subject: [PATCH net-next v4 0/3] net: phy: dap8211r: add LED control support
Date: Sun, 22 Nov 2026 16:18:53 +0300
Message-ID: <20261122131900.2951586-1-a.shimko.dev@gmail.com>
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

This series adds support for LEDs on the DAP8211R
Gigabit Ethernet PHY.

The first patch fixes mistakes in function comments about locking mdio.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA and implements the three LED callbacks
required by the PHY library.

$ make dt_binding_check DT_SCHEMA_FILES=Documentation/devicetree/bindings/net/dptel,dap8211r.yaml 
  SCHEMA  Documentation/devicetree/bindings/processed-schema.json
  CHKDT   ./Documentation/devicetree/bindings
  LINT    ./Documentation/devicetree/bindings
  STYLE   ./Documentation/devicetree/bindings
  DTEX    Documentation/devicetree/bindings/net/dptel,dap8211r.example.dts
  DTC [C] Documentation/devicetree/bindings/net/dptel,dap8211r.example.dtb
$ yamllint Documentation/devicetree/bindings/net/dptel,dap8211r.yaml
$ grep -i "dap8211r" Documentation/devicetree/bindings/processed-schema.json
    "http://devicetree.org/schemas/net/dptel,dap8211r.yaml": {
        "$filename": "/home/a-shimko/patchwork/linux/Documentation/devicetree/bindings/net/dptel,dap8211r.yaml",
        "$id": "http://devicetree.org/schemas/net/dptel,dap8211r.yaml#",
        "title": "DAPU Telecom DAP8211R(I) Gigabit Ethernet PHY",

Required:
CONFIG_NEW_LEDS=y
    CONFIG_LEDS_CLASS=y
    CONFIG_LEDS_TRIGGERS=y
        CONFIG_LEDS_TRIGGER_NETDEV=y

Testing:
$ ip link set eth1 up
$ ls /sys/class/leds/
stmmac-1:01:amber:lan  stmmac-1:01:green:lan
$ echo netdev > /sys/class/leds/stmmac-1:01:green:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:green:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:green:lan/link_1000
$ cat /sys/class/leds/stmmac-1:01:green:lan/offloaded
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo eth1 > /sys/class/leds/stmmac-1:01:amber:lan/device_name
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ cat /sys/class/leds/stmmac-1:01:amber:lan/offloaded

$ echo none > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/brightness

$ echo netdev > /sys/class/leds/stmmac-1:01:amber:lan/trigger
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/tx
$ echo 1 > /sys/class/leds/stmmac-1:01:amber:lan/rx
$ ip addr add 192.168.5.100/24 dev eth1
$ ping -I eth1 192.168.5.1

--
Best regards,
artem

ChangeLog:
  v4:
    - squash extended register write helper into the LED control patch to
    fix netdev/build_32bit, netdev/build_allmodconfig_warn, netdev/build_clang
    fails (patchwork.kernel.org)
    - add andrew+netdev@lunn.ch to Cc of dt-bindings patch to fix
    netdev/cc_maintainers warning (patchwork.kernel.org)
  v3:
    - fix kernel-doc comment for DAP8211R_LED_FORCE_MODE_ON and
    DAP8211R_LED_FORCE_MODE_MASK
    - use FIELD_PREP() for DAP8211R_LED_FORCE_MODE_ON 
    - Link: https://lore.kernel.org/all/20261120081106.2919010-1-a.shimko.dev@gmail.com/T/#t
  v2:
    - add a commit fixing kernel-doc comments for dap8211r_read_ext() and dap8211r_modify_ext()
    - move LED child node down below tx-internal-delay-ps in dptel,dap8211r.yaml
    - add blank lines in dptel,dap8211r.yaml
    - restrict LED reg index to 0..2 and fix schema properties in dptel,dap8211r.yaml
    - fix kernel-doc comment for dap8211r_write_ext()
    - add LED brightness (force mode) support to driver
    - remove rules == 0 statement
    - add TRIGGER_NETDEV_LINK to DAP8211R_LED_SUPPORTED_TRG for dap8211r_led_hw_is_supported()
    - clean up switch (index) statements
    - Link: https://lore.kernel.org/all/CAOPX74709XiLXLoioDJStTSzzhstC2sHpM4GieAO=3-37E18pw@mail.gmail.com/T/#u
  v1:
    - Link: https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (3):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 242 +++++++++++++++++-
 2 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.43.0

