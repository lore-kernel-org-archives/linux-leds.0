Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795181183;
	b=N/aMFMCmLsFKycr8+HGmXgd5PKHyOVOQcr3kPm8LG3HLh23Q+ufEAZDickX5LnjOmx4L
	 UDWGIrqCzZVeosvkA6Dk8o1e3n6860JTkOE9vxlb2LtJcsVoQJjT0pD2oBfBgc5kHePcm
	 ph1pmugDn/TnDj+liT7vIXWIisxm34081V7sckFv6GV63+VIrvHz0AqritnYOozbF3ocq
	 u3fkXiRcDMLneJum/rPWpD6SAvmom6eiYvXBdhlDzyWgqDULjCyiE1vpU5bDgvtMe9Owl
	 W+105ONrNL60Iikr531ADVCo2xt/5ZGf/jn9I8hUSn1onNH1LAIW78VRst+wJQ5YqLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795181183;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=LpERgTsu052q04aftLC87SFcJq19G3GurEh6LRoztq4=;
	b=wrEz1wVCJoxINSMwMG6AEsZerdBXU3IdL4bdJ6iGO7GPY7iQW8+YcmQave1f3E+Sh1iq
	 ZtytQY+JDETF2jjfZQkH0ZPFe8AaH2hDdqFt2qcSQoGx6vAOKglEdIMuKnwxckTd+I0Vg
	 X/QE94veGVRfIczTRjmM3BBkRnJkgNdNvSLxg8UpSi491BIpubDEbj1drhq+ebwv/JVjw
	 YC5wQJ4ftYSH5ZouefJas3t224uDGQ16FbnasiLj6+CyP/iVDzEpZ3CfiohrYhRKCHE4s
	 lNtXf7c7fBKePTgsR1zWvh45rHAusyyJ8f8G6A3ZIHSc5K7LNA3JzxZEqlveKKUACAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=DCYB8bgX;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40B86606A330;
	Fri, 20 Nov 2026 13:26:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40B86606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=DCYB8bgX
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jWGLy6LCbzMlcd;
	Fri, 20 Nov 2026 14:26:18 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1795181178;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpERgTsu052q04aftLC87SFcJq19G3GurEh6LRoztq4=;
	b=DCYB8bgXhFZKhxX7/Zaq6KBV+x8x76Fu0mfI9+1SeiT2o+Bbf/VsX3utfOlveRjj6ilhtu
	D2EEukMpsWo9XGRjWjeI5OIFlz6040fBNfbrm6E/KGsYfWUR6qzLfgJAqQ8fJ8VEGSuevt
	CjTijxMMcLSPcEH+CwA/M6lou4L+NZC6ylzIaSUgIhTAR7ZgDepPTBpQbpUfOZNattJqk0
	D+qNZfPrA3jyJPdZ7bxmVL8q8Y/k3u50+i4W6sT5epepaHk0KZrPZKW0fHrz7UMB4dUena
	LD83pqM5NJIbRb3dUbUnIBRg6bjWA8baAmGaC5faPPr2jATAp8dIpzf08q5QOA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Fri, 20 Nov 2026 10:25:58 -0300
Subject: [PATCH v6 1/2] dt-bindings: leds: Add issi,is31fl3206 to
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
Message-Id: <20261120-add-is31fl3206-support-v6-1-0969fd6292ab@amieiro.net>
References: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
In-Reply-To: <20261120-add-is31fl3206-support-v6-0-0969fd6292ab@amieiro.net>
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
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDNkMXhkVLcsUvY4JvE+cpLvsytraFS2vq+cdFy+yrnqvc
 qSpa6ZcRykLgxgXg6yYIgtLGUuZd/vB5t3TVkvCzGFlAhnCwMUpABM5Kszw38Utxink1SLD26Ie
 t24Uvjk08aHQDcGpeaJnWUptq1UKlBj+yk+St5jH5zuhwHtb23v525yLT2wTMVZn983PdjV5/aG
 UEQA=
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jWGLy6LCbzMlcd

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

