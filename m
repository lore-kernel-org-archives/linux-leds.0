Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701585;
	b=E2OdmgCbrW2WU6jlz+UCmC4ZcwvLKy+W+JjSXHsvR92+M0NPfGntfzBUAjz9GZKpsBkP
	 Fro8+pJ1oe7L3NjlyvAqoj/pZ89czuhWiZCkg/fIE/b9vEjSFYtA/Btjz+TVGsoQqpoS+
	 FqStbI2CBtuX/hEAxhkgiMqwbvEMh9mJkF5ajWpiCV9Z0Gl+sJAoPMOn9R8eY5JfOrGX5
	 Vuqw7jxAxSMyS3V2CeS0A/upPSNc7HNJl1rJCMpQelIadprnkmkpnRBh7XrfjfnOhJPyT
	 WDXp6uYiz+1G55rNcBqf2LXOCUujfBKtADuMBa8jjXnVUPmr6RXHZo0Ji/ucvL1QJHQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701585;
	h=DMARC-Filter:Received:DKIM-Signature:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=zfyroGzkNGL4W30JLb+5vyu/PrDiYb5tYKlfqHvbl2E=;
	b=0I/RKEbpulI31/5a4SVpkUfMMp1yn/JFps3q7/e84D1qTwY3Khw8qsYYs8CO8O3l9bWR
	 c1i51XSJPbR/YR2GeMybIcOiThqYg/WnY1wiHQ21q/PuJELQIBSsjN6oNI1fhD/1kGhFD
	 5maHFyvA0OkxA28U5Z5ua0iFXbUoYfbCcXn3YQI+e24eLw/YlWsiGfmqVyAzWJbmracR8
	 ZslYAPJU1IqZ/l/NZvPOXCgmaOevqPmGuqf1lJxHYiCn3KdbUotK4hc11jBVLU2Uy68kQ
	 H9+SxVoCXUedIYd2onKXFCdEnb8/6eMklestdjrbEI30Xvs5ElcvuJpJ0K5gTjL4/ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=UwW5TSuX;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E22DE606A330;
	Sun, 15 Nov 2026 00:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E22DE606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=UwW5TSuX
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jRrzq00Y2zMlqj;
	Sun, 15 Nov 2026 01:12:55 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1794701575;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zfyroGzkNGL4W30JLb+5vyu/PrDiYb5tYKlfqHvbl2E=;
	b=UwW5TSuXIYrIW0epGUdFWUOpiHYxGkq6ImsXY04lCECk/zEmP+6dbQhUv6YWQygarSmiid
	AiWMVL0ixvteZ4TATGl422tlfN7ndcPlDyExzntmCimkk4cA5SahhDQoyL3NzXzgExO3c7
	Pg1L+BNIeLM1KVaeTHOklWWvr46AT3QkQ4A3AraapDaGw5OdnhkjHzERDG2v3k0naznyud
	SHLpLpiTFQtoGDRPcOxIdr/izLs1hUfPoRBq0iAQGZN1Rf9KrRaKk/RqKxkHiwPV/OnJaU
	2IEVHqJYGbg4TERp/B3CqAViaHTf8YCF4XJUemaCM+whxCbryqxDQLks3ebjMQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Subject: [PATCH v5 0/2] leds: Add support for the is31fl3206 LED driver
Date: Sat, 14 Nov 2026 21:12:19 -0300
Message-Id: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/43NwWrDMAzG8VcpPs/FlhIn7anvUXZwZHnV2JJgp
 2Gj5N3ntAw2tkKPH0i//0VlTsJZ7TcXlXiWLENfRv20UXTy/QtrCWUrMOCssaB9CFoy2viGYJz
 O53Ec0qRDXTexdeh3jVfleUwc5eMKH59vO5+7V6Zp1daLk+RpSJ/X8mzXu+8I3ovMVhttWjLOE
 UFlw8G/C0satj1Pas3M8BgEBSJvAnSxblqMfyF8DMICOecbBx7Jwj9Q9QOC9i5UFYgRLTHvInX
 4G1qW5Qvax769qwEAAA==
X-Change-ID: 20261012-add-is31fl3206-support-d557f863a97a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Flavio Amieiro <flavio@amieiro.net>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2692; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=GaSDExbClgmHiJCppCphbXgKmOXG5JSGmiBs0bbKiD4=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFk/fvxT2aVd+fkj672W2PgJiQlbgm4Lr9z1Pt9oF5OBZ
 LSOnSN3RykLgxgXg6yYIgtLGUuZd/vB5t3TVkvCzGFlAhnCwMUpABPx12D4X8X6XO3pn60b2y8W
 qnbY7v9nfWR/s83f/U9+zIjt2V0T+puR4ZVex/OCdOk/kvfL5jfMSnjFsLrkQIfI91fvljPM+xa
 9jhkA
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jRrzq00Y2zMlqj

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
Changes in v5:
- Fix spelling in the documentation for the new attribute
- Rebase onto newest for-leds-next
- Use assignment operator for left shift
- Remove unecessary line wrap
- Link to v4: https://patch.msgid.link/20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net

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
 drivers/leds/leds-is31fl32xx.c                     | 30 ++++++++++++++++++++--
 2 files changed, 29 insertions(+), 2 deletions(-)
---
base-commit: 4e88404a72e5e26720539e5555c383069cefb486
change-id: 20261012-add-is31fl3206-support-d557f863a97a

Best regards,
--  
Flavio Amieiro <flavio@amieiro.net>

