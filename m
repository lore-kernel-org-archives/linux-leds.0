Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.153
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793365784;
	b=Nzw2wo0kq9HYxjr1rNvirA0jqkEQ0wB2KB39EuIE0oupLQrjb2L+ZpHqu3x4tKBlTQVd
	 0abHa5OJZbzRyfxdNEmCpwuniCe2ojzw+i61enHm9KpUf2DiczMqAnnfjMdt8YvOjOC/y
	 R8Wy+w8MrugQovafIUSQJMhUPzZUuYGjXj/KoKJTyZ1kGhqVE36LJFMAzrsmrx5mn+m4H
	 AUI0kVYZMOniO3aR4udCML2VWw6M3fQJ9ieMWIcqhokYUNJKVWN7yCieySNhpDtvre2Mg
	 zh04SV2OxBDcRlVpKPMPAmLUVJv0amxtZ7YsL+DPn2G6THnaNQRzw7Qz9BfiWLL2KrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793365784;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:
	 From:To:Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=VufzyxxDNDky0ZTk+wV90t8Sun+2IAPwwdrPG8KvB6M=;
	b=dOTxN4Ken7/bI80PCBgULCSm4LkpmSE9BtRVigwmNyGu18jrqSoj9mz/4qSduf0Q6xMl
	 gmSgxSjvIi1OhMvooRHhHzRIC1V4fdjMQHt2VCENEKiVh9rlcRhJ2WXNX+hj4Nrpr9zTo
	 l2YyCj24yQG1cs7uhhuvNfjsYe1SqvGppARGAlam2gBlCEtd/UB66u1AHRbhGKvqHSx9n
	 Ip/KlNqSuTKGbMKTwhFe/1hTXNUzjuBloB5SCW4/cojHj3VUA35Q5MCFF3JwV/Sborcfi
	 GO4gmQRccUjvuheWep6h5O5D74/7yB0MvuoTuQ1W/9EdVZO3c49CPeN8O3A6kIajvkw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=eFI8Dleh;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=U3s+78E6;
	arc=none smtp.remote-ip=103.168.172.153
Received: from fhigh-a2-smtp.messagingengine.com (fhigh-a2-smtp.messagingengine.com [103.168.172.153])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 174C3606A31A
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 13:09:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 174C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm2 header.b=eFI8Dleh;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=U3s+78E6
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 70FFC140019E
	for <linux-leds@vger.kernel.org>; Fri, 30 Oct 2026 09:09:42 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 30 Oct 2026 09:09:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1793365782;
	 x=1793452182; bh=VufzyxxDNDky0ZTk+wV90t8Sun+2IAPwwdrPG8KvB6M=; b=
	eFI8DlehxLNn4JQk2eQScxcHA++LvXicnJAlpZCfecdo/GDfFqNWOFO+YKz0RGUS
	SI2sGsc0OzU+HmAkt8gf7GVtHlQ5oLJ1eumrflNSNyOWvG5+fwuIkYFWsljNlJRr
	6/BBBjcjMN2+52cE/uBN8Zqp6SElZRo9H++5JZNFO8OwyT32S09owK5NaMzPBYjh
	dWOm2f9qmnO/lmVu0dVlfUKK8YFhv9ggVsV/zSEXPw79lVXM3W5vvrz0y/RZ90Sf
	fNzZr2Xr5ADX7PjyAq5WO9G+qgxnYY8QL2/0xNDCMfYokwbONfDbZVgunYHVfdhV
	dA6lNnDKkeB0nzt4z2vd/A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1793365782; x=
	1793452182; bh=VufzyxxDNDky0ZTk+wV90t8Sun+2IAPwwdrPG8KvB6M=; b=U
	3s+78E6xzVnH/d+DxTT8mC4dkFSqB/x+aLpLWZX+7l+kbQKmzTApVT4hVtnxXyD9
	Rw2kBPgGcJ+34l23SnRQuMRDg84vIEajL0fX4O0eE7lpY4hcv2T8oH2Fu5EWPQz6
	7GxEYdrpEY7twu1tFS33raA7P6JzlknepybaKZDSKAN9MXufCghjA1BHYaUCg28Q
	0dlrbtE6iK5Zml6pntOXLrRdoII4zU9m2VkTt7G1cvWZgPDVLHRT+hyZ+UL5AbXT
	G4TdoNum/LGBKXYtKAv/bqha2JoFUyP3UJcF2r0/lV2vGu2AhYeW3VVZZT9Jjwhd
	GsPEA47vBjoqtiTuEhrJQ==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1793365782; d=kroah.com;
	mf=PGdyaWZmaW5Aa3JvYWguY29tPg==;
	rt=PGxpbnV4LWxlZHNAdmdlci5rZXJuZWwub3JnPg==;
	s=fm2:rsa-sha256:h3nz0B/98tEGUH0kt0nbYBuQx7eVrB8KWKAfpvbB9tX90HG
	hiRgnkSOIGpypBZEyiLVDEj7ZZziGHvgF0EShcXQ8VER8FYKKyCTE9F9YDQN4s6M
	84uGrod+8g34+GP1/9IbA9pzxSt7LeoXoCF1WEWd33gPSCkNHh56HVmnasVVYhBP
	90dIzgHZLrFWfMO2N9bmrAH42PyqCY9usY8E8h1GQgd8hiuCpUCOtVYzCLdQj+Gs
	DSKEw37LjldqY6wDGgr0lFTlum+imfhijq7psrsiFyDg6WpQWEFV6kxeasNKplSj
	UpO9zdaw9nSlMSAGNatWWWSYFXH3TliyASCzquA==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-08;
	repo=github.com/dkim2wg/interop; date=2026-10-28; sw=lmtpprox;
	action=mi-m=1; hc=12;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,in-reply-to,message-id,mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:kSbCdK552iHhn+o0I7vynbVpg225Uz05cpbdLu/VafU=:6KVHz2zoa4xh0XSo5OIeYpPDvMH7dMzwcsIZNl+Vw8I=;
