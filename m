Received: from mout-p-101.mailbox.org (mout-p-101.mailbox.org [80.241.56.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656F94AEBC6;
	Tue, 13 Oct 2026 10:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791885633; cv=none; b=IsfT2RLpW4Izt5q1m+cwoaBaCq3Z80Mb03jQAkCmn5cDRr9vTTf5G6mf0bu0sI1RjNeRknKQ9D9JEyDLRko2Mnqy/x73wVMOo1v1rYAunlUMSFNVxivqV/Mk1zRUHYacQkbvvunib9sjeAGMN8VYc7jSEZjUy7MgITkO9+Ign8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791885633; c=relaxed/simple;
	bh=46BqH9BAIlunijNkff3H/ga0UxeXAdMhqT/msNSQh+A=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=azjtfkLwkXd+tr321Eq6f0374T4VZTu+p1r3moxLGA2S7CsX/oRR8UAh/181RJ2m5Go7BpAtyNg3KstnwduR/t2zaaMIT97Sz2wAUnSZfCEk5Hbi3rjBU1i8wfxbAr+FHgHy/N4BDm1/Q8neJtW9RPoviI49hqfXa9fNPGwhyLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=ZZsCZ1Hp; arc=none smtp.client-ip=80.241.56.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="ZZsCZ1Hp"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-101.mailbox.org (Postfix) with ESMTPS id 4j3qZy3txKz8v1s;
	Tue, 13 Oct 2026 12:00:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791885626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zSBJwzPrQS+I6gxzPMgU+tr1yFEQWRfxcIuKNoQhreI=;
	b=ZZsCZ1HpMZE++6zSZoi5JvtlKIJJXy6Dcuh6Lt8XMsJ+x5ptT2eqnGvLVwT0lGZp0yhCR7
	n8b0hf8mbxl9tPtuN2+NBU5JC8BGsRZWHjb0LUqjLHY3ytdMxVyaxiYrmy/Oy1dmIx0HEY
	zJ6rqDUWloV9fcxlhXThJvXLKXH7it+gONFJFU1hy/zKxwiwoXLxq0J3Hmlt+B/dgA6RhB
	LA8sJABgz8oEQoxcrvrz/0GvLAoxD1O9OLm3X34Ql9+A4qe/n4/zD5jgj3e5Y19uEGSch3
	Q4Syq0ep+AT1LqrLTS+F7OW4WI/qwxjxXuP7ReVUdlKRhQLJ0lGM4yHobSAoug==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Subject: [PATCH v3 0/2] leds: Add support for the is31fl3206 LED driver
Date: Tue, 13 Oct 2026 07:00:08 -0300
Message-Id: <20261013-add-is31fl3206-support-v3-0-66a762a3c12f@amieiro.net>
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42Nyw7CIBQFf6VhLYaHpdWV/2FcUB72Gi0NUKJp+
 u9CjQsXJi4nOWdmRsF4MAEdqhl5kyCAGzLwTYVUL4eLwaAzI0aYoIQyLLXGEDi1N86IwGEaR+c
 j1nXd2FZwuW8kyufRGwuPVXw6vzlM3dWoWGxl0UOIzj/XcqJl94nwX5FEMcGkVUQIpdiO6qO8g
 wHvtoOJqGQS+0/EskhJolln66bl9lu0LMsLPqCwTRkBAAA=
X-Change-ID: 20261012-add-is31fl3206-support-d557f863a97a
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Flavio Amieiro <flavio@amieiro.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2481; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=46BqH9BAIlunijNkff3H/ga0UxeXAdMhqT/msNSQh+A=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFnnGDV3JThzcr8Ni3lV9M/M6NDJRz1Xl+hoLJ+4yJln2
 5wXR/9c7yhlYRDjYpAVU2RhKWMp824/2Lx72mpJmDmsTCBDGLg4BWAi+TsYGb79Lb8bpOvG6ijA
 OZXV+fTKGeUTjHdNzVml92iu4rcTB7gZ/mcav/7Q/fzIFYHrr0QqtP25+Vu+bjhqUblu/s+Dkq5
 bFrMDAA==
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4j3qZy3txKz8v1s

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
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: devicetree@vger.kernel.org

---
Flavio Amieiro (2):
      dt-bindings: leds: Add issi,is31fl3206 to leds-is31fl32xx
      leds: is31f132xx: Add support for is31fl3206

 .../devicetree/bindings/leds/leds-is31fl32xx.txt   |  1 +
 drivers/leds/leds-is31fl32xx.c                     | 95 ++++++++++++++++++----
 2 files changed, 80 insertions(+), 16 deletions(-)
---
base-commit: 05b4738b0078f7d6f154f68068a11c8a0635e9df
change-id: 20261012-add-is31fl3206-support-d557f863a97a

Best regards,
--  
Flavio Amieiro <flavio@amieiro.net>

