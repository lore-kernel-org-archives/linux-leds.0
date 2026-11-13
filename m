Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794588750;
	b=JQt9wFoAknbH/wweMtjc/EBtrzB2k5BVASDvutdp/JhCw2tTu4Ynrc5BMPiBMdng74Fb
	 v72tfU0i/OX/geCHGL1nZ+iKhGMIgyxGvLx5o9reC2G7UVv6M7Bj+TvtRPrIxmmv7GfS/
	 Uo2gEgI3UV4R7BOmjnqPbvUjZ7GP86ZEU3v0whMn8yn3VIVsOxjDwU/fFD25moOeNgmMJ
	 Y7BXTLWelVSsQlofc1wYhybRMIPEcn7Pu+VgdN5aaBnIy5UBfTGPumcLPnwCLsIdassHf
	 Mn9u5WuqU16sFC89RFx7d0cpzOMhbSuFQT52IsLmyTvTeF03mo1vVQKFkkC7z3GhPfg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794588750;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=svY1w6EwatVo838DMHluYYqTPuJ2NWAoxPsNbfKh4U0=;
	b=toGCaGRRr3retEE9CuTDjmAP5pAyzeqPJbw8lKSTke9cYXgY7Om0/KwCjMGEuUEIKlum
	 mGs9eT+SBAdiHzf++1O8n1t/t+ksdaj6S/TmtQJrRYBaM8R//jIqB6ErUhccY6SRl/uOI
	 GLGJZ92zoR0MUyniasLP76C8X/oxdkNEszmFDmGfxX+x0m1T/rpl2wepsqHOcEAwqAfBB
	 vVVSJa1PqzJOTcxxHxEhaLMTLcCUl1EB15KuOM6G+jAZ/Kvz5HJpqHLtvz4+pyUOalEmP
	 KUKrp1XX0b8QOCgOOnMUb+uDyTaBWzIkTG03g25+bTtR548GLdDqEjkqI40Xd77tq3Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=o9oWjx64;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF1EC606CDEE;
	Fri, 13 Nov 2026 16:52:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF1EC606CDEE
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=o9oWjx64
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jR3Fw1DQhzMlXf;
	Fri, 13 Nov 2026 17:52:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1794588740;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=svY1w6EwatVo838DMHluYYqTPuJ2NWAoxPsNbfKh4U0=;
	b=o9oWjx64l3jVuPPckX8M5LXKLmN4T5cbxIUzULDFCxw96LnPMUI45yGurOV4eT7Mju+AJW
	G7N1sRf2LZr9ab7yQSxrXYy4ReE5bQ8LIw8rZLn/7Nkf+qDDnyplRyTyq7TsO2+g7Jv71G
	0ICl7qZ6ClpmqkEyqYp/HUL5GS1KwnxZPPnXaKniLfPUr0aIfEFCUl0tHdtrW/OEN0uAi5
	iLpk+3FWxeykuyGp/pXmMn3eYioQgLwGE8xLRIi6twwygLnwq2U5G6tF2u4uznJvsK0i7D
	iZ4TWkzi4Jal2fIC8QiOksSF1DJrokyoz7uWYvI3lpdR/wJiKesq2Evh1fDVoQ==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::102 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: =?utf-8?Q?Fl=C3=A1vio?= Amieiro <flavio@amieiro.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman
 <griffin@kroah.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: is31f132xx: Add support for is31fl3206
In-Reply-To: <179370064610.793788.8239015594326628135@kernel.org>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
 <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
 <179370064610.793788.8239015594326628135@kernel.org>
Date: Fri, 13 Nov 2026 13:51:54 -0300
Message-ID: <87cxs87jyt.fsf@berlin>
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Queue-Id: 4jR3Fw1DQhzMlXf


Thank you very much for the review.

> Lee Jones <lee@kernel.org> writes:
> --- checkpatch.pl (1 issue) ---
> Line 83: WARNING: DT compatible string "issi,is31fl3206" appears un-docum=
ented -- check ./Documentation/devicetree/bindings/
> ----------------------------------
>

This is documented in the first patch of the series, as requested as
part of the review for v1[1].

> On Wed, 28 Oct 2026, Flavio Amieiro wrote:
>
>> + * @enable_bit_offset_in_led_control_reg determines the offset of the
>> + * enable bits from the least significant bit of the LED control
>
> Make sure you run W=3D1, particularly when changing Kerneldoc.
>

I checked and get no warnings with `make W=3D1
./drivers/leds/leds-is31fl32xx.o`, `./scripts/checkpatch.pl --strict`,
and `./scripts/kernel-doc -N drivers/leds/leds-is31fl32xx.c`. Am I
missing some other check here?

Again, thank you very much for the review. I will address the other
points and send a v5 as soon as possible.

Best regards,
Fl=C3=A1vio Amieiro


[1]: https://lore.kernel.org/all/20261013-jolly-salamander-of-tact-7cf46e@q=
uoll/
