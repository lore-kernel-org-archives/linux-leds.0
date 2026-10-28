Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.152
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793223134;
	b=UcpH6Xx5X4fjMfy/KTWg2efT5DizGyzD/U++NLCTGeSoSaYv7wWqOVmlAYqj3Fa2nM3e
	 O2afQueJcvsGyPqR9nt2Bs4PaAbHg/U2PVOQXBLM7VsJ+WMeGfgc/ae/f/R4fvnDHokfi
	 6/AGqkqryb1DK4/KGpQtj3W9pTV/COUYMZX8M/FcS3QeIFS2E1ZmdOcB7l4fyFCZGJFjD
	 lqo70eCNT0fOF0E+pdblu39rmU70ku6l9sQQgxx7tY6UUatSdq/UiABq9oQ8OvSXh6WbH
	 earQqI4Sms0iyRbQGlgmMeaOvcuvMr1yQHVNLcf9pGpo7XIcxgnmFbWyB469a/HktCw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793223134;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Rspamd-Queue-Id;
	bh=LpERgTsu052q04aftLC87SFcJq19G3GurEh6LRoztq4=;
	b=Ci5uYZJf+GLPCCsRR7En3bnOx9wr/G112OrQW/Db1PTsDqa4JKgDQLI1XpK819mPJ7ii
	 nDewfpJZoxgXQlraz1a42INHLraB6kJd/JiuHgZTS0GLG7bMXWD2ChA0SMWNBIJVfPEKW
	 qKjLTEZ4ejO3b0c0n2CZwtSO25qX+D9cWTCpumd0ijsTanq9AsNZBZxRzaXPZIVoXMF1/
	 umwvR3AGiiMo8zOiSt336+KdtmSzgKF9avjsvRpr7r/GFlKm7z7bkBloJJl2wQP6RVWX/
	 HNBqLqRNYpvPEvB25MpMyRPqdynSCOuuHmixkPlPZJ/3mEbQLu2nc+6bGcRmZgZGpcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=fpeL1exQ;
	arc=none smtp.remote-ip=80.241.56.152
Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BBA606A324;
	Wed, 28 Oct 2026 21:32:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3BBA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=fpeL1exQ
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4jFLD45FmYzKpBH;
	Wed, 28 Oct 2026 22:32:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1793223124;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LpERgTsu052q04aftLC87SFcJq19G3GurEh6LRoztq4=;
	b=fpeL1exQZ4Dh+m4/RXROirKE4yjLiIJbRAkdY6HCH9Omuc/zVhDqD7ZtZFGXxvs6/DR/dn
	jDx72vTGocIO7/hHvWlHL24UNy9oNAq45e9nsGs/6u8G3ECPIJsOYEFNrtFA6/ad9UW6sj
	zujD2nJhb2Ua9+riktDRs98sGyTZNSDtjRiz/SxhLXRrb835fz8ee0z3fy9nyjL6RwsIro
	5dTOp8TiGtPhmD+enQQ0SC4TerJjQ/C11YKQJ+BZPw8EAaDpiWSyPdOvzzRN2UpqUJqi2g
	JJ77PJtr/g7n/XyfNuMpQ8fpYsuZYffz3j67wpN/3x+0aqOGA6RJbwKkQchZ6g==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::202 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: Flavio Amieiro <flavio@amieiro.net>
Date: Wed, 28 Oct 2026 18:31:01 -0300
Subject: [PATCH v4 1/2] dt-bindings: leds: Add issi,is31fl3206 to
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
Message-Id: <20261028-add-is31fl3206-support-v4-1-e331cee9fcb3@amieiro.net>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
In-Reply-To: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
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
 b=owGbwMvMwCX2bmrBFGnZ5lDG02pJDFmPMo9Nz65RXFf34M3diy2dPpd8eWfUz4t9qbVcT8lWh
 SmqO7Gro5SFQYyLQVZMkYWljKXMu/1g8+5pqyVh5rAygQxh4OIUgIns2s3wP+DzTTeuuEVHfwqF
 sL21FPosdLfx2zNngbbMFWFvl647bsPwV8ZgX+YPTbUQZwb94kafHOU5ovtuCMb6b7jOvDfOwOE
 ZNwA=
X-Developer-Key: i=flavio@amieiro.net; a=openpgp;
 fpr=047604764B87C183BB96AB19EE9570941B1D8355
X-Rspamd-Queue-Id: 4jFLD45FmYzKpBH

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

