Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631869;
	b=p2kS+4cmJrsYICrk+Umou2MTCWGwuGSZjXlo8daL3wm3qWfM6R3D8Md8ivduJKKvMLwe
	 zTIffyE1Zpa1vjzlCpF3WBmRsiSDpfmKmQtYPl/VsXQVQ6wZS5Uw59V7MapepedzklU8C
	 GEbAPQnaoO93xhIk6JuO94MR3WM2W7PwfkxyXtmXTmJWMl6VFnLuK/2Fkel9Oc4lC1fKR
	 vvV16JQv4OXLLLt6VyFS1GfAokIZUvpP+SuLEDyEN6q3CRIDUMkbEixQb0B/rQ/sTISQX
	 lXTa7YuvAbF/aVwEBHAXk03ePICx4Ap2FDUxsRbJ09zHkDJHeQYe4k1u+nu9rVye/SA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631869;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
	b=p9KRyJ23LeEmrQswhOHI2OmHmT/zcvlGQ/X8Bt3QI3OyKsLQBKB+jAeRxGGaLP3iOVqx
	 UWbSa6+yWTvboISE6QozWFFv7qS+YSgZT286b77ImJObU47Jr8D8eksIpVLBenDuOYrf4
	 1uMRy90S7lzlQAbh8orXt4LX4r4+pq0q4PYvlme06BzEf3mvUN7P8iiDwBkfdDUiZCAqL
	 d6IKKeYfYkOrXrHLo5clc4o32z+nwbYTcOkSvgZxlLvlQ2e90BzhgXg4ITIzZE3/RNPwC
	 6Z+l1kZPFvdyWlucjE34PhS0wVcmjY7lln/aar/zaQ1Ej+Q6a3222W4UvriqSP/hIDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB5MIJGF;
	arc=none smtp.remote-ip=209.85.167.54
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91324606A323
	for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 18:37:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 91324606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PB5MIJGF
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5c1c0c8d61aso4116042e87.1
        for <linux-leds@vger.kernel.org>; Wed, 25 Nov 2026 10:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795631867; x=1796236667; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
        b=PB5MIJGFsSGsLnz/41wkgUtlP2knNJBhBc4t3c30++a/pzxcSozvH6zFtS0WbcTzx4
         miR6zzP9eKDqvOGNPLKqMKyhsXIyF7PtfEVS61tELJ9fWv7+oY4VZdoxOtYQsocOkzhC
         tCD6DhrsCOJf+c69+3iDF3O2awLsxADq9iwbqzk1p91A8GTqp20mI9zYjJMLAT27JQv/
         W9LJkUpvQ/mRfWRIlNkzfa/xWdFU6rbNk9m+xOzh6OuKLqXlJk/ibOEnOVmmpdhQYYMp
         ts6X2S/KulVHQhGtaBNcmudaglk9aHsSDxlVBSw8r2wJNH5ODXb6sFZ51+YDB7NiGAsi
         scCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631867; x=1796236667;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xksOV9aqopJGkGV2R/R/SK9xwhAwgR81ELO68UFIWf4=;
        b=Gi1jChxmr1tBZwUj5x7OfFR7wnlDMiDHT65Kd5TpG0Emk5xLVD0PSwBTcjbLOSe6GJ
         oThrxf869sMimWCRAULYyWvCDQcgEjNVkI6UOfQACRPRfdcSdYruMrO87FEke6cbCzw1
         BrohwKwj/Uqxj+0o+JX2pxe0aVJpi6M6A01Xn8lxC++LAsflRquDbo78uB1exROhxLiR
         ymPIZLWx09Fm/Ti65kNY24F560QwTGQqOZSvnXRO/0wy6DAwjc1C79LQn9pzBW7B6oFv
         di+8puHx9nNSRlTI90w1SgW1VhqO3xkcovrLttLJemDt3ZKWoENWKSsdEQJ7cDrY6OvL
         OHsA==
X-Forwarded-Encrypted: i=1; AL+hErG6ggwffyqKwJVTWLQywM9hfmgZ9zJ6VEe6ZK/JD47z2Z+K+AIcQmAWr87RX4HJ02vQw8honAYwAhTo@vger.kernel.org
X-Gm-Message-State: APuU4Z+acTywVZYeq81CeFFv0tIVPetO/a+jkcb7anGESyye8jcS5W5O
	s0ZFvlhe39EpDMxllXa7fEX9tp4twoU265W0iAOKpsoHLZ89nlAMSbrw
X-Gm-Gg: AZFdTZct+W/BVvdq+tuN9YVgYomtVoZHxdy7kzllm3hPdq/5CjB0qUppFVJB5NIXh0e
	A24M+R6xnX8ieU60yiBxaQ3GfzSEWm3Mx9DfjZKyQMUOfhT3x8X+r6LnXeaAopanpW2IoPeFeby
	bg2Z6g2PFuv1q9YUFF14HPvONH/mrQmCyZrfVYZEH9twiB/X96lfdKfD1KoSr1ifiJroVLQHYR4
	iYYvUWlwpr4HxQ+x1BdXfG7D9bk8OypifI6PeZl5v0o+pElVRPmbnJd2iuDVgsl8A8k4GCkRd5F
	UNLwBieLLWT5JNl/StQoL2xBqOuROw1py8ze5RmLrOqgKKtMPfZ9eDsu57XB/xpd8O/To8cT586
	Pvohimh2OqovPVCPRyG/ODNysbu6OpBiD3FuI4jmGgcIXdMlubSBSlb3oydAtuYvEbNRvlxmrcu
	3TplJEgBBp6jB/Kh++1YGnUIXUzGmD5xoRwhf+jTveVUaO8UpI8Szb0kWdW553Jv1UrNiaZFXHh
	9IF3q4P8SBwa/epRoTWIrJk6NEgq5U7vpc09dFvozfN01HXSIfn5Aj0dURrCk2jdpmCBEqx5Aru
	OWIgQPAivCLZM2x2oK1EKZ7E5RF43mZkUM5/8PSMRUfWOkU=
X-Received: by 2002:a05:6512:1393:b0:5c0:b5c:4044 with SMTP id 2adb3069b0e04-5c1bc690966mr5240993e87.1.1795631866318;
        Wed, 25 Nov 2026 10:37:46 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd05051bsm4650755e87.62.2026.11.25.10.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:37:46 -0800 (PST)
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
Subject: [PATCH net-next v6 0/3] net: phy: dap8211r: add LED control support
Date: Wed, 25 Nov 2026 21:37:35 +0300
Message-ID: <20261125183742.3039752-1-a.shimko.dev@gmail.com>
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
  v6:
    - Return -EOPNOTSUPP in dap8211r_led_hw_control_get() if DAP8211R_LED_ACT_BLINK
    does not match the presence of DAP8211R_LED_RX or DAP8211R_LED_TX,
    preventing incomplete rule reporting and register clobbering.
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
 drivers/net/phy/dap8211r.c                    | 265 +++++++++++++++++-
 2 files changed, 304 insertions(+), 2 deletions(-)

-- 
2.43.0

