Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128C243BDDF;
	Tue, 13 Oct 2026 03:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791862442; cv=none; b=KyWjH5o+aia4iN2RCXVdNAhYKqFApI/XbVu7NgAHpo9imgtV1IvJ81FZunWjCLJLB/gf8N9OEQpBfIfERqHSJbpT6EOjnDOW2woWCnznwa6F3mejlArCVEZ13ORSnaQzx5EVhZBtLhbEBbaO2n+aTu15IqqLy3Z10rAL8SSAnbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791862442; c=relaxed/simple;
	bh=ZWmvi75A8cRSXcq0gb36sZx/g8Wce62zkJ2ecnlSg58=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JnAX9tumX3hnQrbWQYLP6RUbaBtlb7sk9vFwxTvbPN6ZnU+x07vrn+Fb2/Fbu+ykcrLzudKf8vfkTOGWYZSXAzHFpgTIcwHl0eIc/DfZ66Smk9YXZx04LupgMkm1Z8f9xhN+0cRXWhmreptpf83qw2V3NwCMwNrSpZhHJfWnju4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=fl7ms5W3; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="fl7ms5W3"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j3g0s2lLJzMlh2;
	Tue, 13 Oct 2026 05:33:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791862429;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=adG69Ja7OsWsel0AKizfQSv5CcAToVcXhzPW/2o1mq4=;
	b=fl7ms5W3bbGuJBWH8SdYSfF7QKVpg19XxtPa8rK6ka1yxnnjX7kN+GF/9rVKa3XO9jrGNf
	T6jGC1ZF0BMIJp7nHsvdyG1C23TAY4CY3VrK4sL2COWxGRshakPyoWTFDLF7OcTyp0wf3s
	WyL6jvpKIrmHWBzAZpRb2n5toOsn48ty6ZskKzHQZjIxYuugFoEARRK/VtozoXBXn/M8QU
	rEJ/qjOrxwjsVLZIvRznm1wCzmi0XmAFSzVxBOaUybMSA+5yWY3kGGYKq97nIa2vwp4dvo
	ekTnfSFx2zOlveQp746VuW0U94RMbPIxWSjOrd/D+pHCXw8cXL4Kj/kO6PFIBA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Subject: [PATCH 0/2] leds: Add support for the is31fl3206 LED driver
Date: Tue, 13 Oct 2026 00:33:13 -0300
Message-Id: <20261013-add-is31fl3206-support-v1-0-08c066cc241d@amieiro.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQqDMBBA4avIrDuQH4xtr1JcRDOxU4qGjIog3
 t20Lr/FezsIZSaBZ7VDppWFp7FA3yro334cCDkUg1HGaaUN+hCQxer4tUY5lCWlKc8Y6rqJd2f
 9o/FQ4pQp8vYfv9rLsnQf6uffDY7jBBfkyFl6AAAA
X-Change-ID: 20261012-add-is31fl3206-support-d557f863a97a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Flavio Amieiro <flavio@amieiro.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1595; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=ZWmvi75A8cRSXcq0gb36sZx/g8Wce62zkJ2ecnlSg58=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFlnl03+W5EZ/cAnMGzq/vzemQa7JjlbLeTZafZkJ8vsP
 dMWChxy7ihlYRDjYpAVU2RhKWMp824/2Lx72mpJmDmsTCBDGLg4BWAi3syMDG3r/7ydPfVv9tUH
 TC1zD35z6dTknbyxwTz95fxXRmfnbL/OyLDfXlfsoMb37NdVW34vCVz5dE/d4RuO7Obub+xrJXq
 cnZkA
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4j3g0s2lLJzMlh2

This patch series adds support for the is31fl3206 LED driver to the
already existing is31fl32xx driver.

The main difference between this specific variant and the others in
the series is that the LED Control Register controls not only the
enable status of the channel, but also the maximum output current for
it.

Because the layout of the register is very different from the
previously supported variants, this patch follows the same pattern
present in the driver for paths that deviated from the norm: the
chipdef can define a pointer to an extra function that (if non-NULL)
will be called during probing. This was already done for reset_func
and for sw_shutdown_func in order to support other chips in the same
family.

The patches keep the previous behavior of using only the PWM registers
to control the state of the LEDs. For that reason, the current output
is always set to the maximum value.

This is my first attempt at a patch for the linux kernel, so please
let me know how I can improve it.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
Flavio Amieiro (2):
      leds: is31f132xx: Add support for is31fl3206
      dt-bindings: leds: Add issi,is31fl3206 to leds-is31fl32xx

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  1 +
 drivers/leds/leds-is31fl32xx.c                     | 89 ++++++++++++++++++----
 2 files changed, 74 insertions(+), 16 deletions(-)
---
base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
change-id: 20261012-add-is31fl3206-support-d557f863a97a

Best regards,
--  
Flavio Amieiro <flavio@amieiro.net>

