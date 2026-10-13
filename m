Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08AE4B4864;
	Tue, 13 Oct 2026 09:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884667; cv=none; b=KwFXXa0Bjd25QeK3bqcto/ulQL4q6epqpdCgcWe+zlLl3S7RTuyXKSYyzBdG6gqzQ2AUsy4j8bUdR2oYhNNIfKlxH/IU1nn4D9WjGQBPutHSpJH8uSXdbJSPbZvApXHkS/eODeNTFmrME4O8T9vj8pMjCpyM47rD6s75+nYzXMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884667; c=relaxed/simple;
	bh=w2AdlNpBy+1TwF9d4CHcLsL5oZ/y5bqPPF21Ann5FNE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=gfMT5lCExyd/f0vxxCmZCTmoPtCyw00n9Ctt3lTLflA/F6KX+g5gwf8bkZ/OYQGO2xqiHA4m+fpYzLP+ZnVT/FA2MjcWqVqeLs9YkyP6BRIXRSDw/I+RdRCfgDDUhlee/q0biPH2iW35S0lVY6op1T1C2UXA2Jf4h46PjGV/h7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=AgL38F/d; arc=none smtp.client-ip=80.241.56.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="AgL38F/d"
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4j3qDN4XCyzMlHW;
	Tue, 13 Oct 2026 11:44:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791884660;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=+ek82YOwxY2ZyMmaquQUEhCsrfdE0Z/M/Xy2E8wUM9Q=;
	b=AgL38F/dmSM+by9AJXo/gj6A8Q1zJzIMyuqJ+4V6DP7phJK76ZejwFua1ujK3+tw5EpulG
	pfAmbnpiI33iGu1LSCHJWnPyVC2BzM58jx3Bk4CbwA6X6jkFW0hKortV1S7NoTd//KIMur
	KxSJeXw0EO3MfKPDjv6K6foKWG7b/kfSywlFK8dc7Wzt4IvtXk4YUWQmnvTbImf55blj1D
	DqNX5M5+4FFQzufQUgyFB5vWKD/+iE5WCsbLcvrKtGPowi7+954JFnYcQiCgPrQJKMhAaw
	9S1KBiG6szgAV6FmIngWJerJjVqgDAPrZMX45fbXoJCyB8SsvlfrBHCrr9LhOw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Subject: [PATCH v2 0/2] leds: Add support for the is31fl3206 LED driver
Date: Tue, 13 Oct 2026 06:43:40 -0300
Message-Id: <20261013-add-is31fl3206-support-v2-0-ca0d2bf5783f@amieiro.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WNyw6CMBBFf4V07Zg+pKAr/8OwqO0gY7QlbSEaw
 r8LGJcuT3LvORNLGAkTOxUTizhSouAXkLuC2c74GwK5hZnkUgsuJBjngJIS7UNJriENfR9iBle
 WVVtrZY6VYcu5j9jSaxNfmi+n4XpHm1fbuugo5RDfW3kU6+4XUf8iowAOvLZca2vlQbizeRJSD
 HuPmTXzPH8AZwkhONAAAAA=
X-Change-ID: 20261012-add-is31fl3206-support-d557f863a97a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Flavio Amieiro <flavio@amieiro.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2279; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=w2AdlNpBy+1TwF9d4CHcLsL5oZ/y5bqPPF21Ann5FNE=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFln/0akilnbRCmJOhkJFlk9Upi6WeaZyVJZpY8n/092f
 hRr8upvRykLgxgXg6yYIgtLGUuZd/vB5t3TVkvCzGFlAhnCwMUpABNpecTI0N4yqaiFUWfWn3fT
 o4Waa2/31Jmtf73Zh+sul8Spu2J3bzIyXGNzLTpRIFFQLc65vvHyX9Zjul/s9USn/vsqVWzNfHw
 nPwA=
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4j3qDN4XCyzMlHW

This patch series adds support for the is31fl3206 LED driver to the
already existing is31fl32xx driver.

The main difference between this specific variant and the others in
the series is that the LED Control Register controls not only the
enable status of the channel, but also the maximum output current for
it.

Because the layout of the register is very different from the previously
supported variants, this patch follows a similar pattern present in the
driver for paths that deviated from the norm: the chipdef can define a
pointer to an extra function that (if non-NULL) will be called during
probing. This was already done for reset_func and for sw_shutdown_func
in order to support other chips in the same family but here, if the
function is defined, the original initialization code will not run. This
is because, in the previously existing cases, the lack of a register
meant the generic code could be skipped, while here the registers exist,
but differ in function.

The patches keep the previous behavior of using only the PWM registers
to control the state of the LEDs. For that reason, the current output
is always set to the maximum value.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
Changes in v2:
- Avoid double initialization when enable_all_channels is non-NULL
- Add missing entry in the i2c_device_id table
- Link to v1: https://patch.msgid.link/20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net

To: Lee Jones <lee@kernel.org>
To: Pavel Machek <pavel@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Flavio Amieiro (2):
      leds: is31f132xx: Add support for is31fl3206
      dt-bindings: leds: Add issi,is31fl3206 to leds-is31fl32xx

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  1 +
 drivers/leds/leds-is31fl32xx.c                     | 95 ++++++++++++++++++----
 2 files changed, 80 insertions(+), 16 deletions(-)
---
base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
change-id: 20261012-add-is31fl3206-support-d557f863a97a

Best regards,
--  
Flavio Amieiro <flavio@amieiro.net>

