Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794915880;
	b=tIjWbC3+KF6hR19cwoDmbqbH5/x5iLfXgm/QLebK1z65PWHTmkuiRYzsNpGPZFHm7/le
	 xtWBZAWDdlNccjaRoYI1RErNSS8cCApbKi7kDS5JwZh7SfEQ+pBH+4DIjexP6fqPBYjIV
	 qROqIfF/QBr/l4dYmsy1XYYtzgQBPfy8Mbqop/Rdv4PLbClSDB8JyxhEIsJeQU8mQ9gCu
	 frw5rMaDoMjz7COF3fdHDjR09+d0dTqRHjA5w9P0b782MBPo42+SOS9zOThJlAFsuACkP
	 7w70KHj9ZRZn7ThJ8XVwCxqzZYh5B8SBX2Q1D9923UKukOOAJdaA7r/BlTcNcmg6cxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794915880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
	b=SNiz5fTax8a3Th7CvhensGUUK6LEgV2ScX4nhCDmAR4r0PW1h5/p54abi/JkmVKHBMub
	 Zy5z8bCHKRKdm1L9q9fcvJiV1dVADORSxZgbLbJhIL7UmlpfCTFrSd1q2ryidbKvTxv7d
	 mj2DQbHecPw3biIqol/SCh3fJCNqHssN/FN0xGrKbrKbI3abhvJ0NZCpqXARMa5tVTxRC
	 tx15mkZGOTIP4DWXSLs1ZnGO5gZj/n/icJwUpivoigU2R9QCJ1Tqxmc46yIl2Io5SVWlU
	 dg3lNVRQ6w73swmC8efazIM//QtUBWWYw74wvL5dRcekvk2aE1ftaClsR5ea2ADxEsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5;
	arc=none smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB6D606A329
	for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 11:44:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FB6D606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Bb9NC1x5
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ae25c9f857so48233121fa.1
        for <linux-leds@vger.kernel.org>; Tue, 17 Nov 2026 03:44:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794915878; x=1795520678; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=Bb9NC1x5OLMj6GYojtlvhpg2bGM9QkVVZ/Nuze7fFvnPSyiL3TFFk2hjQ5LFSo5/oS
         AnE+Y2WaF5Sg2oRLyvYJldA7T1yXNiUO70MnKqvfH9EXdNc1QGOKS0nRLWyihPRCBmB+
         hHBuPTBFHDRVRVywd9qEV8hRwZPZKWPctrsmSgAxE2nIA6aODanvekNhMQIbqhlV6oBI
         8U3LzEZePp10oSkctiV/9ScXs2dMTD7t6Zj6S3UOcHWbe7R8qOOmrCG8KMM7qCOZt6qm
         lhZBvxEg4WRGMbBij0PyRjtLXnQk3X58KtvjIT4fMLMdyP7EB6dbcqw3BDBVP1zEVeMn
         B2Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794915878; x=1795520678;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=F3FrqstYoZ58clg3fjTCq4uduDDEeqEHJoKcIe9/fkQ=;
        b=OVt55Q8AAGRKXdbcMAIAOgpBh8t3FDU4mkhBKs4FSYv8MA5hbo+bqZsPN0QjELSRL6
         /oVueLbF5+Ff08c3qkABCq88a33V7rwNm02bMotbLlJWuKmAgyClOrWGvyTqeN34Mc0w
         xlI/iLL+jh3HT94eTT+TmNPIVq9OxsNenNCpuPMr9cnaVe1XDpBjT/a0XX/cu2wAkr1r
         sLta0dQwmU4atKGEH4gpCFeqduA7IAWKAX8xdO8Wvq9DnyEsDyAyp/n/+2oONg4FeC25
         iN3637s5kK96+qYsMpGLvtntwMo0rm8I5ZF9+R83XgU2svpH0DRY+BgzTdOroxvOdWOp
         C6wQ==
