Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794167084;
	b=nAgA1uhgbMLQvvZnUNUsCDDcBEoENknpAq2/jM6g0o38wp8zondkckVY3mnBAiBhmt8V
	 Buh6J2xakcQXubqhCOdwX/lHtQ4rz/n2+L8MsmgNBzfInUP2Xd8o52rnXB6ZSQaROOjQh
	 IjEbMShK3Y69gJUSzb9RkVxQD/A3QAtuuLs9GmRRqPIEzwNMZJfA6GcLVS5nkQGpklxKR
	 24s0mYG9XknePf018GU+zzd/8+6oz3iZ82IDcopV+WEg+aoJm+y5UdAYhBz+k991v7SoD
	 UYzoBni7o8R+vPtOfebkik4mYFENiBrBt8+xHxrrIo7HP5XdX3T7ART8Nrn5JnJfImA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794167084;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:Autocrypt:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=bK/w0JY0qsvel/2C3Ak4Hi+ciU/jEBjPjTp1td+7pv0=;
	b=jOYWbcOfb1nowr6NU90QjNvOvn+Ua4j69rLiDB+AN13dMEoRRTATTkqXFWRClP7Li/xC
	 a7h9Qx8E7lij7zYCXw9s+QFR4+rTuVHS0MjGwQhUIYil2aTwuJoOL2vsfAe0A7uT3dAvJ
	 KSMGki4r30AOxRh9TNOOk6sFJBoGAXf53Qpar3vRgh5k6BZUMNBAdbgxrcJphEQMy8byg
	 4Rft5Cj07/Tj3evrL1+jnLPFHZhmqgTZKyifnlgQrXAgtNMr1xPGKMWrl6t50sviqsbge
	 hK9BlQpVHm9t8hwBPPq+1wuJVOaDQzm7FiietrScLg73AeT4kR3GWk06mL1/c/CX3Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=postmarketos.org;
	spf=pass smtp.mailfrom=postmarketos.org;
	dkim=pass header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=YOLYPyDJ;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD29606A323
	for <linux-leds@vger.kernel.org>; Sun,  8 Nov 2026 19:44:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AFD29606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=postmarketos.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=postmarketos.org header.i=@postmarketos.org header.a=rsa-sha256 header.s=key1 header.b=YOLYPyDJ
X-Envelope-To: linux-leds@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=+ceEzAMQMvwUP9EY3u46PKK9C3QjKCi+ClAiSsq36c4=;
 c=simple/simple; d=postmarketos.org;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794167081; v=1; x=1794771881;
 b=YOLYPyDJ5TrEuBjbkSQ95fn1ZYo2KwuU1lq7GFgen8TTH6u60yMKaSozr3ldYPZuVk7EOdWI
 TQ98p4/oOSC9ajxW2pIWwgYLw3f/9Ye7fRxFUUpD2v1JKZB7fMhSb44EhsgBz6a36v/EVOCVfK4
 HgxI3aC+1/CFcJTcHjUulwTq6C8MVFoolvSmWjxk7U6PB+EUDC4+z0uKe77372CyKJ2W1zJeLum
 KW03KFc06t8oz17lYqx7InY6CFj35e5HKYumTo9cbUHJYnznwW62kFX6Vqw2TF+9CsX6bvoHzLP
 lJBITxDilGJflgy4jUct6WbL7hZZfnTDOu667KLyDV9ZQ==
X-Envelope-To: linux-leds@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d627279e59766dfb;
	Sun, 08 Nov 2026 19:44:41 +0000
X-Mizu-Trace-ID: d627279e59766dfb
X-Migadu-Flow: FLOW_OUT
Message-ID: <73c1c139-e0ec-4179-b911-174e4f01a0c7@postmarketos.org>
Date: Sun, 8 Nov 2026 12:44:38 -0700
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] leds: aw2013: Add AW2027 support
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Nikita Travkin <nikitos.tr@gmail.com>,
 Alexey Min <alexeymin@minlexx.ru>, Nikita Travkin <nikita@trvn.ru>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, phone-devel@vger.kernel.org,
 ~postmarketos/upstreaming@lists.sr.ht
References: <20261012-aw2013-aw20xx-rename-v3-0-cab1fdd050b6@postmarketos.org>
 <20261012-aw2013-aw20xx-rename-v3-2-cab1fdd050b6@postmarketos.org>
 <179198402838.839288.17911568760182808689@kernel.org>
Content-Language: en-US
From: Paul Sajna <sajattack@postmarketos.org>
Autocrypt: addr=sajattack@postmarketos.org; keydata=
 xjMEaVNevhYJKwYBBAHaRw8BAQdAjvGGprvrSn/CmlA1Bpjc4S5zJBNSz/6q0AESlS2JbdjN
 J1BhdWwgU2FqbmEgPHNhamF0dGFja0Bwb3N0bWFya2V0b3Mub3JnPsKZBBMWCgBBFiEEv1E8
 AP7J5F2dJQd4hycszAKyDbsFAmmt6twCGwMFCQlmAYAFCwkIBwICIgIGFQoJCAsCBBYCAwEC
 HgcCF4AACgkQhycszAKyDbv25QD9EdvXYqdH6vGQvB5HrUnMOsd37AZkKKgK87kMOXL/5tcA
 /jM3VLcq9mol+GstmBm1itIVAblXcm+H8g/wKoPXq/4LzjgEaVNevhIKKwYBBAGXVQEFAQEH
 QEgCn8S+S7t/3QvXt4dK4572qd+iTl7h4JX1FEV5XUs6AwEIB8J+BBgWCgAmFiEEv1E8AP7J
 5F2dJQd4hycszAKyDbsFAmlTXr4CGwwFCQlmAYAACgkQhycszAKyDbueJAD+IMjk8ztbONXz
 H7fieZc5LoR+6mHnddccacmQyPcGAvsA/0+5SkHEgIBuKwkzwrmKgDqcLhVuEs2f1H2GxKUX jqQI
In-Reply-To: <179198402838.839288.17911568760182808689@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2026-10-20 3:16 a.m., Lee Jones wrote:
> Also, the for() loops are identical and are the last pieces of both
> branches, so why are they duplicated?

The for loops were not meant to be identical, that was a separate 
mistake that sashiko caught, the one it mentioned about writing a 4-bit 
value to a 2-bit mask. I'll address that before resend.

-- 
Hal: They're going for the kernel!
Margo: Colonel Who?
