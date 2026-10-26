Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.183.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793022964;
	b=vmr7zctSnDr0IF2xFWrYYUMD7QWkKtNSuD1fY9qSbr4aTVeChVvsnt8yGaqJ9ChZxAo+
	 FqMBJ/n3P11LGc4AVQu8yFBnI65yW5L733hzOpIDWsEUSIMf4vDn1+jAbcJKvanrZ40BF
	 0jz09ywmLsl+o8TUFS6nV7eAOGGmHbpbIz7HztPeyhc8sB6Vk3Bnf4ftmFpH/I50TTVHk
	 /NV/5mioFl433ru+wp6vcL6j+CiGQUflnWij0Opl4hHbSRWJ4VzzXnPy+HvSmNacDIlBj
	 Y6TpYs1RQdDynUhpvMTX6LLtolxCnvhJmxKyBK6ZHhDlY6OmTx8ejB2v+rXqeZ0M5mQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793022964;
	h=DMARC-Filter:Received:DKIM-Signature:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-GND-Sasl:X-GND-Cause:X-GND-State:
	 X-GND-Score;
	bh=no+qXWoVUtPdmyI+zw6GzGkvpR5k42dNrWAHNpp59kg=;
	b=J+zdy1kPvJP7iBVsw4NuvW/4Ym2crnZy11VcnkZXShCQ+nMytXMUa2BZVSB09tUwoiNQ
	 r6RqM3GhT0hB7QwRdGRo2NpTk44LyNQk0NWKY6PR1YzYHt7j42FrG9cXopv0okDLTspg8
	 b2UqOyjkFSmsTl4lSu+TLoEslLmdBGbo32nyHJnVm1PSt5ab49VSMabu1mSOMHoIa88z4
	 FP62cBcUsQV1dghU3XCIjHLcOgeRdaxNLNAqPLjZRxZiAVJxoyWQ2ywnhN50bZVIHGSSU
	 oR+0v/yl9l7xK83yJszPUinuG1wfD5ScUd5wt02CWoiEEW3axfzkqI3qnuQ0erBj9Ng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=marmottus.net;
	spf=pass smtp.mailfrom=marmottus.net;
	dkim=pass header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b=SXNzgX+N;
	arc=none smtp.remote-ip=217.70.183.197
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net [217.70.183.197])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89A3606A31F;
	Mon, 26 Oct 2026 13:56:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89A3606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=marmottus.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=marmottus.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=marmottus.net header.i=@marmottus.net header.a=rsa-sha256 header.s=gm1 header.b=SXNzgX+N
Received: by mail.gandi.net (Postfix) with ESMTPSA id 0EB363EC86;
	Mon, 26 Oct 2026 13:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1793022955;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=no+qXWoVUtPdmyI+zw6GzGkvpR5k42dNrWAHNpp59kg=;
	b=SXNzgX+NVNoj+5hPJWf7wlvppK7MllN4uG3G885AXd0efnEf/gzx7eRutVuyhb77INsEUX
	w1sILqk+1ZEPXMKMhpEtNE8os8zLLhkv+WTzkDNicG+qcwAdu2oJ/W6K0169U3YVQhs4v0
	JjJRpUAD5z2OVFHMo1QsBzpJYgXehjo8WdDii9cVgvNd8h3uqy/dK8Ek+e0IVROUA7vacw
	a0uKN45Twb0Ok8+H9b82pe6TL4ApqmURoThVVnTHBMKxiW10o8i2vcio1V9ESkljEHRded
	Uv6zl31Y2xMRL9B3H2yPsSvoK31GiTCPmdcb8manO3Muabq0nRDOAejVeIIYxw==
From: Arthur Crepin Leblond <arthur@marmottus.net>
Date: Mon, 26 Oct 2026 14:55:41 +0100
Subject: [PATCH 3/3] Documentation: leds: lp55xx: Add an LP5569 example
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
Message-Id: <20261026-lp55xx-v1-3-6eaaf530115c@marmottus.net>
References: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
In-Reply-To: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
To: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Christian Marangi <ansuelsmth@gmail.com>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-leds@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Arthur Crepin Leblond <arthur@marmottus.net>
X-Mailer: b4 0.15.2
X-GND-Sasl: arthur@marmottus.net
X-GND-Cause: dmFkZTF4wHLuNZNT+x8QlpvzKlCxiQ5v2Xy48uyN0XCB/1+FoIXabsjUwdsrOAnEv00sHzZcWK9jzeLdTqDar17yLdhWCO3HeWhe4TTzmwiIXmPcXT0eWYP54N5aPolxv0jmeaXrEgBZagKbus65l09WZAp7xgQR2sj4YVQErQBi/WseZ9qe4i5TORJMs5bSNSCd5UpYmMf7AZmKRDBFngUISwL3+00J0vV5a4IS+g1SCNBiiJfGxFjWMKMcy2WCzgGOltqTsGur/fZKzOuALTbwlCZh1ECtCjtZIlBB2NeQMyIkI5OX/4dkWE6rFvDqQLkifvnLWNLxG4Bd1pN6E6uKkZIyrptoTEyK6YWIPRN5veKd2sk4UW0cD0ao02bqJ8Q97eNqnu+EcwGhlSOQ+yxeN1QDkZLdxyinbnSH33zhbukqq8sGqXbE9ei8IDS4PH1dCaC3I2SWpOxx5wgen1yFMahAtHrbGRhmS6rzDR1Gh0ZqezjjHear11ohwGm0/caTgG8W5VEvPzZDmm5MYPOiRqid7kIHgF2LvTTR04PGHBvxO2miywIqFnkM4Aoo280dQP9YdVUWACJJS+jWiaOWOG6n1/EaIl0knklkaFHX1QJNdxvsNusTb0oTYlaJNhd1ZZTUOtr4pWAxSxdgIGwyqF6SCjH5+3ZI/OfFJT1DF/Khqg
X-GND-State: clean
X-GND-Score: -100

Add an example for the LP5569 that drives three LED channels at the
same time.

Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>
---
 Documentation/leds/leds-lp55xx.rst | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/Documentation/leds/leds-lp55xx.rst b/Documentation/leds/leds-lp55xx.rst
index f60c7ec39816..549bdb0c890f 100644
--- a/Documentation/leds/leds-lp55xx.rst
+++ b/Documentation/leds/leds-lp55xx.rst
@@ -161,6 +161,30 @@ Ex 2) Engine 2 and 3 are used at the same time::
 	sleep 1
 	echo 1 > /sys/class/leds/d1/device/run_engine
 
+Here is another example for LP5569.
+
+Three engines run at the same time on different channels:
+
+  - channel 0 blinking every ~1 second
+  - channel 4 pulsing from 0 to 255
+  - channel 8 blinking every ~500ms
+
+Load a program and select the LED(s) of each engine, then run them::
+
+	cd /sys/bus/i2c/devices/xxxx
+	echo "load" > engine1_mode
+	echo "load" > engine2_mode
+	echo "load" > engine3_mode
+	echo "100000000" > engine1_leds
+	echo "000010000" > engine2_leds
+	echo "000000001" > engine3_leds
+	echo "9D8040FF7E007E0040007E007E00A001C000" > engine1_load
+	echo "9D80400010FF11FFA002C000" > engine2_load
+	echo "9D8040FF7E0040007E00A001C000" > engine3_load
+	echo "run" > engine1_mode
+	echo "run" > engine2_mode
+	echo "run" > engine3_mode
+
 ( 'run_engine' and 'firmware_cb' )
 
 The sequence of running the program data is common.

-- 
2.56.0