X-Forwarded-Encrypted: i=1; AL+hErF3zUsf0/RTVd9qxD8oYd3yKwuHYwdMt4nj1TIbxDask9QJCciI9Kka/2SZXhJsXBDyiUbiRVstkvoK@vger.kernel.org
X-Gm-Message-State: APuU4Z9y3kBS9VNW92+NjpyfmDHmRzc8AFiATYZePHif3sHJuEyBnzao
	nR55x9tjEJdE5eZ/MC+Bhkc4/mzTGvd7NsYXptxm9xZ74am95O6MWe2D
X-Gm-Gg: AYBFou0Igrrwbih7OZJUhBhwv3J3uFB11jyyzg8Y7s7hSIRTc8IYbEXcgXCD2WNDpii
	gq0Gqw6cScHRzpiiACwWZRNs8GW69FwYs/KOYrVrQ2gN5/rpKjmx/3oEEF4wvM2pR07TnY697Jf
	kikyEMmItHzsKzBt3dSaAfJLyCs/WbJotGKr8Wq8n98gPQn/Y4SAp6+7ig/V/RbBgvE8PjKi7j8
	XY92EoKMNp5xyxF4yTnqMFJEf87t12R1KvYZlexaV5rY7qlFCADYnfsbjpacV+AT/MAOXNFh5tE
	K51LZcLKXEy3mAXcCmIpfNHk+j3lPS92XVWjXMbZisB1oK6dte0RHmlF93N+trsUVBVop521T4M
	1hgeXF6YCKHkhMEewOWosePjmTWrI8kjgZpEhShwEcXNQo+8J02T9FDkjS5bTCuE/GeQSJzLHSg
	E0RIQDWfgm/CTU7efbLjrOYHLHY3RkH6+aKNTvwLv9xO3yGBfnVw/WX0wg5T80CXeGcifMeOYUS
	GvG2zWhY7GTJH6fb2Fgr9sQ9GRYS59vc9luG+YccepNQBmI0aiy9ZmRoPM0t11uNaYodoAiNMUd
	4aKcncjM9HrmjYo3Y2AmJ6ahtGS9XEVVY/Mee0+05yDuKsE=
X-Received: by 2002:a2e:a105:0:b0:3ae:68:d07b with SMTP id 38308e7fff4ca-3ae2b5399b8mr37245611fa.11.1794915877954;
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
Received: from NB-6746.corp.yadro.com ([188.243.183.76])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c19f9bff4asm695635e87.56.2026.11.17.03.44.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 03:44:37 -0800 (PST)
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
Subject: [PATCH net-next v2 0/4] net: phy: dap8211r: add LED control support
Date: Tue, 17 Nov 2026 14:44:26 +0300
Message-ID: <20261117114432.2794961-1-a.shimko.dev@gmail.com>
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

The first patch fixes mistakes in kernel-doc comments regarding MDIO
locking.
The second patch documents the optional "leds" node in the Device Tree
binding. 
The third patch introduces a small helper to write extended
registers, since the LED registers are accessed indirectly via
EXT_ADD/EXT_DATA. 
The fourth patch implements the LED callbacks
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
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

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
$ ip addr add PEER_IP_ADDR dev eth1
$ ping -I eth1 ELP_ID_ADDR

--
Best regards,
artem shimko

ChangeLog:
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
  v1:
    - https://lore.kernel.org/all/20261113110546.173624-1-a.shimko.dev@gmail.com/T/#t

Artem Shimko (4):
  net: phy: dap8211r: fix kernel-doc comments for extended register
    helpers
  dt-bindings: net: dptel,dap8211r: add LED nodes
  net: phy: dap8211r: add extended register write helper
  net: phy: dap8211r: add PHY LED control support

 .../bindings/net/dptel,dap8211r.yaml          |  50 ++++
 drivers/net/phy/dap8211r.c                    | 243 +++++++++++++++++-
 2 files changed, 291 insertions(+), 2 deletions(-)

-- 
2.43.0

