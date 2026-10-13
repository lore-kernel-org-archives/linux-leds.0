Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A7DD246781;
	Tue, 13 Oct 2026 09:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791884684; cv=none; b=WZbkHRHubbqqUidSyIHQi8UDg+sgg0xpfUY1tmKvBOSbheG4bLlhzobQJl6b0zvIUiVtuBAm0iN4ogbHyOQsXsDxMEIKVTj/0nhaxkNdUCXpQVitgLENx7o2f9g1QJ248cXebu+upof7gqQphtN9wwUeEXWqVJ0rWWFzUGqg6os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791884684; c=relaxed/simple;
	bh=C3f/PU3q3e17UxXNeOIaXS+wMmxjkbvo+XRbZ6ndYcQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kbBtzsA/DXdMued2IUNhK687Wp6Ljh7yp7ZGsD/9h8cJ5zuAeUubb8PTEQ43cefhP54N4h/69/cSBZyADKMmeMY0fEiXc3tGSGsdupKBlRBMKQ0zVfJy4+lp5+N4sAMUaa/hCXx4b8kvT1+wvbwrZmPB/sGrvOeO6V8+FXlks50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net; spf=pass smtp.mailfrom=amieiro.net; dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b=eWHrVT6V; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amieiro.net header.i=@amieiro.net header.b="eWHrVT6V"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j3qDk5kWwzMlg6;
	Tue, 13 Oct 2026 11:44:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1791884678;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1JByn10oJi/4Szu73S8win3SzOhC2s6rQ+eLKXsUO9U=;
	b=eWHrVT6VU/CHdPzZgGgvqSNY+mcE4MySX5iW1honivpcJlxzbLNzEp0N/t03/1gNJ/3Td/
	eLNysE1Q2WH4y53/xklrxcsZsTgm7SB1JnrRa3+Ep1tu7wj5/eZL/igqPhRdIShEJSHX/o
	85MYqokquUEthSqao2LHRzwLybcqacZMp3M+UWmnVy/zlXyXuXVRwJtHeisbL4deT3x3qC
	ZXOYnu0W1I66zJ3m4Eh0dzpG40uc/ugXmWIkc2eF7yWUxc69MYTmy33WtdJ5FBsT7w7m7T
	N9atmNJNzUc1Gm1qedwj5GqZpxOzhLUqdcl72kvDnVqUP1TeJn2f4H/9e07sgg==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Tue, 13 Oct 2026 06:43:42 -0300
Subject: [PATCH v2 2/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
Precedence: bulk
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261013-add-is31fl3206-support-v2-2-ca0d2bf5783f@amieiro.net>
References: <20261013-add-is31fl3206-support-v2-0-ca0d2bf5783f@amieiro.net>
In-Reply-To: <20261013-add-is31fl3206-support-v2-0-ca0d2bf5783f@amieiro.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Flavio Amieiro <flavio@amieiro.net>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=725; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=C3f/PU3q3e17UxXNeOIaXS+wMmxjkbvo+XRbZ6ndYcQ=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFln/2axnG7csCu4R+fjzoiUVXPCzxv83hzWYxHAKvyGW
 0fx3FrJjlIWBjEuBlkxRRaWMpYy7/aDzbunrZaEmcPKBDKEgYtTAC7CwcjwyjAxw6/vuMKvC7t2
 Trctzn117VB+x7R+73l1W99c2Zv0k+F/JINM1Sv2uEqjcB6HPaqWaQrBnSbsC44+sNYTdxI4+YI
 ZAA==
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4j3qDk5kWwzMlg6

This is a 12 channel variant of the is31fl32xx led driver series.

Signed-off-by: Flavio Amieiro <flavio@amieiro.net>
---
 Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
index 7082ed186dd9..06f85a1c6aaf 100644
--- a/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
+++ b/Documentation/devicetree/bindings/leds/leds-is31fl32xx.txt
@@ -11,6 +11,7 @@ Required properties:
 	issi,is31fl3218
 	issi,is31fl3216
 	issi,is31fl3293
+	issi,is31fl3206
 	si-en,sn3218
 	si-en,sn3216
 - reg: I2C slave address

-- 
2.53.0

