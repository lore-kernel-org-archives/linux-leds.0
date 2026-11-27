Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795761433;
	b=x5MjDHzcDyYO7YA4Lm3bTz/PseCsOx47NGYPscZnoqwQBpoIWL5AbQMoBhJtYy131M4v
	 bbxw7x2vql2t2bYkyGbCNRuOGPRXNfavNEYJImQYnXvP1iUelD2KKaseyY73y/aoIGSQb
	 17+jcL53/gnP2E0hA3QijXhJbzM4jq8cxTKsWak9w2I/KeaEvQbdSOsKx9v15zJseKW7R
	 qAzqS5Pr96lic3ZjRWyQp0fiCUDc63VWdX2HGCMy+ry2iDAfIzNMSkbcNmgOMYbFrwu3m
	 wRhLuo9qZBigeozUPJy61ohIUk96Dw1DIBeNlGIcIX/p3l7tpUQXLpg3RUxEMHMcthA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761433;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=1SnlirmZdWpy8m97rVq8q4D7ao2YFooYL/YRCVvC1OE=;
	b=XEGDkTQVqnj478D/YJg+xEt129c5RY9bAIh9yWhyPOuE3v96E/YHAHXQoFwpZFdrFfJJ
	 mIqHxu8vW6BhKuQuceIA6PfMC/O+xT7amlrdLnkhGd2yFrIof77xxZtfDUGHlUjcZOd3n
	 +TzFEVUWo8ZXD9wPtfVFgcr/Op4T8kC2j2FXAkSxnW5Dnfuidx9HZtONy9Toifu23WGi2
	 QkwXnW3f78fDHiGx1hXQF/eEyIXAM7185KTF82rs6vq50bV9QwOGUa8fSpnZw3Lp/3xxQ
	 khgztHx8RTG42Ptz2ANURsDVbL6sY0WepMGaIimPw2W6pxqwy5lqn2fTvNOOaDbFFzw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoaSDGvG;
	arc=none smtp.remote-ip=209.85.167.51
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com [209.85.167.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04C1606A323
	for <linux-leds@vger.kernel.org>; Fri, 27 Nov 2026 06:37:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A04C1606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xoaSDGvG
Received: by mail-lf1-f51.google.com with SMTP id 2adb3069b0e04-5bcdae234ecso2603269e87.3
        for <linux-leds@vger.kernel.org>; Thu, 26 Nov 2026 22:37:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795761431; x=1796366231; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1SnlirmZdWpy8m97rVq8q4D7ao2YFooYL/YRCVvC1OE=;
        b=xoaSDGvGqXCDqg5ZBljB93k5S98112kC/0LcjC6NxoD4BK12F2WWjDmWHNjLyTbDmz
         DS+au+RiTIeiCrtE43m35ZEWD5gKDwss/1IiA1OhITOIAU4WbfrSSx7kfFFq5hwe5634
         w0neZwy4RC8jUAio8z4QoOjNrTdFXaSbm/VEX65skcJtyU8uyJGLwub4srPDuTS0fxYE
         JtWUPZnitwgRDMG3YXxbKT2G9F1y6lNRi+98Zee+KClbdgCGChdS3/yhGA+iSPtnjMwF
         B/HhblIKwfF7dq1m0gpyUSaLRSa6hVaUvEcbkn4KsmBsmYXzUW6ECKtCssAI7AaMsMaf
         fZVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795761431; x=1796366231;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1SnlirmZdWpy8m97rVq8q4D7ao2YFooYL/YRCVvC1OE=;
        b=vLQ6BluTDYdYVFm7SiKoTDB6+R7qci+T77vGOqHtGhX9R5piDAWkaXh2GbcTpBa/lq
         HH17TOrr0E5mdWYIHGff47jaVuprhshW0yVVPWllp29ZUej+QBwoybgrHHlNahGCIPHF
         owEnwCAUIAKpE2jawdOjF8RvpeXyAkMmvW2XU3v/FTgHUgccqiSePFSqJ2AVs1xGVN9S
         0xENM7jbpcRYw5DVMHM4F24+IuETTkSl9iTju+eqVIQvim/zIQDY5kJVT5m2lA7BUBbj
         GyMLXisIh4aWPSHZ94q83g49bZUpPTAkzkP5Hx1iYOoKDou1gkVEgB+seShOPyr8vvtv
         /FCg==
X-Forwarded-Encrypted: i=1; AL+hErHdbC/i7N3cA7h9KKZqgJRf3pgbyS91b5CqhJkt0H8gfk+AlnA7M09ug0qP1ze643MjgL+fnqAEnh3L@vger.kernel.org
X-Gm-Message-State: APuU4Z/qoV6UtpHB2sseYYpdkQo7fGYSfRWARq+HgSOPscbj/96nLxSh
	qO4JXPAM/U38Hd6BznH1+Lor2zI50Gp2FQdn6n/y5AJcD9j4pcidjNSa
X-Gm-Gg: AZFdTZdg6y38gZwN+sELt+Z8dE4Lx6/Z1tkfhFeXeBuLjIpjF3Wm31f8G4Ttz1N//1B
	MbOITZ8mVOFHHEY2eWxoTTh5Nazxx3sfkMAx+EU53hfRRFeRWYhSuiOMVWeOEZW08+cOI2czMNh
	jgIUb3fTbw0iceP6ZSIMGIjtlrghiVj84+BYBz52KzVhex2n6ZZtsfw/W7cR5omJ5blOd4d2QB4
	qwscjnSkszNyUmRttWlp8duj5jV7y7aiuJ+L6IMcTzQA/slOn6VySnVyGcCa6UPs9jjuOKqOnmy
	hIruZY3HQ4GaN1R/kyG2R82HEuBmvxwCOlFhn8dkjLMj4WrjKFrRs+DzaTWK/Ek5V5cp09hlbJ8
	GqzihrosWOjbYSAwPbXepa11qCgRuuDMv/cFjaJL28CiTKPDTkjUjmz7L8oK3ZoEDPutsOvdfYA
	DALnCq8XEHRm0w5iqWEJi6i88tLzWPyIf6dDIXeVFOQVQm3Gkc3hCjs/+Wbxkze2UWWGvTrB3/E
	3dhlaJXHxI/dJY8aqAUPqeMMI+T8dOve5d7JQYJxLGyUwjvKMrYPKXVckcBYXYPIhaX0d3CfmMu
	UtObsiOXAwk8s+VtwU0UAClWXF/iLA==
X-Received: by 2002:a05:6512:1081:b0:5c1:44ea:cfa6 with SMTP id 2adb3069b0e04-5c1bc7bcc56mr7286636e87.18.1795761430529;
        Thu, 26 Nov 2026 22:37:10 -0800 (PST)
Received: from NB-6746.. ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd01772esm5618994e87.39.2026.11.26.22.37.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 22:37:10 -0800 (PST)
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
Subject: [PATCH net-next v7 0/3] net: phy: dap8211r: add LED control support
Date: Fri, 27 Nov 2026 09:37:02 +0300
Message-ID: <20261127063708.3074433-1-a.shimko.dev@gmail.com>
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
  v7:
    - Add clear LED_x_CON in the dap8211r_led_brightness_set() function so
    that stale settings do not interfere with clearing the FORCE_EN bit in
    hw_control_set() when switching back to the netdev trigger.
  v6:
    - Return -EOPNOTSUPP in dap8211r_led_hw_control_get() if DAP8211R_LED_ACT_BLINK
    does not match the presence of DAP8211R_LED_RX or DAP8211R_LED_TX,
    preventing incomplete rule reporting and register clobbering.
    - Link: https://lore.kernel.org/all/CAOPX747OUSNbg2vqba3LL8r0chrTdpz6hOg1yf-n_wMX+fpQag@mail.gmail.com/T/#u
  v5:
    - Drop redundant $ref to common.yaml and inner unevaluatedProperties: false
    from the led@[0-2] subnode, as they are already inherited from
    ethernet-phy.yaml.
    - Move write of LED_x_CON first and clear FORCE_EN afterwards in
    dap8211r_led_hw_control_set().
    - Report TRIGGER_NETDEV_LINK instead of individual speed flags in
    dap8211r_led_hw_control_get() when all three link speed bits are set, as
    netdev trigger rejects reporting them together. Based on [1].
    - Add checking of DAP8211R_LED_ACT_BLINK alongside TX/RX bits in
    dap8211r_led_hw_control_get().
    - Add -EOPNOTSUPP in dap8211r_led_hw_control_get() if unsupported
    hardware bits are set in LED_x_CON.
    - Link: [1] https://lists.infradead.org/pipermail/linux-arm-kernel/2026-September/1172246.html
    - Link: https://lore.kernel.org/all/179560033613.3135.13122318439070700886@kernel.org/T/#u
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

 .../bindings/net/dptel,dap8211r.yaml          |  41 +++
 drivers/net/phy/dap8211r.c                    | 272 +++++++++++++++++-
 2 files changed, 311 insertions(+), 2 deletions(-)

-- 
2.43.0

