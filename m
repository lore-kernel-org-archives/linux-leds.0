Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223129;
	b=SEpYGsvH1giSlCLN2vdNIocP9ILL+ft/8u2AT/mHVvj9IxrVfwjhDGSk0nKnecjNYzv9
	 YlyDRFAj1JDPOwjK76yDJZ8DwN9DoDtBUAAO7AdEqg0TFNKMXXxWvU/9hx0Yd+T5W0RSb
	 qOtWe/++KJXjBmw4G4zFUrm3lDLCLNsmHEt8u9ndh2CyNq14suo3BZE25TaM/sG7XloGr
	 5VjE240xJ1ynqzZP68KQH20V/wBgubp2CDi+kHU/kk4s7mS1/fgm8kLhafTsQp3+dQjdS
	 7dJ9VcpI2qKglS5U9Ng1DBYBgG6uaZ+Rjd4RQ5n56tRfoHiAPD3cagNeDnLvvkpp+zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223129;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=29LyQxk7QfI967PaMQaBEjAkv6FF+It48n/6M4uIjfA=;
	b=TWmnR//vDkZquBuYMH4bj7nehfLzCN81fbsaarVoVHGKBrUYQyK2JSTst2bFluoYGmZK
	 sgc96BGk62YnwLPec83YV3qQkSzFPEbkPP5XfXom4YYP8qsQ9oBqMKvq+MMoiR7VHm3YM
	 oGJxhkklwaDnpX7B2YWTXvudSjcknO2ArABJC9cptOsXhmUCyOgVH285iiYLzUtluOq1o
	 /7W27bSScsaq8ltD8ZR/OaT2pwWTNsFy37mmO0JOGLu4IqeoyG1Q0LoUJQDLrEp89v0HD
	 V32RHkEpzk/V0x0d2Iw3e+ju7+Igg2+/ss/UBUJuVYReJg240DiTayU9D6/2wKRrdjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=SadAVY8c;
	arc=none smtp.remote-ip=80.241.56.172
Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196B4606A31D;
	Wed, 28 Oct 2026 21:32:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 196B4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=SadAVY8c
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4jFLCy0mctzMlkr;
	Wed, 28 Oct 2026 22:31:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1793223118;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=29LyQxk7QfI967PaMQaBEjAkv6FF+It48n/6M4uIjfA=;
	b=SadAVY8c/YQYYi991/Ti6forBNFuFNtq+jUQzzFc7w0BagQISDddMd+fJzgRAav8TkmjzH
	3r/EvZvLbM8IGO3mdBf6lXllflq19Qr9PGmThowVgzEXcPBi1CH0NfcTUlO8h3RRziKgM6
	Hh2JV8LHjZpyoc9HLxwyjXXBJ2H+e8pqeyk83vrtKM72XTvf05MGWrOso/gDR3bol4PXQX
	YR3kqFE5l8UX2X3mPRE39k8Yo5YmZrGwEQa6N6X++PgpM0qNbSTuL/SLsJtDFw2w0MFoqP
	9eR5RFBtkYv23hmkl2ocmQaYUO80Q+t1E8mq2NjVtaxEbcNTP0wN5eTnq6BOfg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Subject: [PATCH v4 0/2] leds: Add support for the is31fl3206 LED driver
Date: Wed, 28 Oct 2026 18:31:00 -0300
Message-Id: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NTQ6CMBCG4auYrq1pp1DQlfcwLkp/ZIxS0gLRE
 O5uwbjRmLD8kpnnHUm0AW0kh81Igh0wom/SyLYbomvVXCxFkzYBBpIzDlQZQzEK7m4CmKSxb1s
 fOmryvHClFGpfKJKe22AdPhb4dH7v2FdXq7tZmy9qjJ0Pz6U88PnuExH/IgOnjLJSMym1hoybo
 7qjxeB3je3InBlgHQQJ0ooZqFxelML9QmIdJBIkpSokKKE5fEHTNL0Asl6QoGIBAAA=
X-Change-ID: 20261012-add-is31fl3206-support-d557f863a97a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Flavio Amieiro <flavio@amieiro.net>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2388; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=OO1YFmI+MRuQUZp6oC4XaIg5Wu43v85bGykH0oXWE3E=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFmPMo+t6VJxVVt6945U5PawyYdW72jbUfX53pL/syOvv
 nbTUpjH1lHKwiDGxSArpsjCUsZS5t1+sHn3tNWSMHNYmUCGMHBxCsBECkwZGXaIT6qbaPI2J/zt
 5dc+f1cme+/tOJM7j3NFY0rfZ+Hbjq2MDDctbllP/v/uYmZrhXZ51pc/M1x+6UjdSvmWIuHw9Yl
 eIwsA
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jFLCy0mctzMlkr

This patch series adds support for the is31fl3206 LED driver to the
already existing is31fl32xx driver.

The main difference between this specific variant and the others in
the series is that the LED Control Register controls not only the
enable status of the channel, but also the maximum output current for
it.

This patch allows the chipdef to define at which offset the LED enable
bits are inside the LED Control Register, so when calculating the
value to write to the register we can offset it to the correct
position in the register for ICs like the IS31FL3206.

The patches keep the behavior of the drivers for the other ICs in the
family: initializing the LEDs by enabling all of them and setting
output current to maximum and then using only the PWM registers to
control the brightness of the LEDs.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
Changes in v4:
- Changes approach from pointers to functions (used in v3) to
  describing the LED control register layout.
- Link to v3: https://patch.msgid.link/20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net

Changes in v3:
- Reorganizes the commits so the dt-bindings are documented before using
  them
- Link to v2: https://patch.msgid.link/20261013-add-is31fl3206-support-v2-0-ca0d2bf5783f@amieiro.net

Changes in v2:
- Avoid double initialization when enable_all_channels is non-NULL
- Add missing entry in the i2c_device_id table
- Link to v1: https://patch.msgid.link/20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Griffin Kroah-Hartman <griffin@kroah.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Flavio Amieiro (2):
      dt-bindings: leds: Add issi,is31fl3206 to leds-is31fl32xx
      leds: is31f132xx: Add support for is31fl3206

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  1 +
 drivers/leds/leds-is31fl32xx.c                     | 25 ++++++++++++++++++++++
 2 files changed, 26 insertions(+)
---
base-commit: 59cf91cf87abb67a49b1bb7b9d3b06486abde8cf
change-id: 20261012-add-is31fl3206-support-d557f863a97a

Best regards,
--  
Flavio Amieiro <flavio@amieiro.net>

