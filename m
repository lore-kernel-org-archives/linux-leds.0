Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=80.241.56.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794599618;
	b=n1fK8iRMOmajR3mXVJY96SblW5u3r72swa7P4fia8GlgGNjEhlymeMQMyhPYhzSusYXS
	 36isE17DsxUkrWd1ke/QE86+FNMYJZGGlVDXZJlZ57NPxiaAgCmwPMzW0yDct2HWPLSep
	 OOQfwkX+YWEZayotQRrAJlEA3K8aGwePA7SAi6xSyZGbwgXh19N1NOjT9k6pN66agUmEe
	 ffxJUGTjvpDZtEIKZpRF5pn8aKzOdcCFX7KVGjh0UH1IyW/5k+H//1KmflUZ4PaNisT3e
	 TgTegwxiWfksrzYiX1gXNXtT7Tza7MBaFI91u2hG6lCVPPhEUcnx8EmRdpR8hx9LqQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794599618;
	h=DMARC-Filter:Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:
	 References:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-Rspamd-Queue-Id;
	bh=dwKbjIwix86xARbJdD4uRnizYgxLzRiRFRGveKCQ+EA=;
	b=nM2bEBdfcTau0sCaOIBXvCkf1uthgR8/AY+ee3+dIWpJWgzu6Jc+uSd0D5TXRAypAFqV
	 OUnd9iDyYT/v8pXBMlzzomq4y2ZO20QDaxFuBqKx4cCD4oygPty91mhanhc7yU+kpQodz
	 V5Gi/fMg5EjpTT3ZaFqH0KNdWtsTxYEaR/rk/Pp5pG5yIKZPygqz08ezd4WSyq22YtSKD
	 JtfOEES8DdvoYQ0w9BfsBehWzkwTwlyyXstTGUFkcIDWDPtd54oNW6OZrLji4Xw62rXHl
	 EBhunOl1NZuUP7z8Olwvoz8zRKgbqb2upwpr+M5Bu7WHf5kBYZGvZAmBCdo6CVaEoTA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amieiro.net;
	spf=pass smtp.mailfrom=amieiro.net;
	dkim=pass header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=YMuvZiRM;
	arc=none smtp.remote-ip=80.241.56.171
Received: from mout-p-201.mailbox.org (mout-p-201.mailbox.org [80.241.56.171])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89D2606A330;
	Fri, 13 Nov 2026 19:53:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89D2606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amieiro.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amieiro.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amieiro.net header.i=@amieiro.net header.a=rsa-sha256 header.s=MBO0001 header.b=YMuvZiRM
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-201.mailbox.org (Postfix) with ESMTPS id 4jR7H22QFBzMlbq;
	Fri, 13 Nov 2026 20:53:34 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amieiro.net; s=MBO0001;
	t=1794599614;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwKbjIwix86xARbJdD4uRnizYgxLzRiRFRGveKCQ+EA=;
	b=YMuvZiRMKzNxbpSl5/mB9AwmF6NrJczmqaXrE1yLtMIJLF8naU6klrAtgwvSBOSlhsNrWP
	s4lWwl08YsbUoa4R2EhcFJOKU1KuYb8URGZ2OGEwd9qDTyBI15W0TTUYa5ER71cDOEL8up
	/vuR2RI/GnALmHREhbCLyLZvqyUBdM5HEad7Q6s5EWCYMbuj9d65vgo9wLp6mA8JFNQNSy
	VuMzeZGeGhMMwp2mCLTI/dVOyWXRMBykaQkdg+f3ft++RvMtt4dI3gMGLVB/Ng1Vt5pLpU
	iUJ/320UOhA4eixqYuPxazOyrkO2qHB2CpMz8ryqiUoXurk4VuSXjqsBbAUaAA==
Authentication-Results: outgoing_mbo_mout;
	dkim=none;
	spf=pass (outgoing_mbo_mout: domain of flavio@amieiro.net designates 2001:67c:2050:b231:465::2 as permitted sender) smtp.mailfrom=flavio@amieiro.net
From: =?utf-8?Q?Fl=C3=A1vio?= Amieiro <flavio@amieiro.net>
To: Lee Jones <lee@kernel.org>
Cc: Pavel Machek <pavel@kernel.org>, Griffin Kroah-Hartman
 <griffin@kroah.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 linux-leds@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] leds: is31f132xx: Add support for is31fl3206
In-Reply-To: <20261113190226.GJ6323@joneslee-macbookpro.roam.internal>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
 <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
 <179370064610.793788.8239015594326628135@kernel.org>
 <87cxs87jyt.fsf@berlin>
 <20261113190226.GJ6323@joneslee-macbookpro.roam.internal>
Date: Fri, 13 Nov 2026 16:52:46 -0300
Message-ID: <8733t45x0x.fsf@berlin>
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
X-Rspamd-Queue-Id: 4jR7H22QFBzMlbq

Lee Jones <lee@kernel.org> writes:
> Ah, it's because the first one is spelt correctly.
>
> This mention however, is not:
>
> @enable_bit_offset_in_led_control_reg
>

I'm sorry I missed that. I'll also fix it in v5.

Thank you!

--
Fl=C3=A1vio Amieiro