X-ME-Sender: <xms:FZfkasdEVvI4T-JfT48sNvUxwdW0U-vh501_iwKQRywhAXe1cJ9lfA>
    <xme:FZfkakOK_ILhkXEUcV2C8FPcF-EWnkaDtdWkGe2gKPZWkeAXNqIP-OVvJkm3pgk9a
    uUHdPNVTKkXiuZ9UZuHEawAxGa43XE0LoUoy3XPwTC4DVhLiSpZ>
X-ME-Received: <xmr:FZfkaoV5Q83vtsTbUSNmEKoRHPhfEn6hs6rHMxWx_QCjm1WM448wGg3sadJU1ejPMkE>
X-ME-Proxy-Cause: dmFkZTG4vKBYpEcgvlFJ9ZA0nv/pK+py/1nRHJ8/IZkEcogj2lwgjT02ZjIGc0qsEBLM6q
    /nFCF07RrdhWNp2TLAY4qt1cY0YLNOBTsDepaKiEMjzv4JkahRjDn5AVfzVkNOcTk8kUjy
    C4ShJNj2pts6Ppk/U6XHi8XF4llJGg9aFGAR8beFmg/V0smf9Gd6PhvtP87st771hUdEkY
    Pa8QSzvjLImE5aW+kYYogXOmIEvWlwbdh+AyoOrFSxAAHQSvqniCIx+xgXeAemHtGzybqC
    XrZHRVob8tLNf5ruAxOCHsIm763UXHeBf55FlNn0LRen4J3Ohpf+or6ZuZhEUPmPXS0vmP
    CkooH0YYbUdHrJLeAhx6eg3PFQNJxWyEaL074WTtuxCwsL7C04vNimJg73cGL7oVqaQeyy
    QAidQVflvSPVTDx92+49/VvHTjraqnvMrhZF7bweiFYO4w7mQW1RmCbRxWXqhvrPFTCL3A
    oiO7a04bJL48Vkc08Wm9j2XwSizO6xWIRDXcXpqip+QOWClJQYxnl0Xeqen8aF7LIjsr77
    WoL7msUaEf0MiCGolQNx2xPOictvJ2N+5nVpYzQj6BjWI8Bm+rpCz/v/58pxMeCgjCSIhC
    uTo81O7OnhXwHZszLPZxmSRzhMbWZqV3+lKdQVTHoYbi1f65OTcUkUaT416Q
X-ME-Proxy: <xmx:FZfkakxM9iPUnMfnQdMxGzQY4Wn1Q4V3a9Xd_OWVjOVMRAJ_IYuWug>
    <xmx:FZfkan-G9V-7VHLZTe7d6EHG6GQBUebTJtXQWeOuWyrs7KhCXvWyvA>
    <xmx:FZfkah_k7PMbt47heDLbCibcpFNa4zXGhXa3UNt0kYXz5AyWxDGRGA>
    <xmx:FZfkauU-s9YmFATGDJzczmCkosxdNQxdI2OVLHX7fe0ciVlFlqLaKw>
    <xmx:FpfkaiyyeOD_He73yqP-1rEEazVrZIEfls9y-vFYmyB7Vngmqtt12D34>
Feedback-ID: i1d2843be:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 30 Oct 2026 09:09:40 -0400 (EDT)
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
Subject: Re: [PATCH v4 2/2] leds: is31f132xx: Add support for is31fl3206
From: Griffin Kroah-Hartman <griffin@kroah.com>
To: Flavio Amieiro <flavio@amieiro.net>
Cc: Lee Jones <lee@kernel.org>, Pavel Machek <pavel@kernel.org>, 
 Griffin Kroah-Hartman <griffin@kroah.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-leds@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
References: <20261028-add-is31fl3206-support-v4-0-e331cee9fcb3@amieiro.net>
 <20261028-add-is31fl3206-support-v4-2-e331cee9fcb3@amieiro.net>
Date: Fri, 30 Oct 2026 14:09:34 +0100
Message-Id: <179336577421.12256.1115507139108601652.b4-review@b4>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793365780; l=521;
 i=griffin@kroah.com; s=20260910; h=from:subject:message-id;
 bh=6KVHz2zoa4xh0XSo5OIeYpPDvMH7dMzwcsIZNl+Vw8I=;
 b=6Ph6y3Rh8f3qWBglJ5W18J21C4P8RjXtKubaM8r8MD9XtsuW4W8/UnLcKH7DTJj8LYYSM5iok
 QSTwz3FKjG6BHRE8LnmTvBPYnk15gn6IO8AlGcMSs03dNIDJxpIZBSQ
X-Developer-Key: i=griffin@kroah.com; a=ed25519;
 pk=HlyUkuZAN9I5qlPbOHN5N9xxdQ5sT6AbPgC4TsLCxzA=

On Wed, 28 Oct 2026 18:31:02 -0300, Flavio Amieiro <flavio@amieiro.net> wrote:
> This chip has a different layout for the LED Control Register when
> compared to the other variants. This register contains the enable bit
> (in the highest nibble) but also the current control (in the lowest
> nibble).
> 
> According to the datasheet, a value of 010000 (0x10) in the register
> enables an LED with the output current set to maximum.
> 
> [...]

Reviewed-by: Griffin Kroah-Hartman <griffin@kroah.com>

-- 
 

