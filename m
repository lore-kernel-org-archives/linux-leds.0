Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795162272;
	b=wDPL6flIaO+SRn1m4+oRs4kEREs1pi5j54Y0Jmkpvsps4mDTYD8ZH3aFiRnFEOjGrzsg
	 gtWvck0wPpuS41KwgFTLRO1co0jrP8aSh3olMwAb8/2LbaUQLzgsnUluWyr7SqRfWnf7C
	 oIHA4oZigyfipV8isicp/o92EqbJTwsHWlOIxF+PKR+GjJZXb9ErqGDb/08j2woLSnJuR
	 cmOV+n4icwIiCSJ7Nf1dQtZTCpfVtOCHPCxPUzOIzbGxLNeUKRr0XzoXjOefFFA86fu3z
	 2+VcPmEkGIwZP9aTZaZVdnKOX8ZaN+q3jFB44NexPjEbfns4sr9NSPqaH8gUFX0AvjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795162272;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KesKeUvHiMdS1LmxeerRsnDhtdf500zX8ZdToOP0rAE=;
	b=tkGXtBMIUBbwoWwXGtyZYyn9gUAA6rmN2jaATmgZSH9qTgZdi2B/vcRVMFGyvjISstpl
	 +staFwgVQRnb1SLZefdBPaY3ybWHz0o6TVII7yQNPIQ6Rzu2jP0Q/7yDfvuURo+l1Mm98
	 cU81WhmhFMantueuR+N/+gCqzhm2lkxRGg0F841ChFc4GpO2tinQOAHCdijvAp6eYvvh1
	 ArpWE2zx+CQDhpXMc/7V8Im3V+G0a5k4EtuRoWnHqj8LrZY3owykVmvBBxQCMAwaH6DUC
	 sD0mjIfI7MRXZyuCCm0tfjtgfW67MdS6XLC68T217hT/infERr4Go9if8UsczZOSwWg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JPuSwB2N;
	arc=none smtp.remote-ip=209.85.167.44
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABDC1606A32A
	for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 08:11:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABDC1606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JPuSwB2N
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5c158c4c15fso613774e87.1
        for <linux-leds@vger.kernel.org>; Fri, 20 Nov 2026 00:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795162270; x=1795767070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KesKeUvHiMdS1LmxeerRsnDhtdf500zX8ZdToOP0rAE=;
        b=JPuSwB2Nih7gGboyvYZGHEFVyAAT5jR0tAzI1/z6nXBTiepqdhbG0OMaGaisVK5Eii
         9H14U2OncF7/V49Iy41oGgRN5M37pZB2xRV+DSLvb6bmVryWdyEtm3Dz2U7f1LllFoD9
         /SuGzgxYeSLTQ6msRDYzWBaG9p/iJ5RIizUFRTovJlZMehV0omqGULs1viP2clmYiLZJ
         /OzWgwIyFBilROvRKpdDfx7rZhbhbcBt9p+MhwBwur/clab8cVKN7WmpqUgOIlDaE9tD
         kZpftuO04kEw64nuT3eUl4f4HMMaSVQZdOFblvCtyB3SBuvClKcCHAQoQRxE3ZbsyErx
         LBAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795162270; x=1795767070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KesKeUvHiMdS1LmxeerRsnDhtdf500zX8ZdToOP0rAE=;
        b=qGZrKGCh48MNulGcRYIdVORQrOaybEjxyELC18Fh67Rq4EDSwLR4MI6TpLl84ZGkXw
         fTGrQY/CirH61pmpaL62UyP1dNntJMHi6cFJT5o31gTiCdsUrEPXvc8jiKvQ6vdfyx8c
         0Xh1+GUjjY079S/u2jilp4kJB6RY0kNtY5wMn7yvD8vPWSYkL1GpzHRCnlkp5S1xX3Dk
         w65aR2PUTrSgSEE90wmTl7P5AJ2L7H0YUZistpWOHavWCXimoXkmtq2ivLCsNeSJDTih
         HA/5Ao5vqb2hPTUhdZgMrXs0/2lGjxrJmOv9jJCpjkLUSB9q5VukLD/LtQslglRj9Upg
         rP/A==
X-Forwarded-Encrypted: i=1; AL+hErHYiQcnpdlaxFqqHQ0OnNDK6kvQYpm4p4yaVEABGUPXHORRk9VFI9zdtELYhMwBzwmPFZIkx6okrYRj@vger.kernel.org
X-Gm-Message-State: APuU4Z9hgmGIk/uf2Oh6dANSlFUmfNiy5CJeDw8O0yRa6BwnyDwP2TYO
	U/6Kg1qrPIL9QTdfI/eCX0s6rJxFGt0z/CC9MjWG9lbT+Xy32nvyW3tZENdSbg==
X-Gm-Gg: AZFdTZdHrjYaPVLPgsLRK+gG+HCuhMdFEADJe56s81fVK6rTu7IKd1ACMtOs4aI0hc0
	mcEMRPzHLuEdsowLxBcE5CjahHJL1EvAnl5IPa3UAGxHC8C/Vk3+lDLnSsQ3kbF7ZTfkMOLU9vC
	e/64VPvtjNlBZgBHd/2bEzwl2yghMhlbL2eKPLebyHq2pOZIAHwe3fMId9riGE5jIFut4WWv3rF
	jhgF7IoNxGrMXR0nDvfNP9uRBWQiql0Fsi6yti49jgt3my8XGAstYD3PBjQLXFLirYsckg1v7fj
	CPfA3egneHOlBfXsvTSfgDKADM7NH4maKJWhfqq2Ht+jaJSV9Y9qqerQqj/BnNg/WtAMnwQR7DE
	q05O1fzncGxp3JKzQyalrXhY9/mx+knyXmCbKO3iDE9uho9zDq8BXSZDmOR0vvFgMMCRHjHtdsZ
	kB+OgKdRgC2xfc7gSSMuuoczW8NxZzR9pIEoyNY6+oJxcG71azPESiaP3Mg8UalFXMwQmbibcaA
	SU9AB67eAh4LRGBTqGLKJDLeefjGX0v/uAirw7dbiElEXqdfDMKlr9qfksBdnUH56+atrviT4gJ
	2i38+rF+iniJ3koxLHILLHf3dTcYOMgcjoC4RfEebAbe5+A=
X-Received: by 2002:a05:6512:3c86:b0:5bf:a34f:14ce with SMTP id 2adb3069b0e04-5c1b7bcb80cmr1048858e87.11.1795162269671;
        Fri, 20 Nov 2026 00:11:09 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c1bd018b3asm395463e87.32.2026.11.20.00.11.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 00:11:09 -0800 (PST)
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
Subject: [PATCH net-next v3 0/4] net: phy: dap8211r: add LED control support
Date: Fri, 20 Nov 2026 11:10:58 +0300
Message-ID: <20261120081106.2919010-1-a.shimko.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <y>
References: <y>
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

The first patch fixes mistaces in functions comment about locking mdio.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. 
The forth patch implements the three LED callbacks
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
artem shimko

ChangeLog:
  v3:
    - fix kernel-doc comment for DAP8211R_LED_FORCE_MODE_ON and
      DAP8211R_LED_FORCE_MODE_MASK
    - use FIELD_PREP() for DAP8211R_LED_FORCE_MODE_ON
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

Artem Shimko (4):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 242 +++++++++++++++++-
 2 files changed, 290 insertions(+), 2 deletions(-)

-- 
2.43.0

