Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794701584;
	b=alPdJwPsMF6GTwrz1nMZlOhmxuUI69X1Pkci9IkqK2ygz+yGLMeIbgA3u+cVEEvlMcFF
	 bpIBI/3ig/uJ+fBIAmxz8DtwWJCnPA76wUWaK1IX8Ub+GraaFwKkcoabcibgOBoK4hj1C
	 TSQ3eNXYzPnjkvalevnuqJuObECv9PLCxB56dv1kdK86cJLMyXGQDQ07byUMinI4nMtwD
	 9b0RCqnRkqZYwOHdgBoG5BiisrGJf9cWlPdenxPN0pHf8FwsaWe9cvmsIyRs0mqiip6FE
	 Y7gbLApyvftNyhrlORY3QjlrZSRMhZir9L25TBcT0y6B2whFdU9Q0o4L++yu7EBRTsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794701584;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=LpERgTsu052q04aftLC87SFcJq19G3GurEh6LRoztq4=;
	b=WDw1scuGXmOfz2BVYEIdSznjk+DM4S7BVpn1c5U1nUj3QPnSR5phJV/U0o8dggbHLGzc
	 jp2asgJ/Z72DLXBUmO+3uSVybtyBlPEHN8OdnbWaHHNvxsqw2mtvxauh7E+oFXpSTvnAZ
	 Nmv7C/Cjphw366LAWg/F7UZe7WkhEfM4Rjx9XbFzLDZRUbump2s4IxVCQzf04UHLzeLzN
	 EuO/YThjNvKlz+mmrKXhVFtxOw7mPnwIZKNi05RTCBbk60IdKokyW/GP21V6UHihyVbNi
	 ET1D8aZOvGMDh/BiKeWgjj9rBMpG14iHupg+oTpKXZwBVsk0OAt910xex7i9xgafAxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b="FWC/esTg";
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 095C0606A323;
	Sun, 15 Nov 2026 00:13:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 095C0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=FWC/esTg
Received: from smtp1.mailbox.org (smtp1.mailbox.org [IPv6:2001:67c:2050:b231:465::1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jRrzv5RgXzKr6S;
	Sun, 15 Nov 2026 01:12:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1794701579;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpERgTsu052q04aftLC87SFcJq19G3GurEh6LRoztq4=;
	b=FWC/esTg3twmFH9/o8KqrI+eK7JwhuHIOzK5eFHJh3Zw9s2f05DuvfnGXf6XOZvpeskFXT
	vWF7xZ+uP2n8kJEsW6Hc0D0NZ8cu5kt+FRdJGAeqerSErPhXPnI+kOpgYqiYanLqej9KQ3
	w1+5TOXVZcmOZdCYw2mlGBSXX6G9Dn7EBrkFPxx3fMCPPhO8qIC1QPwW5ns4aHPAy0/mYr
	qqfk0cwEB/Pkmx1e/d3MtZvNd+3+ginDCRcNuhFmUn/8uLiNHUvH8gkdCgvbmtkj0YEwGZ
	bTpIThB8ZNBCPJD63+ie1a1djQPL5vmuZZ3pmc7FExjPY1ITDee0e9IZpE64uw==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::1 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Sat, 14 Nov 2026 21:12:20 -0300
Subject: [PATCH v5 1/2] dt-bindings: leds: Add issi,is31fl3206 to
 leds-is31fl32xx
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
Message-Id: <20261114-add-is31fl3206-support-v5-1-332db80233df@amieiro.net>
References: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
In-Reply-To: <20261114-add-is31fl3206-support-v5-0-332db80233df@amieiro.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Flavio Amieiro <flavio@amieiro.net>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=795; i=flavio@amieiro.net;
 h=from:subject:message-id; bh=+A8I52rCvgnfvwrfz6L5/w/bDLVeMwFGRbV/sS5gUq8=;
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFk/fvyLUl8+Q21a4VaPToGko9eOtO40fjxPXUpHYcOSn
 5nvnGZP7ihlYRDjYpAVU2RhKWMp824/2Lx72mpJmDmsTCBDGLg4BWAiCrMZ/kceWcCdf1ZGRrdl
 //O8GL8TxZWBN+av5Z4vOFvosJLw7pUM/wP1tQTZA174OCz86OHq3r72hMJH1QPqqSvmHf0eP+v
 wLhYA
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jRrzv5RgXzKr6S

This is a 12 channel variant of the is31fl32xx led driver series.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
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

