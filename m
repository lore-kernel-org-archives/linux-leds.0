Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793023187;
	b=E3WyLB/ndtp+o1YvI+Aqh8cv07CeMjkkPDWIu41vM/yTX9OGd+hJERDz47t4QWyS4Q6H
	 FA2HneqIUd/7R+lBVnOO1f6+T19NvxItd4yKsIygPO/vgsyE4fm9g1IGR9RTpX5OFtJsL
	 lByuvTqeLPYK8fIQ2lZXVceAS+Zsj4NYXdn5M95F0P3JfFwY7v/Bw9m9UVQ0Sm/D2nCud
	 yr2KI8n8pLeKaMb2REwbUEQ39PnJ0sgyTurln1hoVojtPuhsZqHobCVo0EEF/opg28Q7+
	 zGotPmTTS9Rj3okRVWxuMho2maqTT6PS6qaD1L+XZOp/q4PCcxq+mee+sYZEnTwacRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793023187;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=mNcB0M0/Lzb3XBKpguzkBfhM38qP57iR+s1dnSAP2sQ=;
	b=yQx5+C0kLS0V8gXUo0aF+nWgh4PxZsMq6bXmxJGIjnXs4N6SxCUKuf16hu0LEPmjTyxB
	 CDN8c061ytkNJhD7XffpohTxNRYnq5saub2VUEIxcdUgC5W/oUb82XlUY3PE/q6hww+CS
	 z8hagSNJl6dNOi4jWQlBa2W7rJPFxXRt30G+4qClQrlldyNf7cKtlpviFxxdMEI27FCxL
	 86bFqeRqcUQzr8g1Mb5AKkgvAam7oD9cYsuPrxZ9G/r3rjnsMekDSXsf+fOu9Bth1KIk5
	 D9UH6CdzCmmbQgRajBtzirPG+YTDwnsV9tko8Jy/ktBmJ1hR1h+2NnFEOhUZWg/4Z0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1AAF22a;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE1FF606A31B
	for <linux-leds@vger.kernel.org>; Mon, 26 Oct 2026 13:59:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A1AAF22a
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2708C1F01825;
	Mon, 26 Oct 2026 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793023186;
	bh=mNcB0M0/Lzb3XBKpguzkBfhM38qP57iR+s1dnSAP2sQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A1AAF22akXZzg/8Kb/J72IAUQ+0qMgImVB3Ost6udoHdhmeyfQ8OMyP0w9uwwqcbl
	 7p02DdPhk1Uyg59I8UJTRQWJq+c8DULFP1YKcYYWH6CwsCYu4AGHIas9jib41oIlA4
	 4o7Z5rMO1XzfoJzoeY1o4qf/OR4tt6dfWmO/BOMJ1RTZveoeasjqYvwiSDLbzruBP7
	 RQtia2cWYUTSa7JLPm0UPZcXe9ptyXc/gzxK+j6faXKPXbBbI0bK+oBUmJaA7xIsKz
	 ypvTP5c+m9BLTYa9hZMBeHG+QXIW6+I26LFJ47mAwzubLBM6Eh7mVm7pfM7eEx7hCF
	 9JGFWQ+4FsmYQ==
Message-ID: <sashiko-outbox-185361@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/3] leds: lp55xx: Add program and mux base pages to the
 device config
Reply-To: sashiko-reviews@lists.linux.dev
To: "Arthur Crepin Leblond" <arthur@marmottus.net>
Cc: linux-leds@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261026-lp55xx-v1-1-6eaaf530115c@marmottus.net>
References: <20261026-lp55xx-v1-0-6eaaf530115c@marmottus.net>
 <20261026-lp55xx-v1-1-6eaaf530115c@marmottus.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 26 Oct 2026 13:59:45 +0000
X-Mailing-List: linux-leds@vger.kernel.org
List-Id: <linux-leds.vger.kernel.org>
List-Post: <mailto:linux-leds@vger.kernel.org>
List-Help: <mailto:linux-leds+help@vger.kernel.org>
List-Subscribe: <mailto:linux-leds+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-leds+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-leds+owner@vger.kernel.org>
Precedence: list

> Add program and mux base page to struct lp55xx_device_config to
> set the first page of the engine programs and of the LED mapping table.
>=20
> Until now the mapping tables were placed at the end of the programs.
> On the LP5569 this puts them in the upper half of the SRAM, while the
> map_* instructions can only address words 0-127.
> This change allows placing the mapping tables before the programs instead.
>=20
> All the chips set the values matching their current layout, so their
> behavior is unchanged:
>   - LP5523 has the 3 engine programs on the first 3 pages and their
>     LED mapping tables on the next 3 pages.
>   - LP5569 has the 3 engine programs of 4 pages each, followed by the
>     LED mapping tables.
>   - LP8501 stores its program at address 0.
>=20
> Signed-off-by: Arthur Crepin Leblond <arthur@marmottus.net>

Sashiko has reviewed this patch and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261026-lp55xx-v1-=
0-6eaaf530115c@marmottus.net?part=3D1

